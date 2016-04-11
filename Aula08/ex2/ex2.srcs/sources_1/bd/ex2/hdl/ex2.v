//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
//Date        : Mon Apr 11 16:46:54 2016
//Host        : RODRIGOCUNH821E running 64-bit major release  (build 9200)
//Command     : generate_target ex2.bd
//Design      : ex2
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ex2,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ex2,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=2,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "ex2.hwdef" *) 
module ex2
   (an,
    btnC,
    clk,
    seg,
    sw);
  output [7:0]an;
  input btnC;
  input clk;
  output [6:0]seg;
  input [15:0]sw;

  wire [3:0]BinToBCD16_0_BCD0;
  wire [3:0]BinToBCD16_0_BCD1;
  wire [3:0]BinToBCD16_0_BCD2;
  wire [3:0]BinToBCD16_0_BCD3;
  wire [3:0]BinToBCD16_0_BCD4;
  wire [6:0]EightDisplayControl_0_segments;
  wire [7:0]EightDisplayControl_0_select_display;
  wire btnC_1;
  wire clk_1;
  wire [15:0]sw_1;
  wire [0:0]xlconstant_0_dout;

  assign an[7:0] = EightDisplayControl_0_select_display;
  assign btnC_1 = btnC;
  assign clk_1 = clk;
  assign seg[6:0] = EightDisplayControl_0_segments;
  assign sw_1 = sw[15:0];
  ex2_BinToBCD16_0_0 BinToBCD16_0
       (.BCD0(BinToBCD16_0_BCD0),
        .BCD1(BinToBCD16_0_BCD1),
        .BCD2(BinToBCD16_0_BCD2),
        .BCD3(BinToBCD16_0_BCD3),
        .BCD4(BinToBCD16_0_BCD4),
        .binary(sw_1),
        .clk(clk_1),
        .request(xlconstant_0_dout),
        .reset(btnC_1));
  ex2_EightDisplayControl_0_0 EightDisplayControl_0
       (.clk(clk_1),
        .leftL({1'b0,1'b0,1'b0,1'b0}),
        .leftR(BinToBCD16_0_BCD3),
        .near_leftL({1'b0,1'b0,1'b0,1'b0}),
        .near_leftR(BinToBCD16_0_BCD2),
        .near_rightL({1'b0,1'b0,1'b0,1'b0}),
        .near_rightR(BinToBCD16_0_BCD1),
        .rightL(BinToBCD16_0_BCD4),
        .rightR(BinToBCD16_0_BCD0),
        .segments(EightDisplayControl_0_segments),
        .select_display(EightDisplayControl_0_select_display));
  ex2_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
