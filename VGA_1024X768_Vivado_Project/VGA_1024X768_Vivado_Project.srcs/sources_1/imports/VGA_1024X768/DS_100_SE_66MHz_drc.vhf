--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : DS_100_SE_66MHz_drc.vhf
-- /___/   /\     Timestamp : 01/03/2024 16:35:12
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt\unwrapped\sch2hdl.exe -intstyle ise -family artix7 -flat -suppress -vhdl DS_100_SE_66MHz_drc.vhf -w E:/vhdl/VGA_1024X768/DS_100_SE_66MHz.sch
--Design Name: DS_100_SE_66MHz
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

entity DS_100_SE_66MHz is
   port ( ROLOI_100MHz : in    std_logic; 
          E_ROLOI      : out   std_logic);
end DS_100_SE_66MHz;

architecture BEHAVIORAL of DS_100_SE_66MHz is
   attribute BOX_TYPE   : string ;
   signal XLXN_1       : std_logic;
   signal XLXN_2       : std_logic;
   signal XLXN_6       : std_logic;
   signal XLXN_7       : std_logic;
   signal XLXN_12      : std_logic;
   component DFF_AK_MAE
      port ( D     : in    std_logic; 
             ROLOI : in    std_logic; 
             PR    : in    std_logic; 
             MH    : in    std_logic; 
             Q     : out   std_logic; 
             Qs    : out   std_logic);
   end component;
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
begin
   XLXI_1 : DFF_AK_MAE
      port map (D=>XLXN_1,
                MH=>XLXN_12,
                PR=>XLXN_12,
                ROLOI=>XLXN_6,
                Q=>E_ROLOI,
                Qs=>XLXN_1);
   
   XLXI_2 : DFF_AK_MAE
      port map (D=>XLXN_2,
                MH=>XLXN_12,
                PR=>XLXN_12,
                ROLOI=>XLXN_1,
                Q=>XLXN_7,
                Qs=>XLXN_2);
   
   XLXI_3 : XOR2
      port map (I0=>XLXN_7,
                I1=>ROLOI_100MHz,
                O=>XLXN_6);
   
   XLXI_4 : VCC
      port map (P=>XLXN_12);
   
end BEHAVIORAL;


