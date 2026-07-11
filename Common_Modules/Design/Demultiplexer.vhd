
-- Demultiplexers are commonly not implemented as modules, as their code is
-- small and easy to include anywhere.

-- Headers
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  -- required for STD_LOGIC type

-- Entity declaration for 1-4 Demux
entity Demultiplexer is
   port ( in_data   : IN STRING(5 DOWNTO 1);
          out_data0 : OUT STRING(5 DOWNTO 1);
          out_data1 : OUT STRING(5 DOWNTO 1);
          out_data2 : OUT STRING(5 DOWNTO 1);
          out_data3 : OUT STRING(5 DOWNTO 1);
          data_sel  : IN STD_LOGIC_VECTOR(1 DOWNTO 0) );
end entity Demultiplexer;


-- Define architecture
architecture RTL of Demultiplexer is
   -- Define local signals (none)
begin

   out_data0 <= in_data when data_sel = "00" else "     ";
   out_data1 <= in_data when data_sel = "01" else "     ";
   out_data2 <= in_data when data_sel = "10" else "     ";
   out_data3 <= in_data when data_sel = "11" else "     ";

end architecture RTL;