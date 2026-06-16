---------------------------------------------------------------------------------------------------
-- Testbench for Project 1 - Blink_LED
--
--    For the testbench simulation, we need to create a virtual clock source.
--   
--    Note: Top level testbench does not usually define inputs or outputs in a port map.
--          All of the input and output signals required are usually defined internally.
--
--    Test Description:
--       This test verifies that the LED output is toggled at a rate of 1 Hz with a 50%
--       duty cycle. This is verified for 3 consecutive clock cycles for robustness.
--
---------------------------------------------------------------------------------------------------
-- Formal Verification Checks
--
--    CHECK_1:
--       On the first rising edge of the LED output, verify that the LED output is
--       continuously set high for a duration of 0.5 seconds (50% duty cycle duration 
--       for a frequency of 1 Hz), and is then set low.
--
--    CHECK_2:
--       On the first falling edge of the LED output, verify that the LED output is
--       continuously set low for a duration of 0.5 seconds, and is then set high.
--
--    CHECK_3:
--       On the second rising edge of the LED output, verify that the LED output is
--       continuously set high for a duration of 0.5 seconds, and is then set low.
--
--    CHECK_4:
--       On the second falling edge of the LED output, verify that the LED output is
--       continuously set low for a duration of 0.5 seconds, and is then set high.
--
--    CHECK_5:
--       On the third rising edge of the LED output, verify that the LED output is
--       continuously set high for a duration of 0.5 seconds, and is then set low.
--
--    CHECK_6:
--       On the third falling edge of the LED output, verify that the LED output is
--       continuously set low for a duration of 0.5 seconds, and is then set high.
---------------------------------------------------------------------------------------------------

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
   signal rise_time           : time;
   signal fall_time           : time;

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
   Clock_Generation : process begin
      wait for (clk_period_100mhz / 2);              -- must toggle generated clock at 50% duty cycle
      virtual_clk_100mhz <= not virtual_clk_100mhz;  -- toggle generated clock
   end process;


   -- Main stimulus
   Main_Stimulus : process begin
      -- Initialize verification stats
      setup_verification_stats;

      -- Wait until first rising edge of LED output to start measuring clock cycles
      wait until rising_edge(out_LED);
      rise_time <= now;
      wait until falling_edge(out_LED);
      fall_time <= now;

      -- CHECK_1: Verify LED output is held high for 0.5 seconds after 1st rising edge of LED output.
      check("After 1st rising edge of LED output, LED output is continuously held high for 0.5 seconds",
            0.5 sec,
            (now - rise_time));

      wait until rising_edge(out_LED);
      rise_time <= now;

      -- CHECK_2: Verify LED output is held low for 0.5 seconds after 1st falling edge of LED output.
      check("After 1st falling edge of LED output, LED output is continuously held low for 0.5 seconds",
            0.5 sec,
            (now - fall_time));

      wait until falling_edge(out_LED);
      fall_time <= now;

      -- CHECK_3: Verify LED output is held high for 0.5 seconds after 2nd rising edge of LED output.
      check("After 2nd rising edge of LED output, LED output is continuously held high for 0.5 seconds",
            0.5 sec,
            (now - rise_time));

      wait until rising_edge(out_LED);
      rise_time <= now;

      -- CHECK_4: Verify LED output is held low for 0.5 seconds after 2nd falling edge of LED output.
      check("After 2nd falling edge of LED output, LED output is continuously held low for 0.5 seconds",
            0.5 sec,
            (now - fall_time));

      wait until falling_edge(out_LED);
      fall_time <= now;

      -- CHECK_5: Verify LED output is held high for 0.5 seconds after 3rd rising edge of LED output.
      check("After 3rd rising edge of LED output, LED output is continuously held high for 0.5 seconds",
            0.5 sec,
            (now - rise_time));

      wait until rising_edge(out_LED);
      rise_time <= now;

      -- CHECK_6: Verify LED output is held low for 0.5 seconds after 3rd falling edge of LED output.
      check("After 3rd falling edge of LED output, LED output is continuously held low for 0.5 seconds",
            0.5 sec,
            (now - fall_time));


      -- Finalize test results and assert test finished flag
      finish_results_file;
      test_finished <= '1';
   end process;

end stimulus;