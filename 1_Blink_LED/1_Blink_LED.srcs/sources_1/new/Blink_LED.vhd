-- Project 1 - Blink_LED
--
--    Blink LED[0] at a frequency of 1 Hz (with 50% duty cycle) using the 100MHz board system clock.

-- Library headers
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Define the entity being used in this module
entity Blink_LED is 
    -- Port Map for this entity
    port(
        sys_clk_100mhz     : in  STD_LOGIC;
        LED                : out STD_LOGIC
    );
end Blink_LED;


-- Define the architecture (logic) for the entity
architecture rtl of Blink_LED is
    -- Define local signals here
    signal clk_1hz         : STD_LOGIC := '0';     -- divided down 1 Hz clock
    signal counter         : INTEGER   := 0;       -- counter used to divide clock
begin

    -- Must divide system clock down from 100 MHz to 1 Hz
    -- process executes on every value change of the system clock
    process (sys_clk_100mhz)
    begin
        -- Increment counter every positive edge of system clock
        if (sys_clk_100mhz = '1') then
            counter <= counter + 1;
        end if;

        -- LED output must be toggled every 50E6 positive edges of system clock
        -- in order to achieve 1 Hz output with 50% duty cycle. In other words,
        -- LED must be toggled every 2 Hz.
        -- (100E6) / (50E6) = 2 Hz
        if (counter = 50E6) then
            clk_1hz <= not clk_1hz;     -- toggle 1 Hz clock edge
            counter <= 0;               -- reset counter
        end if;

    end process;

    -- Assign LED output to always be the value of the 1 Hz clock signal
    LED <= clk_1hz;

end rtl;