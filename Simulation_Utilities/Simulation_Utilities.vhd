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
   -- procedure setup_results_file;
   procedure finish_results_file;
   procedure test_write_output( signal text_in : in string(1 to 15) );

   -- Declare public variables
   file results_file : TEXT;
   
end package Sim_Utilities;


-- Define package contents
package body Sim_Utilities is


   -- -- Create and open output text file, and write header information to file
   -- procedure setup_results_file is
   --    -- Internal variables
   --    variable temp_line : LINE;
   -- begin

   --    -- Open specified output file for writing, and create it if it doesn't exist
   --    file_open(results_file, "Test_Results.txt", WRITE_MODE);

   --    -- Print header
   --    write(temp_line, string'("===================================================================================================================================="));
   --    writeline(results_file, temp_line);
   --    write(temp_line, string'("Verification Test Results"));
   --    writeline(results_file, temp_line);
   --    write(temp_line, string'("===================================================================================================================================="));
   --    writeline(results_file, temp_line);
   --    write(temp_line, string'(""));
   --    writeline(results_file, temp_line);   -- write newline character
   --    write(temp_line, string'("===================================================================================================================================="));

   -- end procedure setup_results_file;


   -- Write test results summary to file, close file
   procedure finish_results_file is
      -- Internal variables
   begin
      -- Print test results summary and footer

      file_close(results_file);
   end procedure finish_results_file;


   -- Test output file write string (NEEDS WORK)
   procedure test_write_output( signal text_in : in string(1 to 15) ) is
      -- Internal variables
      variable newline : LINE;
   begin
      file_open(results_file, "Test_Results.txt", APPEND_MODE);

      write(results_file, text_in);       -- write given text

      write(newline, string'(""));
      writeline(results_file, newline);   -- write newline character

      file_close(results_file);
   end procedure test_write_output;




   -- Procedure to test std_logic = std_logic, and print
   -- formatted results in output text file.
   

end package body Sim_Utilities;