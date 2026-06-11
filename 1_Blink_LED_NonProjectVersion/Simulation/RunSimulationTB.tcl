
# Run this script within ModelSim/Questa in order to run the design and testbench simulation,
# modifying this script as needed to run the correct design and testbench files for each project.

# ModelSim TCL Command Reference Manual
# https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/swdocs/modelsim/modelsim_ref_2024_2.pdf

# ModelSim Tutorial Manual
# https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/swdocs/modelsim/modelsim_tut_2024_2.pdf


set test_name "Blink_LED"
set test_results_file_name "Test_Results.txt"
set test_start_time [clock seconds]
set test_date_formatted [clock format $test_start_time -format "%Y-%m-%d %H:%M:%S"]



# =================================================================================================
# STEP 1
#    Navigate to project's simulation directory, then copy the default write protected
#    "modelsim.ini" file from ModelSim's installation folder to the project's simulation directory.
#    This allows this script to safely modify the copy of the .ini file.
# =================================================================================================
cd C:/CM/VHDL_Study_Hall/1_Blink_LED_NonProjectVersion/Simulation
vmap -c



# =================================================================================================
# STEP 2
#    Setup test results file.
# =================================================================================================
# Delete old test results file if it exists
file delete $test_results_file_name

# Create a new test results file and open it in write mode
set test_results_file [open $test_results_file_name w]

# Write header text in results file
puts $test_results_file "===================================================================================================================================="
puts $test_results_file "Verification Test Results"
puts $test_results_file "===================================================================================================================================="
puts $test_results_file ""
puts $test_results_file "Test Name: $test_name"
puts $test_results_file "Test Date: $test_date_formatted"
puts $test_results_file ""
puts $test_results_file "Check # | Pass/Fail | Description                                                                    | Expected | Actual | Tolerance"
puts $test_results_file "------------------------------------------------------------------------------------------------------------------------------------"

# Temporarily close results file to allow testbench to write to it
close $test_results_file



# =================================================================================================
# STEP 3
#    Create a physical ModelSim design library with the specified name, if the library does not
#    exist.
#
#    NOTE: A "library" in ModelSim is the conceptual storage area for where compiled RTL
#          designs are kept to be used by the simulator. The default library name is "work".
# =================================================================================================
vlib work



# =================================================================================================
# STEP 4
#    Creates a logical library name (first argument) and maps it to the specified physical library.
#    (second argument). This command achieves this by modifying the "modelsim.ini" file.
# =================================================================================================
vmap library1 work



# =================================================================================================
# STEP 5
#    Compile the design and testbench files into the default library (or a different specified
#    library).
#
#    NOTE: Many additional arguments are available for the "vcom" command to finely control the
#          compilation process. The "-2008" flag here forces the VHDL 2008 version to be used,
#          which includes the STD.ENV library that is useful for simulation commands.
# =================================================================================================
vcom -2008 ../../Simulation_Utilities/Simulation_Utilities.vhd
vcom -2008 ../Design/Blink_LED.vhd
vcom -2008 TB_Blink_LED.vhd



# =================================================================================================
# STEP 6
#    Initiate a simulation, which is titled using the specified name.
#
#    NOTE: 
#        - The "-t 1ns" flag forces the simulation to use a 1ns resolution regardless of what the
#          modelsim.ini resolution is set to.
#
#        - The "-onfinish stop" flag is used to force the simulation to treat "finish" commands as
#          "stop" commands. This is useful because "finish" will close ModelSim, while "stop" just
#          pauses the simulation.
# =================================================================================================
vsim -t 1ns TB_Blink_LED



# =================================================================================================
# STEP 7
#    Configure waveform output if desired.
# =================================================================================================
# Adds all signals in library to waveform viewer.
add wave -radix decimal -r /*



# =================================================================================================
# STEP 8
#    Advance the simulation by the specified amount of time.
#
#    NOTE: Use the "-all" flag to advance the simulation continuously until a breakpoint is hit.
# =================================================================================================
# Monitor testbench for when it sets the "test_finished" signal to '1', then stop the simulation
# and calculate elapsed time and report it.
when {test_finished = 1} {
   stop
   set test_end_time [clock seconds]
   set elapsed_time_raw_seconds             [expr $test_end_time - $test_start_time]
   set elapsed_time_hours                   [expr $elapsed_time_raw_seconds / 3600]
   set elapsed_time_raw_seconds_minus_hours [expr $elapsed_time_raw_seconds - $elapsed_time_hours * 3600]
   set elapsed_time_minutes                 [expr $elapsed_time_raw_seconds_minus_hours / 60]
   set elapsed_time_seconds                 [expr $elapsed_time_raw_seconds_minus_hours - $elapsed_time_minutes * 60]
   echo "Test elapsed time = $elapsed_time_hours hours, $elapsed_time_minutes minutes, $elapsed_time_seconds seconds"

   # Open test results file in append mode, and print final line for test elapsed time
   set test_results_file [open $test_results_file_name a]
   puts $test_results_file "Test Elapsed Time = $elapsed_time_hours hours : $elapsed_time_minutes minutes : $elapsed_time_seconds seconds"
   close $test_results_file
}
run -all