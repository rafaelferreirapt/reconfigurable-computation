--Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
--Date        : Thu Apr 14 14:46:30 2016
--Host        : ubuntu running 64-bit Ubuntu 14.04.1 LTS
--Command     : generate_target example.bd
--Design      : example
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity example is
  port (
    an : out STD_LOGIC_VECTOR ( 7 downto 0 );
    btnC : in STD_LOGIC;
    clk : in STD_LOGIC;
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    sw : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of example : entity is "example,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=example,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=7,numReposBlks=7,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of example : entity is "example.hwdef";
end example;

architecture STRUCTURE of example is
  component example_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 2 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component example_blk_mem_gen_0_0;
  component example_blk_mem_gen_1_0 is
  port (
    clka : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 2 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    clkb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 2 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component example_blk_mem_gen_1_0;
  component example_EightDisplayControl_0_0 is
  port (
    clk : in STD_LOGIC;
    leftL : in STD_LOGIC_VECTOR ( 3 downto 0 );
    near_leftL : in STD_LOGIC_VECTOR ( 3 downto 0 );
    near_rightL : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rightL : in STD_LOGIC_VECTOR ( 3 downto 0 );
    leftR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    near_leftR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    near_rightR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rightR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    select_display : out STD_LOGIC_VECTOR ( 7 downto 0 );
    segments : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  end component example_EightDisplayControl_0_0;
  component example_xlslice_0_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component example_xlslice_0_0;
  component example_xlslice_0_1 is
  port (
    Din : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component example_xlslice_0_1;
  component example_xlslice_1_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component example_xlslice_1_0;
  component example_xlslice_2_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component example_xlslice_2_0;
  signal EightDisplayControl_0_segments : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal EightDisplayControl_0_select_display : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal blk_mem_gen_0_douta : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal blk_mem_gen_1_douta : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal btnC_1 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal sw_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xlslice_0_Dout : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xlslice_1_Dout : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xlslice_2_Dout : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xlslice_3_Dout : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_blk_mem_gen_1_doutb_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
  an(7 downto 0) <= EightDisplayControl_0_select_display(7 downto 0);
  btnC_1 <= btnC;
  clk_1 <= clk;
  seg(6 downto 0) <= EightDisplayControl_0_segments(6 downto 0);
  sw_1(2 downto 0) <= sw(2 downto 0);
EightDisplayControl_0: component example_EightDisplayControl_0_0
     port map (
      clk => clk_1,
      leftL(3 downto 0) => B"0000",
      leftR(3 downto 0) => xlslice_3_Dout(3 downto 0),
      near_leftL(3 downto 0) => B"0000",
      near_leftR(3 downto 0) => xlslice_2_Dout(3 downto 0),
      near_rightL(3 downto 0) => B"0000",
      near_rightR(3 downto 0) => xlslice_1_Dout(3 downto 0),
      rightL(3 downto 0) => B"0000",
      rightR(3 downto 0) => xlslice_0_Dout(3 downto 0),
      segments(6 downto 0) => EightDisplayControl_0_segments(6 downto 0),
      select_display(7 downto 0) => EightDisplayControl_0_select_display(7 downto 0)
    );
blk_mem_gen_0: component example_blk_mem_gen_0_0
     port map (
      addra(2 downto 0) => sw_1(2 downto 0),
      clka => clk_1,
      douta(15 downto 0) => blk_mem_gen_0_douta(15 downto 0)
    );
blk_mem_gen_1: component example_blk_mem_gen_1_0
     port map (
      addra(2 downto 0) => sw_1(2 downto 0),
      addrb(2 downto 0) => B"000",
      clka => clk_1,
      clkb => '0',
      dina(15 downto 0) => blk_mem_gen_0_douta(15 downto 0),
      dinb(15 downto 0) => B"0000000000000000",
      douta(15 downto 0) => blk_mem_gen_1_douta(15 downto 0),
      doutb(15 downto 0) => NLW_blk_mem_gen_1_doutb_UNCONNECTED(15 downto 0),
      wea(0) => btnC_1,
      web(0) => '0'
    );
xlslice_0: component example_xlslice_0_0
     port map (
      Din(15 downto 0) => blk_mem_gen_1_douta(15 downto 0),
      Dout(3 downto 0) => xlslice_0_Dout(3 downto 0)
    );
xlslice_1: component example_xlslice_0_1
     port map (
      Din(15 downto 0) => blk_mem_gen_1_douta(15 downto 0),
      Dout(3 downto 0) => xlslice_1_Dout(3 downto 0)
    );
xlslice_2: component example_xlslice_1_0
     port map (
      Din(15 downto 0) => blk_mem_gen_1_douta(15 downto 0),
      Dout(3 downto 0) => xlslice_2_Dout(3 downto 0)
    );
xlslice_3: component example_xlslice_2_0
     port map (
      Din(15 downto 0) => blk_mem_gen_1_douta(15 downto 0),
      Dout(3 downto 0) => xlslice_3_Dout(3 downto 0)
    );
end STRUCTURE;
