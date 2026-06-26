-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Fri Jun 26 17:49:15 2026
-- Host        : DESKTOP-3778IF0 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force
--               C:/CM/VHDL_Study_Hall/1_Blink_LED_NonProjectVersion/Build_Results/design_impl_netlist.vhd
-- Design      : Blink_LED
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Blink_LED is
  port (
    sys_clk_100mhz : in STD_LOGIC;
    LED : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Blink_LED : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of Blink_LED : entity is "2925e02";
end Blink_LED;

architecture STRUCTURE of Blink_LED is
  signal LED_OBUF : STD_LOGIC;
  signal RE_counter : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \RE_counter[31]_i_3_n_0\ : STD_LOGIC;
  signal \RE_counter[31]_i_4_n_0\ : STD_LOGIC;
  signal \RE_counter[31]_i_5_n_0\ : STD_LOGIC;
  signal \RE_counter[31]_i_6_n_0\ : STD_LOGIC;
  signal \RE_counter[31]_i_7_n_0\ : STD_LOGIC;
  signal \RE_counter[31]_i_8_n_0\ : STD_LOGIC;
  signal \RE_counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \RE_counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \RE_counter_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \RE_counter_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \RE_counter_reg[28]_i_1_n_0\ : STD_LOGIC;
  signal \RE_counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \RE_counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal clk_out_1hz : STD_LOGIC;
  signal clk_out_1hz_i_1_n_0 : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal sys_clk_100mhz_IBUF : STD_LOGIC;
  signal sys_clk_100mhz_IBUF_BUFG : STD_LOGIC;
  signal \NLW_RE_counter_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_RE_counter_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_RE_counter_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_RE_counter_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_RE_counter_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_RE_counter_reg[31]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_RE_counter_reg[31]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_RE_counter_reg[4]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_RE_counter_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \RE_counter_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \RE_counter_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \RE_counter_reg[20]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \RE_counter_reg[24]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \RE_counter_reg[28]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \RE_counter_reg[31]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \RE_counter_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \RE_counter_reg[8]_i_1\ : label is 35;
begin
LED_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF,
      O => LED
    );
\RE_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => RE_counter(0),
      O => p_1_in(0)
    );
\RE_counter[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \RE_counter[31]_i_3_n_0\,
      I1 => \RE_counter[31]_i_4_n_0\,
      I2 => \RE_counter[31]_i_5_n_0\,
      I3 => \RE_counter[31]_i_6_n_0\,
      I4 => \RE_counter[31]_i_7_n_0\,
      I5 => \RE_counter[31]_i_8_n_0\,
      O => clk_out_1hz
    );
\RE_counter[31]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RE_counter(0),
      I1 => RE_counter(1),
      O => \RE_counter[31]_i_3_n_0\
    );
\RE_counter[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => RE_counter(4),
      I1 => RE_counter(5),
      I2 => RE_counter(2),
      I3 => RE_counter(3),
      I4 => RE_counter(7),
      I5 => RE_counter(6),
      O => \RE_counter[31]_i_4_n_0\
    );
\RE_counter[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => RE_counter(10),
      I1 => RE_counter(11),
      I2 => RE_counter(8),
      I3 => RE_counter(9),
      I4 => RE_counter(13),
      I5 => RE_counter(12),
      O => \RE_counter[31]_i_5_n_0\
    );
\RE_counter[31]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => RE_counter(17),
      I1 => RE_counter(16),
      I2 => RE_counter(14),
      I3 => RE_counter(15),
      I4 => RE_counter(18),
      I5 => RE_counter(19),
      O => \RE_counter[31]_i_6_n_0\
    );
\RE_counter[31]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => RE_counter(22),
      I1 => RE_counter(23),
      I2 => RE_counter(20),
      I3 => RE_counter(21),
      I4 => RE_counter(24),
      I5 => RE_counter(25),
      O => \RE_counter[31]_i_7_n_0\
    );
\RE_counter[31]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => RE_counter(28),
      I1 => RE_counter(29),
      I2 => RE_counter(26),
      I3 => RE_counter(27),
      I4 => RE_counter(31),
      I5 => RE_counter(30),
      O => \RE_counter[31]_i_8_n_0\
    );
\RE_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(0),
      Q => RE_counter(0),
      R => clk_out_1hz
    );
\RE_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(10),
      Q => RE_counter(10),
      R => clk_out_1hz
    );
\RE_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(11),
      Q => RE_counter(11),
      R => clk_out_1hz
    );
\RE_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(12),
      Q => RE_counter(12),
      R => clk_out_1hz
    );
\RE_counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \RE_counter_reg[8]_i_1_n_0\,
      CO(3) => \RE_counter_reg[12]_i_1_n_0\,
      CO(2 downto 0) => \NLW_RE_counter_reg[12]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(12 downto 9),
      S(3 downto 0) => RE_counter(12 downto 9)
    );
\RE_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(13),
      Q => RE_counter(13),
      R => clk_out_1hz
    );
\RE_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(14),
      Q => RE_counter(14),
      R => clk_out_1hz
    );
\RE_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(15),
      Q => RE_counter(15),
      R => clk_out_1hz
    );
\RE_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(16),
      Q => RE_counter(16),
      R => clk_out_1hz
    );
\RE_counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \RE_counter_reg[12]_i_1_n_0\,
      CO(3) => \RE_counter_reg[16]_i_1_n_0\,
      CO(2 downto 0) => \NLW_RE_counter_reg[16]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(16 downto 13),
      S(3 downto 0) => RE_counter(16 downto 13)
    );
\RE_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(17),
      Q => RE_counter(17),
      R => clk_out_1hz
    );
\RE_counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(18),
      Q => RE_counter(18),
      R => clk_out_1hz
    );
\RE_counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(19),
      Q => RE_counter(19),
      R => clk_out_1hz
    );
\RE_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(1),
      Q => RE_counter(1),
      R => clk_out_1hz
    );
\RE_counter_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(20),
      Q => RE_counter(20),
      R => clk_out_1hz
    );
\RE_counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \RE_counter_reg[16]_i_1_n_0\,
      CO(3) => \RE_counter_reg[20]_i_1_n_0\,
      CO(2 downto 0) => \NLW_RE_counter_reg[20]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(20 downto 17),
      S(3 downto 0) => RE_counter(20 downto 17)
    );
\RE_counter_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(21),
      Q => RE_counter(21),
      R => clk_out_1hz
    );
\RE_counter_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(22),
      Q => RE_counter(22),
      R => clk_out_1hz
    );
\RE_counter_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(23),
      Q => RE_counter(23),
      R => clk_out_1hz
    );
\RE_counter_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(24),
      Q => RE_counter(24),
      R => clk_out_1hz
    );
\RE_counter_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \RE_counter_reg[20]_i_1_n_0\,
      CO(3) => \RE_counter_reg[24]_i_1_n_0\,
      CO(2 downto 0) => \NLW_RE_counter_reg[24]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(24 downto 21),
      S(3 downto 0) => RE_counter(24 downto 21)
    );
\RE_counter_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(25),
      Q => RE_counter(25),
      R => clk_out_1hz
    );
\RE_counter_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(26),
      Q => RE_counter(26),
      R => clk_out_1hz
    );
\RE_counter_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(27),
      Q => RE_counter(27),
      R => clk_out_1hz
    );
\RE_counter_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(28),
      Q => RE_counter(28),
      R => clk_out_1hz
    );
\RE_counter_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \RE_counter_reg[24]_i_1_n_0\,
      CO(3) => \RE_counter_reg[28]_i_1_n_0\,
      CO(2 downto 0) => \NLW_RE_counter_reg[28]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(28 downto 25),
      S(3 downto 0) => RE_counter(28 downto 25)
    );
\RE_counter_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(29),
      Q => RE_counter(29),
      R => clk_out_1hz
    );
\RE_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(2),
      Q => RE_counter(2),
      R => clk_out_1hz
    );
\RE_counter_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(30),
      Q => RE_counter(30),
      R => clk_out_1hz
    );
\RE_counter_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(31),
      Q => RE_counter(31),
      R => clk_out_1hz
    );
\RE_counter_reg[31]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \RE_counter_reg[28]_i_1_n_0\,
      CO(3 downto 0) => \NLW_RE_counter_reg[31]_i_2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_RE_counter_reg[31]_i_2_O_UNCONNECTED\(3),
      O(2 downto 0) => p_1_in(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => RE_counter(31 downto 29)
    );
\RE_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(3),
      Q => RE_counter(3),
      R => clk_out_1hz
    );
\RE_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(4),
      Q => RE_counter(4),
      R => clk_out_1hz
    );
\RE_counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \RE_counter_reg[4]_i_1_n_0\,
      CO(2 downto 0) => \NLW_RE_counter_reg[4]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => RE_counter(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(4 downto 1),
      S(3 downto 0) => RE_counter(4 downto 1)
    );
\RE_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(5),
      Q => RE_counter(5),
      R => clk_out_1hz
    );
\RE_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(6),
      Q => RE_counter(6),
      R => clk_out_1hz
    );
\RE_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(7),
      Q => RE_counter(7),
      R => clk_out_1hz
    );
\RE_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(8),
      Q => RE_counter(8),
      R => clk_out_1hz
    );
\RE_counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \RE_counter_reg[4]_i_1_n_0\,
      CO(3) => \RE_counter_reg[8]_i_1_n_0\,
      CO(2 downto 0) => \NLW_RE_counter_reg[8]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(8 downto 5),
      S(3 downto 0) => RE_counter(8 downto 5)
    );
\RE_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => p_1_in(9),
      Q => RE_counter(9),
      R => clk_out_1hz
    );
clk_out_1hz_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => clk_out_1hz,
      I1 => LED_OBUF,
      O => clk_out_1hz_i_1_n_0
    );
clk_out_1hz_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => clk_out_1hz_i_1_n_0,
      Q => LED_OBUF,
      R => '0'
    );
sys_clk_100mhz_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => sys_clk_100mhz_IBUF,
      O => sys_clk_100mhz_IBUF_BUFG
    );
sys_clk_100mhz_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => sys_clk_100mhz,
      O => sys_clk_100mhz_IBUF
    );
end STRUCTURE;
