-- Testbench for Project 1 - Blink_LED
--
--    For the testbench simulation, we need to create a virtual clock source.
--   
--    Note: Top level testbench does not usually define inputs or outputs in a port map.
--          All of the input and output signals required are usually defined internally.

-- Library headers
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- Define testbench entity (no port map needed)
entity TB_Blink_LED is
end TB_Blink_LED;


-- Define architecture of testbench entity
architecture stimulus of TB_Blink_LED is
    -- Declare local signals
    constant clk_period_100mhz  : time := 10 ns;    -- 1 / (clk frequency) = clk period
                                                    -- 1 / (100 MHz) = 10 ns clk period
    signal  virtual_clk_100mhz  : std_logic := '0';
    signal  out_LED             : std_logic;

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
        wait for 5 sec;
    end process;

end stimulus;