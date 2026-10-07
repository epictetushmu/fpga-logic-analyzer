-------------------------------------------------------------------------------
-- btn_debounce.vhd
-- Synchronises and debounces a push-button. Produces a one-clock pulse on
-- press and, if REPEAT is true, keeps pulsing while the button is held
-- (typematic auto-repeat). 'fast' goes high after the button has been held
-- for a while so callers can take bigger steps.
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity btn_debounce is
    generic (
        DEB_CYCLES : natural := 1_000_000;   -- 10 ms @ 100 MHz
        REP_DELAY  : natural := 40_000_000;  -- 400 ms before first repeat
        REP_PERIOD : natural := 6_000_000;   -- 60 ms between repeats
        FAST_AFTER : natural := 10;          -- repeats before 'fast'
        REPEAT     : boolean := true
    );
    port (
        clk    : in  std_logic;
        rst    : in  std_logic;
        btn_in : in  std_logic;
        level  : out std_logic;   -- debounced level
        pulse  : out std_logic;   -- press / repeat strobe
        fast   : out std_logic    -- held long enough for big steps
    );
end entity;

architecture rtl of btn_debounce is
    signal s0, s1     : std_logic := '0';
    attribute ASYNC_REG : string;
    attribute ASYNC_REG of s0, s1 : signal is "TRUE";

    signal stable     : std_logic := '0';
    signal deb_cnt    : natural range 0 to DEB_CYCLES := 0;
    signal rep_cnt    : natural range 0 to REP_DELAY + REP_PERIOD := 0;
    signal repeating  : std_logic := '0';
    signal reps       : natural range 0 to FAST_AFTER := 0;
    signal pulse_r    : std_logic := '0';
begin

    process(clk)
    begin
        if rising_edge(clk) then
            s0 <= btn_in;
            s1 <= s0;
            pulse_r <= '0';

            if rst = '1' then
                stable    <= '0';
                deb_cnt   <= 0;
                rep_cnt   <= 0;
                repeating <= '0';
                reps      <= 0;
            else
                -- debounce: input must differ from 'stable' for DEB_CYCLES
                if s1 /= stable then
                    if deb_cnt = DEB_CYCLES then
                        deb_cnt <= 0;
                        stable  <= s1;
                        if s1 = '1' then
                            pulse_r <= '1';
                        end if;
                        rep_cnt   <= 0;
                        repeating <= '0';
                        reps      <= 0;
                    else
                        deb_cnt <= deb_cnt + 1;
                    end if;
                else
                    deb_cnt <= 0;
                    -- auto-repeat while held
                    if REPEAT and stable = '1' then
                        if (repeating = '0' and rep_cnt = REP_DELAY) or
                           (repeating = '1' and rep_cnt = REP_PERIOD) then
                            rep_cnt   <= 0;
                            repeating <= '1';
                            pulse_r   <= '1';
                            if reps < FAST_AFTER then
                                reps <= reps + 1;
                            end if;
                        else
                            rep_cnt <= rep_cnt + 1;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;

    level <= stable;
    pulse <= pulse_r;
    fast  <= '1' when reps = FAST_AFTER else '0';

end architecture;
