--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : AKA.vhf
-- /___/   /\     Timestamp : 03/17/2025 03:29:20
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl E:/vhdl/VGA_1024X768/AKA.vhf -w E:/vhdl/VGA_1024X768/AKA.sch
--Design Name: AKA
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

entity TET_MANT_MUSER_AKA is
   port ( EIS1 : in    std_logic; 
          EIS2 : in    std_logic; 
          EIS3 : in    std_logic; 
          EIS4 : in    std_logic; 
          E1   : out   std_logic; 
          E2   : out   std_logic; 
          E3   : out   std_logic; 
          E4   : out   std_logic);
end TET_MANT_MUSER_AKA;

architecture BEHAVIORAL of TET_MANT_MUSER_AKA is
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SY806_MUSER_AKA is
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
end SY806_MUSER_AKA;

architecture BEHAVIORAL of SY806_MUSER_AKA is
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SY803_MUSER_AKA is
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
          ESY803  : out   std_logic);
end SY803_MUSER_AKA;

architecture BEHAVIORAL of SY803_MUSER_AKA is
   attribute BOX_TYPE   : string ;
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
                O=>ESY803);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SY35_MUSER_AKA is
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
end SY35_MUSER_AKA;

architecture BEHAVIORAL of SY35_MUSER_AKA is
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SY6_MUSER_AKA is
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
          ESY6    : out   std_logic);
end SY6_MUSER_AKA;

architecture BEHAVIORAL of SY6_MUSER_AKA is
   attribute BOX_TYPE   : string ;
   signal XLXN_12 : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_26 : std_logic;
   signal XLXN_27 : std_logic;
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
      port map (I0=>XLXN_27,
                I1=>XLXN_26,
                I2=>XLXN_14,
                I3=>XLXN_13,
                I4=>XLXN_12,
                O=>XLXN_36);
   
   XLXI_8 : INV
      port map (I=>EISMET5,
                O=>XLXN_27);
   
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
                O=>ESY6);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity MET_10M_MUSER_AKA is
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
end MET_10M_MUSER_AKA;

architecture BEHAVIORAL of MET_10M_MUSER_AKA is
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity AKA is
   port ( ROLOI : in    std_logic; 
          KEO   : out   std_logic; 
          KS    : out   std_logic);
end AKA;

architecture BEHAVIORAL of AKA is
   attribute BOX_TYPE   : string ;
   signal XLXN_1  : std_logic;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic;
   signal XLXN_5  : std_logic;
   signal XLXN_6  : std_logic;
   signal XLXN_7  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_9  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_12 : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_23 : std_logic;
   signal XLXN_27 : std_logic;
   component MET_10M_MUSER_AKA
      port ( MH    : in    std_logic; 
             ROLOI : in    std_logic; 
             MET0  : out   std_logic; 
             MET1  : out   std_logic; 
             MET2  : out   std_logic; 
             MET3  : out   std_logic; 
             MET4  : out   std_logic; 
             MET_4 : out   std_logic; 
             MET5  : out   std_logic; 
             MET6  : out   std_logic; 
             MET7  : out   std_logic; 
             MET8  : out   std_logic; 
             MET9  : out   std_logic);
   end component;
   
   component SY6_MUSER_AKA
      port ( EISMET1 : in    std_logic; 
             EISMET3 : in    std_logic; 
             EISMET4 : in    std_logic; 
             EISMET2 : in    std_logic; 
             EISMET0 : in    std_logic; 
             EISMET5 : in    std_logic; 
             EISMET6 : in    std_logic; 
             EISMET7 : in    std_logic; 
             EISMET8 : in    std_logic; 
             EISMET9 : in    std_logic; 
             ESY6    : out   std_logic);
   end component;
   
   component SY35_MUSER_AKA
      port ( EISMET1 : in    std_logic; 
             EISMET3 : in    std_logic; 
             EISMET4 : in    std_logic; 
             EISMET2 : in    std_logic; 
             EISMET0 : in    std_logic; 
             EISMET5 : in    std_logic; 
             EISMET6 : in    std_logic; 
             EISMET7 : in    std_logic; 
             EISMET8 : in    std_logic; 
             EISMET9 : in    std_logic; 
             ESY35   : out   std_logic);
   end component;
   
   component SY803_MUSER_AKA
      port ( EISMET1 : in    std_logic; 
             EISMET3 : in    std_logic; 
             EISMET4 : in    std_logic; 
             EISMET2 : in    std_logic; 
             EISMET0 : in    std_logic; 
             EISMET5 : in    std_logic; 
             EISMET6 : in    std_logic; 
             EISMET7 : in    std_logic; 
             EISMET8 : in    std_logic; 
             EISMET9 : in    std_logic; 
             ESY803  : out   std_logic);
   end component;
   
   component SY806_MUSER_AKA
      port ( EISMET1 : in    std_logic; 
             EISMET3 : in    std_logic; 
             EISMET4 : in    std_logic; 
             EISMET2 : in    std_logic; 
             EISMET0 : in    std_logic; 
             EISMET5 : in    std_logic; 
             EISMET6 : in    std_logic; 
             EISMET7 : in    std_logic; 
             EISMET8 : in    std_logic; 
             EISMET9 : in    std_logic; 
             ESY806  : out   std_logic);
   end component;
   
   component TET_MANT_MUSER_AKA
      port ( EIS1 : in    std_logic; 
             EIS2 : in    std_logic; 
             EIS3 : in    std_logic; 
             EIS4 : in    std_logic; 
             E1   : out   std_logic; 
             E2   : out   std_logic; 
             E3   : out   std_logic; 
             E4   : out   std_logic);
   end component;
   
   component NAND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NAND2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_1 : MET_10M_MUSER_AKA
      port map (MH=>XLXN_23,
                ROLOI=>ROLOI,
                MET_4=>open,
                MET0=>XLXN_1,
                MET1=>XLXN_2,
                MET2=>XLXN_3,
                MET3=>XLXN_4,
                MET4=>XLXN_5,
                MET5=>XLXN_6,
                MET6=>XLXN_7,
                MET7=>XLXN_8,
                MET8=>XLXN_9,
                MET9=>XLXN_10);
   
   XLXI_2 : SY6_MUSER_AKA
      port map (EISMET0=>XLXN_1,
                EISMET1=>XLXN_2,
                EISMET2=>XLXN_3,
                EISMET3=>XLXN_4,
                EISMET4=>XLXN_5,
                EISMET5=>XLXN_6,
                EISMET6=>XLXN_7,
                EISMET7=>XLXN_8,
                EISMET8=>XLXN_9,
                EISMET9=>XLXN_10,
                ESY6=>XLXN_12);
   
   XLXI_3 : SY35_MUSER_AKA
      port map (EISMET0=>XLXN_1,
                EISMET1=>XLXN_2,
                EISMET2=>XLXN_3,
                EISMET3=>XLXN_4,
                EISMET4=>XLXN_5,
                EISMET5=>XLXN_6,
                EISMET6=>XLXN_7,
                EISMET7=>XLXN_8,
                EISMET8=>XLXN_9,
                EISMET9=>XLXN_10,
                ESY35=>XLXN_11);
   
   XLXI_4 : SY803_MUSER_AKA
      port map (EISMET0=>XLXN_1,
                EISMET1=>XLXN_2,
                EISMET2=>XLXN_3,
                EISMET3=>XLXN_4,
                EISMET4=>XLXN_5,
                EISMET5=>XLXN_6,
                EISMET6=>XLXN_7,
                EISMET7=>XLXN_8,
                EISMET8=>XLXN_9,
                EISMET9=>XLXN_10,
                ESY803=>XLXN_13);
   
   XLXI_5 : SY806_MUSER_AKA
      port map (EISMET0=>XLXN_1,
                EISMET1=>XLXN_2,
                EISMET2=>XLXN_3,
                EISMET3=>XLXN_4,
                EISMET4=>XLXN_5,
                EISMET5=>XLXN_6,
                EISMET6=>XLXN_7,
                EISMET7=>XLXN_8,
                EISMET8=>XLXN_9,
                EISMET9=>XLXN_10,
                ESY806=>XLXN_14);
   
   XLXI_6 : TET_MANT_MUSER_AKA
      port map (EIS1=>XLXN_12,
                EIS2=>XLXN_11,
                EIS3=>XLXN_13,
                EIS4=>XLXN_14,
                E1=>open,
                E2=>KEO,
                E3=>open,
                E4=>XLXN_27);
   
   XLXI_7 : NAND2
      port map (I0=>XLXN_14,
                I1=>XLXN_27,
                O=>XLXN_23);
   
   XLXI_8 : INV
      port map (I=>XLXN_27,
                O=>KS);
   
end BEHAVIORAL;


