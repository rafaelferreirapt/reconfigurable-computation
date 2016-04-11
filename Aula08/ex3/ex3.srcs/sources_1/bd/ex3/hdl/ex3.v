//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
//Date        : Mon Apr 11 17:16:35 2016
//Host        : RODRIGOCUNH821E running 64-bit major release  (build 9200)
//Command     : generate_target ex3.bd
//Design      : ex3
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ex3,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ex3,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "ex3.hwdef" *) 
module ex3
   (an,
    clk,
    seg,
    sw);
  output [7:0]an;
  input clk;
  output [6:0]seg;
  input [3:0]sw;

  wire [6:0]EightDisplayControl32inputs_0_segments;
  wire [7:0]EightDisplayControl32inputs_0_select_display;
  wire [31:0]blk_mem_gen_0_douta;
  wire clk_1;
  wire [3:0]sw_1;

  assign an[7:0] = EightDisplayControl32inputs_0_select_display;
  assign clk_1 = clk;
  assign seg[6:0] = EightDisplayControl32inputs_0_segments;
  assign sw_1 = sw[3:0];
  ex3_EightDisplayControl32inputs_0_0 EightDisplayControl32inputs_0
       (.clk(clk_1),
        .data_in(blk_mem_gen_0_douta),
        .segments(EightDisplayControl32inputs_0_segments),
        .select_display(EightDisplayControl32inputs_0_select_display));
  ex3_blk_mem_gen_0_1 blk_mem_gen_0
       (.addra(sw_1),
        .clka(clk_1),
        .douta(blk_mem_gen_0_douta));
endmodule
