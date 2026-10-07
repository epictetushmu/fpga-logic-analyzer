-------------------------------------------------------------------------------
-- capture_ctrl.vhd
-- Sample-rate divider, trigger detection and circular-buffer write control.
--
-- Memory is split into two banks (ping-pong). The display always reads the
-- "display bank" while new captures go into the other one, so the screen
-- never shows a half-written capture. When a capture completes the banks are
-- swapped at the next vertical blank.
--
-- Capture sequence:
--   PRE  : write pre_len samples (the pre-trigger history)
--   WAIT : keep writing circularly, test every sample for the trigger
--   POST : after the trigger, write DEPTH-pre_len samples (incl. trigger)
-- Result: logical sample 0 is at physical address (trig_addr - pre_len) and
-- the trigger sample sits at logical index pre_len.
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.la_pkg.all;

entity capture_ctrl is
    port (
        clk        : in  std_logic;
        rst        : in  std_logic;
        din        : in  sample_t;                      -- synchronised inputs
        rate       : in  unsigned(3 downto 0);          -- fs = 100 MHz / 2**rate
        trig_ch    : in  unsigned(3 downto 0);
        trig_mode  : in  std_logic_vector(1 downto 0);  -- 00 auto 01 rise 10 fall 11 any
        pre_sel    : in  std_logic_vector(1 downto 0);  -- pre-trigger 0/25/50/75 %
        continuous : in  std_logic;                     -- 1 = re-arm automatically
        btn_run    : in  std_logic;                     -- run/stop, arm, force_trig
        vblank     : in  std_logic;                     -- 1-clk pulse at vertical blank
        -- sample memory write port (bank & address)
        wr_en      : out std_logic;
        wr_addr    : out std_logic_vector(ADDR_W downto 0);
        wr_data    : out sample_t;
        -- what the display should show
        disp_bank  : out std_logic;
        disp_start : out idx_t;                         -- physical addr of logical 0
        disp_trig  : out idx_t;                         -- logical index of trigger
        state      : out std_logic_vector(1 downto 0);
        running    : out std_logic
    );
end entity;

architecture rtl of capture_ctrl is
    signal div_cnt   : unsigned(15 downto 0) := (others => '0');
    signal tick      : std_logic := '0';
    signal smp       : sample_t := (others => '0');
    signal prev      : sample_t := (others => '0');
    signal have_prev : std_logic := '0';

    signal st        : std_logic_vector(1 downto 0) := ST_IDLE;
    signal run_r     : std_logic := '1';
    signal force_trig     : std_logic := '0';
    signal wr_ptr    : unsigned(ADDR_W-1 downto 0) := (others => '0');
    signal cnt       : integer range 0 to DEPTH := 0;
    signal pre_len   : integer range 0 to DEPTH := 0;
    signal trig_addr : unsigned(ADDR_W-1 downto 0) := (others => '0');

    signal wr_bank   : std_logic := '0';
    signal dbank     : std_logic := '1';
    signal swap_pend : std_logic := '0';
    signal new_start : idx_t := 0;
    signal new_trig  : idx_t := 0;
    signal dstart    : idx_t := 0;
    signal dtrig     : idx_t := 0;

    signal we_r      : std_logic := '0';
    signal waddr_r   : std_logic_vector(ADDR_W downto 0) := (others => '0');
    signal wdata_r   : sample_t := (others => '0');
begin

    ---------------------------------------------------------------------------
    -- Sample clock enable: one tick every 2**rate system clocks
    ---------------------------------------------------------------------------
    process(clk)
        variable limit : unsigned(15 downto 0);
    begin
        if rising_edge(clk) then
            limit := shift_left(to_unsigned(1, 16), to_integer(rate)) - 1;
            if rst = '1' or div_cnt >= limit then
                div_cnt <= (others => '0');
                tick    <= '1';
            else
                div_cnt <= div_cnt + 1;
                tick    <= '0';
            end if;
            smp <= din;   -- aligned with 'tick'
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- Capture state machine
    ---------------------------------------------------------------------------
    process(clk)
        variable start   : boolean;
        variable stop    : boolean;
        variable b, pb   : std_logic;
        variable hit     : boolean;
        variable pre_v   : integer range 0 to DEPTH;
    begin
        if rising_edge(clk) then
            we_r <= '0';

            if rst = '1' then
                st        <= ST_IDLE;
                run_r     <= '1';
                force_trig     <= '0';
                wr_bank   <= '0';
                dbank     <= '1';
                swap_pend <= '0';
                dstart    <= 0;
                dtrig     <= 0;
                have_prev <= '0';
            else
                ---------------------------------------------------------------
                -- Run / stop / arm / force_trig-trigger button
                ---------------------------------------------------------------
                start := false;
                stop  := false;
                if btn_run = '1' then
                    if continuous = '1' then
                        run_r <= not run_r;
                        stop := run_r = '1';         -- stop: abort capture
                    else
                        if st = ST_IDLE then
                            start := swap_pend = '0';  -- single-shot arm
                        elsif st = ST_WAIT then
                            force_trig <= '1';            -- second press forces trigger
                        end if;
                    end if;
                end if;

                if continuous = '1' and run_r = '1' and not stop and
                   st = ST_IDLE and swap_pend = '0' then
                    start := true;
                end if;

                if stop then
                    st    <= ST_IDLE;
                    force_trig <= '0';

                elsif start then
                    case pre_sel is
                        when "00"   => pre_v := 0;
                        when "01"   => pre_v := DEPTH / 4;
                        when "10"   => pre_v := DEPTH / 2;
                        when others => pre_v := 3 * DEPTH / 4;
                    end case;
                    pre_len   <= pre_v;
                    wr_ptr    <= (others => '0');
                    cnt       <= 0;
                    force_trig     <= '0';
                    have_prev <= '0';
                    if pre_v = 0 then
                        st <= ST_WAIT;
                    else
                        st <= ST_PRE;
                    end if;

                elsif tick = '1' and st /= ST_IDLE then
                    -- every active state stores the sample
                    we_r      <= '1';
                    waddr_r   <= wr_bank & std_logic_vector(wr_ptr);
                    wdata_r   <= smp;
                    wr_ptr    <= wr_ptr + 1;
                    prev      <= smp;
                    have_prev <= '1';

                    case st is
                        when ST_PRE =>
                            if cnt = pre_len - 1 then
                                st <= ST_WAIT;
                            else
                                cnt <= cnt + 1;
                            end if;

                        when ST_WAIT =>
                            b  := smp(to_integer(trig_ch));
                            pb := prev(to_integer(trig_ch));
                            case trig_mode is
                                when "00"   => hit := true;
                                when "01"   => hit := have_prev = '1' and pb = '0' and b = '1';
                                when "10"   => hit := have_prev = '1' and pb = '1' and b = '0';
                                when others => hit := have_prev = '1' and pb /= b;
                            end case;
                            if hit or force_trig = '1' then
                                trig_addr <= wr_ptr;
                                cnt       <= 1;
                                force_trig     <= '0';
                                st        <= ST_POST;
                            end if;

                        when others =>  -- ST_POST
                            if cnt = DEPTH - pre_len - 1 then
                                st        <= ST_IDLE;
                                swap_pend <= '1';
                                new_start <= to_integer(trig_addr - to_unsigned(pre_len mod DEPTH, ADDR_W));
                                new_trig  <= pre_len mod DEPTH;
                            else
                                cnt <= cnt + 1;
                            end if;
                    end case;
                end if;

                ---------------------------------------------------------------
                -- Swap banks during vertical blank once a capture is complete
                ---------------------------------------------------------------
                if vblank = '1' and swap_pend = '1' then
                    dbank     <= wr_bank;
                    wr_bank   <= not wr_bank;
                    dstart    <= new_start;
                    dtrig     <= new_trig;
                    swap_pend <= '0';
                end if;
            end if;
        end if;
    end process;

    wr_en      <= we_r;
    wr_addr    <= waddr_r;
    wr_data    <= wdata_r;
    disp_bank  <= dbank;
    disp_start <= dstart;
    disp_trig  <= dtrig;
    state      <= st;
    running    <= run_r;

end architecture;
