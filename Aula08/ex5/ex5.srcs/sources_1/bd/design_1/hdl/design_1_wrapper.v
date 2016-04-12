//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
//Date        : Tue Apr 12 15:50:21 2016
//Host        : DESKTOP-87HGRSN running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (an,
    clk,
    seg,
    sw);
  output [7:0]an;
  input clk;
  output [6:0]seg;
  input [3:0]sw;

  wire [7:0]an;
  wire clk;
  wire [6:0]seg;
  wire [3:0]sw;

  design_1 design_1_i
       (.an(an),
        .clk(clk),
        .seg(seg),
        .sw(sw));
endmodule
