set_property SRC_FILE_INFO {cfile:d:/Embedded/Nexys-A7/Nexys-A7/hw/proj/hw.gen/sources_1/ip/ClkGen/ClkGen.xdc rfile:../../../hw.gen/sources_1/ip/ClkGen/ClkGen.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_100MHz_i]] 0.100
