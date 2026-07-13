--=============================================================================
-- Description:
--
--    This module is a simple SPI Master Controller intended to be used to send
-- data to the PMOD LED screen attachment on the development board. As such,
-- not all SPI Master Controller features are implemented (no Chip Select
-- logic). These may be added later if needed.
--
--
-- SPI Protocol Notes:
--
--    - Serial Peripheral Interface (SPI)
--    - 4x wire connection (by default, other variants exist)
--    - Connections:
--         SCLK = Serial Clock
--         MOSI = Master Out Slave In
--         MISO = Master In Slave Out
--           CS = Chip Select (active low)
--    - Different word lengths are used in data transmission depending on the
--      SPI implementation, with 8-bit and 16-bit words being common.
--    - There is no strict specification for SPI, so implementations can vary,
--      and there are no defined frequency requirements for SCLK. Thus, as long
--      as the master / slave devices can support a clock frequency, it can be
--      used for SCLK.
--
--     ___________________                  ___________________
--    |              SCLK |--------------->| SCLK              |
--    |                   |                |                   |
--    |              MOSI |--------------->| MOSI              |
--    |    Master         |                |         Slave(s)  |
--    |    (FPGA)    MISO |<---------------| MISO   (external  |
--    |                __ |                | __      device)   |
--    |                CS |--------------->| CS                |
--    |___________________|                |___________________|
--
--
--    There are 4 possible "modes" for SPI, each of which determine when
--    data is transmitted or received relative to the clock.
--    CPOL = Clock Polarity
--       (ex: CPOL = '0' means SCLK is idle at '0')
--       (ex: CPOL = '1' means SCLK is idle at '1')
--    CPHA = Clock Phase
--       (ex: CPHA = '0' means Rx on leading SCLK edge, Tx on trailing SCLK edge)
--       (ex: CPHA = '1' means Tx on leading SCLK edge, Rx on trailing SCLK edge)
--    ______________________________________________________________________________
--    SPI Mode | CPOL | CPHA | Bit Tx Timing                        | Bit Rx Timing
--    ______________________________________________________________________________
--        0    |  0   |  0   | falling SCLK, also when CS activates | rising SCLK
--        1    |  0   |  1   | rising SCLK                          | falling SCLK
--        2    |  1   |  0   | rising SCLK, also when CS activates  | falling SCLK
--        3    |  1   |  1   | falling SCLK                         | rising SCLK
--
--
-- SPI Implementation Notes:
--
--    - 8-bit words, MSB transmitted first
--    - PMOD OLEDrgb Screen Pin Mapping for Jumper A (JA):
--       - JA[1]  -> CS       (Chip Select, active low)
--       - JA[2]  -> MOSI     (Master-Out Slave-In)
--       - JA[3]  -> NC       (Not Connected)
--       - JA[4]  -> SCLK     (Serial Clock)
--       - JA[7]  -> D/C      (Data/Command Control)
--       - JA[8]  -> RES      (Power Reset)
--       - JA[9]  -> VCCEN    (Vcc Enable)
--       - JA[10] -> PMODEN   (Vdd Logic Voltage Control)
--    - SCLK: Derived from sys_clock_100mhz. Since we are generating SCLK
--      using positive edges of sys_clock_100mhz, which involves toggling
--      the value of SCLK on every positive edge, the maximum possible
--      SCLK frequency is half of the system clock (maximum is 50 MHz).
--    - 8-bit shift registers are used to convert between parallel 8-bit words
--      and serial 8-bit data. 2x shift registers are needed (one per Tx, Rx).
--
--
-- PMOD OLEDrgb Screen Documentation:
--
--   - SSD1331 Screen Driver & Controller Data Sheet (includes Command list):
--     https://cdn-shop.adafruit.com/datasheets/SSD1331_1.2.pdf
--
--   - PMOD OLEDrgb Reference Manual:
--     https://digilent.com/reference/_media/pmod:pmod:pmodoledrgb_rm.pdf
--
--=============================================================================



-- Library headers
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  -- required for STD_LOGIC type


-- Declare entity
entity SPI_Master is
   -- Declare generics
   generic (
      SPI_MODE         : INTEGER := 0
   );
   -- Declare ports
   port (
      sys_clock_100mhz : IN STD_LOGIC;
      reset_0          : IN STD_LOGIC;

      -- Tx/Rx Data Words
      input_byte_Tx    : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      sreg_byte_Rx     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

      -- Tx/Rx Control Signals
      Tx_load_byte     : IN STD_LOGIC;
      Tx_ready         : OUT STD_LOGIC;
      Rx_byte_captured : OUT STD_LOGIC;

      -- SPI Connections (no CS implemented here)
      SCLK        : OUT STD_LOGIC;
      bit_Tx_MOSI : OUT STD_LOGIC;
      bit_Rx_MISO : IN STD_LOGIC
   );
end entity SPI_Master;


-- Define architecture
architecture RTL of SPI_Master is
   -- Declare internal signals
   signal sreg_byte_Tx : STD_LOGIC_VECTOR(7 DOWNTO 0);   -- shift register for Tx
begin

   -- Register the byte we want to transmit before we start transmitting to
   -- ensure that the Tx byte can't be modified by new Tx data mid-transmission
   Register_Tx_Byte_Input : process (sys_clock_100mhz, reset_0) is begin
      -- Asynchronous reset : clear Tx byte register, clear
      if (reset_0 = '0') then

      elsif rising_edge(sys_clock_100mhz) then
      end if;
   end process Register_Tx_Byte_Input;

   -- Generate SPI SCLK
   SCLK_Generate : process (sys_clock_100mhz, reset_0) is begin
      -- Asynchronous reset
      if (reset_0 = '0') then

      elsif rising_edge(sys_clock_100mhz) then
         SCLK <= not SCLK;
      end if;
   end process SCLK_Generate;

end architecture RTL;