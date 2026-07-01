

-- Headers
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  -- required for STD_LOGIC type
use work.Sim_Utilities.ALL;   -- required for custom verification processes


-- Entity declaration
entity TB_Demultiplexer is
end entity TB_Demultiplexer;


-- Define architecture
architecture Testbench of TB_Demultiplexer is
   -- Define local signals, components
   signal sim_in_data   : STRING(5 DOWNTO 1) := "DataI";
   signal sim_out_data0 : STRING(5 DOWNTO 1) := "     ";
   signal sim_out_data1 : STRING(5 DOWNTO 1) := "     ";
   signal sim_out_data2 : STRING(5 DOWNTO 1) := "     ";
   signal sim_out_data3 : STRING(5 DOWNTO 1) := "     ";
   signal sim_data_sel  : STD_LOGIC_VECTOR(1 DOWNTO 0);
   signal test_finished : STD_LOGIC := '0';

   component Demultiplexer is
      port ( in_data   : IN STRING(5 DOWNTO 1);
             out_data0 : OUT STRING(5 DOWNTO 1);
             out_data1 : OUT STRING(5 DOWNTO 1);
             out_data2 : OUT STRING(5 DOWNTO 1);
             out_data3 : OUT STRING(5 DOWNTO 1);
             data_sel  : IN STD_LOGIC_VECTOR(1 DOWNTO 0) );
   end component Demultiplexer;

begin

   -- Instantiate UUT
   UUT : Demultiplexer
      port map( in_data => sim_in_data,
                out_data0 => sim_out_data0,
                out_data1 => sim_out_data1,
                out_data2 => sim_out_data2,
                out_data3 => sim_out_data3,
                data_sel  => sim_data_sel );

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