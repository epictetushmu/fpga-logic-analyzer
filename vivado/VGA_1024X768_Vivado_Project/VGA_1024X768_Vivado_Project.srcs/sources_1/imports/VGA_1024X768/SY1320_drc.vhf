--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : SY1320_drc.vhf
-- /___/   /\     Timestamp : 01/03/2024 14:10:28
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt\unwrapped\sch2hdl.exe -intstyle ise -family spartan3e -flat -suppress -vhdl SY1320_drc.vhf -w E:/vhdl/VGA_1024X768/SY1320.sch
--Design Name: SY1320
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

entity SY1320 is
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
          ESY1320  : out   std_logic);
end SY1320;

architecture BEHAVIORAL of SY1320 is
   attribute BOX_TYPE   : string ;
   signal XLXN_24  : std_logic;
   signal XLXN_49  : std_logic;
   signal XLXN_50  : std_logic;
   signal XLXN_52  : std_logic;
   signal XLXN_54  : std_logic;
   signal XLXN_55  : std_logic;
   signal XLXN_56  : std_logic;
   signal XLXN_58  : std_logic;
   signal XLXN_61  : std_logic;
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
                O=>XLXN_58);
   
   XLXI_3 : INV
      port map (I=>EISMET0,
                O=>XLXN_54);
   
   XLXI_4 : INV
      port map (I=>EISMET2,
                O=>XLXN_61);
   
   XLXI_6 : INV
      port map (I=>EISMET4,
                O=>XLXN_52);
   
   XLXI_9 : INV
      port map (I=>EISMET6,
                O=>XLXN_50);
   
   XLXI_10 : INV
      port map (I=>EISMET7,
                O=>XLXN_49);
   
   XLXI_14 : INV
      port map (I=>EISMET9,
                O=>XLXN_24);
   
   XLXI_16 : AND5
      port map (I0=>XLXN_50,
                I1=>XLXN_49,
                I2=>EISMET8,
                I3=>XLXN_24,
                I4=>EISMET10,
                O=>XLXN_56);
   
   XLXI_17 : AND5
      port map (I0=>XLXN_54,
                I1=>XLXN_58,
                I2=>XLXN_61,
                I3=>EISMET3,
                I4=>XLXN_52,
                O=>XLXN_55);
   
   XLXI_18 : AND3
      port map (I0=>XLXN_55,
                I1=>EISMET5,
                I2=>XLXN_56,
                O=>ESY1320);
   
end BEHAVIORAL;


