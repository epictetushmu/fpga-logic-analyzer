# -----------------------------------------------------------------------------
# program.tcl - load la_top.bit into the Nexys A7 over USB-JTAG (volatile)
#
# CLI : vivado -mode batch -source scripts/program.tcl
# -----------------------------------------------------------------------------

set root [file normalize [file join [file dirname [info script]] ..]]
set bit  [file join $root la_top.bit]
if {![file exists $bit]} {
    error "ERROR: $bit not found - run scripts/build.tcl first"
}

open_hw_manager
connect_hw_server -allow_non_jtag
open_hw_target
set dev [lindex [get_hw_devices xc7a*] 0]
current_hw_device $dev
set_property PROGRAM.FILE $bit $dev
program_hw_devices $dev
puts "INFO: programmed $dev with $bit"
close_hw_target
disconnect_hw_server
close_hw_manager
