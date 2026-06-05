# Max's Build Script for Non-Project RTL to Bitstream Vivado Design Flow using TCL

# Based off of AMD's provided example TCL script here:
# https://docs.amd.com/r/en-US/ug892-vivado-design-flows-overview/Using-Non-Project-Mode-Tcl-Commands

# Typical usage of this build script in a TCL command line would be:
# "vivado -mode tcl -source DoBuild.tcl"

# This script may also be run from within an opened instance of Vivado via the menu options:
# "Tools->Run Tcl Script..."


# -------------------------------------------------------------------------------------------------
# STEP 0 - INITIAL SETUP
#    Set up local file directories and variables for this script.
# -------------------------------------------------------------------------------------------------
# Configure script variables for this build script
set top_module_name    "Blink_LED"
set design_name        "Blink_LED"
set FPGA_part          "xc7a100tcsg324-1"
set VHDL_design_path   C:/CM/VHDL_Study_Hall/1_Blink_LED_NonProjectVersion/Design/
set constraint_path    C:/CM/VHDL_Study_Hall/1_Blink_LED_NonProjectVersion/Constraints/Blink_LED.xdc
set build_output_path  C:/CM/VHDL_Study_Hall/1_Blink_LED_NonProjectVersion/Build_Results

# Create output folder at specified path if it does not already exist
file mkdir $build_output_path


# -------------------------------------------------------------------------------------------------
# STEP 1
#    Read design sources and constraint files.
# -------------------------------------------------------------------------------------------------
#NOTE: The "glob" command is used to return a list of files at the specified path.
read_vhdl [ glob $VHDL_design_path/*.vhdl ]
read_xdc $constraint_path


# -------------------------------------------------------------------------------------------------
# STEP 2
#    Run Synthesis, report utilization and timing estimates, write checkpoint design.
# -------------------------------------------------------------------------------------------------

# NOTE: "Checkpoints" are saved snapshots of the design at it's current form in the build process.
#       This allows you to incrementally check the design after major build steps, like synthesis,
#       run analysis on the snapshot, and aid with debugging throughout the build process.

synth_design -top $top_module_name -part $FPGA_part
write_checkpoint -force $build_output_path/post_synth
report_timing_summary -file $build_output_path/post_synth_timing_summary.rpt
report_power -file $build_output_path/post_synth_power.rpt


# -------------------------------------------------------------------------------------------------
# STEP 3
#    Run design placement and logic optimization, report utilization and timing estimates, write
#    checkpoint design.
# -------------------------------------------------------------------------------------------------
opt_design
place_design
phys_opt_design
write_checkpoint -force $build_output_path/post_place
report_timing_summary -file $build_output_path/post_place_timing_summary.rpt


# -------------------------------------------------------------------------------------------------
# STEP 4
#    Run design routing, report actual utilization and timing, write checkpoint design, run DRC
#    (Design Rule Checking), 
# -------------------------------------------------------------------------------------------------
route_design
write_checkpoint -force $build_output_path/post_route
report_timing_summary -file $build_output_path/post_route_timing_summary.rpt
report_timing -sort_by group -max_paths 100 -path_type summary -file $build_output_path/post_route_timing.rpt
report_clock_utilization -file $build_output_path/clock_util.rpt
report_utilization -file $build_output_path/post_route_util.rpt
report_power -file $build_output_path/post_route_power.rpt
report_drc -file $build_output_path/post_impl_drc.rpt

# Write VHDL netlist
write_vhdl -force $build_output_path/design_impl_netlist.vhdl

# Write constraints (is this needed if I already have an XDC constraint file?)
write_xdc -no_fixed_only -force $build_output_path/design_constraints.xdc


# -------------------------------------------------------------------------------------------------
# STEP 5
#    Generate final build images with both .bin and .bit files.
# -------------------------------------------------------------------------------------------------
# NOTE: The write_bitstream command only accepts file output names with the .bit extension, even
#       though we are also generating a .bin file. Both file types will be generated still.
write_bitstream -force -bin_file $build_output_path/$design_name.bit