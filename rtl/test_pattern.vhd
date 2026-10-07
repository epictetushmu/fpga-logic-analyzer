-------------------------------------------------------------------------------
-- test_pattern.vhd
-- Built-in signal generator so the analyzer can be tried with nothing wired
-- to the Pmod headers (enable with SW11). The same signals are also driven
-- out on Pmod JC so you can loop them back into JA/JB with jumper wires.
--
--   ch0..ch9   : binary counter bits 1..10  (25 MHz down to 48.8 kHz)
--   ch10       : PWM, 1024-clock period, duty slowly sweeping
--   ch11       : burst - 12.5 MHz clock gated by counter bit 11
--   ch12..ch15 : 16-bit LFSR bits, new value every 64 clocks (random data)
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.la_pkg.all;

entity test_pattern is
    port (
        clk  : in  std_logic;
        rst  : in  std_logic;
        dout : out sample_t
    );
end entity;

architecture rtl of test_pattern is
    signal cnt  : unsigned(31 downto 0) := (others => '0');
    signal lfsr : std_logic_vector(15 downto 0) := x"ACE1";
    signal q    : sample_t := (others => '0');
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                cnt  <= (others => '0');
                lfsr <= x"ACE1";
            else
                cnt <= cnt + 1;
                if cnt(5 downto 0) = "111111" then
                    -- x^16 + x^14 + x^13 + x^11 + 1 (maximal length)
                    lfsr <= lfsr(14 downto 0) &
                            (lfsr(15) xor lfsr(13) xor lfsr(12) xor lfsr(10));
                end if;
            end if;

            for i in 0 to 9 loop
                q(i) <= cnt(i + 1);
            end loop;

            if cnt(9 downto 0) < cnt(29 downto 20) then
                q(10) <= '1';
            else
                q(10) <= '0';
            end if;

            q(11) <= cnt(2) and cnt(11);

            q(15 downto 12) <= lfsr(3 downto 0);
        end if;
    end process;

    dout <= q;

end architecture;
