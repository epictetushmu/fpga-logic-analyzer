--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : SX_drc.vhf
-- /___/   /\     Timestamp : 04/15/2025 14:10:22
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt\unwrapped\sch2hdl.exe -intstyle ise -family artix7 -flat -suppress -vhdl SX_drc.vhf -w E:/vhdl/VGA_1024X768/SX.sch
--Design Name: SX
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

entity ROLOI_100MHz_SE_16MHz_MUSER_SX is
   port ( ROLOI   : in    std_logic; 
          E_ROLOI : out   std_logic);
end ROLOI_100MHz_SE_16MHz_MUSER_SX;

architecture BEHAVIORAL of ROLOI_100MHz_SE_16MHz_MUSER_SX is
   attribute BANDWIDTH          : string ;
   attribute CLKFBOUT_MULT_F    : string ;
   attribute CLKFBOUT_PHASE     : string ;
   attribute CLKIN1_PERIOD      : string ;
   attribute CLKOUT0_DIVIDE_F   : string ;
   attribute CLKOUT0_DUTY_CYCLE : string ;
   attribute CLKOUT0_PHASE      : string ;
   attribute CLKOUT1_DIVIDE     : string ;
   attribute CLKOUT1_DUTY_CYCLE : string ;
   attribute CLKOUT1_PHASE      : string ;
   attribute CLKOUT2_DIVIDE     : string ;
   attribute CLKOUT2_DUTY_CYCLE : string ;
   attribute CLKOUT2_PHASE      : string ;
   attribute CLKOUT3_DIVIDE     : string ;
   attribute CLKOUT3_DUTY_CYCLE : string ;
   attribute CLKOUT3_PHASE      : string ;
   attribute CLKOUT4_CASCADE    : string ;
   attribute CLKOUT4_DIVIDE     : string ;
   attribute CLKOUT4_DUTY_CYCLE : string ;
   attribute CLKOUT4_PHASE      : string ;
   attribute CLKOUT5_DIVIDE     : string ;
   attribute CLKOUT5_DUTY_CYCLE : string ;
   attribute CLKOUT5_PHASE      : string ;
   attribute CLKOUT6_DIVIDE     : string ;
   attribute CLKOUT6_DUTY_CYCLE : string ;
   attribute CLKOUT6_PHASE      : string ;
   attribute DIVCLK_DIVIDE      : string ;
   attribute REF_JITTER1        : string ;
   attribute STARTUP_WAIT       : string ;
   attribute BOX_TYPE           : string ;
   signal XLXN_4                   : std_logic;
   signal XLXI_3_PWRDWN_openSignal : std_logic;
   signal XLXI_3_RST_openSignal    : std_logic;
   component MMCME2_BASE
      -- synopsys translate_off
      generic( BANDWIDTH : string :=  "OPTIMIZED";
               CLKFBOUT_MULT_F : real :=  5.000;
               CLKFBOUT_PHASE : real :=  0.000;
               CLKOUT0_DIVIDE_F : real :=  1.000;
               CLKOUT0_PHASE : real :=  0.000;
               CLKOUT1_DIVIDE : integer :=  1;
               CLKOUT1_PHASE : real :=  0.000;
               CLKOUT2_DIVIDE : integer :=  1;
               CLKOUT2_PHASE : real :=  0.000;
               CLKOUT3_DIVIDE : integer :=  1;
               CLKOUT3_PHASE : real :=  0.000;
               CLKOUT4_CASCADE : string :=  "FALSE";
               CLKOUT4_DIVIDE : integer :=  1;
               CLKOUT4_PHASE : real :=  0.000;
               CLKOUT5_DIVIDE : integer :=  1;
               CLKOUT5_PHASE : real :=  0.000;
               CLKOUT6_DIVIDE : integer :=  1;
               CLKOUT6_PHASE : real :=  0.000;
               DIVCLK_DIVIDE : integer :=  1;
               STARTUP_WAIT : string :=  "FALSE");
      -- synopsys translate_on
      port ( CLKFBIN   : in    std_logic; 
             CLKIN1    : in    std_logic; 
             PWRDWN    : in    std_logic; 
             RST       : in    std_logic; 
             CLKFBOUT  : out   std_logic; 
             CLKFBOUTB : out   std_logic; 
             CLKOUT0   : out   std_logic; 
             CLKOUT0B  : out   std_logic; 
             CLKOUT1   : out   std_logic; 
             CLKOUT1B  : out   std_logic; 
             CLKOUT2   : out   std_logic; 
             CLKOUT2B  : out   std_logic; 
             CLKOUT3   : out   std_logic; 
             CLKOUT3B  : out   std_logic; 
             CLKOUT4   : out   std_logic; 
             CLKOUT5   : out   std_logic; 
             CLKOUT6   : out   std_logic; 
             LOCKED    : out   std_logic);
   end component;
   attribute BANDWIDTH of MMCME2_BASE : component is "OPTIMIZED";
   attribute CLKFBOUT_MULT_F of MMCME2_BASE : component is "5.000";
   attribute CLKFBOUT_PHASE of MMCME2_BASE : component is "0.000";
   attribute CLKIN1_PERIOD of MMCME2_BASE : component is "0.000";
   attribute CLKOUT0_DIVIDE_F of MMCME2_BASE : component is "1.000";
   attribute CLKOUT0_DUTY_CYCLE of MMCME2_BASE : component is "0.500";
   attribute CLKOUT0_PHASE of MMCME2_BASE : component is "0.000";
   attribute CLKOUT1_DIVIDE of MMCME2_BASE : component is "1";
   attribute CLKOUT1_DUTY_CYCLE of MMCME2_BASE : component is "0.500";
   attribute CLKOUT1_PHASE of MMCME2_BASE : component is "0.000";
   attribute CLKOUT2_DIVIDE of MMCME2_BASE : component is "1";
   attribute CLKOUT2_DUTY_CYCLE of MMCME2_BASE : component is "0.500";
   attribute CLKOUT2_PHASE of MMCME2_BASE : component is "0.000";
   attribute CLKOUT3_DIVIDE of MMCME2_BASE : component is "1";
   attribute CLKOUT3_DUTY_CYCLE of MMCME2_BASE : component is "0.500";
   attribute CLKOUT3_PHASE of MMCME2_BASE : component is "0.000";
   attribute CLKOUT4_CASCADE of MMCME2_BASE : component is "FALSE";
   attribute CLKOUT4_DIVIDE of MMCME2_BASE : component is "1";
   attribute CLKOUT4_DUTY_CYCLE of MMCME2_BASE : component is "0.500";
   attribute CLKOUT4_PHASE of MMCME2_BASE : component is "0.000";
   attribute CLKOUT5_DIVIDE of MMCME2_BASE : component is "1";
   attribute CLKOUT5_DUTY_CYCLE of MMCME2_BASE : component is "0.500";
   attribute CLKOUT5_PHASE of MMCME2_BASE : component is "0.000";
   attribute CLKOUT6_DIVIDE of MMCME2_BASE : component is "1";
   attribute CLKOUT6_DUTY_CYCLE of MMCME2_BASE : component is "0.500";
   attribute CLKOUT6_PHASE of MMCME2_BASE : component is "0.000";
   attribute DIVCLK_DIVIDE of MMCME2_BASE : component is "1";
   attribute REF_JITTER1 of MMCME2_BASE : component is "0.010";
   attribute STARTUP_WAIT of MMCME2_BASE : component is "FALSE";
   attribute BOX_TYPE of MMCME2_BASE : component is "BLACK_BOX";
   
   attribute CLKFBOUT_MULT_F of XLXI_3 : label is "13.000";
   attribute CLKOUT1_DIVIDE of XLXI_3 : label is "20";
begin
   XLXI_3 : MMCME2_BASE
   -- synopsys translate_off
   generic map( CLKFBOUT_MULT_F => 13.000,
            CLKOUT1_DIVIDE => 20)
   -- synopsys translate_on
      port map (CLKFBIN=>ROLOI,
                CLKIN1=>XLXN_4,
                PWRDWN=>XLXI_3_PWRDWN_openSignal,
                RST=>XLXI_3_RST_openSignal,
                CLKFBOUT=>XLXN_4,
                CLKFBOUTB=>open,
                CLKOUT0=>open,
                CLKOUT0B=>open,
                CLKOUT1=>E_ROLOI,
                CLKOUT1B=>open,
                CLKOUT2=>open,
                CLKOUT2B=>open,
                CLKOUT3=>open,
                CLKOUT3B=>open,
                CLKOUT4=>open,
                CLKOUT5=>open,
                CLKOUT6=>open,
                LOCKED=>open);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity TET_MANT_MUSER_SX is
   port ( EIS1 : in    std_logic; 
          EIS2 : in    std_logic; 
          EIS3 : in    std_logic; 
          EIS4 : in    std_logic; 
          E1   : out   std_logic; 
          E2   : out   std_logic; 
          E3   : out   std_logic; 
          E4   : out   std_logic);
end TET_MANT_MUSER_SX;

architecture BEHAVIORAL of TET_MANT_MUSER_SX is
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

entity SY806_MUSER_SX is
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
end SY806_MUSER_SX;

architecture BEHAVIORAL of SY806_MUSER_SX is
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

entity SY803_MUSER_SX is
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
end SY803_MUSER_SX;

architecture BEHAVIORAL of SY803_MUSER_SX is
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

entity SY35_MUSER_SX is
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
end SY35_MUSER_SX;

architecture BEHAVIORAL of SY35_MUSER_SX is
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

entity SY6_MUSER_SX is
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
end SY6_MUSER_SX;

architecture BEHAVIORAL of SY6_MUSER_SX is
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

entity MET_10M_MUSER_SX is
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
end MET_10M_MUSER_SX;

architecture BEHAVIORAL of MET_10M_MUSER_SX is
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

entity AKA_MUSER_SX is
   port ( ROLOI : in    std_logic; 
          KEO   : out   std_logic; 
          KS    : out   std_logic);
end AKA_MUSER_SX;

architecture BEHAVIORAL of AKA_MUSER_SX is
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
   component MET_10M_MUSER_SX
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
   
   component SY6_MUSER_SX
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
   
   component SY35_MUSER_SX
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
   
   component SY803_MUSER_SX
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
   
   component SY806_MUSER_SX
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
   
   component TET_MANT_MUSER_SX
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
   XLXI_1 : MET_10M_MUSER_SX
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
   
   XLXI_2 : SY6_MUSER_SX
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
   
   XLXI_3 : SY35_MUSER_SX
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
   
   XLXI_4 : SY803_MUSER_SX
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
   
   XLXI_5 : SY806_MUSER_SX
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
   
   XLXI_6 : TET_MANT_MUSER_SX
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SY1344_MUSER_SX is
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
          ESY1344  : out   std_logic);
end SY1344_MUSER_SX;

architecture BEHAVIORAL of SY1344_MUSER_SX is
   attribute BOX_TYPE   : string ;
   signal XLXN_24  : std_logic;
   signal XLXN_28  : std_logic;
   signal XLXN_41  : std_logic;
   signal XLXN_44  : std_logic;
   signal XLXN_45  : std_logic;
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
   
   XLXI_5 : INV
      port map (I=>EISMET3,
                O=>XLXN_45);
   
   XLXI_6 : INV
      port map (I=>EISMET4,
                O=>XLXN_44);
   
   XLXI_8 : INV
      port map (I=>EISMET5,
                O=>XLXN_28);
   
   XLXI_10 : INV
      port map (I=>EISMET7,
                O=>XLXN_41);
   
   XLXI_14 : INV
      port map (I=>EISMET9,
                O=>XLXN_24);
   
   XLXI_16 : AND5
      port map (I0=>EISMET6,
                I1=>XLXN_41,
                I2=>EISMET8,
                I3=>XLXN_24,
                I4=>EISMET10,
                O=>XLXN_48);
   
   XLXI_17 : AND5
      port map (I0=>XLXN_46,
                I1=>XLXN_50,
                I2=>XLXN_51,
                I3=>XLXN_45,
                I4=>XLXN_44,
                O=>XLXN_47);
   
   XLXI_18 : AND3
      port map (I0=>XLXN_47,
                I1=>XLXN_28,
                I2=>XLXN_48,
                O=>ESY1344);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SY1320_MUSER_SX is
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
end SY1320_MUSER_SX;

architecture BEHAVIORAL of SY1320_MUSER_SX is
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SY296_MUSER_SX is
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
          ESY296   : out   std_logic);
end SY296_MUSER_SX;

architecture BEHAVIORAL of SY296_MUSER_SX is
   attribute BOX_TYPE   : string ;
   signal XLXN_23  : std_logic;
   signal XLXN_24  : std_logic;
   signal XLXN_41  : std_logic;
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
   
   XLXI_9 : INV
      port map (I=>EISMET6,
                O=>XLXN_42);
   
   XLXI_10 : INV
      port map (I=>EISMET7,
                O=>XLXN_41);
   
   XLXI_14 : INV
      port map (I=>EISMET9,
                O=>XLXN_24);
   
   XLXI_16 : AND5
      port map (I0=>XLXN_42,
                I1=>XLXN_41,
                I2=>EISMET8,
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
                I1=>EISMET5,
                I2=>XLXN_48,
                O=>ESY296);
   
   XLXI_19 : INV
      port map (I=>EISMET10,
                O=>XLXN_23);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SY136_MUSER_SX is
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
end SY136_MUSER_SX;

architecture BEHAVIORAL of SY136_MUSER_SX is
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity AOR_MUSER_SX is
   port ( ROLOI : in    std_logic; 
          OEO   : out   std_logic; 
          OS    : out   std_logic);
end AOR_MUSER_SX;

architecture BEHAVIORAL of AOR_MUSER_SX is
   attribute BOX_TYPE   : string ;
   signal XLXN_7  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   signal XLXN_24 : std_logic;
   signal XLXN_25 : std_logic;
   signal XLXN_26 : std_logic;
   signal XLXN_28 : std_logic;
   signal XLXN_31 : std_logic;
   signal XLXN_32 : std_logic;
   signal XLXN_35 : std_logic;
   signal XLXN_36 : std_logic;
   signal XLXN_37 : std_logic;
   signal XLXN_38 : std_logic;
   signal XLXN_40 : std_logic;
   signal XLXN_41 : std_logic;
   signal XLXN_44 : std_logic;
   component DFF_AK_MAE
      port ( D     : in    std_logic; 
             ROLOI : in    std_logic; 
             PR    : in    std_logic; 
             MH    : in    std_logic; 
             Q     : out   std_logic; 
             Qs    : out   std_logic);
   end component;
   
   component MET_10M_MUSER_SX
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
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component SY136_MUSER_SX
      port ( EISMET10 : in    std_logic; 
             EISMET1  : in    std_logic; 
             EISMET3  : in    std_logic; 
             EISMET4  : in    std_logic; 
             EISMET2  : in    std_logic; 
             EISMET0  : in    std_logic; 
             EISMET5  : in    std_logic; 
             EISMET6  : in    std_logic; 
             EISMET7  : in    std_logic; 
             EISMET8  : in    std_logic; 
             EISMET9  : in    std_logic; 
             ESY136   : out   std_logic);
   end component;
   
   component SY296_MUSER_SX
      port ( EISMET10 : in    std_logic; 
             EISMET1  : in    std_logic; 
             EISMET3  : in    std_logic; 
             EISMET4  : in    std_logic; 
             EISMET2  : in    std_logic; 
             EISMET0  : in    std_logic; 
             EISMET5  : in    std_logic; 
             EISMET6  : in    std_logic; 
             EISMET7  : in    std_logic; 
             EISMET8  : in    std_logic; 
             EISMET9  : in    std_logic; 
             ESY296   : out   std_logic);
   end component;
   
   component SY1320_MUSER_SX
      port ( EISMET10 : in    std_logic; 
             EISMET1  : in    std_logic; 
             EISMET3  : in    std_logic; 
             EISMET4  : in    std_logic; 
             EISMET2  : in    std_logic; 
             EISMET0  : in    std_logic; 
             EISMET5  : in    std_logic; 
             EISMET6  : in    std_logic; 
             EISMET7  : in    std_logic; 
             EISMET8  : in    std_logic; 
             EISMET9  : in    std_logic; 
             ESY1320  : out   std_logic);
   end component;
   
   component SY1344_MUSER_SX
      port ( EISMET10 : in    std_logic; 
             EISMET1  : in    std_logic; 
             EISMET3  : in    std_logic; 
             EISMET4  : in    std_logic; 
             EISMET2  : in    std_logic; 
             EISMET0  : in    std_logic; 
             EISMET5  : in    std_logic; 
             EISMET6  : in    std_logic; 
             EISMET7  : in    std_logic; 
             EISMET8  : in    std_logic; 
             EISMET9  : in    std_logic; 
             ESY1344  : out   std_logic);
   end component;
   
   component TET_MANT_MUSER_SX
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
   
begin
   XLXI_1 : DFF_AK_MAE
      port map (D=>XLXN_7,
                MH=>XLXN_41,
                PR=>XLXN_40,
                ROLOI=>XLXN_8,
                Q=>XLXN_32,
                Qs=>XLXN_7);
   
   XLXI_2 : MET_10M_MUSER_SX
      port map (MH=>XLXN_41,
                ROLOI=>ROLOI,
                MET_4=>open,
                MET0=>XLXN_18,
                MET1=>XLXN_19,
                MET2=>XLXN_20,
                MET3=>XLXN_21,
                MET4=>XLXN_22,
                MET5=>XLXN_24,
                MET6=>XLXN_25,
                MET7=>XLXN_26,
                MET8=>XLXN_28,
                MET9=>XLXN_31);
   
   XLXI_3 : VCC
      port map (P=>XLXN_40);
   
   XLXI_4 : INV
      port map (I=>XLXN_31,
                O=>XLXN_8);
   
   XLXI_9 : SY136_MUSER_SX
      port map (EISMET0=>XLXN_18,
                EISMET1=>XLXN_19,
                EISMET2=>XLXN_20,
                EISMET3=>XLXN_21,
                EISMET4=>XLXN_22,
                EISMET5=>XLXN_24,
                EISMET6=>XLXN_25,
                EISMET7=>XLXN_26,
                EISMET8=>XLXN_28,
                EISMET9=>XLXN_31,
                EISMET10=>XLXN_32,
                ESY136=>XLXN_36);
   
   XLXI_10 : SY296_MUSER_SX
      port map (EISMET0=>XLXN_18,
                EISMET1=>XLXN_19,
                EISMET2=>XLXN_20,
                EISMET3=>XLXN_21,
                EISMET4=>XLXN_22,
                EISMET5=>XLXN_24,
                EISMET6=>XLXN_25,
                EISMET7=>XLXN_26,
                EISMET8=>XLXN_28,
                EISMET9=>XLXN_31,
                EISMET10=>XLXN_32,
                ESY296=>XLXN_35);
   
   XLXI_11 : SY1320_MUSER_SX
      port map (EISMET0=>XLXN_18,
                EISMET1=>XLXN_19,
                EISMET2=>XLXN_20,
                EISMET3=>XLXN_21,
                EISMET4=>XLXN_22,
                EISMET5=>XLXN_24,
                EISMET6=>XLXN_25,
                EISMET7=>XLXN_26,
                EISMET8=>XLXN_28,
                EISMET9=>XLXN_31,
                EISMET10=>XLXN_32,
                ESY1320=>XLXN_37);
   
   XLXI_12 : SY1344_MUSER_SX
      port map (EISMET0=>XLXN_18,
                EISMET1=>XLXN_19,
                EISMET2=>XLXN_20,
                EISMET3=>XLXN_21,
                EISMET4=>XLXN_22,
                EISMET5=>XLXN_24,
                EISMET6=>XLXN_25,
                EISMET7=>XLXN_26,
                EISMET8=>XLXN_28,
                EISMET9=>XLXN_31,
                EISMET10=>XLXN_32,
                ESY1344=>XLXN_38);
   
   XLXI_45 : TET_MANT_MUSER_SX
      port map (EIS1=>XLXN_36,
                EIS2=>XLXN_35,
                EIS3=>XLXN_37,
                EIS4=>XLXN_38,
                E1=>open,
                E2=>OEO,
                E3=>open,
                E4=>XLXN_44);
   
   XLXI_46 : NAND2
      port map (I0=>XLXN_44,
                I1=>XLXN_38,
                O=>XLXN_41);
   
   XLXI_47 : INV
      port map (I=>XLXN_44,
                O=>OS);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SX is
   port ( EISK  : in    std_logic; 
          EISM  : in    std_logic; 
          EISP  : in    std_logic; 
          ROLOI : in    std_logic; 
          K     : out   std_logic; 
          KS    : out   std_logic; 
          M     : out   std_logic; 
          OS    : out   std_logic; 
          P     : out   std_logic);
end SX;

architecture BEHAVIORAL of SX is
   attribute BOX_TYPE   : string ;
   signal XLXN_13  : std_logic;
   signal XLXN_22  : std_logic;
   signal XLXN_25  : std_logic;
   signal XLXN_29  : std_logic;
   signal OS_DUMMY : std_logic;
   component AOR_MUSER_SX
      port ( ROLOI : in    std_logic; 
             OEO   : out   std_logic; 
             OS    : out   std_logic);
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AKA_MUSER_SX
      port ( ROLOI : in    std_logic; 
             KEO   : out   std_logic; 
             KS    : out   std_logic);
   end component;
   
   component ROLOI_100MHz_SE_16MHz_MUSER_SX
      port ( ROLOI   : in    std_logic; 
             E_ROLOI : out   std_logic);
   end component;
   
begin
   OS <= OS_DUMMY;
   XLXI_2 : AOR_MUSER_SX
      port map (ROLOI=>XLXN_29,
                OEO=>XLXN_13,
                OS=>OS_DUMMY);
   
   XLXI_4 : AND2
      port map (I0=>XLXN_13,
                I1=>XLXN_25,
                O=>XLXN_22);
   
   XLXI_7 : AND2
      port map (I0=>XLXN_22,
                I1=>EISM,
                O=>M);
   
   XLXI_8 : AND2
      port map (I0=>XLXN_22,
                I1=>EISP,
                O=>P);
   
   XLXI_9 : AND2
      port map (I0=>XLXN_22,
                I1=>EISK,
                O=>K);
   
   XLXI_11 : AKA_MUSER_SX
      port map (ROLOI=>OS_DUMMY,
                KEO=>XLXN_25,
                KS=>KS);
   
   XLXI_13 : ROLOI_100MHz_SE_16MHz_MUSER_SX
      port map (ROLOI=>ROLOI,
                E_ROLOI=>XLXN_29);
   
end BEHAVIORAL;


