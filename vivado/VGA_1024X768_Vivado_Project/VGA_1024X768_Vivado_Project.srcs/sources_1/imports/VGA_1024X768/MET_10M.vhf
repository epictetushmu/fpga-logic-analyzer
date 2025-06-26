--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : MET_10M.vhf
-- /___/   /\     Timestamp : 03/17/2025 03:29:18
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl E:/vhdl/VGA_1024X768/MET_10M.vhf -w E:/vhdl/VGA_1024X768/MET_10M.sch
--Design Name: MET_10M
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

entity MET_10M is
   port ( MH    : in    std_logic; 
          ROLOI : in    std_logic; 
          MET_4 : out   std_logic; 
          MET0  : out   std_logic; 
          MET1  : out   std_logic; 
          MET2  : out   std_logic; 
          MET3  : out   std_logic; 
          MET4  : out   std_logic; 
          MET5  : out   std_logic; 
          MET6  : out   std_logic; 
          MET7  : out   std_logic; 
          MET8  : out   std_logic; 
          MET9  : out   std_logic);
end MET_10M;

architecture BEHAVIORAL of MET_10M is
   attribute BOX_TYPE   : string ;
   signal XLXN_1      : std_logic;
   signal XLXN_3      : std_logic;
   signal XLXN_4      : std_logic;
   signal XLXN_6      : std_logic;
   signal XLXN_23     : std_logic;
   signal XLXN_24     : std_logic;
   signal XLXN_25     : std_logic;
   signal XLXN_26     : std_logic;
   signal XLXN_27     : std_logic;
   signal XLXN_61     : std_logic;
   signal XLXN_62     : std_logic;
   signal XLXN_63     : std_logic;
   signal XLXN_64     : std_logic;
   signal XLXN_70     : std_logic;
   signal XLXN_71     : std_logic;
   signal XLXN_72     : std_logic;
   signal XLXN_73     : std_logic;
   signal XLXN_74     : std_logic;
   signal XLXN_76     : std_logic;
   signal MET_4_DUMMY : std_logic;
   component DFF_AK_MAE
      port ( D     : in    std_logic; 
             ROLOI : in    std_logic; 
             PR    : in    std_logic; 
             MH    : in    std_logic; 
             Q     : out   std_logic; 
             Qs    : out   std_logic);
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
begin
   MET_4 <= MET_4_DUMMY;
   XLXI_1 : DFF_AK_MAE
      port map (D=>XLXN_1,
                MH=>MH,
                PR=>XLXN_23,
                ROLOI=>ROLOI,
                Q=>MET0,
                Qs=>XLXN_1);
   
   XLXI_3 : DFF_AK_MAE
      port map (D=>XLXN_3,
                MH=>MH,
                PR=>XLXN_24,
                ROLOI=>XLXN_1,
                Q=>MET1,
                Qs=>XLXN_3);
   
   XLXI_4 : DFF_AK_MAE
      port map (D=>XLXN_4,
                MH=>MH,
                PR=>XLXN_25,
                ROLOI=>XLXN_3,
                Q=>MET2,
                Qs=>XLXN_4);
   
   XLXI_6 : DFF_AK_MAE
      port map (D=>XLXN_6,
                MH=>MH,
                PR=>XLXN_26,
                ROLOI=>XLXN_4,
                Q=>MET3,
                Qs=>XLXN_6);
   
   XLXI_7 : DFF_AK_MAE
      port map (D=>MET_4_DUMMY,
                MH=>MH,
                PR=>XLXN_27,
                ROLOI=>XLXN_6,
                Q=>MET4,
                Qs=>MET_4_DUMMY);
   
   XLXI_8 : VCC
      port map (P=>XLXN_23);
   
   XLXI_9 : VCC
      port map (P=>XLXN_24);
   
   XLXI_10 : VCC
      port map (P=>XLXN_25);
   
   XLXI_11 : VCC
      port map (P=>XLXN_26);
   
   XLXI_12 : VCC
      port map (P=>XLXN_27);
   
   XLXI_33 : DFF_AK_MAE
      port map (D=>XLXN_61,
                MH=>MH,
                PR=>XLXN_70,
                ROLOI=>MET_4_DUMMY,
                Q=>MET5,
                Qs=>XLXN_61);
   
   XLXI_34 : DFF_AK_MAE
      port map (D=>XLXN_62,
                MH=>MH,
                PR=>XLXN_71,
                ROLOI=>XLXN_61,
                Q=>MET6,
                Qs=>XLXN_62);
   
   XLXI_35 : DFF_AK_MAE
      port map (D=>XLXN_63,
                MH=>MH,
                PR=>XLXN_72,
                ROLOI=>XLXN_62,
                Q=>MET7,
                Qs=>XLXN_63);
   
   XLXI_36 : DFF_AK_MAE
      port map (D=>XLXN_64,
                MH=>MH,
                PR=>XLXN_73,
                ROLOI=>XLXN_63,
                Q=>MET8,
                Qs=>XLXN_64);
   
   XLXI_37 : DFF_AK_MAE
      port map (D=>XLXN_76,
                MH=>MH,
                PR=>XLXN_74,
                ROLOI=>XLXN_64,
                Q=>MET9,
                Qs=>XLXN_76);
   
   XLXI_38 : VCC
      port map (P=>XLXN_70);
   
   XLXI_39 : VCC
      port map (P=>XLXN_71);
   
   XLXI_40 : VCC
      port map (P=>XLXN_72);
   
   XLXI_41 : VCC
      port map (P=>XLXN_73);
   
   XLXI_42 : VCC
      port map (P=>XLXN_74);
   
end BEHAVIORAL;


