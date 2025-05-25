library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity debounce is
    Port ( clk       : in  STD_LOGIC;
           rst       : in  STD_LOGIC;
           button_in : in  STD_LOGIC;
           button_out : out STD_LOGIC);
end debounce;

architecture Behavioral of debounce is
    signal button_sync : STD_LOGIC_VECTOR(1 downto 0);
    signal button_filtered : STD_LOGIC;
begin

    process(clk, rst)
    begin
        if rst = '1' then
            button_sync <= (others => '0');
            button_filtered <= '0';
        elsif rising_edge(clk) then
            button_sync(0) <= button_in;
            button_sync(1) <= button_sync(0);
            if button_sync(0) = button_sync(1) then
                button_filtered <= button_sync(0);
            end if;
        end if;
    end process;

    button_out <= button_filtered;

end Behavioral;