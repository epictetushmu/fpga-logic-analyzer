-------------------------------------------------------------------------------
-- vga_timing.vhd
-- 640x480 @ 60 Hz timing generator. Runs on the 100 MHz system clock with a
-- 25 MHz pixel clock-enable (pix_en), so the whole design is one clock domain.
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_timing is
    port (
        clk    : in  std_logic;
        rst    : in  std_logic;
        pix_en : out std_logic;                    -- 1 clk in every 4
        h      : out integer range 0 to 799;
        v      : out integer range 0 to 524;
        active : out std_logic;
        hsync  : out std_logic;                    -- active low
        vsync  : out std_logic;                    -- active low
        vblank : out std_logic                     -- 1-clk pulse at line 480
    );
end entity;

architecture rtl of vga_timing is
    constant H_VIS : integer := 640;
    constant H_FP  : integer := 16;
    constant H_SY  : integer := 96;
    constant H_TOT : integer := 800;
    constant V_VIS : integer := 480;
    constant V_FP  : integer := 10;
    constant V_SY  : integer := 2;
    constant V_TOT : integer := 525;

    signal div  : unsigned(1 downto 0) := (others => '0');
    signal en   : std_logic := '0';
    signal hc   : integer range 0 to H_TOT-1 := 0;
    signal vc   : integer range 0 to V_TOT-1 := 0;
    signal vb   : std_logic := '0';
begin

    process(clk)
    begin
        if rising_edge(clk) then
            vb <= '0';
            if rst = '1' then
                div <= (others => '0');
                en  <= '0';
                hc  <= 0;
                vc  <= 0;
            else
                div <= div + 1;
                if div = "11" then en <= '1'; else en <= '0'; end if;

                if en = '1' then
                    if hc = H_TOT-1 then
                        hc <= 0;
                        if vc = V_TOT-1 then
                            vc <= 0;
                        else
                            vc <= vc + 1;
                        end if;
                        if vc = V_VIS-1 then
                            vb <= '1';
                        end if;
                    else
                        hc <= hc + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    pix_en <= en;
    h      <= hc;
    v      <= vc;
    active <= '1' when hc < H_VIS and vc < V_VIS else '0';
    hsync  <= '0' when hc >= H_VIS + H_FP and hc < H_VIS + H_FP + H_SY else '1';
    vsync  <= '0' when vc >= V_VIS + V_FP and vc < V_VIS + V_FP + V_SY else '1';
    vblank <= vb;

end architecture;
