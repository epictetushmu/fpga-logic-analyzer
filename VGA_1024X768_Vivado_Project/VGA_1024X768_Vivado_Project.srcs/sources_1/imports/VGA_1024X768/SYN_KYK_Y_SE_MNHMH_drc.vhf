--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : SYN_KYK_Y_SE_MNHMH_drc.vhf
-- /___/   /\     Timestamp : 04/03/2025 06:42:51
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt\unwrapped\sch2hdl.exe -intstyle ise -family artix7 -flat -suppress -vhdl SYN_KYK_Y_SE_MNHMH_drc.vhf -w E:/vhdl/VGA_1024X768/SYN_KYK_Y_SE_MNHMH.sch
--Design Name: SYN_KYK_Y_SE_MNHMH
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SYN_KYK_Y_SE_MNHMH is
   port ( E   : in    std_logic; 
          Y7  : in    std_logic; 
          Y8  : in    std_logic; 
          A16 : out   std_logic; 
          A17 : out   std_logic; 
          A18 : out   std_logic);
end SYN_KYK_Y_SE_MNHMH;

architecture BEHAVIORAL of SYN_KYK_Y_SE_MNHMH is
   attribute BOX_TYPE   : string ;
   signal XLXN_1  : std_logic;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic;
   signal XLXN_5  : std_logic;
   signal XLXN_6  : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_26 : std_logic;
   signal XLXN_29 : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND2
      port map (I0=>Y8,
                I1=>E,
                O=>XLXN_1);
   
   XLXI_2 : AND2
      port map (I0=>Y7,
                I1=>E,
                O=>XLXN_2);
   
   XLXI_4 : AND2
      port map (I0=>Y8,
                I1=>XLXN_26,
                O=>XLXN_4);
   
   XLXI_5 : AND2
      port map (I0=>Y7,
                I1=>XLXN_26,
                O=>XLXN_5);
   
   XLXI_6 : AND2
      port map (I0=>XLXN_29,
                I1=>E,
                O=>XLXN_6);
   
   XLXI_7 : OR2
      port map (I0=>XLXN_2,
                I1=>XLXN_1,
                O=>A18);
   
   XLXI_8 : OR2
      port map (I0=>XLXN_4,
                I1=>XLXN_3,
                O=>A17);
   
   XLXI_9 : OR2
      port map (I0=>XLXN_6,
                I1=>XLXN_5,
                O=>A16);
   
   XLXI_22 : AND3
      port map (I0=>XLXN_29,
                I1=>XLXN_21,
                I2=>E,
                O=>XLXN_3);
   
   XLXI_23 : INV
      port map (I=>Y8,
                O=>XLXN_21);
   
   XLXI_24 : INV
      port map (I=>Y7,
                O=>XLXN_29);
   
   XLXI_25 : INV
      port map (I=>E,
                O=>XLXN_26);
   
end BEHAVIORAL;


