# -----------------------------------------------------------------------------
# build.tcl - synthesise, implement and write the bitstream
#
# CLI : vivado -mode batch -source scripts/build.tcl            (Nexys A7-100T)
#       vivado -mode batch -source scripts/build.tcl -tclargs 50t
#
# Creates the project first if it does not exist. The bitstream is copied to
# ./la_top.bit in the repository root.
# -----------------------------------------------------------------------------

set root [file normalize [file join [file dirname [info script]] ..]]
set xpr  [file join $root vivado_proj logic_analyzer.xpr]

if {[file exists $xpr]} {
    open_project $xpr
} else {
    source [file join $root scripts create_project.tcl]
}

set jobs 4
reset_run synth_1
launch_runs synth_1 -jobs $jobs
wait_on_run synth_1
if {[get_property PROGRESS [get_runs synth_1]] ne "100%"} {
    error "ERROR: synthesis failed"
}

launch_runs impl_1 -to_step write_bitstream -jobs $jobs
wait_on_run impl_1
if {[get_property PROGRESS [get_runs impl_1]] ne "100%"} {
    error "ERROR: implementation failed"
}

open_run impl_1
report_utilization -file [file join $root vivado_proj utilization.rpt]
report_timing_summary -file [file join $root vivado_proj timing.rpt]
set wns [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
puts "INFO: worst negative slack = $wns ns"

set bit [glob [file join $root vivado_proj logic_analyzer.runs impl_1 *.bit]]
file copy -force $bit [file join $root la_top.bit]
puts "INFO: bitstream written to [file join $root la_top.bit]"
