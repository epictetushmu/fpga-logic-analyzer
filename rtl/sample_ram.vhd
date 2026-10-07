-------------------------------------------------------------------------------
-- sample_ram.vhd
-- Simple dual-port block RAM (one write port, one registered read port).
-- Vivado infers RAMB36 primitives from this template.
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sample_ram is
    generic (
        AW : integer := 13;   -- address width (bank bit + sample address)
        DW : integer := 16
    );
    port (
        clk   : in  std_logic;
        we    : in  std_logic;
        waddr : in  std_logic_vector(AW-1 downto 0);
        wdata : in  std_logic_vector(DW-1 downto 0);
        raddr : in  std_logic_vector(AW-1 downto 0);
        rdata : out std_logic_vector(DW-1 downto 0)
    );
end entity;

architecture rtl of sample_ram is
    type ram_t is array (0 to 2**AW - 1) of std_logic_vector(DW-1 downto 0);
    signal ram : ram_t := (others => (others => '0'));
    attribute ram_style : string;
    attribute ram_style of ram : signal is "block";
    signal q : std_logic_vector(DW-1 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                ram(to_integer(unsigned(waddr))) <= wdata;
            end if;
            q <= ram(to_integer(unsigned(raddr)));
        end if;
    end process;
    rdata <= q;
end architecture;
