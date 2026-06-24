

-- Declare headers
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Declare entity (no port map needed for simulation Testbench)
entity TB_LED_Toggle_Debounced is
end entity TB_LED_Toggle_Debounced;

-- Define testbench architecture
architecture Testbench of TB_LED_Toggle_Debounced is
   -- Declare local signals
   constant clk_period_100mhz  : TIME := 10 ns;
   signal virtual_clk_100mhz   : STD_LOGIC := '0';
   signal sim_button_input     : STD_LOGIC := '0';
   signal sim_LED_out          : STD_LOGIC := '0';
   signal test_finished        : STD_LOGIC := '0';

   -- Declare internal components
   component LED_Button_Toggle is
      port( sys_clk_100mhz : IN STD_LOGIC;
            button_input   : IN STD_LOGIC;
            LED_out        : OUT STD_LOGIC );
   end component LED_Button_Toggle;
begin

   -- Instantiate UUT
   UUT : LED_Button_Toggle
   port map( sys_clk_100mhz => virtual_clk_100mhz,
             button_input   => sim_button_input,
             LED_out        => sim_LED_out );

   -- Generate system clock
   Clock_Gen : process begin
      wait for (clk_period_100mhz / 2);         -- wait for 50% duty cycle time mark
      virtual_clk_100mhz <= not virtual_clk_100mhz; -- toggle clock
   end process;

   -- Peform test stimulus
   Stimulus : process begin
      wait for 10 ns;
      sim_button_input <= '1';
      wait for 10 ns;
      sim_button_input <= '0';
      wait for 10 ns;
      sim_button_input <= '1';
      wait for 10 ns;
      sim_button_input <= '0';
      wait for 10 ns;
      sim_button_input <= '1';
      wait for 10 ns;
      
      test_finished <= '1';

   end process;

end architecture Testbench;