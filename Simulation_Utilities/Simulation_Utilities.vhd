-- Custom Package for Simulation Utility Functions and Procedures
--
--    This package primarily is used for creating formal verification check functions that
--    write to a text output file via the TextIO package.

library ieee;
use ieee.std_logic_1164.all;    -- for STD_LOGIC data type
use std.textio.all;             -- for text file I/O
use ieee.std_logic_textio.all;  -- for text file I/O specifically for STD_LOGIC_VECTORS


-- Declare package
package Sim_Utilities is
    -- Declare function and procedure prototypes
    procedure test_write_output( signal text_in : in string(1 to 15) );
end package Sim_Utilities;


-- Define package contents
package body Sim_Utilities is

   procedure test_write_output(
      -- Procedure arguments
      signal text_in : in string(1 to 15)
   ) is
      file output_file : TEXT;
   begin
      -- Define procedure logic
      --file output_file : text open write_mode is "output_file.txt";
      file_open(output_file, "output_file.txt", WRITE_MODE);
      write(output_file, text_in);
      file_close(output_file);
   end procedure test_write_output;


   -- Procedure to test std_logic = std_logic, and print
   -- formatted results in output text file.
   

end package body Sim_Utilities;