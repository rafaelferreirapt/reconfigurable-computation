//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
//Date        : Tue Apr 12 14:44:10 2016
//Host        : ubuntu running 64-bit Ubuntu 14.04.1 LTS
//Command     : generate_target ex4.bd
//Design      : ex4
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ex4,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ex4,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=4,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "ex4.hwdef" *) 
module ex4
   (an,
    btnC,
    clk,
    seg);
  output [7:0]an;
  input btnC;
  input clk;
  output [6:0]seg;

  wire [3:0]BinToBCD16_0_BCD0;
  wire [3:0]BinToBCD16_0_BCD1;
  wire [3:0]BinToBCD16_0_BCD2;
  wire [3:0]BinToBCD16_0_BCD3;
  wire [6:0]EightDisplayControl_0_segments;
  wire [7:0]EightDisplayControl_0_select_display;
  wire [7:0]HW_0_out_n;
  wire [3:0]Unroll_ROM_last_0_addr;
  wire [255:0]Unroll_ROM_last_0_data_out;
  wire [15:0]blk_mem_gen_0_douta;
  wire btnC_1;
  wire clk_1;

  assign an[7:0] = EightDisplayControl_0_select_display;
  assign btnC_1 = btnC;
  assign clk_1 = clk;
  assign seg[6:0] = EightDisplayControl_0_segments;
  ex4_BinToBCD16_0_0 BinToBCD16_0
       (.BCD0(BinToBCD16_0_BCD0),
        .BCD1(BinToBCD16_0_BCD1),
        .BCD2(BinToBCD16_0_BCD2),
        .BCD3(BinToBCD16_0_BCD3),
        .binary(HW_0_out_n),
        .clk(clk_1),
        .request(1'b0),
        .reset(btnC_1));
  ex4_EightDisplayControl_0_0 EightDisplayControl_0
       (.clk(clk_1),
        .leftL({1'b0,1'b0,1'b0,1'b0}),
        .leftR(BinToBCD16_0_BCD3),
        .near_leftL({1'b0,1'b0,1'b0,1'b0}),
        .near_leftR(BinToBCD16_0_BCD2),
        .near_rightL({1'b0,1'b0,1'b0,1'b0}),
        .near_rightR(BinToBCD16_0_BCD1),
        .rightL({1'b0,1'b0,1'b0,1'b0}),
        .rightR(BinToBCD16_0_BCD0),
        .segments(EightDisplayControl_0_segments),
        .select_display(EightDisplayControl_0_select_display));
  ex4_HW_0_1 HW_0
       (.in_vector(Unroll_ROM_last_0_data_out),
        .out_n(HW_0_out_n));
  ex4_Unroll_ROM_last_0_0 Unroll_ROM_last_0
       (.addr(Unroll_ROM_last_0_addr),
        .clk(clk_1),
        .data_in(blk_mem_gen_0_douta),
        .data_out(Unroll_ROM_last_0_data_out),
        .rst(btnC_1));
  ex4_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(Unroll_ROM_last_0_addr),
        .clka(clk_1),
        .douta(blk_mem_gen_0_douta));
endmodule
