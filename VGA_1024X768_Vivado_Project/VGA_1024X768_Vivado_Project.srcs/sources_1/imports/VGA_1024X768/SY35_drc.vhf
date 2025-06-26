--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : SY35_drc.vhf
-- /___/   /\     Timestamp : 01/03/2024 14:11:03
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt\unwrapped\sch2hdl.exe -intstyle ise -family spartan3e -flat -suppress -vhdl SY35_drc.vhf -w E:/vhdl/VGA_1024X768/SY35.sch
--Design Name: SY35
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

entity SY35 is
   port ( EISMET0 : in    std_logic; 
          EISMET1 : in    std_logic; 
          EISMET2 : in    std_logic; 
          EISMET3 : in    std_logic; 
          EISMET4 : in    std_logic; 
          EISMET5 : in    std_logic; 
          EISMET6 : in    std_logic; 
          EISMET7 : in    std_logic; 
          EISMET8 : in    std_logic; 
          EISMET9 : in    std_logic; 
          ESY35   : out   std_logic);
end SY35;

architecture BEHAVIORAL of SY35 is
   attribute BOX_TYPE   : string ;
   signal XLXN_12 : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_26 : std_logic;
   signal XLXN_30 : std_logic;
   signal XLXN_31 : std_logic;
   signal XLXN_32 : std_logic;
   signal XLXN_35 : std_logic;
   signal XLXN_36 : std_logic;
   component AND5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND5
      port map (I0=>EISMET0,
                I1=>EISMET1,
                I2=>XLXN_32,
                I3=>XLXN_31,
                I4=>XLXN_30,
                O=>XLXN_35);
   
   XLXI_4 : INV
      port map (I=>EISMET2,
                O=>XLXN_32);
   
   XLXI_5 : INV
      port map (I=>EISMET3,
                O=>XLXN_31);
   
   XLXI_6 : INV
      port map (I=>EISMET4,
                O=>XLXN_30);
   
   XLXI_7 : AND5
      port map (I0=>EISMET5,
                I1=>XLXN_26,
                I2=>XLXN_14,
                I3=>XLXN_13,
                I4=>XLXN_12,
                O=>XLXN_36);
   
   XLXI_9 : INV
      port map (I=>EISMET6,
                O=>XLXN_26);
   
   XLXI_10 : INV
      port map (I=>EISMET7,
                O=>XLXN_14);
   
   XLXI_11 : INV
      port map (I=>EISMET8,
                O=>XLXN_13);
   
   XLXI_14 : INV
      port map (I=>EISMET9,
                O=>XLXN_12);
   
   XLXI_15 : AND2
      port map (I0=>XLXN_35,
                I1=>XLXN_36,
                O=>ESY35);
   
end BEHAVIORAL;


