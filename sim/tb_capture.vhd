-------------------------------------------------------------------------------
-- tb_capture.vhd
-- Self-checking testbench for capture_ctrl + sample_ram.
--
-- The input is a free-running 16-bit counter, so every stored sample is
-- unique and we can verify that:
--   * the capture is contiguous (each sample = previous + 2**rate)
--   * the trigger condition holds exactly at logical index pre_len
--   * a second button press forces a trigger that would never occur
-- Ends with "ALL TESTS PASSED" or an assertion failure.
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.la_pkg.all;

entity tb_capture is
end entity;

architecture sim of tb_capture is
    signal clk        : std_logic := '0';
    signal rst        : std_logic := '1';
    signal cnt        : unsigned(15 downto 0) := (others => '0');
    signal din        : sample_t;
    signal rate       : unsigned(3 downto 0) := (others => '0');
    signal trig_ch    : unsigned(3 downto 0) := (others => '0');
    signal trig_mode  : std_logic_vector(1 downto 0) := "00";
    signal pre_sel    : std_logic_vector(1 downto 0) := "00";
    signal btn_run    : std_logic := '0';
    signal vblank     : std_logic := '0';
    signal wr_en      : std_logic;
    signal wr_addr    : std_logic_vector(ADDR_W downto 0);
    signal wr_data    : sample_t;
    signal rd_addr    : std_logic_vector(ADDR_W downto 0) := (others => '0');
    signal rd_data    : sample_t;
    signal disp_bank  : std_logic;
    signal disp_start : idx_t;
    signal disp_trig  : idx_t;
    signal state      : std_logic_vector(1 downto 0);
    signal running    : std_logic;
    signal done       : boolean := false;
begin

    clk <= not clk after 5 ns when not done;

    process(clk)
        variable vc : integer := 0;
    begin
        if rising_edge(clk) then
            cnt <= cnt + 1;
            vc  := (vc + 1) mod 200;
            if vc = 0 then vblank <= '1'; else vblank <= '0'; end if;
        end if;
    end process;
    din <= std_logic_vector(cnt);

    dut : entity work.capture_ctrl
        port map (clk => clk, rst => rst, din => din, rate => rate,
                  trig_ch => trig_ch, trig_mode => trig_mode, pre_sel => pre_sel,
                  continuous => '0', btn_run => btn_run, vblank => vblank,
                  wr_en => wr_en, wr_addr => wr_addr, wr_data => wr_data,
                  disp_bank => disp_bank, disp_start => disp_start, disp_trig => disp_trig,
                  state => state, running => running);

    ram : entity work.sample_ram
        generic map (AW => ADDR_W + 1, DW => NCH)
        port map (clk => clk, we => wr_en, waddr => wr_addr, wdata => wr_data,
                  raddr => rd_addr, rdata => rd_data);

    stim : process
        variable errors : integer := 0;

        procedure press is
        begin
            wait until rising_edge(clk);
            btn_run <= '1';
            wait until rising_edge(clk);
            btn_run <= '0';
        end procedure;

        procedure read_logical(k : integer; variable val : out unsigned(15 downto 0)) is
            variable pa : unsigned(ADDR_W-1 downto 0);
        begin
            pa := to_unsigned((disp_start + k) mod DEPTH, ADDR_W);
            rd_addr <= disp_bank & std_logic_vector(pa);
            wait until rising_edge(clk);
            wait until rising_edge(clk);
            val := unsigned(rd_data);
        end procedure;

        procedure run_case(name : string; r : integer; ch : integer;
                           mode : std_logic_vector(1 downto 0);
                           pre : std_logic_vector(1 downto 0);
                           force_after : integer) is
            variable old_bank : std_logic;
            variable pre_len  : integer;
            variable a, b     : unsigned(15 downto 0);
            variable bad      : integer := 0;
            variable waited   : integer := 0;
        begin
            rate      <= to_unsigned(r, 4);
            trig_ch   <= to_unsigned(ch, 4);
            trig_mode <= mode;
            pre_sel   <= pre;
            case pre is
                when "00"   => pre_len := 0;
                when "01"   => pre_len := DEPTH / 4;
                when "10"   => pre_len := DEPTH / 2;
                when others => pre_len := 3 * DEPTH / 4;
            end case;
            wait until rising_edge(clk);
            old_bank := disp_bank;
            press;
            while disp_bank = old_bank loop
                wait until rising_edge(clk);
                waited := waited + 1;
                if force_after > 0 and waited = force_after then
                    assert state = ST_WAIT report name & ": expected WAIT before force" severity error;
                    press;
                end if;
                assert waited < 2_000_000 report name & ": capture timed out" severity failure;
            end loop;

            assert disp_trig = pre_len
                report name & ": disp_trig=" & integer'image(disp_trig) &
                       " expected " & integer'image(pre_len) severity error;
            if disp_trig /= pre_len then bad := bad + 1; end if;

            -- contiguity
            read_logical(0, a);
            for k in 1 to DEPTH-1 loop
                read_logical(k, b);
                if b /= a + to_unsigned(2**r, 16) then
                    if bad < 5 then
                        report name & ": gap at logical " & integer'image(k) &
                               " (" & integer'image(to_integer(a)) & " -> " &
                               integer'image(to_integer(b)) & ")" severity error;
                    end if;
                    bad := bad + 1;
                end if;
                a := b;
            end loop;

            -- trigger condition at logical pre_len
            if force_after = 0 and mode /= "00" and pre_len > 0 then
                read_logical(pre_len - 1, a);
                read_logical(pre_len, b);
                case mode is
                    when "01" =>
                        if not (a(ch) = '0' and b(ch) = '1') then bad := bad + 1;
                            report name & ": no rising edge at trigger" severity error; end if;
                    when "10" =>
                        if not (a(ch) = '1' and b(ch) = '0') then bad := bad + 1;
                            report name & ": no falling edge at trigger" severity error; end if;
                    when others =>
                        if a(ch) = b(ch) then bad := bad + 1;
                            report name & ": no edge at trigger" severity error; end if;
                end case;
            end if;

            if bad = 0 then
                report "PASS  " & name;
            else
                report "FAIL  " & name & " (" & integer'image(bad) & " errors)" severity error;
                errors := errors + bad;
            end if;
        end procedure;

    begin
        rst <= '1';
        wait for 100 ns;
        wait until rising_edge(clk);
        rst <= '0';
        wait for 100 ns;

        run_case("rise ch5  pre25%  rate0", 0, 5,  "01", "01", 0);
        run_case("fall ch3  pre0%   rate0", 0, 3,  "10", "00", 0);
        run_case("any  ch9  pre50%  rate2", 2, 9,  "11", "10", 0);
        run_case("auto      pre75%  rate1", 1, 0,  "00", "11", 0);
        run_case("rise ch12 pre25%  rate3", 3, 12, "01", "01", 0);
        run_case("force     pre0%   rate0", 0, 15, "01", "00", 300);

        done <= true;
        if errors = 0 then
            report "ALL TESTS PASSED";
        else
            report integer'image(errors) & " ERRORS" severity failure;
        end if;
        wait;
    end process;

end architecture;
