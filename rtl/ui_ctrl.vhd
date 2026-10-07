-------------------------------------------------------------------------------
-- ui_ctrl.vhd
-- Zoom, scroll and measurement cursors driven by the push-buttons.
--
--   BTNU / BTND : zoom in / out (centred on cursor A)
--   BTNL / BTNR : action selected by mode (SW15..14)
--                   00 scroll the view
--                   01 move cursor A
--                   10 move cursor B
--                   11 move both cursors together
-- The view follows a cursor that is moved off-screen.
--
-- A button event is processed over four clocks (buttons are milliseconds
-- apart) so that no single clock has a long arithmetic chain:
--   ph1 : zoom, cursor and scroll arithmetic, cursor clamping
--   ph2 : re-centre on cursor A after a zoom
--   ph3 : make sure a moved cursor stays on screen
--   ph4 : clamp the view to the buffer and align it
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.la_pkg.all;

entity ui_ctrl is
    port (
        clk        : in  std_logic;
        rst        : in  std_logic;
        zoom_in    : in  std_logic;
        zoom_out   : in  std_logic;
        left       : in  std_logic;
        right      : in  std_logic;
        fast       : in  std_logic;
        mode       : in  std_logic_vector(1 downto 0);
        zoom       : out zoom_t;
        view_start : out idx_t;
        cur_a      : out idx_t;
        cur_b      : out idx_t
    );
end entity;

architecture rtl of ui_ctrl is
    subtype sint is integer range -2*DEPTH to 2*DEPTH;

    signal z_r  : zoom_t := Z_MIN;
    signal vs_r : idx_t  := 0;
    signal a_r  : idx_t  := DEPTH / 4;
    signal b_r  : idx_t  := DEPTH / 4 + DEPTH / 16;

    signal ph2, ph3, ph4 : std_logic := '0';
    signal vs_t      : sint := 0;      -- view start being worked on
    signal recenter  : std_logic := '0';
    signal follow    : integer range 0 to 2 := 0;   -- 0 none, 1 A, 2 B
    signal vis_r     : integer range 1 to 8*WAVE_W := WAVE_W;
    signal half_vis  : integer range 0 to 4*WAVE_W := WAVE_W / 2;
    signal lim_r     : sint := 0;      -- DEPTH - vis
    signal c_r       : idx_t := 0;     -- cursor the view should follow
begin

    process(clk)
        variable z    : zoom_t;
        variable vis  : integer range 1 to 8*WAVE_W;
        variable step : integer range 0 to DEPTH;
        variable a, b : sint;
        variable vs   : sint;
        variable ev   : boolean;
    begin
        if rising_edge(clk) then
            ph2 <= '0';
            ph3 <= '0';
            ph4 <= '0';

            if rst = '1' then
                z_r      <= Z_MIN;
                vs_r     <= 0;
                a_r      <= DEPTH / 4;
                b_r      <= DEPTH / 4 + DEPTH / 16;
                vis_r    <= visible_samples(Z_MIN);
                recenter <= '0';
                follow   <= 0;
            else
                ---------------------------------------------------------------
                -- ph1 : react to a button event
                ---------------------------------------------------------------
                ev := zoom_in = '1' or zoom_out = '1' or left = '1' or right = '1';
                if ev then
                    z := z_r;
                    a := a_r;
                    b := b_r;
                    vs := vs_r;
                    recenter <= '0';
                    follow   <= 0;

                    if zoom_in = '1' and z < Z_MAX then
                        z := z + 1;
                        recenter <= '1';
                    elsif zoom_out = '1' and z > Z_MIN then
                        z := z - 1;
                        recenter <= '1';
                    end if;
                    vis := visible_samples(z);

                    if left = '1' or right = '1' then
                        if mode = "00" then
                            -- scroll by 1/8 screen (half a screen when held)
                            if fast = '1' then step := vis / 2; else step := vis / 8; end if;
                            if step > DEPTH then step := DEPTH; end if;
                            if left = '1' then vs := vs - step; else vs := vs + step; end if;
                        else
                            -- cursor: one pixel column per press, 8 when held
                            case z is
                                when -1     => step := 2;
                                when -2     => step := 4;
                                when -3     => step := 8;
                                when others => step := 1;
                            end case;
                            if fast = '1' then step := step * 8; end if;

                            if mode = "01" or mode = "11" then
                                if left = '1' then a := a - step; else a := a + step; end if;
                                follow <= 1;
                            end if;
                            if mode = "10" or mode = "11" then
                                if left = '1' then b := b - step; else b := b + step; end if;
                                if mode = "10" then follow <= 2; end if;
                            end if;
                        end if;
                    end if;

                    -- keep cursors inside the buffer
                    if a < 0 then a := 0; elsif a > DEPTH-1 then a := DEPTH-1; end if;
                    if b < 0 then b := 0; elsif b > DEPTH-1 then b := DEPTH-1; end if;

                    z_r      <= z;
                    a_r      <= a;
                    b_r      <= b;
                    vs_t     <= vs;
                    vis_r    <= vis;
                    half_vis <= vis / 2;
                    lim_r    <= DEPTH - vis;
                    ph2      <= '1';
                end if;

                ---------------------------------------------------------------
                -- ph2 : re-centre on cursor A after a zoom
                ---------------------------------------------------------------
                if ph2 = '1' then
                    vs := vs_t;
                    if recenter = '1' then
                        vs := a_r - half_vis;
                    end if;
                    vs_t <= vs;
                    if follow = 1 then c_r <= a_r; else c_r <= b_r; end if;
                    ph3 <= '1';
                end if;

                ---------------------------------------------------------------
                -- ph3 : follow the moved cursor
                ---------------------------------------------------------------
                if ph3 = '1' then
                    vs := vs_t;
                    if follow /= 0 then
                        if c_r < vs then
                            vs := c_r;
                        elsif c_r >= vs + vis_r then
                            vs := c_r - vis_r + 1;
                        end if;
                    end if;
                    vs_t <= vs;
                    ph4  <= '1';
                end if;

                ---------------------------------------------------------------
                -- ph4 : clamp to the buffer and align
                ---------------------------------------------------------------
                if ph4 = '1' then
                    vs := vs_t;
                    if lim_r <= 0 or vs < 0 then
                        vs := 0;
                    elsif vs > lim_r then
                        vs := lim_r;
                    end if;
                    -- when zoomed out each pixel column covers up to 8 samples;
                    -- keep columns aligned so none straddles the end of the buffer
                    if z_r < 0 then
                        vs := (vs / 8) * 8;
                    end if;
                    vs_r <= vs;
                end if;
            end if;
        end if;
    end process;

    zoom       <= z_r;
    view_start <= vs_r;
    cur_a      <= a_r;
    cur_b      <= b_r;

end architecture;
