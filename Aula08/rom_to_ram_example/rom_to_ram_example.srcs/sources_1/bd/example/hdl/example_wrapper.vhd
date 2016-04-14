--Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
--Date        : Thu Apr 14 14:46:30 2016
--Host        : ubuntu running 64-bit Ubuntu 14.04.1 LTS
--Command     : generate_target example_wrapper.bd
--Design      : example_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity example_wrapper is
  port (
    an : out STD_LOGIC_VECTOR ( 7 downto 0 );
    btnC : in STD_LOGIC;
    clk : in STD_LOGIC;
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    sw : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
end example_wrapper;

architecture STRUCTURE of example_wrapper is
  component example is
  port (
    clk : in STD_LOGIC;
    sw : in STD_LOGIC_VECTOR ( 2 downto 0 );
    btnC : in STD_LOGIC;
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    an : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component example;
begin
example_i: component example
     port map (
      an(7 downto 0) => an(7 downto 0),
      btnC => btnC,
      clk => clk,
      seg(6 downto 0) => seg(6 downto 0),
      sw(2 downto 0) => sw(2 downto 0)
    );
end STRUCTURE;
