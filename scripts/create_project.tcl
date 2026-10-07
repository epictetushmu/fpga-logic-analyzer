# -----------------------------------------------------------------------------
# create_project.tcl - build the Vivado project for the Nexys A7 logic analyzer
#
# GUI : Vivado -> Tools -> Run Tcl Script... -> scripts/create_project.tcl
# CLI : vivado -mode batch -source scripts/create_project.tcl
#       vivado -mode batch -source scripts/create_project.tcl -tclargs 50t
#
# Default part is the Nexys A7-100T (xc7a100tcsg324-1). Pass "50t" for the
# Nexys A7-50T. The project is created in ./vivado_proj next to this folder.
# -----------------------------------------------------------------------------

set root [file normalize [file join [file dirname [info script]] ..]]

set part xc7a100tcsg324-1
if {[llength $argv] > 0 && [string tolower [lindex $argv 0]] eq "50t"} {
    set part xc7a50ticsg324-1L
}
puts "INFO: creating project for part $part"

create_project logic_analyzer [file join $root vivado_proj] -part $part -force
set_property target_language VHDL [current_project]
set_property simulator_language VHDL [current_project]

# Design sources (order matters only for the package, Vivado sorts the rest)
set rtl_files [list \
    [file join $root rtl la_pkg.vhd] \
    [file join $root rtl btn_debounce.vhd] \
    [file join $root rtl test_pattern.vhd] \
    [file join $root rtl capture_ctrl.vhd] \
    [file join $root rtl sample_ram.vhd] \
    [file join $root rtl vga_timing.vhd] \
    [file join $root rtl ui_ctrl.vhd] \
    [file join $root rtl display.vhd] \
    [file join $root rtl seg7_ctrl.vhd] \
    [file join $root rtl la_top.vhd] ]
add_files -norecurse -fileset sources_1 $rtl_files
set_property file_type {VHDL 2008} [get_files $rtl_files]
set_property top la_top [get_filesets sources_1]

# Constraints
add_files -norecurse -fileset constrs_1 [file join $root constr nexys_a7.xdc]

# Simulation sources
set sim_files [list \
    [file join $root sim tb_capture.vhd] \
    [file join $root sim tb_la_top.vhd] ]
add_files -norecurse -fileset sim_1 $sim_files
set_property file_type {VHDL 2008} [get_files $sim_files]
set_property top tb_capture [get_filesets sim_1]
set_property -name {xsim.simulate.runtime} -value {all} -objects [get_filesets sim_1]

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

puts "INFO: project created: [file join $root vivado_proj logic_analyzer.xpr]"
puts "INFO: run 'Generate Bitstream', or source scripts/build.tcl"
