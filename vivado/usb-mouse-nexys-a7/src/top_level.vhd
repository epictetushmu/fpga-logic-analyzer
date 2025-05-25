library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top_level is
    Port (
        clk         : in  STD_LOGIC;
        reset       : in  STD_LOGIC;
        usb_data    : in  STD_LOGIC_VECTOR(7 downto 0);
        usb_clk     : in  STD_LOGIC;
        mouse_buttons: in  STD_LOGIC_VECTOR(2 downto 0);
        led         : out STD_LOGIC_VECTOR(7 downto 0)
    );
end top_level;

architecture Behavioral of top_level is

    signal usb_ready       : STD_LOGIC;
    signal mouse_data      : STD_LOGIC_VECTOR(7 downto 0);
    signal mouse_position   : STD_LOGIC_VECTOR(15 downto 0);

    component usb_mouse_controller is
        Port (
            clk         : in  STD_LOGIC;
            reset       : in  STD_LOGIC;
            usb_data    : in  STD_LOGIC_VECTOR(7 downto 0);
            usb_clk     : in  STD_LOGIC;
            mouse_data   : out STD_LOGIC_VECTOR(7 downto 0);
            mouse_position: out STD_LOGIC_VECTOR(15 downto 0);
            usb_ready   : out STD_LOGIC
        );
    end component;

    component usb_phy is
        Port (
            clk         : in  STD_LOGIC;
            reset       : in  STD_LOGIC;
            usb_data    : in  STD_LOGIC_VECTOR(7 downto 0);
            usb_clk     : in  STD_LOGIC;
            led         : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

begin

    usb_controller_inst : usb_mouse_controller
        port map (
            clk => clk,
            reset => reset,
            usb_data => usb_data,
            usb_clk => usb_clk,
            mouse_data => mouse_data,
            mouse_position => mouse_position,
            usb_ready => usb_ready
        );

    usb_phy_inst : usb_phy
        port map (
            clk => clk,
            reset => reset,
            usb_data => usb_data,
            usb_clk => usb_clk,
            led => led
        );

end Behavioral;