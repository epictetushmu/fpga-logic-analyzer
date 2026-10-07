-------------------------------------------------------------------------------
-- la_pkg.vhd
-- Shared constants and helpers for the Nexys A7 logic analyzer.
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package la_pkg is

    -- Acquisition --------------------------------------------------------
    constant NCH    : integer := 16;          -- number of logic channels
    constant ADDR_W : integer := 12;          -- log2(samples per capture)
    constant DEPTH  : integer := 2**ADDR_W;   -- 4096 samples per capture

    subtype sample_t is std_logic_vector(NCH-1 downto 0);
    subtype idx_t    is integer range 0 to DEPTH-1;

    -- Capture state encoding (also shown on screen / RGB LED)
    constant ST_IDLE : std_logic_vector(1 downto 0) := "00";
    constant ST_PRE  : std_logic_vector(1 downto 0) := "01";  -- filling pre-trigger
    constant ST_WAIT : std_logic_vector(1 downto 0) := "10";  -- armed, waiting trigger
    constant ST_POST : std_logic_vector(1 downto 0) := "11";  -- capturing post-trigger

    -- Display zoom: z >= 0 -> 2**z pixels per sample
    --               z <  0 -> 2**(-z) samples per pixel
    constant Z_MIN : integer := -3;
    constant Z_MAX : integer := 4;
    subtype zoom_t is integer range Z_MIN to Z_MAX;

    -- Screen layout (640 x 480) ------------------------------------------
    constant WAVE_X0 : integer := 40;                    -- left edge of traces
    constant WAVE_W  : integer := 600;                   -- trace area width
    constant WAVE_Y0 : integer := 32;                    -- top of channel 0
    constant ROW_H   : integer := 26;                    -- pixels per channel
    constant WAVE_Y1 : integer := WAVE_Y0 + NCH*ROW_H;   -- 448

    -- Number of samples fully visible across the trace area at zoom z
    function visible_samples(z : zoom_t) return integer;

end package;

package body la_pkg is

    function visible_samples(z : zoom_t) return integer is
    begin
        case z is
            when -3     => return WAVE_W * 8;
            when -2     => return WAVE_W * 4;
            when -1     => return WAVE_W * 2;
            when 0      => return WAVE_W;
            when 1      => return WAVE_W / 2;
            when 2      => return WAVE_W / 4;
            when 3      => return WAVE_W / 8;
            when others => return WAVE_W / 16;
        end case;
    end function;

end package body;
