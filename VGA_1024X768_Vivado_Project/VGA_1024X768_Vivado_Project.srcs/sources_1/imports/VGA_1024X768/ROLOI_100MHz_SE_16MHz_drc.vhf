--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : ROLOI_100MHz_SE_16MHz_drc.vhf
-- /___/   /\     Timestamp : 04/15/2025 14:09:05
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt\unwrapped\sch2hdl.exe -intstyle ise -family artix7 -flat -suppress -vhdl ROLOI_100MHz_SE_16MHz_drc.vhf -w E:/vhdl/VGA_1024X768/ROLOI_100MHz_SE_16MHz.sch
--Design Name: ROLOI_100MHz_SE_16MHz
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

entity ROLOI_100MHz_SE_16MHz is
   port ( ROLOI   : in    std_logic; 
          E_ROLOI : out   std_logic);
end ROLOI_100MHz_SE_16MHz;

architecture BEHAVIORAL of ROLOI_100MHz_SE_16MHz is
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


