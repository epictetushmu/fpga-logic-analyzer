-------------------------------------------------------------------------------
-- seg7_ctrl.vhd
-- Drives the 8-digit seven-segment display.
--
--   digits 7..4 : |cursor B - cursor A| in samples (decimal)
--   digit  3    : trigger channel (hex)
--   digit  2    : trigger mode (0 auto, 1 rise, 2 fall, 3 any edge)
--   digits 1..0 : sample-rate setting n (decimal), fs = 100 MHz / 2**n
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seg7_ctrl is
    port (
        clk       : in  std_logic;
        rst       : in  std_logic;
        delta     : in  integer range 0 to 8191;
        trig_ch   : in  unsigned(3 downto 0);
        trig_mode : in  std_logic_vector(1 downto 0);
        rate      : in  unsigned(3 downto 0);
        seg       : out std_logic_vector(6 downto 0);  -- 0=CA .. 6=CG, active low
        dp        : out std_logic;                     -- active low
        an        : out std_logic_vector(7 downto 0)   -- active low
    );
end entity;

architecture rtl of seg7_ctrl is
    signal refresh : unsigned(16 downto 0) := (others => '0');

    -- sequential binary -> BCD (double dabble)
    signal sh      : unsigned(12 downto 0) := (others => '0');
    signal bcd     : unsigned(15 downto 0) := (others => '0');
    signal bcd_out : unsigned(15 downto 0) := (others => '0');
    signal bit_cnt : integer range 0 to 13 := 13;

    signal seg_r   : std_logic_vector(6 downto 0) := (others => '1');
    signal an_r    : std_logic_vector(7 downto 0) := (others => '1');
    signal dp_r    : std_logic := '1';

    function hex7(d : unsigned(3 downto 0)) return std_logic_vector is
    begin
        case d is                          -- gfedcba
            when x"0" => return "1000000";
            when x"1" => return "1111001";
            when x"2" => return "0100100";
            when x"3" => return "0110000";
            when x"4" => return "0011001";
            when x"5" => return "0010010";
            when x"6" => return "0000010";
            when x"7" => return "1111000";
            when x"8" => return "0000000";
            when x"9" => return "0010000";
            when x"A" => return "0001000";
            when x"B" => return "0000011";
            when x"C" => return "1000110";
            when x"D" => return "0100001";
            when x"E" => return "0000110";
            when others => return "0001110";
        end case;
    end function;
begin

    -- binary to BCD, restarts continuously so it tracks 'delta'
    process(clk)
        variable t : unsigned(15 downto 0);
    begin
        if rising_edge(clk) then
            if rst = '1' or bit_cnt = 13 then
                sh      <= to_unsigned(delta, 13);
                bcd     <= (others => '0');
                bit_cnt <= 0;
            else
                t := bcd;
                for i in 0 to 3 loop
                    if t(4*i+3 downto 4*i) >= 5 then
                        t(4*i+3 downto 4*i) := t(4*i+3 downto 4*i) + 3;
                    end if;
                end loop;
                t := t(14 downto 0) & sh(12);
                bcd <= t;
                sh  <= sh(11 downto 0) & '0';
                if bit_cnt = 12 then
                    bcd_out <= t;
                end if;
                bit_cnt <= bit_cnt + 1;
            end if;
        end if;
    end process;

    -- digit multiplexing (~760 Hz full refresh)
    process(clk)
        variable sel   : integer range 0 to 7;
        variable d     : unsigned(3 downto 0);
        variable blank : boolean;
        variable tens  : unsigned(3 downto 0);
        variable ones : unsigned(3 downto 0);
    begin
        if rising_edge(clk) then
            refresh <= refresh + 1;
            sel := to_integer(refresh(16 downto 14));

            if rate >= 10 then
                tens  := x"1";
                ones := rate - 10;
            else
                tens  := x"0";
                ones := rate;
            end if;

            blank := false;
            case sel is
                when 0 => d := ones;
                when 1 => d := tens;
                when 2 => d := "00" & unsigned(trig_mode);
                when 3 => d := trig_ch;
                when 4 => d := bcd_out(3 downto 0);
                when 5 => d := bcd_out(7 downto 4);
                          blank := bcd_out(15 downto 4) = 0;
                when 6 => d := bcd_out(11 downto 8);
                          blank := bcd_out(15 downto 8) = 0;
                when others => d := bcd_out(15 downto 12);
                          blank := bcd_out(15 downto 12) = 0;
            end case;

            an_r <= (others => '1');
            if not blank then
                an_r(sel) <= '0';
            end if;
            seg_r <= hex7(d);
            if sel = 4 or sel = 2 then dp_r <= '0'; else dp_r <= '1'; end if;
        end if;
    end process;

    seg <= seg_r;
    dp  <= dp_r;
    an  <= an_r;

end architecture;
