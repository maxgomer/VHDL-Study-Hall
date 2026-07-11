
-- This design is for a simple Linear Feedback Shift Register (LFSR).
--
-- This is a modified shift register, where the outputs of certain flip-flops
-- in the shift register are fed into an XOR or XNOR gate, whose output is then
-- fed back into the very first flip-flop of the register chain (hence "feedback").
-- "Linear" comes from the fact that the next input bit to the register chain is
-- calculated as a linear function of the shift register's previous state.
--
-- LFSR's are useful to produce pseudo-random bit combinations, which can be used
-- to generate test pattern vectors, scramble data, perform cryptography, or be used
-- as lightweight counters. Using an LFSR over a traditional counter allows you to
-- avoid needing adders, and also allows for faster counting speeds since you don't
-- need as long of a chain of flip-flops.
--
-- LFSR's typically include intialization, and reset logic, and can optionally be
-- configurable to different sized shift registers.
--
-- LFSR patterns repeat every 2^n - 1 clock cycles, where "n" is the number of flip-flops
-- in the shift register chain.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  -- required for STD_LOGIC type


-- Declare entity
entity LFSR is
   -- List ports
   port( sys_clock_100mhz : IN STD_LOGIC;
         i_seed           : IN STD_LOGIC_VECTOR(2 DOWNTO 0);   -- value to use as key for determining when LFSR state repeats
                                                               -- optionally can be used to initialize registers to seed value
         enable_seed      : IN STD_LOGIC;                      -- pulse to trigger initialization of registers to seed value
         r_lfsr_out       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);  -- optional output of register values
         count_done       : OUT STD_LOGIC );                   -- done pulse to flag that LFSR state has repeated, meaning the
                                                               -- total 2^n-1 count of possible state changes has been reached
end entity LFSR;


-- Define architecture
architecture RTL of LFSR is
   -- Declare internal signals
   signal r_lfsr   : STD_LOGIC_VECTOR(2 DOWNTO 0) := (others => '0');
   signal XNOR_out : STD_LOGIC;
begin

   -- Every clock cycle, shift data forward by 1 bit and concatenate with
   -- XNOR output of Bit(2) and Bit(1)
   process (sys_clock_100mhz) is begin
      if rising_edge(sys_clock_100mhz) then
         if (enable_seed) then   
            r_lfsr <= i_seed;   -- initialize registers to seed value if enable pulse is detected
         else
            r_lfsr <= r_lfsr(1 DOWNTO 0) & XNOR_out;
         end if;
      end if;
   end process;

   XNOR_out   <= r_lfsr(2) xnor r_lfsr(1);
   count_done <= '1' when r_lfsr = i_seed else '0';
   r_lfsr_out <= r_lfsr;

end architecture RTL;