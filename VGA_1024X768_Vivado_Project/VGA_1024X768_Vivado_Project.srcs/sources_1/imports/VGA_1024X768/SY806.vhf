--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : SY806.vhf
-- /___/   /\     Timestamp : 01/03/2024 16:52:25
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl E:/vhdl/VGA_1024X768/SY806.vhf -w E:/vhdl/VGA_1024X768/SY806.sch
--Design Name: SY806
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

entity SY806 is
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
          ESY806  : out   std_logic);
end SY806;

architecture BEHAVIORAL of SY806 is
   attribute BOX_TYPE   : string ;
   signal XLXN_14 : std_logic;
   signal XLXN_26 : std_logic;
   signal XLXN_30 : std_logic;
   signal XLXN_31 : std_logic;
   signal XLXN_34 : std_logic;
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
      port map (I0=>XLXN_34,
                I1=>EISMET1,
                I2=>EISMET2,
                I3=>XLXN_31,
                I4=>XLXN_30,
                O=>XLXN_35);
   
   XLXI_3 : INV
      port map (I=>EISMET0,
                O=>XLXN_34);
   
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
                I3=>EISMET8,
                I4=>EISMET9,
                O=>XLXN_36);
   
   XLXI_9 : INV
      port map (I=>EISMET6,
                O=>XLXN_26);
   
   XLXI_10 : INV
      port map (I=>EISMET7,
                O=>XLXN_14);
   
   XLXI_15 : AND2
      port map (I0=>XLXN_35,
                I1=>XLXN_36,
                O=>ESY806);
   
end BEHAVIORAL;


