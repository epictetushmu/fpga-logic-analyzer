--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : SY136_drc.vhf
-- /___/   /\     Timestamp : 01/03/2024 14:10:46
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt\unwrapped\sch2hdl.exe -intstyle ise -family spartan3e -flat -suppress -vhdl SY136_drc.vhf -w E:/vhdl/VGA_1024X768/SY136.sch
--Design Name: SY136
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SY136 is
   port ( EISMET0  : in    std_logic; 
          EISMET1  : in    std_logic; 
          EISMET2  : in    std_logic; 
          EISMET3  : in    std_logic; 
          EISMET4  : in    std_logic; 
          EISMET5  : in    std_logic; 
          EISMET6  : in    std_logic; 
          EISMET7  : in    std_logic; 
          EISMET8  : in    std_logic; 
          EISMET9  : in    std_logic; 
          EISMET10 : in    std_logic; 
          ESY136   : out   std_logic);
end SY136;

architecture BEHAVIORAL of SY136 is
   attribute BOX_TYPE   : string ;
   signal XLXN_23  : std_logic;
   signal XLXN_24  : std_logic;
   signal XLXN_25  : std_logic;
   signal XLXN_28  : std_logic;
   signal XLXN_42  : std_logic;
   signal XLXN_44  : std_logic;
   signal XLXN_46  : std_logic;
   signal XLXN_47  : std_logic;
   signal XLXN_48  : std_logic;
   signal XLXN_50  : std_logic;
   signal XLXN_51  : std_logic;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5 : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
begin
   XLXI_2 : INV
      port map (I=>EISMET1,
                O=>XLXN_50);
   
   XLXI_3 : INV
      port map (I=>EISMET0,
                O=>XLXN_46);
   
   XLXI_4 : INV
      port map (I=>EISMET2,
                O=>XLXN_51);
   
   XLXI_6 : INV
      port map (I=>EISMET4,
                O=>XLXN_44);
   
   XLXI_8 : INV
      port map (I=>EISMET5,
                O=>XLXN_28);
   
   XLXI_9 : INV
      port map (I=>EISMET6,
                O=>XLXN_42);
   
   XLXI_11 : INV
      port map (I=>EISMET8,
                O=>XLXN_25);
   
   XLXI_14 : INV
      port map (I=>EISMET9,
                O=>XLXN_24);
   
   XLXI_16 : AND5
      port map (I0=>XLXN_42,
                I1=>EISMET7,
                I2=>XLXN_25,
                I3=>XLXN_24,
                I4=>XLXN_23,
                O=>XLXN_48);
   
   XLXI_17 : AND5
      port map (I0=>XLXN_46,
                I1=>XLXN_50,
                I2=>XLXN_51,
                I3=>EISMET3,
                I4=>XLXN_44,
                O=>XLXN_47);
   
   XLXI_18 : AND3
      port map (I0=>XLXN_47,
                I1=>XLXN_28,
                I2=>XLXN_48,
                O=>ESY136);
   
   XLXI_19 : INV
      port map (I=>EISMET10,
                O=>XLXN_23);
   
end BEHAVIORAL;


