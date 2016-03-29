-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:24:04 MST 2014
-- Date        : Thu Apr 02 16:15:03 2015
-- Host        : Jeronimo running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/jeronimos/Documents/Universidade/CR/praticas/aula5/exercicio54/exercicio54.srcs/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0_stub.vhdl
-- Design      : dist_mem_gen_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dist_mem_gen_0 is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 5 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end dist_mem_gen_0;

architecture stub of dist_mem_gen_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[5:0],spo[7:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0,Vivado 2014.4";
begin
end;
