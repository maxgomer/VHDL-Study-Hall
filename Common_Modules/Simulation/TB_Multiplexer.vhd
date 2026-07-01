

-- Declare headers
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  -- required for STD_LOGIC type
use work.Sim_Utilities.ALL;        -- required for custom VHDL verification procedures


-- Entity declaration
entity TB_Multiplexer is
end entity TB_Multiplexer;


-- Architecture definition
architecture Testbench of TB_Multiplexer is
   -- Internal signal definitions
   signal sim_data0     : STRING(5 DOWNTO 1) := "Data0";
   signal sim_data1     : STRING(5 DOWNTO 1) := "Data1";
   signal sim_data2     : STRING(5 DOWNTO 1) := "Data2";
   signal sim_data3     : STRING(5 DOWNTO 1) := "Data3";
   signal sim_data_sel  : STD_LOGIC_VECTOR(1 DOWNTO 0);
   signal sim_data_out  : STRING(5 DOWNTO 1);
   signal test_finished : STD_LOGIC := '0';

   -- Component declarations
   component mux is
      port ( i_data0 : IN STRING(5 DOWNTO 1);
             i_data1 : IN STRING(5 DOWNTO 1);
             i_data2 : IN STRING(5 DOWNTO 1);
             i_data3 : IN STRING(5 DOWNTO 1);
             data_sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
             data_out : OUT STRING(5 DOWNTO 1) );
   end component mux;

begin

   -- Instantiate UUT
   UUT : mux
   port map( i_data0 => sim_data0,
             i_data1 => sim_data1,
             i_data2 => sim_data2,
             i_data3 => sim_data3,
             data_sel => sim_data_sel,
             data_out => sim_data_out );

   -- Perform stimulus
   Stimulus : process begin
      setup_verification_stats;
      wait for 10 ns;

      -- Input Vector : 00
      sim_data_sel <= "00";
      wait for 10 ns;

      -- Input Vector : 01
      sim_data_sel <= "01";
      wait for 10 ns;

      -- Input Vector : 10
      sim_data_sel <= "10";
      wait for 10 ns;

      -- Input Vector : 11
      sim_data_sel <= "11";
      wait for 10 ns;

      report_comment("Formal verification not performed for this module, visual inspection of testbench results only.");
      finish_results_file;
      test_finished <= '1';
   end process;

end architecture Testbench;