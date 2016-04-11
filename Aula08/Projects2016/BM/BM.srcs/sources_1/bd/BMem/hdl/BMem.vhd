--Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
--Date        : Sun Apr 10 14:48:17 2016
--Host        : DETI-PC0018 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target BMem.bd
--Design      : BMem
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BMem is
  port (
    an : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    sw : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of BMem : entity is "BMem,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=BMem,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of BMem : entity is "BMem.hwdef";
end BMem;

architecture STRUCTURE of BMem is
  component BMem_DC32_0_0 is
  port (
    clk : in STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    select_display : out STD_LOGIC_VECTOR ( 7 downto 0 );
    segments : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  end component BMem_DC32_0_0;
  component BMem_dist_mem_gen_0_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component BMem_dist_mem_gen_0_0;
  signal DC32_0_segments : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal DC32_0_select_display : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal clk_1 : STD_LOGIC;
  signal dist_mem_gen_0_spo : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal sw_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  an(7 downto 0) <= DC32_0_select_display(7 downto 0);
  clk_1 <= clk;
  seg(6 downto 0) <= DC32_0_segments(6 downto 0);
  sw_1(3 downto 0) <= sw(3 downto 0);
DC32_0: component BMem_DC32_0_0
     port map (
      clk => clk_1,
      data_in(31 downto 0) => dist_mem_gen_0_spo(31 downto 0),
      segments(6 downto 0) => DC32_0_segments(6 downto 0),
      select_display(7 downto 0) => DC32_0_select_display(7 downto 0)
    );
dist_mem_gen_0: component BMem_dist_mem_gen_0_0
     port map (
      a(3 downto 0) => sw_1(3 downto 0),
      spo(31 downto 0) => dist_mem_gen_0_spo(31 downto 0)
    );
end STRUCTURE;
