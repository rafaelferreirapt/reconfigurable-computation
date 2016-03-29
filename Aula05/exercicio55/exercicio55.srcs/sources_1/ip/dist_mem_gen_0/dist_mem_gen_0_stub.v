// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:24:04 MST 2014
// Date        : Thu Apr 02 16:43:38 2015
// Host        : Jeronimo running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               {c:/Users/jeronimos/Documents/Universidade/CR/praticas/aula5/exemplos/Memoria distribuida projeto
//               complet/exercicio55/exercicio55.srcs/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0_stub.v}
// Design      : dist_mem_gen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0,Vivado 2014.4" *)
module dist_mem_gen_0(a, spo)
/* synthesis syn_black_box black_box_pad_pin="a[5:0],spo[7:0]" */;
  input [5:0]a;
  output [7:0]spo;
endmodule
