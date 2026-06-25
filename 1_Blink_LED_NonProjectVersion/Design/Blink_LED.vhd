-- Project 1 - Blink_LED
--
--    Blink LED[0] at a frequency of 1 Hz (with 50% duty cycle) using the 100MHz board system clock.

-- Library headers
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;    -- required for use of STD_LOGIC data type


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
    signal clk_out_1hz     : STD_LOGIC := '0';     -- divided down 1 Hz clock
    signal RE_counter      : INTEGER   := 0;       -- counter used to divide clock by
                                                   -- counting number of rising edges
begin

    -- Must divide system clock down from 100 MHz to 1 Hz
    -- process executes on every value change of the system clock
    process (sys_clk_100mhz)
    begin
        -- Increment counter every positive edge of system clock
        if rising_edge(sys_clk_100mhz) then
            RE_counter <= RE_counter + 1;

            -- LED output must be toggled every 50E6 completed cycles of system clock
            -- in order to achieve 1 Hz output with 50% duty cycle. In other words,
            -- LED must be toggled at a rate of 2 Hz.
            -- (100E6) / (50E6) = 2 Hz
            --
            -- (50E6 - 1) is used because of the nature of how the counter is reset
            -- and how one clock cycle will already have completed by the time the counter
            -- reaches 1. However, this is NOT true for the very first counting cycle after
            -- device power on, because the counter is already initialized to 0 before the
            -- first clock edge is counted. As such, the very first LED OFF duration will be
            -- shorter by 1 clock cycle, but this is acceptable.
            if (RE_counter = (50E6 - 1)) then
                clk_out_1hz <= not clk_out_1hz;   -- toggle 1 Hz clock edge
                RE_counter <= 0;                  -- reset counter
            end if;

        end if;

    end process;

    -- Assign LED output to always be the value of the 1 Hz clock signal
    LED <= clk_out_1hz;

end rtl;