-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Fri Jun 26 13:15:39 2026
-- Host        : DESKTOP-3778IF0 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force C:/CM/VHDL_Study_Hall/2_LED_Toggle_Debounced/Build_Results/design_impl_netlist.vhd
-- Design      : LED_Toggle_Debounced_Top
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Debounce_Filter is
  port (
    w_button_state_filt : out STD_LOGIC;
    BTNC_IBUF : in STD_LOGIC;
    sys_clk_100mhz_IBUF_BUFG : in STD_LOGIC
  );
end Debounce_Filter;

architecture STRUCTURE of Debounce_Filter is
  signal debounce_clk_counter21_in : STD_LOGIC;
  signal \debounce_clk_counter2_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \debounce_clk_counter2_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \debounce_clk_counter2_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \debounce_clk_counter2_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \debounce_clk_counter2_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \debounce_clk_counter2_carry__0_i_6_n_0\ : STD_LOGIC;
  signal debounce_clk_counter2_carry_i_1_n_0 : STD_LOGIC;
  signal debounce_clk_counter2_carry_i_2_n_0 : STD_LOGIC;
  signal debounce_clk_counter2_carry_i_3_n_0 : STD_LOGIC;
  signal debounce_clk_counter2_carry_i_4_n_0 : STD_LOGIC;
  signal debounce_clk_counter2_carry_i_5_n_0 : STD_LOGIC;
  signal debounce_clk_counter2_carry_i_6_n_0 : STD_LOGIC;
  signal debounce_clk_counter2_carry_n_0 : STD_LOGIC;
  signal \debounce_clk_counter[0]_i_3_n_0\ : STD_LOGIC;
  signal debounce_clk_counter_reg : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal \debounce_clk_counter_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \debounce_clk_counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal r_button_filt : STD_LOGIC;
  signal \r_button_filt1__20\ : STD_LOGIC;
  signal r_button_filt_i_3_n_0 : STD_LOGIC;
  signal r_button_filt_i_4_n_0 : STD_LOGIC;
  signal r_button_filt_i_5_n_0 : STD_LOGIC;
  signal \^w_button_state_filt\ : STD_LOGIC;
  signal NLW_debounce_clk_counter2_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_debounce_clk_counter2_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_debounce_clk_counter2_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_debounce_clk_counter2_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_debounce_clk_counter_reg[0]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_debounce_clk_counter_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_debounce_clk_counter_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_debounce_clk_counter_reg[4]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_debounce_clk_counter_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of debounce_clk_counter2_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \debounce_clk_counter2_carry__0\ : label is 11;
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \debounce_clk_counter_reg[0]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \debounce_clk_counter_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \debounce_clk_counter_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \debounce_clk_counter_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \debounce_clk_counter_reg[8]_i_1\ : label is 35;
begin
  w_button_state_filt <= \^w_button_state_filt\;
debounce_clk_counter2_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => debounce_clk_counter2_carry_n_0,
      CO(2 downto 0) => NLW_debounce_clk_counter2_carry_CO_UNCONNECTED(2 downto 0),
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => debounce_clk_counter2_carry_i_1_n_0,
      DI(0) => debounce_clk_counter2_carry_i_2_n_0,
      O(3 downto 0) => NLW_debounce_clk_counter2_carry_O_UNCONNECTED(3 downto 0),
      S(3) => debounce_clk_counter2_carry_i_3_n_0,
      S(2) => debounce_clk_counter2_carry_i_4_n_0,
      S(1) => debounce_clk_counter2_carry_i_5_n_0,
      S(0) => debounce_clk_counter2_carry_i_6_n_0
    );
\debounce_clk_counter2_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => debounce_clk_counter2_carry_n_0,
      CO(3) => \NLW_debounce_clk_counter2_carry__0_CO_UNCONNECTED\(3),
      CO(2) => debounce_clk_counter21_in,
      CO(1 downto 0) => \NLW_debounce_clk_counter2_carry__0_CO_UNCONNECTED\(1 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \debounce_clk_counter2_carry__0_i_1_n_0\,
      DI(1) => \debounce_clk_counter2_carry__0_i_2_n_0\,
      DI(0) => \debounce_clk_counter2_carry__0_i_3_n_0\,
      O(3 downto 0) => \NLW_debounce_clk_counter2_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \debounce_clk_counter2_carry__0_i_4_n_0\,
      S(1) => \debounce_clk_counter2_carry__0_i_5_n_0\,
      S(0) => \debounce_clk_counter2_carry__0_i_6_n_0\
    );
\debounce_clk_counter2_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => debounce_clk_counter_reg(18),
      I1 => debounce_clk_counter_reg(19),
      O => \debounce_clk_counter2_carry__0_i_1_n_0\
    );
\debounce_clk_counter2_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => debounce_clk_counter_reg(16),
      I1 => debounce_clk_counter_reg(17),
      O => \debounce_clk_counter2_carry__0_i_2_n_0\
    );
\debounce_clk_counter2_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => debounce_clk_counter_reg(14),
      I1 => debounce_clk_counter_reg(15),
      O => \debounce_clk_counter2_carry__0_i_3_n_0\
    );
\debounce_clk_counter2_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => debounce_clk_counter_reg(18),
      I1 => debounce_clk_counter_reg(19),
      O => \debounce_clk_counter2_carry__0_i_4_n_0\
    );
\debounce_clk_counter2_carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => debounce_clk_counter_reg(16),
      I1 => debounce_clk_counter_reg(17),
      O => \debounce_clk_counter2_carry__0_i_5_n_0\
    );
\debounce_clk_counter2_carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => debounce_clk_counter_reg(14),
      I1 => debounce_clk_counter_reg(15),
      O => \debounce_clk_counter2_carry__0_i_6_n_0\
    );
debounce_clk_counter2_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => debounce_clk_counter_reg(9),
      O => debounce_clk_counter2_carry_i_1_n_0
    );
debounce_clk_counter2_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => debounce_clk_counter_reg(6),
      I1 => debounce_clk_counter_reg(7),
      O => debounce_clk_counter2_carry_i_2_n_0
    );
debounce_clk_counter2_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => debounce_clk_counter_reg(12),
      I1 => debounce_clk_counter_reg(13),
      O => debounce_clk_counter2_carry_i_3_n_0
    );
debounce_clk_counter2_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => debounce_clk_counter_reg(10),
      I1 => debounce_clk_counter_reg(11),
      O => debounce_clk_counter2_carry_i_4_n_0
    );
debounce_clk_counter2_carry_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => debounce_clk_counter_reg(9),
      I1 => debounce_clk_counter_reg(8),
      O => debounce_clk_counter2_carry_i_5_n_0
    );
debounce_clk_counter2_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => debounce_clk_counter_reg(6),
      I1 => debounce_clk_counter_reg(7),
      O => debounce_clk_counter2_carry_i_6_n_0
    );
\debounce_clk_counter[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9F"
    )
        port map (
      I0 => BTNC_IBUF,
      I1 => \^w_button_state_filt\,
      I2 => debounce_clk_counter21_in,
      O => p_0_in
    );
\debounce_clk_counter[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => debounce_clk_counter_reg(0),
      O => \debounce_clk_counter[0]_i_3_n_0\
    );
\debounce_clk_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[0]_i_2_n_7\,
      Q => debounce_clk_counter_reg(0),
      R => p_0_in
    );
\debounce_clk_counter_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \debounce_clk_counter_reg[0]_i_2_n_0\,
      CO(2 downto 0) => \NLW_debounce_clk_counter_reg[0]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \debounce_clk_counter_reg[0]_i_2_n_4\,
      O(2) => \debounce_clk_counter_reg[0]_i_2_n_5\,
      O(1) => \debounce_clk_counter_reg[0]_i_2_n_6\,
      O(0) => \debounce_clk_counter_reg[0]_i_2_n_7\,
      S(3 downto 1) => debounce_clk_counter_reg(3 downto 1),
      S(0) => \debounce_clk_counter[0]_i_3_n_0\
    );
\debounce_clk_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[8]_i_1_n_5\,
      Q => debounce_clk_counter_reg(10),
      R => p_0_in
    );
\debounce_clk_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[8]_i_1_n_4\,
      Q => debounce_clk_counter_reg(11),
      R => p_0_in
    );
\debounce_clk_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[12]_i_1_n_7\,
      Q => debounce_clk_counter_reg(12),
      R => p_0_in
    );
\debounce_clk_counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \debounce_clk_counter_reg[8]_i_1_n_0\,
      CO(3) => \debounce_clk_counter_reg[12]_i_1_n_0\,
      CO(2 downto 0) => \NLW_debounce_clk_counter_reg[12]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \debounce_clk_counter_reg[12]_i_1_n_4\,
      O(2) => \debounce_clk_counter_reg[12]_i_1_n_5\,
      O(1) => \debounce_clk_counter_reg[12]_i_1_n_6\,
      O(0) => \debounce_clk_counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => debounce_clk_counter_reg(15 downto 12)
    );
\debounce_clk_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[12]_i_1_n_6\,
      Q => debounce_clk_counter_reg(13),
      R => p_0_in
    );
\debounce_clk_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[12]_i_1_n_5\,
      Q => debounce_clk_counter_reg(14),
      R => p_0_in
    );
\debounce_clk_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[12]_i_1_n_4\,
      Q => debounce_clk_counter_reg(15),
      R => p_0_in
    );
\debounce_clk_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[16]_i_1_n_7\,
      Q => debounce_clk_counter_reg(16),
      R => p_0_in
    );
\debounce_clk_counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \debounce_clk_counter_reg[12]_i_1_n_0\,
      CO(3 downto 0) => \NLW_debounce_clk_counter_reg[16]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \debounce_clk_counter_reg[16]_i_1_n_4\,
      O(2) => \debounce_clk_counter_reg[16]_i_1_n_5\,
      O(1) => \debounce_clk_counter_reg[16]_i_1_n_6\,
      O(0) => \debounce_clk_counter_reg[16]_i_1_n_7\,
      S(3 downto 0) => debounce_clk_counter_reg(19 downto 16)
    );
\debounce_clk_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[16]_i_1_n_6\,
      Q => debounce_clk_counter_reg(17),
      R => p_0_in
    );
\debounce_clk_counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[16]_i_1_n_5\,
      Q => debounce_clk_counter_reg(18),
      R => p_0_in
    );
\debounce_clk_counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[16]_i_1_n_4\,
      Q => debounce_clk_counter_reg(19),
      R => p_0_in
    );
\debounce_clk_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[0]_i_2_n_6\,
      Q => debounce_clk_counter_reg(1),
      R => p_0_in
    );
\debounce_clk_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[0]_i_2_n_5\,
      Q => debounce_clk_counter_reg(2),
      R => p_0_in
    );
\debounce_clk_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[0]_i_2_n_4\,
      Q => debounce_clk_counter_reg(3),
      R => p_0_in
    );
\debounce_clk_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[4]_i_1_n_7\,
      Q => debounce_clk_counter_reg(4),
      R => p_0_in
    );
\debounce_clk_counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \debounce_clk_counter_reg[0]_i_2_n_0\,
      CO(3) => \debounce_clk_counter_reg[4]_i_1_n_0\,
      CO(2 downto 0) => \NLW_debounce_clk_counter_reg[4]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \debounce_clk_counter_reg[4]_i_1_n_4\,
      O(2) => \debounce_clk_counter_reg[4]_i_1_n_5\,
      O(1) => \debounce_clk_counter_reg[4]_i_1_n_6\,
      O(0) => \debounce_clk_counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => debounce_clk_counter_reg(7 downto 4)
    );
\debounce_clk_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[4]_i_1_n_6\,
      Q => debounce_clk_counter_reg(5),
      R => p_0_in
    );
\debounce_clk_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[4]_i_1_n_5\,
      Q => debounce_clk_counter_reg(6),
      R => p_0_in
    );
\debounce_clk_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[4]_i_1_n_4\,
      Q => debounce_clk_counter_reg(7),
      R => p_0_in
    );
\debounce_clk_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[8]_i_1_n_7\,
      Q => debounce_clk_counter_reg(8),
      R => p_0_in
    );
\debounce_clk_counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \debounce_clk_counter_reg[4]_i_1_n_0\,
      CO(3) => \debounce_clk_counter_reg[8]_i_1_n_0\,
      CO(2 downto 0) => \NLW_debounce_clk_counter_reg[8]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \debounce_clk_counter_reg[8]_i_1_n_4\,
      O(2) => \debounce_clk_counter_reg[8]_i_1_n_5\,
      O(1) => \debounce_clk_counter_reg[8]_i_1_n_6\,
      O(0) => \debounce_clk_counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => debounce_clk_counter_reg(11 downto 8)
    );
\debounce_clk_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => \debounce_clk_counter_reg[8]_i_1_n_6\,
      Q => debounce_clk_counter_reg(9),
      R => p_0_in
    );
r_button_filt_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0440"
    )
        port map (
      I0 => debounce_clk_counter21_in,
      I1 => \r_button_filt1__20\,
      I2 => \^w_button_state_filt\,
      I3 => BTNC_IBUF,
      O => r_button_filt
    );
r_button_filt_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => debounce_clk_counter_reg(19),
      I1 => debounce_clk_counter_reg(18),
      I2 => r_button_filt_i_3_n_0,
      I3 => r_button_filt_i_4_n_0,
      I4 => r_button_filt_i_5_n_0,
      O => \r_button_filt1__20\
    );
r_button_filt_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEFFFFFFFFF"
    )
        port map (
      I0 => debounce_clk_counter_reg(7),
      I1 => debounce_clk_counter_reg(8),
      I2 => debounce_clk_counter_reg(6),
      I3 => debounce_clk_counter_reg(10),
      I4 => debounce_clk_counter_reg(11),
      I5 => debounce_clk_counter_reg(9),
      O => r_button_filt_i_3_n_0
    );
r_button_filt_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFBFFFFFFFFFFFF"
    )
        port map (
      I0 => debounce_clk_counter_reg(12),
      I1 => debounce_clk_counter_reg(14),
      I2 => debounce_clk_counter_reg(13),
      I3 => debounce_clk_counter_reg(15),
      I4 => debounce_clk_counter_reg(16),
      I5 => debounce_clk_counter_reg(17),
      O => r_button_filt_i_4_n_0
    );
r_button_filt_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => debounce_clk_counter_reg(0),
      I1 => debounce_clk_counter_reg(1),
      I2 => debounce_clk_counter_reg(2),
      I3 => debounce_clk_counter_reg(3),
      I4 => debounce_clk_counter_reg(4),
      I5 => debounce_clk_counter_reg(5),
      O => r_button_filt_i_5_n_0
    );
r_button_filt_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => r_button_filt,
      D => BTNC_IBUF,
      Q => \^w_button_state_filt\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity LED_Button_Toggle is
  port (
    LED_OBUF : out STD_LOGIC;
    w_button_state_filt : in STD_LOGIC;
    sys_clk_100mhz_IBUF_BUFG : in STD_LOGIC
  );
end LED_Button_Toggle;

architecture STRUCTURE of LED_Button_Toggle is
  signal \^led_obuf\ : STD_LOGIC;
  signal r_LED_status_i_1_n_0 : STD_LOGIC;
  signal r_button_status : STD_LOGIC;
begin
  LED_OBUF <= \^led_obuf\;
r_LED_status_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B4"
    )
        port map (
      I0 => w_button_state_filt,
      I1 => r_button_status,
      I2 => \^led_obuf\,
      O => r_LED_status_i_1_n_0
    );
r_LED_status_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => r_LED_status_i_1_n_0,
      Q => \^led_obuf\,
      R => '0'
    );
r_button_status_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sys_clk_100mhz_IBUF_BUFG,
      CE => '1',
      D => w_button_state_filt,
      Q => r_button_status,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity LED_Toggle_Debounced_Top is
  port (
    sys_clk_100mhz : in STD_LOGIC;
    BTNC : in STD_LOGIC;
    LED : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of LED_Toggle_Debounced_Top : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of LED_Toggle_Debounced_Top : entity is "de8dd370";
end LED_Toggle_Debounced_Top;

architecture STRUCTURE of LED_Toggle_Debounced_Top is
  signal BTNC_IBUF : STD_LOGIC;
  signal LED_OBUF : STD_LOGIC;
  signal sys_clk_100mhz_IBUF : STD_LOGIC;
  signal sys_clk_100mhz_IBUF_BUFG : STD_LOGIC;
  signal w_button_state_filt : STD_LOGIC;
begin
BTNC_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => BTNC,
      O => BTNC_IBUF
    );
Debounce_Filter_Inst: entity work.Debounce_Filter
     port map (
      BTNC_IBUF => BTNC_IBUF,
      sys_clk_100mhz_IBUF_BUFG => sys_clk_100mhz_IBUF_BUFG,
      w_button_state_filt => w_button_state_filt
    );
LED_Button_Toggle_Inst: entity work.LED_Button_Toggle
     port map (
      LED_OBUF => LED_OBUF,
      sys_clk_100mhz_IBUF_BUFG => sys_clk_100mhz_IBUF_BUFG,
      w_button_state_filt => w_button_state_filt
    );
LED_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF,
      O => LED
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
