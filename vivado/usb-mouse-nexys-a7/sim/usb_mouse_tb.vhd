library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity usb_mouse_tb is
end entity usb_mouse_tb;

architecture behavior of usb_mouse_tb is

    signal clk         : std_logic := '0';
    signal reset       : std_logic := '1';
    signal mouse_data  : std_logic_vector(7 downto 0);
    signal mouse_clk   : std_logic;
    signal mouse_ready : std_logic;

    constant clk_period : time := 10 ns;

begin

    -- Instantiate the USB mouse controller and PHY
    uut: entity work.usb_mouse_controller
        port map (
            clk => clk,
            reset => reset,
            mouse_data => mouse_data,
            mouse_clk => mouse_clk,
            mouse_ready => mouse_ready
        );

    -- Clock generation
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process clk_process;

    -- Stimulus process
    stimulus_process : process
    begin
        -- Initialize signals
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        
        -- Add stimulus here
        -- Example: Simulate mouse data input
        wait for 100 ns;
        mouse_data <= "00000001"; -- Example mouse data
        wait for 10 ns;
        
        -- Finish simulation
        wait;
    end process stimulus_process;

end architecture behavior;