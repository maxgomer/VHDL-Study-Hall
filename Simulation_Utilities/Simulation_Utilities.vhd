-- Custom Package for Simulation Utility Functions and Procedures
--
--    This package primarily is used for creating formal verification check functions that
--    write to a text output file via the TextIO package.
--
--    A series of protected shared variables are used in this package to track the number
--    of PASS/FAIL results from verification checks, and the total number of checks. These
--    are shared and protected to allow multiple processes within this package to update
--    their values, but prevent the tester from directly modifying them (which could 
--    compromise the validity of the test results documents).

library ieee;
use ieee.std_logic_1164.all;    -- for STD_LOGIC data type
use std.textio.all;             -- for text file I/O
use ieee.std_logic_textio.all;  -- for text file I/O specifically for STD_LOGIC_VECTORS
use ieee.numeric_std.all;       -- for type conversion to string



--=================================================================================================
-- Declare package
--=================================================================================================
package Sim_Utilities is
   -- Declare protected shared variable types
   type verification_stat is protected
      -- Declare methods
      procedure reset;
      procedure increment;
      impure function get return INTEGER;
   end protected;

   type check_result_type is protected
      -- Declare methods
      procedure set_pass;
      procedure set_fail;
      impure function get return STRING;
   end protected;

   -- Declare function and procedure prototypes
   procedure setup_verification_stats;
   procedure finish_results_file;
   procedure check( constant check_description    : in string;
                    constant expected             : in bit;
                    constant actual               : in bit );
   procedure check( constant check_description    : in string;
                    constant expected             : in STD_LOGIC;
                    constant actual               : in STD_LOGIC );                 
   procedure check( constant check_description    : in string;
                    constant expected             : in integer;
                    constant actual               : in integer );
   procedure check( constant check_description    : in string;
                    constant expected             : in time;
                    constant actual               : in time );
   procedure check( constant check_description    : in string;
                    constant expected             : in time;
                    constant actual               : in time; 
                    constant tolerance            : in real );
   procedure check( constant check_description    : in string;
                    constant expected_lower_limit : in time;
                    constant expected_upper_limit : in time;
                    constant actual               : in time );                 
   procedure print_check( variable in_result         : inout check_result_type;
                          constant check_description : in string; 
                          constant expected          : in string;
                          constant actual            : in string;
                          constant tolerance         : in string );
   procedure report_comment( constant description : in string );

   -- Declare public variables
   file results_file     : TEXT;
   
end package;
--=================================================================================================




--=================================================================================================
-- Define package contents
--=================================================================================================
package body Sim_Utilities is

   -- Define Verification Stat protected shared variable type
   type verification_stat is protected body
      variable stat_value : INTEGER;

      procedure reset is begin
         stat_value := 0;
      end;

      procedure increment is begin
         stat_value := stat_value + 1;
      end;

      impure function get return INTEGER is begin
         return stat_value;
      end;
   end protected body;

   -- Define Check Result protected shared variable type
   type check_result_type is protected body
      type result_type is (PASS, FAIL);
      variable result : result_type;

      procedure set_pass is begin
         result := PASS;
      end procedure;

      procedure set_fail is begin
         result := FAIL;
      end procedure;

      impure function get return STRING is begin
         if (result = PASS) then
            return "PASS";
         elsif (result = FAIL) then
            return "FAIL";
         end if;
      end;
   end protected body;


   -- Declare protected shared variables
   shared variable pass_count   : verification_stat;
   shared variable fail_count   : verification_stat;
   shared variable check_count  : verification_stat;
   shared variable check_result : check_result_type;


   ----------------------------------------------------------------------
   -- Reset shared protected Verification Stats to 0
   ----------------------------------------------------------------------
   procedure setup_verification_stats is
      -- Internal variables
   begin
      -- Reset verification stats
      pass_count.reset;
      fail_count.reset;
      check_count.reset;
   end procedure;


   ----------------------------------------------------------------------
   -- Write footer with test results summary to output file
   ----------------------------------------------------------------------
   procedure finish_results_file is
      -- Internal variables
      variable temp_line   : LINE;
      variable newline     : LINE;
   begin
      file_open(results_file, "Test_Results.txt", APPEND_MODE);

      -- Print test results summary and footer
      write(temp_line, string'("-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"));
      writeline(results_file, temp_line);
      write(newline, string'(""));
      writeline(results_file, newline);
      write(temp_line, string'("Results Summary:"));
      writeline(results_file, temp_line);
      write(results_file, (string'("   Total PASS: ") & to_string(pass_count.get) & string'(" / ") & to_string(check_count.get)));
      writeline(results_file, newline);
      write(results_file, (string'("   Total FAIL: ") & to_string(fail_count.get)));
      writeline(results_file, newline);
      writeline(results_file, newline);

      file_close(results_file);
   end procedure;


   ----------------------------------------------------------------------
   -- Check - Bit Equality
   --    Inputs: (check description string, expected bit, actual bit)
   ----------------------------------------------------------------------
   procedure check( constant check_description  : in string;
                    constant expected           : in bit;
                    constant actual             : in bit
                  ) is
   begin
      -- Perform check
      if (expected = actual) then
         -- PASS result
         check_result.set_pass;

         -- Update verification stat counts accordingly
         check_count.increment;
         pass_count.increment;
      else
         -- FAIL result
         check_result.set_fail;

         -- Update verification stat counts accordingly
         check_count.increment;
         fail_count.increment;
      end if;

      -- Print check results
      print_check(check_result, check_description, to_string(expected), to_string(actual), string'("N/A"));
   end procedure;


   ----------------------------------------------------------------------
   -- Check - STD_LOGIC Equality
   --    Inputs: (check description string, expected STD_LOGIC, actual STD_LOGIC)
   ----------------------------------------------------------------------
   procedure check( constant check_description  : in string;
                    constant expected           : in STD_LOGIC;
                    constant actual             : in STD_LOGIC
                  ) is
   begin
      -- Perform check
      if (expected = actual) then
         -- PASS result
         check_result.set_pass;

         -- Update verification stat counts accordingly
         check_count.increment;
         pass_count.increment;
      else
         -- FAIL result
         check_result.set_fail;

         -- Update verification stat counts accordingly
         check_count.increment;
         fail_count.increment;
      end if;

      -- Print check results
      print_check(check_result, check_description, to_string(expected), to_string(actual), string'("N/A"));
   end procedure;


   ----------------------------------------------------------------------
   -- Check - Integer Equality
   --    Inputs: (check description string, expected integer, actual integer)
   ----------------------------------------------------------------------
   procedure check( constant check_description  : in string;
                    constant expected           : in integer;
                    constant actual             : in integer
                  ) is
   begin
      -- Perform check
      if (expected = actual) then
         -- PASS result
         check_result.set_pass;

         -- Update verification stat counts accordingly
         check_count.increment;
         pass_count.increment;
      else
         -- FAIL result
         check_result.set_fail;

         -- Update verification stat counts accordingly
         check_count.increment;
         fail_count.increment;
      end if;

      -- Print check results
      print_check(check_result, check_description, to_string(expected), to_string(actual), string'("N/A"));
   end procedure;


   ----------------------------------------------------------------------
   -- Check - Time Equality
   --    Inputs: (check description string, expected time, actual time)
   ----------------------------------------------------------------------
   procedure check( constant check_description  : in string;
                    constant expected           : in time;
                    constant actual             : in time
                  ) is
   begin
      -- Perform check
      if (expected = actual) then
         -- PASS result
         check_result.set_pass;

         -- Update verification stat counts accordingly
         check_count.increment;
         pass_count.increment;
      else
         -- FAIL result
         check_result.set_fail;

         -- Update verification stat counts accordingly
         check_count.increment;
         fail_count.increment;
      end if;

      -- Print check results
      print_check(check_result, check_description, to_string(expected), to_string(actual), string'("N/A"));
   end procedure;


   ----------------------------------------------------------------------
   -- Check - Time Equality with Tolerance
   --    Inputs: (check description string, expected time, actual time, tolerance real)
   ----------------------------------------------------------------------
   procedure check( constant check_description  : in string;
                    constant expected           : in time;
                    constant actual             : in time;
                    constant tolerance          : in real      -- example value: 0.05 for +/- 5%
                  ) is
      -- Local variables
      variable lower_value : time;
      variable upper_value : time;
   begin
      -- Calculate nominal range
      lower_value := expected - (expected * tolerance);
      upper_value := expected + (expected * tolerance);

      -- Perform check
      if (actual > lower_value AND actual < upper_value) then
         -- PASS result
         check_result.set_pass;

         -- Update verification stat counts accordingly
         check_count.increment;
         pass_count.increment;
      else
         -- FAIL result
         check_result.set_fail;

         -- Update verification stat counts accordingly
         check_count.increment;
         fail_count.increment;
      end if;

      -- Print check results
      print_check(check_result, check_description, to_string(expected), to_string(actual), ("+/- " & to_string(tolerance * 100.0) & "%"));
   end procedure;


   ----------------------------------------------------------------------
   -- Check - Time Within Upper and Lower Bounds
   --    Inputs: (check description string, expected lower limit time,
   --             expected upper limit time, actual time)
   ----------------------------------------------------------------------
   procedure check( constant check_description    : in string;
                    constant expected_lower_limit : in time;
                    constant expected_upper_limit : in time;
                    constant actual               : in time
                  ) is
   begin
      
      -- Perform check
      if (actual >= expected_lower_limit AND actual <= expected_upper_limit) then
         -- PASS result
         check_result.set_pass;

         -- Update verification stat counts accordingly
         check_count.increment;
         pass_count.increment;
      else
         -- FAIL result
         check_result.set_fail;

         -- Update verification stat counts accordingly
         check_count.increment;
         fail_count.increment;
      end if;

      -- Print check results
      print_check(check_result, check_description, "N/A", to_string(actual), ("[ " & to_string(expected_lower_limit) & ", " & to_string(expected_upper_limit) & " ]"));
   end procedure;


   ----------------------------------------------------------------------
   -- Print Check Results
   ----------------------------------------------------------------------
   procedure print_check( variable in_result         : inout check_result_type;
                          constant check_description : in string;
                          constant expected          : in string;
                          constant actual            : in string;
                          constant tolerance         : in string
                        ) is
      -- Internal variables
      variable temp_line   : LINE;
      variable field_width : WIDTH;
      variable check_description_formatted : string(1 to 116);
   begin
      file_open(results_file, "Test_Results.txt", APPEND_MODE);

      -- Ensure that the description string is constrained to the correct field width
      if (check_description'length > 116) then
         check_description_formatted := check_description(1 to 116);
      else
         check_description_formatted := "                                                                                                                    ";
         check_description_formatted(1 to check_description'length) := check_description;
      end if;

      -- Build line according to test results table format
      field_width := 8;
      write(temp_line, to_string(check_count.get), LEFT, field_width);  -- Check #
      write(temp_line, string'("  "));                                     --   2x spaces
      field_width := 10;
      write(temp_line, in_result.get, LEFT, field_width);               -- PASS/FAIL
      write(temp_line, string'("  "));                                     --   2x spaces
      field_width := 116;
      write(temp_line, check_description_formatted, LEFT, field_width); -- Description
      write(temp_line, string'("  "));                                     --   2x spaces
      field_width := 15;
      write(temp_line, expected, LEFT, field_width);                    -- Expected
      write(temp_line, string'("  "));                                     --   2x spaces
      field_width := 15;
      write(temp_line, actual, LEFT, field_width);                      -- Actual
      write(temp_line, string'("  "));                                     --   2x spaces
      field_width := 25;
      write(temp_line, tolerance, LEFT, field_width);                   -- Tolerance
      writeline(results_file, temp_line);

      file_close(results_file);
   end procedure;


   ----------------------------------------------------------------------
   -- Print Comment in Results File
   ----------------------------------------------------------------------
   procedure report_comment( constant description : in string ) is
      -- Internal variables
      variable temp_line   : LINE;
      variable field_width : WIDTH;
      variable description_formatted : string(1 to 116);
   begin
      file_open(results_file, "Test_Results.txt", APPEND_MODE);

      -- Ensure that the description string is constrained to the correct field width
      if (description'length > 116) then
         description_formatted := description(1 to 116);
      else
         description_formatted := "                                                                                                                    ";
         description_formatted(1 to description'length) := description;
      end if;

      -- Build line according to test results table format
      field_width := 8;
      write(temp_line, string'(""), LEFT, field_width);                 -- Check #
      write(temp_line, string'("  "));                                     --   2x spaces
      field_width := 10;
      write(temp_line, string'(""), LEFT, field_width);                 -- PASS/FAIL
      write(temp_line, string'("  "));                                     --   2x spaces
      field_width := 116;
      write(temp_line, description_formatted, LEFT, field_width);       -- Description
      write(temp_line, string'("  "));                                     --   2x spaces
      field_width := 15;
      write(temp_line, string'(""), LEFT, field_width);                 -- Expected
      write(temp_line, string'("  "));                                     --   2x spaces
      field_width := 15;
      write(temp_line, string'(""), LEFT, field_width);                 -- Actual
      write(temp_line, string'("  "));                                     --   2x spaces
      field_width := 25;
      write(temp_line, string'(""), LEFT, field_width);                 -- Tolerance
      writeline(results_file, temp_line);      

      file_close(results_file);
   end procedure;


end package body;
--=================================================================================================