-------------------------------------------------------------------------------
-- la_top.vhd
-- 16-channel standalone logic analyzer for the Digilent Nexys A7 (Artix-7).
-- Inputs on Pmod JA (ch0-7) and JB (ch8-15), waveforms on the VGA port.
--
-- Switches
--   SW3..0   sample rate n  : fs = 100 MHz / 2**n  (100 MS/s ... 3.05 kS/s)
--   SW7..4   trigger channel 0..15
--   SW9..8   trigger mode    00 auto  01 rising  10 falling  11 any edge
--   SW10     1 = continuous (auto re-arm), 0 = single shot
--   SW11     1 = analyse the internal test pattern instead of JA/JB
--   SW13..12 pre-trigger     00 0%  01 25%  10 50%  11 75%
--   SW15..14 BTNL/BTNR do    00 scroll  01 cursor A  10 cursor B  11 both
-- Buttons
--   BTNC     continuous: run/stop.  single: arm; press again to force trigger
--   BTNU/D   zoom in / out (around cursor A)
--   BTNL/R   scroll or move cursors (hold for auto-repeat, longer = faster)
--   CPU_RESET reset
-- Outputs
--   LED15..0 live input levels       LED16 RGB: capture state
--   7-seg    |B-A| samples . trig ch . trig mode . rate n
--   JC/JD    test pattern ch0-7 / ch8-15 (for loop-back testing)
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.la_pkg.all;

entity la_top is
    generic (
        SIM : boolean := false   -- shortens button timing in simulation
    );
    port (
        CLK100MHZ  : in  std_logic;
        CPU_RESETN : in  std_logic;
        SW         : in  std_logic_vector(15 downto 0);
        BTNC       : in  std_logic;
        BTNU       : in  std_logic;
        BTND       : in  std_logic;
        BTNL       : in  std_logic;
        BTNR       : in  std_logic;
        JA         : in  std_logic_vector(7 downto 0);   -- ch0..7
        JB         : in  std_logic_vector(7 downto 0);   -- ch8..15
        JC         : out std_logic_vector(7 downto 0);   -- test pattern 0..7
        JD         : out std_logic_vector(7 downto 0);   -- test pattern 8..15
        LED        : out std_logic_vector(15 downto 0);
        LED16_R    : out std_logic;
        LED16_G    : out std_logic;
        LED16_B    : out std_logic;
        CA, CB, CC, CD, CE, CF, CG : out std_logic;
        DP         : out std_logic;
        AN         : out std_logic_vector(7 downto 0);
        VGA_R      : out std_logic_vector(3 downto 0);
        VGA_G      : out std_logic_vector(3 downto 0);
        VGA_B      : out std_logic_vector(3 downto 0);
        VGA_HS     : out std_logic;
        VGA_VS     : out std_logic
    );
end entity;

architecture rtl of la_top is

    function sel(c : boolean; a, b : natural) return natural is
    begin
        if c then return a; else return b; end if;
    end function;

    constant DEB_CYCLES : natural := sel(SIM, 20, 1_000_000);
    constant REP_DELAY  : natural := sel(SIM, 400, 40_000_000);
    constant REP_PERIOD : natural := sel(SIM, 100, 6_000_000);

    signal clk : std_logic;

    -- reset synchroniser
    signal rst_sr : std_logic_vector(2 downto 0) := (others => '1');
    signal rst    : std_logic;

    -- input / switch synchronisers
    signal pin_s0, pin_s1 : sample_t := (others => '0');
    signal sw_s0, sw_s1   : std_logic_vector(15 downto 0) := (others => '0');
    attribute ASYNC_REG : string;
    attribute ASYNC_REG of pin_s0, pin_s1, sw_s0, sw_s1 : signal is "TRUE";

    signal pattern  : sample_t;
    signal din      : sample_t := (others => '0');

    -- buttons
    signal p_c, p_u, p_d, p_l, p_r : std_logic;
    signal f_l, f_r                : std_logic;
    signal fast                    : std_logic;

    -- capture
    signal wr_en      : std_logic;
    signal wr_addr    : std_logic_vector(ADDR_W downto 0);
    signal wr_data    : sample_t;
    signal we_e, we_o : std_logic;
    signal rd_addr_e  : std_logic_vector(ADDR_W-1 downto 0);
    signal rd_addr_o  : std_logic_vector(ADDR_W-1 downto 0);
    signal rd_q_e     : sample_t;
    signal rd_q_o     : sample_t;
    signal disp_bank  : std_logic;
    signal disp_start : idx_t;
    signal disp_trig  : idx_t;
    signal cap_state  : std_logic_vector(1 downto 0);
    signal running    : std_logic;

    -- ui
    signal zoom       : zoom_t;
    signal view_start : idx_t;
    signal cur_a      : idx_t;
    signal cur_b      : idx_t;
    signal delta      : integer range 0 to 8191;

    -- vga timing
    signal pix_en  : std_logic;
    signal hc      : integer range 0 to 799;
    signal vc      : integer range 0 to 524;
    signal active  : std_logic;
    signal hs, vs  : std_logic;
    signal vblank  : std_logic;

    -- settings decoded from switches
    signal rate       : unsigned(3 downto 0);
    signal trig_ch    : unsigned(3 downto 0);
    signal trig_mode  : std_logic_vector(1 downto 0);
    signal continuous : std_logic;
    signal use_tp     : std_logic;
    signal pre_sel    : std_logic_vector(1 downto 0);
    signal ui_mode    : std_logic_vector(1 downto 0);

    signal seg     : std_logic_vector(6 downto 0);
    signal pwm     : unsigned(3 downto 0) := (others => '0');

begin

    clk <= CLK100MHZ;

    ---------------------------------------------------------------------------
    -- Reset and synchronisers
    ---------------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then
            rst_sr <= rst_sr(1 downto 0) & (not CPU_RESETN);
            pin_s0 <= JB & JA;
            pin_s1 <= pin_s0;
            sw_s0  <= SW;
            sw_s1  <= sw_s0;
            if use_tp = '1' then
                din <= pattern;
            else
                din <= pin_s1;
            end if;
        end if;
    end process;
    rst <= rst_sr(2);

    rate       <= unsigned(sw_s1(3 downto 0));
    trig_ch    <= unsigned(sw_s1(7 downto 4));
    trig_mode  <= sw_s1(9 downto 8);
    continuous <= sw_s1(10);
    use_tp     <= sw_s1(11);
    pre_sel    <= sw_s1(13 downto 12);
    ui_mode    <= sw_s1(15 downto 14);

    ---------------------------------------------------------------------------
    -- Test pattern generator
    ---------------------------------------------------------------------------
    u_tp : entity work.test_pattern
        port map (clk => clk, rst => rst, dout => pattern);

    JC <= pattern(7 downto 0);
    JD <= pattern(15 downto 8);

    ---------------------------------------------------------------------------
    -- Buttons
    ---------------------------------------------------------------------------
    u_bc : entity work.btn_debounce
        generic map (DEB_CYCLES => DEB_CYCLES, REP_DELAY => REP_DELAY,
                     REP_PERIOD => REP_PERIOD, REPEAT => false)
        port map (clk => clk, rst => rst, btn_in => BTNC, level => open, pulse => p_c, fast => open);
    u_bu : entity work.btn_debounce
        generic map (DEB_CYCLES => DEB_CYCLES, REP_DELAY => REP_DELAY,
                     REP_PERIOD => REP_PERIOD, REPEAT => false)
        port map (clk => clk, rst => rst, btn_in => BTNU, level => open, pulse => p_u, fast => open);
    u_bd : entity work.btn_debounce
        generic map (DEB_CYCLES => DEB_CYCLES, REP_DELAY => REP_DELAY,
                     REP_PERIOD => REP_PERIOD, REPEAT => false)
        port map (clk => clk, rst => rst, btn_in => BTND, level => open, pulse => p_d, fast => open);
    u_bl : entity work.btn_debounce
        generic map (DEB_CYCLES => DEB_CYCLES, REP_DELAY => REP_DELAY,
                     REP_PERIOD => REP_PERIOD, REPEAT => true)
        port map (clk => clk, rst => rst, btn_in => BTNL, level => open, pulse => p_l, fast => f_l);
    u_br : entity work.btn_debounce
        generic map (DEB_CYCLES => DEB_CYCLES, REP_DELAY => REP_DELAY,
                     REP_PERIOD => REP_PERIOD, REPEAT => true)
        port map (clk => clk, rst => rst, btn_in => BTNR, level => open, pulse => p_r, fast => f_r);
    fast <= f_l or f_r;

    ---------------------------------------------------------------------------
    -- Capture + sample memory (2 banks x 4096 x 16 bit)
    -- Stored as even / odd sample RAMs so the display can read two
    -- consecutive samples per clock.
    ---------------------------------------------------------------------------
    u_cap : entity work.capture_ctrl
        port map (
            clk => clk, rst => rst, din => din,
            rate => rate, trig_ch => trig_ch, trig_mode => trig_mode,
            pre_sel => pre_sel, continuous => continuous,
            btn_run => p_c, vblank => vblank,
            wr_en => wr_en, wr_addr => wr_addr, wr_data => wr_data,
            disp_bank => disp_bank, disp_start => disp_start, disp_trig => disp_trig,
            state => cap_state, running => running);

    we_e <= wr_en and not wr_addr(0);
    we_o <= wr_en and wr_addr(0);

    u_ram_e : entity work.sample_ram
        generic map (AW => ADDR_W, DW => NCH)
        port map (clk => clk, we => we_e, waddr => wr_addr(ADDR_W downto 1),
                  wdata => wr_data, raddr => rd_addr_e, rdata => rd_q_e);

    u_ram_o : entity work.sample_ram
        generic map (AW => ADDR_W, DW => NCH)
        port map (clk => clk, we => we_o, waddr => wr_addr(ADDR_W downto 1),
                  wdata => wr_data, raddr => rd_addr_o, rdata => rd_q_o);

    ---------------------------------------------------------------------------
    -- User interface: zoom / scroll / cursors
    ---------------------------------------------------------------------------
    u_ui : entity work.ui_ctrl
        port map (
            clk => clk, rst => rst,
            zoom_in => p_u, zoom_out => p_d, left => p_l, right => p_r,
            fast => fast, mode => ui_mode,
            zoom => zoom, view_start => view_start, cur_a => cur_a, cur_b => cur_b);

    delta <= cur_b - cur_a when cur_b >= cur_a else cur_a - cur_b;

    ---------------------------------------------------------------------------
    -- VGA
    ---------------------------------------------------------------------------
    u_vga : entity work.vga_timing
        port map (clk => clk, rst => rst, pix_en => pix_en, h => hc, v => vc,
                  active => active, hsync => hs, vsync => vs, vblank => vblank);

    u_disp : entity work.display
        port map (
            clk => clk, pix_en => pix_en, h => hc, v => vc, active => active,
            hsync_in => hs, vsync_in => vs,
            zoom => zoom, view_start => view_start, cur_a => cur_a, cur_b => cur_b,
            trig_ch => trig_ch,
            disp_bank => disp_bank, disp_start => disp_start, disp_trig => disp_trig,
            cap_state => cap_state, running => running, continuous => continuous,
            ram_addr_e => rd_addr_e, ram_addr_o => rd_addr_o,
            ram_q_e => rd_q_e, ram_q_o => rd_q_o,
            vga_r => VGA_R, vga_g => VGA_G, vga_b => VGA_B,
            vga_hs => VGA_HS, vga_vs => VGA_VS);

    ---------------------------------------------------------------------------
    -- Seven-segment display
    ---------------------------------------------------------------------------
    u_seg : entity work.seg7_ctrl
        port map (clk => clk, rst => rst, delta => delta, trig_ch => trig_ch,
                  trig_mode => trig_mode, rate => rate, seg => seg, dp => DP, an => AN);

    CA <= seg(0); CB <= seg(1); CC <= seg(2); CD <= seg(3);
    CE <= seg(4); CF <= seg(5); CG <= seg(6);

    ---------------------------------------------------------------------------
    -- LEDs
    ---------------------------------------------------------------------------
    process(clk)
        variable on_t : boolean;
    begin
        if rising_edge(clk) then
            LED <= din;
            pwm <= pwm + 1;
            on_t := pwm = 0;     -- RGB LED is very bright: 1/16 duty
            LED16_R <= '0'; LED16_G <= '0'; LED16_B <= '0';
            if on_t then
                case cap_state is
                    when ST_WAIT => LED16_R <= '1'; LED16_G <= '1';  -- amber: armed
                    when ST_PRE | ST_POST => LED16_B <= '1';           -- blue: capturing
                    when others =>
                        if continuous = '1' and running = '0' then
                            LED16_R <= '1';                            -- red: stopped
                        else
                            LED16_G <= '1';                            -- green: done
                        end if;
                end case;
            end if;
        end if;
    end process;

end architecture;
