-- Testbench for Project 1 - Blink_LED
--
--    For the testbench simulation, we need to create a virtual clock source.
--   
--    Note: Top level testbench does not usually define inputs or outputs in a port map.
--          All of the input and output signals required are usually defined internally.

-- Library headers
library ieee;
use ieee.std_logic_1164.all;  -- for STD_LOGIC data type
use work.Sim_Utilities.all;   -- for custom simulation verification functions/procedures

-- Define testbench entity (no port map needed)
entity TB_Blink_LED is
end TB_Blink_LED;


-- Define architecture of testbench entity
architecture stimulus of TB_Blink_LED is
   -- Declare local signals
   constant clk_period_100mhz : time := 10 ns;    -- 1 / (clk frequency) = clk period
                                                   -- 1 / (100 MHz) = 10 ns clk period
   signal virtual_clk_100mhz  : std_logic := '0';
   signal out_LED             : std_logic;
   signal test_finished       : std_logic := '0';
   signal test_string         : string(1 to 15) := "Just a test! :)";
   -- Declare components that will be used (components are implemented in the UUT)
   component Blink_LED is
      port (
         sys_clk_100mhz     : in  STD_LOGIC;
         LED                : out STD_LOGIC
      );
   end component Blink_LED;

begin

   -- Instantiate Unit Under Test component (UUT) and assign local signals to ports of component
   UUT : Blink_LED
      port map (
          sys_clk_100mhz => virtual_clk_100mhz,
          LED            => out_LED
      );
   -- Generate virtual clock (always executes)
   process begin
      wait for (clk_period_100mhz / 2);              -- must toggle generated clock at 50% duty cycle
      virtual_clk_100mhz <= not virtual_clk_100mhz;  -- toggle generated clock
   end process;
   -- Main stimulus
   process begin
      setup_verification_stats;

      wait for 0.01 sec;
      -- test_write_output(test_string);
      wait for 1 ns;
   
      test_string <= "Just a new test";
      wait for 1 ns;
      test_write_output(test_string);
      test_write_output(test_string);
      test_write_output(test_string);
      test_write_output(test_string);
      test_write_output(test_string);
      wait for 1 ns;

      finish_results_file;
      test_finished <= '1';
   end process;

end stimulus;