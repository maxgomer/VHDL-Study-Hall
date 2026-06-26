

-- Declare headers
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  -- Required for STD_LOGIC type


-- Declare entity
entity LED_Toggle_Debounced_Top is
   port( sys_clk_100mhz   : IN  STD_LOGIC;
         BTNC             : IN  STD_LOGIC;
         LED              : OUT STD_LOGIC );
end entity LED_Toggle_Debounced_Top;


-- Declare architecture
architecture RTL of LED_Toggle_Debounced_Top is

   -- Declare components to be used
   component Debounce_Filter is
      generic( DEBOUNCE_CLK_CNT : INTEGER );
      port( sys_clk_100mhz   : IN  STD_LOGIC;
            raw_button_input : IN  STD_LOGIC;
            button_out_filt  : OUT STD_LOGIC );
   end component Debounce_Filter;

   component LED_Button_Toggle is
      port( sys_clk_100mhz : IN  STD_LOGIC;
            button_input   : IN  STD_LOGIC;
            LED_out        : OUT STD_LOGIC );
   end component LED_Button_Toggle;

   -- Define local signals
   signal w_button_state_filt : STD_LOGIC;

begin

   -- Instantiate components and perform port mapping
   Debounce_Filter_Inst : Debounce_Filter
      -- Want 10ms of button state stability before filtered output updates.
      -- System Clock Period = 10 ns
      -- 10ms = 1000000 clock cycles
      generic map( DEBOUNCE_CLK_CNT => 1000000 )
      port map( sys_clk_100mhz   => sys_clk_100mhz,
                raw_button_input => BTNC,
                button_out_filt  => w_button_state_filt );

   LED_Button_Toggle_Inst : LED_Button_Toggle
      port map( sys_clk_100mhz => sys_clk_100mhz,
                button_input   => w_button_state_filt,
                LED_out        => LED );

end architecture RTL;