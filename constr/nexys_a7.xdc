## Nexys A7 (100T / 50T) constraints for la_top
## Pin locations taken from Digilent's Nexys-A7-100T-Master.xdc

## Clock (100 MHz)
set_property -dict { PACKAGE_PIN E3   IOSTANDARD LVCMOS33 } [get_ports { CLK100MHZ }]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { CLK100MHZ }]

## Reset button (active low)
set_property -dict { PACKAGE_PIN C12  IOSTANDARD LVCMOS33 } [get_ports { CPU_RESETN }]

## Switches
set_property -dict { PACKAGE_PIN J15  IOSTANDARD LVCMOS33 } [get_ports { SW[0] }]
set_property -dict { PACKAGE_PIN L16  IOSTANDARD LVCMOS33 } [get_ports { SW[1] }]
set_property -dict { PACKAGE_PIN M13  IOSTANDARD LVCMOS33 } [get_ports { SW[2] }]
set_property -dict { PACKAGE_PIN R15  IOSTANDARD LVCMOS33 } [get_ports { SW[3] }]
set_property -dict { PACKAGE_PIN R17  IOSTANDARD LVCMOS33 } [get_ports { SW[4] }]
set_property -dict { PACKAGE_PIN T18  IOSTANDARD LVCMOS33 } [get_ports { SW[5] }]
set_property -dict { PACKAGE_PIN U18  IOSTANDARD LVCMOS33 } [get_ports { SW[6] }]
set_property -dict { PACKAGE_PIN R13  IOSTANDARD LVCMOS33 } [get_ports { SW[7] }]
set_property -dict { PACKAGE_PIN T8   IOSTANDARD LVCMOS18 } [get_ports { SW[8] }]
set_property -dict { PACKAGE_PIN U8   IOSTANDARD LVCMOS18 } [get_ports { SW[9] }]
set_property -dict { PACKAGE_PIN R16  IOSTANDARD LVCMOS33 } [get_ports { SW[10] }]
set_property -dict { PACKAGE_PIN T13  IOSTANDARD LVCMOS33 } [get_ports { SW[11] }]
set_property -dict { PACKAGE_PIN H6   IOSTANDARD LVCMOS33 } [get_ports { SW[12] }]
set_property -dict { PACKAGE_PIN U12  IOSTANDARD LVCMOS33 } [get_ports { SW[13] }]
set_property -dict { PACKAGE_PIN U11  IOSTANDARD LVCMOS33 } [get_ports { SW[14] }]
set_property -dict { PACKAGE_PIN V10  IOSTANDARD LVCMOS33 } [get_ports { SW[15] }]

## Push buttons
set_property -dict { PACKAGE_PIN N17  IOSTANDARD LVCMOS33 } [get_ports { BTNC }]
set_property -dict { PACKAGE_PIN M18  IOSTANDARD LVCMOS33 } [get_ports { BTNU }]
set_property -dict { PACKAGE_PIN P18  IOSTANDARD LVCMOS33 } [get_ports { BTND }]
set_property -dict { PACKAGE_PIN P17  IOSTANDARD LVCMOS33 } [get_ports { BTNL }]
set_property -dict { PACKAGE_PIN M17  IOSTANDARD LVCMOS33 } [get_ports { BTNR }]

## Pmod JA - logic inputs ch0..ch7 (JA pins 1-4,7-10)
set_property -dict { PACKAGE_PIN C17  IOSTANDARD LVCMOS33 } [get_ports { JA[0] }]
set_property -dict { PACKAGE_PIN D18  IOSTANDARD LVCMOS33 } [get_ports { JA[1] }]
set_property -dict { PACKAGE_PIN E18  IOSTANDARD LVCMOS33 } [get_ports { JA[2] }]
set_property -dict { PACKAGE_PIN G17  IOSTANDARD LVCMOS33 } [get_ports { JA[3] }]
set_property -dict { PACKAGE_PIN D17  IOSTANDARD LVCMOS33 } [get_ports { JA[4] }]
set_property -dict { PACKAGE_PIN E17  IOSTANDARD LVCMOS33 } [get_ports { JA[5] }]
set_property -dict { PACKAGE_PIN F18  IOSTANDARD LVCMOS33 } [get_ports { JA[6] }]
set_property -dict { PACKAGE_PIN G18  IOSTANDARD LVCMOS33 } [get_ports { JA[7] }]
set_property PULLDOWN TRUE [get_ports { JA[*] }]

## Pmod JB - logic inputs ch8..ch15 (JB pins 1-4,7-10)
set_property -dict { PACKAGE_PIN D14  IOSTANDARD LVCMOS33 } [get_ports { JB[0] }]
set_property -dict { PACKAGE_PIN F16  IOSTANDARD LVCMOS33 } [get_ports { JB[1] }]
set_property -dict { PACKAGE_PIN G16  IOSTANDARD LVCMOS33 } [get_ports { JB[2] }]
set_property -dict { PACKAGE_PIN H14  IOSTANDARD LVCMOS33 } [get_ports { JB[3] }]
set_property -dict { PACKAGE_PIN E16  IOSTANDARD LVCMOS33 } [get_ports { JB[4] }]
set_property -dict { PACKAGE_PIN F13  IOSTANDARD LVCMOS33 } [get_ports { JB[5] }]
set_property -dict { PACKAGE_PIN G13  IOSTANDARD LVCMOS33 } [get_ports { JB[6] }]
set_property -dict { PACKAGE_PIN H16  IOSTANDARD LVCMOS33 } [get_ports { JB[7] }]
set_property PULLDOWN TRUE [get_ports { JB[*] }]

## Pmod JC - test pattern out ch0..ch7
set_property -dict { PACKAGE_PIN K1   IOSTANDARD LVCMOS33 } [get_ports { JC[0] }]
set_property -dict { PACKAGE_PIN F6   IOSTANDARD LVCMOS33 } [get_ports { JC[1] }]
set_property -dict { PACKAGE_PIN J2   IOSTANDARD LVCMOS33 } [get_ports { JC[2] }]
set_property -dict { PACKAGE_PIN G6   IOSTANDARD LVCMOS33 } [get_ports { JC[3] }]
set_property -dict { PACKAGE_PIN E7   IOSTANDARD LVCMOS33 } [get_ports { JC[4] }]
set_property -dict { PACKAGE_PIN J3   IOSTANDARD LVCMOS33 } [get_ports { JC[5] }]
set_property -dict { PACKAGE_PIN J4   IOSTANDARD LVCMOS33 } [get_ports { JC[6] }]
set_property -dict { PACKAGE_PIN E6   IOSTANDARD LVCMOS33 } [get_ports { JC[7] }]

## Pmod JD - test pattern out ch8..ch15
set_property -dict { PACKAGE_PIN H4   IOSTANDARD LVCMOS33 } [get_ports { JD[0] }]
set_property -dict { PACKAGE_PIN H1   IOSTANDARD LVCMOS33 } [get_ports { JD[1] }]
set_property -dict { PACKAGE_PIN G1   IOSTANDARD LVCMOS33 } [get_ports { JD[2] }]
set_property -dict { PACKAGE_PIN G3   IOSTANDARD LVCMOS33 } [get_ports { JD[3] }]
set_property -dict { PACKAGE_PIN H2   IOSTANDARD LVCMOS33 } [get_ports { JD[4] }]
set_property -dict { PACKAGE_PIN G4   IOSTANDARD LVCMOS33 } [get_ports { JD[5] }]
set_property -dict { PACKAGE_PIN G2   IOSTANDARD LVCMOS33 } [get_ports { JD[6] }]
set_property -dict { PACKAGE_PIN F3   IOSTANDARD LVCMOS33 } [get_ports { JD[7] }]

## LEDs
set_property -dict { PACKAGE_PIN H17  IOSTANDARD LVCMOS33 } [get_ports { LED[0] }]
set_property -dict { PACKAGE_PIN K15  IOSTANDARD LVCMOS33 } [get_ports { LED[1] }]
set_property -dict { PACKAGE_PIN J13  IOSTANDARD LVCMOS33 } [get_ports { LED[2] }]
set_property -dict { PACKAGE_PIN N14  IOSTANDARD LVCMOS33 } [get_ports { LED[3] }]
set_property -dict { PACKAGE_PIN R18  IOSTANDARD LVCMOS33 } [get_ports { LED[4] }]
set_property -dict { PACKAGE_PIN V17  IOSTANDARD LVCMOS33 } [get_ports { LED[5] }]
set_property -dict { PACKAGE_PIN U17  IOSTANDARD LVCMOS33 } [get_ports { LED[6] }]
set_property -dict { PACKAGE_PIN U16  IOSTANDARD LVCMOS33 } [get_ports { LED[7] }]
set_property -dict { PACKAGE_PIN V16  IOSTANDARD LVCMOS33 } [get_ports { LED[8] }]
set_property -dict { PACKAGE_PIN T15  IOSTANDARD LVCMOS33 } [get_ports { LED[9] }]
set_property -dict { PACKAGE_PIN U14  IOSTANDARD LVCMOS33 } [get_ports { LED[10] }]
set_property -dict { PACKAGE_PIN T16  IOSTANDARD LVCMOS33 } [get_ports { LED[11] }]
set_property -dict { PACKAGE_PIN V15  IOSTANDARD LVCMOS33 } [get_ports { LED[12] }]
set_property -dict { PACKAGE_PIN V14  IOSTANDARD LVCMOS33 } [get_ports { LED[13] }]
set_property -dict { PACKAGE_PIN V12  IOSTANDARD LVCMOS33 } [get_ports { LED[14] }]
set_property -dict { PACKAGE_PIN V11  IOSTANDARD LVCMOS33 } [get_ports { LED[15] }]
set_property -dict { PACKAGE_PIN N15  IOSTANDARD LVCMOS33 } [get_ports { LED16_R }]
set_property -dict { PACKAGE_PIN M16  IOSTANDARD LVCMOS33 } [get_ports { LED16_G }]
set_property -dict { PACKAGE_PIN R12  IOSTANDARD LVCMOS33 } [get_ports { LED16_B }]

## Seven-segment display
set_property -dict { PACKAGE_PIN T10  IOSTANDARD LVCMOS33 } [get_ports { CA }]
set_property -dict { PACKAGE_PIN R10  IOSTANDARD LVCMOS33 } [get_ports { CB }]
set_property -dict { PACKAGE_PIN K16  IOSTANDARD LVCMOS33 } [get_ports { CC }]
set_property -dict { PACKAGE_PIN K13  IOSTANDARD LVCMOS33 } [get_ports { CD }]
set_property -dict { PACKAGE_PIN P15  IOSTANDARD LVCMOS33 } [get_ports { CE }]
set_property -dict { PACKAGE_PIN T11  IOSTANDARD LVCMOS33 } [get_ports { CF }]
set_property -dict { PACKAGE_PIN L18  IOSTANDARD LVCMOS33 } [get_ports { CG }]
set_property -dict { PACKAGE_PIN H15  IOSTANDARD LVCMOS33 } [get_ports { DP }]
set_property -dict { PACKAGE_PIN J17  IOSTANDARD LVCMOS33 } [get_ports { AN[0] }]
set_property -dict { PACKAGE_PIN J18  IOSTANDARD LVCMOS33 } [get_ports { AN[1] }]
set_property -dict { PACKAGE_PIN T9   IOSTANDARD LVCMOS33 } [get_ports { AN[2] }]
set_property -dict { PACKAGE_PIN J14  IOSTANDARD LVCMOS33 } [get_ports { AN[3] }]
set_property -dict { PACKAGE_PIN P14  IOSTANDARD LVCMOS33 } [get_ports { AN[4] }]
set_property -dict { PACKAGE_PIN T14  IOSTANDARD LVCMOS33 } [get_ports { AN[5] }]
set_property -dict { PACKAGE_PIN K2   IOSTANDARD LVCMOS33 } [get_ports { AN[6] }]
set_property -dict { PACKAGE_PIN U13  IOSTANDARD LVCMOS33 } [get_ports { AN[7] }]

## VGA
set_property -dict { PACKAGE_PIN A3   IOSTANDARD LVCMOS33 } [get_ports { VGA_R[0] }]
set_property -dict { PACKAGE_PIN B4   IOSTANDARD LVCMOS33 } [get_ports { VGA_R[1] }]
set_property -dict { PACKAGE_PIN C5   IOSTANDARD LVCMOS33 } [get_ports { VGA_R[2] }]
set_property -dict { PACKAGE_PIN A4   IOSTANDARD LVCMOS33 } [get_ports { VGA_R[3] }]
set_property -dict { PACKAGE_PIN C6   IOSTANDARD LVCMOS33 } [get_ports { VGA_G[0] }]
set_property -dict { PACKAGE_PIN A5   IOSTANDARD LVCMOS33 } [get_ports { VGA_G[1] }]
set_property -dict { PACKAGE_PIN B6   IOSTANDARD LVCMOS33 } [get_ports { VGA_G[2] }]
set_property -dict { PACKAGE_PIN A6   IOSTANDARD LVCMOS33 } [get_ports { VGA_G[3] }]
set_property -dict { PACKAGE_PIN B7   IOSTANDARD LVCMOS33 } [get_ports { VGA_B[0] }]
set_property -dict { PACKAGE_PIN C7   IOSTANDARD LVCMOS33 } [get_ports { VGA_B[1] }]
set_property -dict { PACKAGE_PIN D7   IOSTANDARD LVCMOS33 } [get_ports { VGA_B[2] }]
set_property -dict { PACKAGE_PIN D8   IOSTANDARD LVCMOS33 } [get_ports { VGA_B[3] }]
set_property -dict { PACKAGE_PIN B11  IOSTANDARD LVCMOS33 } [get_ports { VGA_HS }]
set_property -dict { PACKAGE_PIN B12  IOSTANDARD LVCMOS33 } [get_ports { VGA_VS }]

## All user I/O is asynchronous to the system clock (synchronised in RTL)
set_false_path -from [get_ports { CPU_RESETN SW[*] BTN* JA[*] JB[*] }]
set_false_path -to   [get_ports { JC[*] JD[*] LED* CA CB CC CD CE CF CG DP AN[*] VGA_* }]

## Configuration
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
