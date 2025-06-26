--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : TET_MANT_drc.vhf
-- /___/   /\     Timestamp : 01/03/2024 14:11:59
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt\unwrapped\sch2hdl.exe -intstyle ise -family spartan3e -flat -suppress -vhdl TET_MANT_drc.vhf -w E:/vhdl/VGA_1024X768/TET_MANT.sch
--Design Name: TET_MANT
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

entity TET_MANT is
   port ( EIS1 : in    std_logic; 
          EIS2 : in    std_logic; 
          EIS3 : in    std_logic; 
          EIS4 : in    std_logic; 
          E1   : out   std_logic; 
          E2   : out   std_logic; 
          E3   : out   std_logic; 
          E4   : out   std_logic);
end TET_MANT;

architecture BEHAVIORAL of TET_MANT is
   attribute BOX_TYPE   : string ;
   signal XLXN_2   : std_logic;
   signal XLXN_7   : std_logic;
   signal XLXN_8   : std_logic;
   signal XLXN_10  : std_logic;
   signal E1_DUMMY : std_logic;
   signal E2_DUMMY : std_logic;
   signal E3_DUMMY : std_logic;
   signal E4_DUMMY : std_logic;
   component NOR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NOR4 : component is "BLACK_BOX";
   
   component NOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NOR2 : component is "BLACK_BOX";
   
begin
   E1 <= E1_DUMMY;
   E2 <= E2_DUMMY;
   E3 <= E3_DUMMY;
   E4 <= E4_DUMMY;
   XLXI_1 : NOR4
      port map (I0=>XLXN_2,
                I1=>EIS2,
                I2=>EIS3,
                I3=>EIS4,
                O=>E1_DUMMY);
   
   XLXI_2 : NOR4
      port map (I0=>XLXN_7,
                I1=>EIS4,
                I2=>EIS3,
                I3=>EIS1,
                O=>E2_DUMMY);
   
   XLXI_3 : NOR4
      port map (I0=>XLXN_8,
                I1=>EIS4,
                I2=>EIS2,
                I3=>EIS1,
                O=>E3_DUMMY);
   
   XLXI_4 : NOR4
      port map (I0=>XLXN_10,
                I1=>EIS1,
                I2=>EIS2,
                I3=>EIS3,
                O=>E4_DUMMY);
   
   XLXI_5 : NOR2
      port map (I0=>EIS1,
                I1=>E1_DUMMY,
                O=>XLXN_2);
   
   XLXI_6 : NOR2
      port map (I0=>EIS2,
                I1=>E2_DUMMY,
                O=>XLXN_7);
   
   XLXI_7 : NOR2
      port map (I0=>EIS3,
                I1=>E3_DUMMY,
                O=>XLXN_8);
   
   XLXI_8 : NOR2
      port map (I0=>EIS4,
                I1=>E4_DUMMY,
                O=>XLXN_10);
   
end BEHAVIORAL;


