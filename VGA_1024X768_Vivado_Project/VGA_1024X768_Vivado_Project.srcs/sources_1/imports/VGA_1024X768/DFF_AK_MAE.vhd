----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:17:49 12/12/2024 
-- Design Name: 
-- Module Name:    DFF_AK - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DFF_AK_MAE is
    Port ( D : in  STD_LOGIC;
           ROLOI : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Qs : out  STD_LOGIC;
			  PR : in  STD_LOGIC;
			  MH : in  STD_LOGIC
			  );
end DFF_AK_MAE;

architecture Behavioral of DFF_AK_MAE is

SIGNAL E1, E2, E3, E4, E5, E6 :  STD_LOGIC;

begin

E1<= NOT (E2 AND E4 AND PR);
E2<= NOT (ROLOI AND E1 AND MH);
E3<= NOT (ROLOI AND E2 AND E4);
E4<= NOT(D AND E3 AND MH);
E5<= NOT (E2 AND E6 AND PR);
E6<= NOT (E3 AND E5 AND MH);

Q<= E5;
QS<= E6;

end Behavioral;

