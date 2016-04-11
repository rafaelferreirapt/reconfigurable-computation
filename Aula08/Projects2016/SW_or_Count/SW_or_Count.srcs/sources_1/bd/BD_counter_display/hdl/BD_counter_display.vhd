--Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
--Date        : Sun Apr 10 14:30:01 2016
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
    btnL : in STD_LOGIC;
    clk : in STD_LOGIC;
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    sw : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of BD_counter_display : entity is "BD_counter_display,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=BD_counter_display,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=7,numReposBlks=7,numNonXlnxBlks=4,numHierBlks=0,maxHierDepth=0,synth_mode=Global}";
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
  component BD_counter_display_xlconcat_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    In1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    In2 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    In3 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    In4 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    In5 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    In6 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    In7 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component BD_counter_display_xlconcat_0_0;
  component BD_counter_display_xlconstant_1_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component BD_counter_display_xlconstant_1_0;
  component BD_counter_display_My_Conc_0_0 is
  port (
    in1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out32 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sel : in STD_LOGIC
  );
  end component BD_counter_display_My_Conc_0_0;
  component BD_counter_display_MyC_0_0 is
  port (
    clk : in STD_LOGIC;
    btnC : in STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component BD_counter_display_MyC_0_0;
  signal BinToBCD16_0_BCD0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal BinToBCD16_0_BCD1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal BinToBCD16_0_BCD2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal BinToBCD16_0_BCD3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal BinToBCD16_0_BCD4 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal DC32_0_segments : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal DC32_0_select_display : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal MyC_0_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal My_Conc_0_out32 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal btnC_1 : STD_LOGIC;
  signal btnL_1 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal sw_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_BinToBCD16_0_ready_UNCONNECTED : STD_LOGIC;
begin
  an(7 downto 0) <= DC32_0_select_display(7 downto 0);
  btnC_1 <= btnC;
  btnL_1 <= btnL;
  clk_1 <= clk;
  seg(6 downto 0) <= DC32_0_segments(6 downto 0);
  sw_1(15 downto 0) <= sw(15 downto 0);
BinToBCD16_0: component BD_counter_display_BinToBCD16_0_0
     port map (
      BCD0(3 downto 0) => BinToBCD16_0_BCD0(3 downto 0),
      BCD1(3 downto 0) => BinToBCD16_0_BCD1(3 downto 0),
      BCD2(3 downto 0) => BinToBCD16_0_BCD2(3 downto 0),
      BCD3(3 downto 0) => BinToBCD16_0_BCD3(3 downto 0),
      BCD4(3 downto 0) => BinToBCD16_0_BCD4(3 downto 0),
      binary(15 downto 0) => sw_1(15 downto 0),
      clk => clk_1,
      ready => NLW_BinToBCD16_0_ready_UNCONNECTED,
      request => xlconstant_0_dout(0),
      reset => btnC_1
    );
DC32_0: component BD_counter_display_DC32_0_1
     port map (
      clk => clk_1,
      data_in(31 downto 0) => My_Conc_0_out32(31 downto 0),
      segments(6 downto 0) => DC32_0_segments(6 downto 0),
      select_display(7 downto 0) => DC32_0_select_display(7 downto 0)
    );
MyC_0: component BD_counter_display_MyC_0_0
     port map (
      btnC => btnC_1,
      clk => clk_1,
      data_out(31 downto 0) => MyC_0_data_out(31 downto 0)
    );
My_Conc_0: component BD_counter_display_My_Conc_0_0
     port map (
      in1(31 downto 0) => MyC_0_data_out(31 downto 0),
      in2(31 downto 0) => xlconcat_0_dout(31 downto 0),
      out32(31 downto 0) => My_Conc_0_out32(31 downto 0),
      sel => btnL_1
    );
xlconcat_0: component BD_counter_display_xlconcat_0_0
     port map (
      In0(3 downto 0) => BinToBCD16_0_BCD0(3 downto 0),
      In1(3 downto 0) => BinToBCD16_0_BCD1(3 downto 0),
      In2(3 downto 0) => BinToBCD16_0_BCD2(3 downto 0),
      In3(3 downto 0) => BinToBCD16_0_BCD3(3 downto 0),
      In4(3 downto 0) => BinToBCD16_0_BCD4(3 downto 0),
      In5(3 downto 0) => xlconstant_1_dout(3 downto 0),
      In6(3 downto 0) => xlconstant_1_dout(3 downto 0),
      In7(3 downto 0) => xlconstant_1_dout(3 downto 0),
      dout(31 downto 0) => xlconcat_0_dout(31 downto 0)
    );
xlconstant_0: component BD_counter_display_xlconstant_0_1
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
xlconstant_1: component BD_counter_display_xlconstant_1_0
     port map (
      dout(3 downto 0) => xlconstant_1_dout(3 downto 0)
    );
end STRUCTURE;
