## Clock signal
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports {ROLOI}] ; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {ROLOI}]

set_property PACKAGE_PIN H6  [get_ports EISM]
set_property IOSTANDARD LVCMOS33 [get_ports EISM]

set_property PACKAGE_PIN T13 [get_ports EISP]
set_property IOSTANDARD LVCMOS33 [get_ports EISP]

set_property PACKAGE_PIN R16 [get_ports EISK]
set_property IOSTANDARD LVCMOS33 [get_ports EISK]

# VGA_R[3] → your signal: K
set_property PACKAGE_PIN A4 [get_ports K]
set_property IOSTANDARD LVCMOS33 [get_ports K]

# VGA_G[3] → your signal: P
set_property PACKAGE_PIN A6 [get_ports P]
set_property IOSTANDARD LVCMOS33 [get_ports P]

# VGA_B[3] → your signal: M
set_property PACKAGE_PIN D8 [get_ports M]
set_property IOSTANDARD LVCMOS33 [get_ports M]

# VGA_HS → your signal: OS
set_property PACKAGE_PIN B11 [get_ports OS]
set_property IOSTANDARD LVCMOS33 [get_ports OS]

# VGA_VS → your signal: KS
set_property PACKAGE_PIN B12 [get_ports KS]
set_property IOSTANDARD LVCMOS33 [get_ports KS]


#test

# Combinatorial Loop Bypasses - WARNING: These should be fixed in the design!
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/E40__5]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/E40__2]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/E40__4]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/EISMET9]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/XLXI_1/XLXI_33/E2]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/XLXI_10_i_4]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/XLXI_11_i_4_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/XLXI_1_i_11]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/XLXI_5_i_4]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/XLXI_6_i_4_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/XLXI_6_i_4_1]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/XLXI_7_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/XLXI_8_i_2_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/XLXN_4]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/XLXN_6]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/XLXN_63]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/XLXN_64]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_5/XLXN_6_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_14/E40]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_14/XLXI_2_i_6_n_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_14/XLXI_3_i_2__0_n_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_14/XLXI_3_i_2__1_n_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_14/XLXI_3_i_5_n_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_14/XLXN_1]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_14/XLXN_1_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_14/XLXN_7]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/E40__1]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/E40__2]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/E40__3]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/E40__5]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/E40__6]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/EISMET0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_1/XLXI_1/E2]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/E40__4]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/E40__7]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXI_11_i_5]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXI_11_i_6]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXI_16_i_4_n_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXI_19_i_2_n_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXI_19_i_3_n_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXI_2/XLXI_33/E2]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXI_2_i_5]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXI_4_i_4]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXI_6_i_5_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXI_6_i_5_1]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXI_6_i_6]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXI_8_i_2__0_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXI_8_i_3__0_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXN_24]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXN_24_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXN_3]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXN_32]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXN_4]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXN_6]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXN_63]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_12/XLXN_64]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_1_i_3_n_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_1_i_4_n_0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/XLXI_6/E2]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_2/XLXI_45/E2]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_14/XLXN_6]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/E40__0]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/E40__1]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets XLXI_11/E40__3]
