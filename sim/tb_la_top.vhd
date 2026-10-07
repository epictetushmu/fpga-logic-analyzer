-------------------------------------------------------------------------------
-- tb_la_top.vhd
-- Full-system testbench: runs la_top on its internal test pattern and dumps
-- whole VGA frames to text PPM images (frame_overview.ppm, frame_zoomed.ppm)
-- so you can see exactly what the monitor will show. Open the .ppm files
-- with GIMP, IrfanView, or convert them with scripts/ppm2png.py.
--
-- Simulated time is ~70 ms (a few VGA frames); in XSim run with "run all".
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity tb_la_top is
end entity;

architecture sim of tb_la_top is
    constant TCLK : time := 10 ns;

    signal clk     : std_logic := '0';
    signal resetn  : std_logic := '0';
    signal sw      : std_logic_vector(15 downto 0);
    signal btnc, btnu, btnd, btnl, btnr : std_logic := '0';
    signal ja, jb  : std_logic_vector(7 downto 0) := (others => '0');
    signal jc, jd  : std_logic_vector(7 downto 0);
    signal led     : std_logic_vector(15 downto 0);
    signal l16r, l16g, l16b : std_logic;
    signal ca, cb, cc, cd, ce, cf, cg, dp : std_logic;
    signal an      : std_logic_vector(7 downto 0);
    signal vr, vg, vb : std_logic_vector(3 downto 0);
    signal hs, vs  : std_logic;
    signal done    : boolean := false;
begin

    clk <= not clk after TCLK / 2 when not done;

    -- SW15..14 ui mode   = 00 (scroll)
    -- SW13..12 pre-trig  = 01 (25 %)
    -- SW11     test pattern on
    -- SW10     continuous
    -- SW9..8   trigger    = 01 (rising)
    -- SW7..4   trig ch    = 9
    -- SW3..0   rate       = 0 (100 MS/s)
    sw <= "0001" & "1101" & "1001" & "0000";

    dut : entity work.la_top
        generic map (SIM => true)
        port map (
            CLK100MHZ => clk, CPU_RESETN => resetn, SW => sw,
            BTNC => btnc, BTNU => btnu, BTND => btnd, BTNL => btnl, BTNR => btnr,
            JA => ja, JB => jb, JC => jc, JD => jd, LED => led,
            LED16_R => l16r, LED16_G => l16g, LED16_B => l16b,
            CA => ca, CB => cb, CC => cc, CD => cd, CE => ce, CF => cf, CG => cg,
            DP => dp, AN => an,
            VGA_R => vr, VGA_G => vg, VGA_B => vb, VGA_HS => hs, VGA_VS => vs);

    stim : process

        procedure tap(signal b : out std_logic) is
        begin
            b <= '1';
            wait for 60 * TCLK;
            b <= '0';
            wait for 60 * TCLK;
        end procedure;

        -- Capture one frame. Visible pixel (x, y) is output 144+x pixel
        -- clocks after the hsync falling edge of the line before it.
        procedure dump_frame(fname : string) is
            file f     : text;
            variable l : line;
            variable k : integer;
            variable y : integer;
        begin
            file_open(f, fname, write_mode);
            write(l, string'("P3")); writeline(f, l);
            write(l, string'("640 480")); writeline(f, l);
            write(l, string'("15")); writeline(f, l);

            wait until falling_edge(vs);
            k := 0;
            loop
                wait until falling_edge(hs);
                k := k + 1;
                y := (490 + k) mod 525;
                if y < 480 then
                    wait for (144 * 4 + 2) * TCLK;
                    for x in 0 to 639 loop
                        write(l, to_integer(unsigned(vr))); write(l, ' ');
                        write(l, to_integer(unsigned(vg))); write(l, ' ');
                        write(l, to_integer(unsigned(vb)));
                        writeline(f, l);
                        wait for 4 * TCLK;
                    end loop;
                    exit when y = 479;
                end if;
            end loop;
            file_close(f);
            report "wrote " & fname;
        end procedure;

    begin
        resetn <= '0';
        wait for 200 ns;
        resetn <= '1';

        -- let the first capture complete and get swapped in
        wait until falling_edge(vs);
        wait until falling_edge(vs);
        dump_frame("frame_overview.ppm");

        -- zoom in 4 steps (8 samples/px -> 2 px/sample) around cursor A
        for i in 1 to 4 loop
            tap(btnu);
        end loop;
        -- scroll right a little
        tap(btnr);
        wait until falling_edge(vs);
        dump_frame("frame_zoomed.ppm");

        done <= true;
        report "tb_la_top finished";
        wait;
    end process;

end architecture;
