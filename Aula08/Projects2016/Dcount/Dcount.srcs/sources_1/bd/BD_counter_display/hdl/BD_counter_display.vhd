--Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
--Date        : Sun Apr 10 13:10:19 2016
--Host        : DETI-PC0018 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target BD_counter_display.bd
--Design      : BD_counter_display
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BD_counter_display is
  port (
    an : out STD_LOGIC_VECTOR ( 7 downto 0 );
    btnC : in STD_LOGIC;
    clk : in STD_LOGIC;
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    sw : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of BD_counter_display : entity is "BD_counter_display,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=BD_counter_display,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=4,numReposBlks=4,numNonXlnxBlks=3,numHierBlks=0,maxHierDepth=0,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of BD_counter_display : entity is "BD_counter_display.hwdef";
end BD_counter_display;

architecture STRUCTURE of BD_counter_display is
  component BD_counter_display_DC32_0_1 is
  port (
    clk : in STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    select_display : out STD_LOGIC_VECTOR ( 7 downto 0 );
    segments : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  end component BD_counter_display_DC32_0_1;
  component BD_counter_display_BinToBCD16_0_0 is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    ready : out STD_LOGIC;
    binary : in STD_LOGIC_VECTOR ( 15 downto 0 );
    request : in STD_LOGIC;
    BCD4 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    BCD3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    BCD2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    BCD1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    BCD0 : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component BD_counter_display_BinToBCD16_0_0;
  component BD_counter_display_xlconstant_0_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component BD_counter_display_xlconstant_0_1;
  component BD_counter_display_TopCounterN_0_0 is
  port (
    clk : in STD_LOGIC;
    btnC : in STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component BD_counter_display_TopCounterN_0_0;
  signal DC32_0_segments : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal DC32_0_select_display : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal TopCounterN_0_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal btnC_1 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal sw_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_BinToBCD16_0_ready_UNCONNECTED : STD_LOGIC;
  signal NLW_BinToBCD16_0_BCD0_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_BinToBCD16_0_BCD1_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_BinToBCD16_0_BCD2_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_BinToBCD16_0_BCD3_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_BinToBCD16_0_BCD4_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  an(7 downto 0) <= DC32_0_select_display(7 downto 0);
  btnC_1 <= btnC;
  clk_1 <= clk;
  seg(6 downto 0) <= DC32_0_segments(6 downto 0);
  sw_1(15 downto 0) <= sw(15 downto 0);
BinToBCD16_0: component BD_counter_display_BinToBCD16_0_0
     port map (
      BCD0(3 downto 0) => NLW_BinToBCD16_0_BCD0_UNCONNECTED(3 downto 0),
      BCD1(3 downto 0) => NLW_BinToBCD16_0_BCD1_UNCONNECTED(3 downto 0),
      BCD2(3 downto 0) => NLW_BinToBCD16_0_BCD2_UNCONNECTED(3 downto 0),
      BCD3(3 downto 0) => NLW_BinToBCD16_0_BCD3_UNCONNECTED(3 downto 0),
      BCD4(3 downto 0) => NLW_BinToBCD16_0_BCD4_UNCONNECTED(3 downto 0),
      binary(15 downto 0) => sw_1(15 downto 0),
      clk => clk_1,
      ready => NLW_BinToBCD16_0_ready_UNCONNECTED,
      request => xlconstant_0_dout(0),
      reset => btnC_1
    );
DC32_0: component BD_counter_display_DC32_0_1
     port map (
      clk => clk_1,
      data_in(31 downto 0) => TopCounterN_0_data_out(31 downto 0),
      segments(6 downto 0) => DC32_0_segments(6 downto 0),
      select_display(7 downto 0) => DC32_0_select_display(7 downto 0)
    );
TopCounterN_0: component BD_counter_display_TopCounterN_0_0
     port map (
      btnC => btnC_1,
      clk => clk_1,
      data_out(31 downto 0) => TopCounterN_0_data_out(31 downto 0)
    );
xlconstant_0: component BD_counter_display_xlconstant_0_1
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
end STRUCTURE;
