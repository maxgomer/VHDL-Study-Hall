
-- This module toggles an LED output on the immediate next Rising Edge
-- of the system clock after the falling edge of a button input.

-- Declare Headers
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  -- Required for use of STD_LOGIC type


-- Entity declaration
entity LED_Button_Toggle is
   -- Port Map
   port( sys_clk_100mhz : IN STD_LOGIC;
         button_input   : IN STD_LOGIC;
         LED_out        : OUT STD_LOGIC );
end entity LED_Button_Toggle;


-- Architecture definition
architecture RTL of LED_Button_Toggle is
   -- Define local signals
   signal r_button_status : STD_LOGIC := '0';
   signal r_LED_status    : STD_LOGIC := '0';
begin

   process(sys_clk_100mhz)
   begin
      -- Check for falling edge of button input
      if rising_edge(sys_clk_100mhz) then
         -- Store current state of button input
         r_button_status <= button_input;
         -- Check if falling edge of button occured
         if (button_input = '0' AND r_button_status = '1') then
            -- Toggle LED output
            r_LED_status <= NOT r_LED_status;
         end if;
      end if;
   end process;

   -- Assign output
   LED_out <= r_LED_status;

end RTL;