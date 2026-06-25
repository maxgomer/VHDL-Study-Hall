

-- Declare headers
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  -- Required for use of STD_LOGIC_VECTOR type


-- Declare entity
entity Debounce_Filter is
   -- Generic to allow for configuration of how many clock cycles
   -- the raw button input should be stable for before updating the
   -- filtered output value. Default value is 100, but is intended to
   -- be overridden by a higher level module.
   generic( DEBOUNCE_CLK_CNT : INTEGER := 100 );

   port( sys_clk_100mhz   : IN  STD_LOGIC;
         raw_button_input : IN  STD_LOGIC;
         button_out_filt  : OUT STD_LOGIC );
end entity Debounce_Filter;


-- Define architecture of entity
architecture RTL of Debounce_Filter is
   -- Declare internal signals
   signal r_button_filt        : STD_LOGIC := '0';
   signal debounce_clk_counter : INTEGER range 0 to DEBOUNCE_CLK_CNT := 0;
begin

   -- We want to filter out the bounces from the button state and only output
   -- a stable, filtered version of the button state. To do this, we need to monitor
   -- the value of the button state as it bounces, and wait to update the filtered
   -- output until the raw button state has remained stable for the desired amount
   -- of time. We measure this time by counting system clock cycles, and wait until
   -- the button state has stayed constant for the correct number of clock cycles
   -- before updating the filtered button output value.

   process (sys_clk_100mhz) begin
      if rising_edge(sys_clk_100mhz) then

         -- Check if the input is different from the filtered output AND if stability counter hasn't reached limit
         if ( (raw_button_input /= r_button_filt) AND (debounce_clk_counter < DEBOUNCE_CLK_CNT) ) then
            debounce_clk_counter <= debounce_clk_counter + 1;  -- increment counter

         -- Check if the input is different from the filtered output AND if stability counter has reached limit
         elsif ( (raw_button_input /= r_button_filt) AND (debounce_clk_counter = DEBOUNCE_CLK_CNT) ) then
            r_button_filt <= raw_button_input; -- now stable, update filtered button output with raw button value
            debounce_clk_counter <= 0;         -- reset counter to prepare for next filter event

         -- Button state is still changing, reset stability counter
         else
            debounce_clk_counter <= 0;
         end if;
      end if;
   end process;

   button_out_filt <= r_button_filt;

end architecture RTL;