-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Jul  3 10:53:52 2025
-- Host        : DFazakas running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/Embedded/Nexys-A7/Nexys-A7/hw/proj/hw.gen/sources_1/ip/ClkGen/ClkGen_stub.vhdl
-- Design      : ClkGen
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ClkGen is
  Port ( 
    clk_100MHz_o : out STD_LOGIC;
    clk_200MHz_o : out STD_LOGIC;
    reset_i : in STD_LOGIC;
    locked_o : out STD_LOGIC;
    clk_100MHz_i : in STD_LOGIC
  );

  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of ClkGen : entity is "ClkGen,clk_wiz_v6_0_16_0_0,{component_name=ClkGen,use_phase_alignment=true,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,enable_axi=0,feedback_source=FDBK_AUTO,PRIMITIVE=PLL,num_out_clk=2,clkin1_period=10.000,clkin2_period=10.000,use_power_down=false,use_reset=true,use_locked=true,use_inclk_stopped=false,feedback_type=SINGLE,CLOCK_MGR_TYPE=NA,manual_override=false}";
end ClkGen;

architecture stub of ClkGen is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk_100MHz_o,clk_200MHz_o,reset_i,locked_o,clk_100MHz_i";
begin
end;
