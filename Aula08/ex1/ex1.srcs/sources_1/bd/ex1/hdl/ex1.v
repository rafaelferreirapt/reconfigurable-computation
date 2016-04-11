//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
//Date        : Mon Apr 11 15:49:47 2016
//Host        : RAFAELFERRE2C9F running 64-bit major release  (build 9200)
//Command     : generate_target ex1.bd
//Design      : ex1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ex1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ex1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=3,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "ex1.hwdef" *) 
module ex1
   (clk,
    led);
  input clk;
  output [2:0]led;

  wire clk_1;
  wire clock_divider_0_divided_clk;
  wire clock_divider_1_divided_clk;
  wire clock_divider_2_divided_clk;
  wire [2:0]xlconcat_0_dout;

  assign clk_1 = clk;
  assign led[2:0] = xlconcat_0_dout;
  ex1_clock_divider_0_0 clock_divider_0
       (.clk(clk_1),
        .divided_clk(clock_divider_0_divided_clk));
  ex1_clock_divider_0_1 clock_divider_1
       (.clk(clk_1),
        .divided_clk(clock_divider_1_divided_clk));
  ex1_clock_divider_1_0 clock_divider_2
       (.clk(clk_1),
        .divided_clk(clock_divider_2_divided_clk));
  ex1_xlconcat_0_0 xlconcat_0
       (.In0(clock_divider_0_divided_clk),
        .In1(clock_divider_1_divided_clk),
        .In2(clock_divider_2_divided_clk),
        .dout(xlconcat_0_dout));
endmodule
