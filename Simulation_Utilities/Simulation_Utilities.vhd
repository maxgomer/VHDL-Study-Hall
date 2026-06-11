-- Custom Package for Simulation Utility Functions and Procedures
--
--    This package primarily is used for creating formal verification check functions that
--    write to a text output file via the TextIO package.

library ieee;
use ieee.std_logic_1164.all;    -- for STD_LOGIC data type
use std.textio.all;             -- for text file I/O
use ieee.std_logic_textio.all;  -- for text file I/O specifically for STD_LOGIC_VECTORS
use ieee.numeric_std.all;       -- for type conversion to string


-- Declare package
package Sim_Utilities is
   -- Declare function and procedure prototypes
   procedure setup_verification_stats;
   procedure finish_results_file;
   procedure test_write_output( signal text_in : in string(1 to 15) );

   -- Declare public variables
   file results_file : TEXT;

   -- Declare protected shared variable type
   type verification_stat is protected
      -- Declare methods
      procedure reset;
      procedure increment;
      impure function get_value return INTEGER;
   end protected;
   
end package Sim_Utilities;


-- Define package contents
package body Sim_Utilities is

   -- Define protected shared variable type methods
   type verification_stat is protected body
      variable stat_value : INTEGER;

      procedure reset is begin
         stat_value := 0;
      end;

      procedure increment is begin
         stat_value := stat_value + 1;
      end;

      impure function get_value return INTEGER is begin
         return stat_value;
      end;
   end protected body;

   -- Declare protected shared variables
   shared variable pass_count  : verification_stat;
   shared variable fail_count  : verification_stat;
   shared variable check_count : verification_stat;

   -- Create and open output text file, and write header information to file
   procedure setup_verification_stats is
      -- Internal variables
   begin
      -- Reset verification stats
      pass_count.reset;
      fail_count.reset;
      check_count.reset;
   end procedure setup_verification_stats;


   -- Write test results summary to file, close file
   procedure finish_results_file is
      -- Internal variables
      variable temp_line   : LINE;
      variable newline     : LINE;
   begin
      -- Print test results summary and footer
      file_open(results_file, "Test_Results.txt", APPEND_MODE);
      write(temp_line, string'("------------------------------------------------------------------------------------------------------------------------------------"));
      writeline(results_file, temp_line);
      write(newline, string'(""));
      writeline(results_file, newline);   -- write newline character
      write(temp_line, string'("Results Summary:"));
      writeline(results_file, temp_line);
      write(results_file, (string'("   Total PASS: ") & to_string(pass_count.get_value) & string'(" / ") & to_string(check_count.get_value)));
      writeline(results_file, newline);   -- write newline character
      write(results_file, (string'("   Total FAIL: ") & to_string(fail_count.get_value)));
      writeline(results_file, newline);   -- write newline character
      writeline(results_file, newline);   -- write newline character
      file_close(results_file);
   end procedure finish_results_file;


   -- Test output file write string (NEEDS WORK)
   procedure test_write_output( signal text_in : in string(1 to 15) ) is
      -- Internal variables
      variable temp_line : LINE;
   begin
      file_open(results_file, "Test_Results.txt", APPEND_MODE);

      write(results_file, text_in);       -- write given text

      write(temp_line, string'(""));
      writeline(results_file, temp_line);   -- write newline character

      file_close(results_file);
   end procedure test_write_output;




   -- Procedure to test std_logic = std_logic, and print
   -- formatted results in output text file.
   

end package body Sim_Utilities;