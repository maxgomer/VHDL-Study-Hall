
-- Multiplexers are commonly not implemented as modules, as their code is
-- small and easy to include anywhere.


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  -- required for STD_LOGIC type

-- Entity declaration for 4-1 Mux
entity mux is
   -- Define ports
   port( i_data0  : IN STRING(5 DOWNTO 1);
         i_data1  : IN STRING(5 DOWNTO 1);
         i_data2  : IN STRING(5 DOWNTO 1);
         i_data3  : IN STRING(5 DOWNTO 1);
         data_sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         data_out : OUT STRING(5 DOWNTO 1) );
end entity mux;


-- Architecture definition
architecture RTL of mux is
   -- Internal signal declaration (none)
begin
   -- Implement truth table of 4-1 Mux
   data_out <= i_data0 when data_sel = "00" else
               i_data1 when data_sel = "01" else
               i_data2 when data_sel = "10" else
               i_data3;
end architecture RTL;