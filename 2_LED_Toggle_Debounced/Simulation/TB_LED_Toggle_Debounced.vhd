---------------------------------------------------------------------------------------------------
-- Testbench for Project 2 - LED_Toggle_Debounced
--
--    For the testbench simulation, we need to create a virtual clock source.
--   
--    Note: Top level testbench does not usually define inputs or outputs in a port map.
--          All of the input and output signals required are usually defined internally.
--
--    Test Description:
--       This test verifies that the Debounce Filter module correctly filters the bounce out of the raw
--       button input by producing a filted button output value only once the raw input has stabilized
--       for 10 ms. This test also verifies that the LED Toggle module only toggles the LED on the
--       falling edge of the button input signal.
--
---------------------------------------------------------------------------------------------------
-- Formal Verification Checks
--
--    CHECK_1 - Debounce Filter:
--       After simulating a button press (logic '0' -> '1') with bounce, verify the filtered button
--       output in the Debounce Filter module is set to logic '1' only after the raw button input stays
--       at logic '1' constantly for 10 ms (+ 10 ns tolerance).
--
--    CHECK_2 - Debounce Filter:
--       After simulating a button release (logic '1' -> '0') with bounce, verify the filtered button
--       output in the Debounce Filter module is set to logic '0' only after the raw button input stays
--       at logic '0' constantly for 10 ms (+ 10 ns tolerance).
--
--    CHECK_3 - LED Toggle:
--       After simulating a button press (logic '0' -> '1') with bounce, with the LED's output
--       initially at logic '0', verify the LED output stays at logic '0' on the immediate next
--       rising edge of the system clock once the filtered button output transitions from logic
--       '0' -> '1'.
--
--    CHECK_4 - LED Toggle:
--       After simulating a button release (logic '1' -> '0') with bounce, with the LED's output
--       initially at logic '0', verify the LED output transitions from logic '0' -> '1' on the
--       immediate next rising edge of the system clock once the filtered button output transitions
--       from logic '1' -> '0'.
--       
--    CHECK_5 - LED Toggle:
--       After simulating a button press (logic '0' -> '1') with bounce, with the LED's output
--       initially at logic '1', verify the LED output stays at logic '1' on the immediate next
--       rising edge of the system clock once the filtered button output transitions from logic
--       '0' -> '1'.
--
--    CHECK_6 - LED Toggle:
--       After simulating a button release (logic '1' -> '0') with bounce, with the LED's output
--       initially at logic '1', verify the LED output transitions from logic '1' -> '0' on the
--       immediate next rising edge of the system clock once the filtered button output transitions
--       from logic '1' -> '0'.
--       
---------------------------------------------------------------------------------------------------

-- Declare headers
library IEEE;
library modelsim_lib;         -- for signal spying
use IEEE.STD_LOGIC_1164.ALL;  -- for STD_LOGIC type
use work.Sim_Utilities.all;   -- for custom simulation verification functions/procedures
use modelsim_lib.util.all;    -- for signal spying


-- Declare entity (no port map needed for simulation Testbench)
entity TB_LED_Toggle_Debounced is
end entity TB_LED_Toggle_Debounced;

-- Define testbench architecture
architecture Testbench of TB_LED_Toggle_Debounced is
   -- Declare local signals
   constant clk_period_100mhz      : TIME := 10 ns;
   signal virtual_clk_100mhz       : STD_LOGIC := '0';
   signal sim_button_input         : STD_LOGIC := '0';
   signal sim_LED_out              : STD_LOGIC := '0';
   signal test_finished            : STD_LOGIC := '0';
   signal spy_filt_button_out      : STD_LOGIC;
   signal spy_raw_button_input     : STD_LOGIC;
   signal time_start               : TIME;
   signal button_filt_out_RE_time  : TIME;
   signal button_filt_out_FE_time  : TIME;
   signal immediate_RE_time        : TIME;
   signal test_section             : STRING (8 DOWNTO 1);

   -- Declare internal components
   component LED_Toggle_Debounced_Top is
      port( sys_clk_100mhz   : IN  STD_LOGIC;
            BTNC             : IN  STD_LOGIC;
            LED              : OUT STD_LOGIC );
   end component LED_Toggle_Debounced_Top;
begin

   -- Instantiate UUT
   UUT : LED_Toggle_Debounced_Top
   port map( sys_clk_100mhz   => virtual_clk_100mhz,
             BTNC             => sim_button_input,
             LED              => sim_LED_out );

   -- Generate system clock
   Clock_Gen : process begin
      wait for (clk_period_100mhz / 2);         -- wait for 50% duty cycle time mark
      virtual_clk_100mhz <= not virtual_clk_100mhz; -- toggle clock
   end process;

   -- Peform test stimulus
   Stimulus : process begin
      -- Signal spying is used for these in order to monitor the Debounce Filter module's
      -- internal signals, which we don't otherwise have access too in this test.
      init_signal_spy( "/TB_LED_Toggle_Debounced/UUT/Debounce_Filter_Inst/button_out_filt", "/spy_filt_button_out" );
      init_signal_spy( "/TB_LED_Toggle_Debounced/UUT/Debounce_Filter_Inst/raw_button_input", "/spy_raw_button_input" );
      setup_verification_stats;
      wait for 10 ns;
      

      -- Stimulus for Check 1
      --------------------------------------------------------------------------------
      test_section <= "CHECK 1 ";
      report_comment("Section - Check 1");
      check("Initial value of raw button input = 0",
            '0',                   -- expected
            spy_raw_button_input); -- actual
      check("Initial value of filtered button output = 0",
            '0',                  -- expected
            spy_filt_button_out); -- actual

      -- Simulate button press (logic '0' -> '1') with bounce
      sim_button_input <= '1';
      wait for 10 ns;
      sim_button_input <= '0';
      wait for 10 ns;
      sim_button_input <= '1';
      wait for 10 ns;
      sim_button_input <= '0';
      wait for 10 ns;
      sim_button_input <= '1';
      time_start <= now;

      wait until rising_edge(spy_filt_button_out);
      check("CHECK 1: Verify filtered button output sets to '1' after raw button input is stable for 10 ms (+ 10 ns tolerance)",
            (10 ms),             -- expected lower
            (10 ms + 10 ns),     -- expected upper
            (now - time_start)); -- actual
      report_comment(""); -- newline


      -- Stimulus for Check 2
      --------------------------------------------------------------------------------
      test_section <= "CHECK 2 ";
      report_comment("Section - Check 2");
      check("Initial value of raw button input = 1",
            '1',                   -- expected
            spy_raw_button_input); -- actual
      check("Initial value of filtered button output = 1",
            '1',                   -- expected
            spy_filt_button_out);  -- actual

      -- Simulate button release (logic '1' -> '0') with bounce
      sim_button_input <= '0';
      wait for 10 ns;
      sim_button_input <= '1';
      wait for 10 ns;
      sim_button_input <= '0';
      wait for 10 ns;
      sim_button_input <= '1';
      wait for 10 ns;
      sim_button_input <= '0';
      time_start <= now;

      wait until falling_edge(spy_filt_button_out);
      check("CHECK 2: Verify filtered button output sets to '0' after raw button input is stable for 10 ms (+ 10 ns tolerance)",
            (10 ms),             -- expected lower
            (10 ms + 10 ns),     -- expected upper
            (now - time_start)); -- actual
      report_comment(""); -- newline

      -- Cleanup - Toggle LED output back to 0
      sim_button_input <= '1';
      wait for 15 ms;
      sim_button_input <= '0';
      wait for 15 ms;


      -- Stimulus for Check 3
      --------------------------------------------------------------------------------
      test_section <= "CHECK 3 ";
      report_comment("Section - Check 3");
      check("Initial value of LED output = 0",
            '0',                   -- expected
            sim_LED_out);          -- actual
      check("Initial value of raw button input = 0",
            '0',                   -- expected
            spy_raw_button_input); -- actual
      
      -- Simulate button press (logic '0' -> '1') with bounce
      sim_button_input <= '1';
      wait for 10 ns;
      sim_button_input <= '0';
      wait for 10 ns;
      sim_button_input <= '1';
      wait for 10 ns;
      sim_button_input <= '0';
      wait for 10 ns;
      sim_button_input <= '1';
      
      wait until (button_filt_out_RE_time'event);
      wait until rising_edge(virtual_clk_100mhz);

      check("CHECK 3: Verify LED output stays at '0' on immediate RE of sys clock after filt button out goes from '0' -> '1'",
            '0',          -- expected
            sim_LED_out); -- actual
      report_comment(""); -- newline


      -- Stimulus for Check 4
      --------------------------------------------------------------------------------
      test_section <= "CHECK 4 ";
      report_comment("Section - Check 4");
      check("Initial value of LED output = 0",
            '0',                   -- expected
            sim_LED_out);          -- actual
      check("Initial value of raw button input = 1",
            '1',                   -- expected
            spy_raw_button_input); -- actual

      -- Simulate button release (logic '1' -> '0') with bounce
      sim_button_input <= '0';
      wait for 10 ns;
      sim_button_input <= '1';
      wait for 10 ns;
      sim_button_input <= '0';
      wait for 10 ns;
      sim_button_input <= '1';
      wait for 10 ns;
      sim_button_input <= '0';
      
      wait until rising_edge(sim_LED_out);

      -- We expect the LED output to set to '1' at the same time that the immediate next rising
      -- edge of the system clock occurred after the filtered button output set to '1'.

      check("CHECK 4: Verify LED output sets to '1' on immediate RE of sys clock after filt button out goes from '1' -> '0'",
            immediate_RE_time, -- expected
            now);              -- actual
      report_comment("");      -- newline


      -- Stimulus for Check 5
      --------------------------------------------------------------------------------
      test_section <= "CHECK 5 ";
      report_comment("Section - Check 5");
      check("Initial value of LED output = 1",
            '1',                   -- expected
            sim_LED_out);          -- actual
      check("Initial value of raw button input = 0",
            '0',                   -- expected
            spy_raw_button_input); -- actual

      -- Simulate button press (logic '0' -> '1') with bounce
      sim_button_input <= '1';
      wait for 10 ns;
      sim_button_input <= '0';
      wait for 10 ns;
      sim_button_input <= '1';
      wait for 10 ns;
      sim_button_input <= '0';
      wait for 10 ns;
      sim_button_input <= '1';
      
      wait until (button_filt_out_RE_time'event);
      wait until rising_edge(virtual_clk_100mhz);

      check("CHECK 5: Verify LED output stays at '1' on immediate RE of sys clock after filt button out goes from '0' -> '1'",
            '1',          -- expected
            sim_LED_out); -- actual
      report_comment(""); -- newline


      -- Stimulus for Check 6
      --------------------------------------------------------------------------------
      test_section <= "CHECK 6 ";
      report_comment("Section - Check 6");
      check("Initial value of LED output = 1",
            '1',                   -- expected
            sim_LED_out);          -- actual
      check("Initial value of raw button input = 1",
            '1',                   -- expected
            spy_raw_button_input); -- actual

      -- Simulate button release (logic '1' -> '0') with bounce
      sim_button_input <= '0';
      wait for 10 ns;
      sim_button_input <= '1';
      wait for 10 ns;
      sim_button_input <= '0';
      wait for 10 ns;
      sim_button_input <= '1';
      wait for 10 ns;
      sim_button_input <= '0';
      
      wait until falling_edge(sim_LED_out);

      -- We expect the LED output to set to '0' at the same time that the immediate next rising
      -- edge of the system clock occurred after the filtered button output set to '1'.

      check("CHECK 6: Verify LED output sets to '0' on immediate RE of sys clock after filt button out goes from '1' -> '0'",
            immediate_RE_time, -- expected
            now);              -- actual
      report_comment("");      -- newline


      
      test_section <= "FINISHED";
      wait for 2 ms;
      finish_results_file;
      test_finished <= '1';
   end process;



   -- Time catching process for filtered button output rising edge
   process begin
      wait until rising_edge(spy_filt_button_out);
      button_filt_out_RE_time <= now;
   end process;

   -- Time catching process for filtered button output falling edge and immediate next RE of sys clock
   process begin
      wait until falling_edge(spy_filt_button_out);
      button_filt_out_FE_time <= now;
      wait until rising_edge(virtual_clk_100mhz);
      immediate_RE_time <= now;
   end process;

end architecture Testbench;