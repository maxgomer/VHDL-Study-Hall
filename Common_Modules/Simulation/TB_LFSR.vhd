

-- Library headers
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  -- required for STD_LOGIC type
use work.Sim_Utilities.ALL;   -- required for custom verification procedures


-- Declare entity (no ports needed for testbench)
entity TB_LFSR is
end entity TB_LFSR;


-- Define architecture
architecture Testbench of TB_LFSR is
   -- Local signals/components
   signal sim_sys_clock_100mhz : STD_LOGIC := '0';
   signal sim_seed             : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
   signal sim_enable_seed      : STD_LOGIC := '0';
   signal sim_count_done       : STD_LOGIC;
   signal sim_r_lfsr_out       : STD_LOGIC_VECTOR(2 DOWNTO 0);
   signal test_finished        : STD_LOGIC := '0';

   component LFSR is
      port( sys_clock_100mhz : IN STD_LOGIC;
            i_seed           : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            enable_seed      : IN STD_LOGIC;
            r_lfsr_out       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            count_done       : OUT STD_LOGIC );
   end component LFSR;
begin

   -- Perform simulated clock generation
   Clock_Gen : process is begin
      wait for 5 ns;    -- 50% duty cycle for 10 ns period
      sim_sys_clock_100mhz <= not sim_sys_clock_100mhz;
   end process Clock_Gen;

   -- Instantiate UUT
   UUT_LFSR : LFSR
      port map( sys_clock_100mhz  => sim_sys_clock_100mhz,
                i_seed            => sim_seed,
                enable_seed       => sim_enable_seed,
                r_lfsr_out        => sim_r_lfsr_out,
                count_done        => sim_count_done );

   -- Perform test stimulus
   Stimulus : process is begin
      setup_verification_stats;
      wait for 500 ns;
      report_comment("This module is verified using visual inspection only, no formal verification is being performed.");
      finish_results_file;
      test_finished <= '1';
   end process Stimulus;

end architecture Testbench;