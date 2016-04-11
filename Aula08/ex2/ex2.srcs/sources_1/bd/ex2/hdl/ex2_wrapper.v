//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
//Date        : Mon Apr 11 16:46:54 2016
//Host        : RODRIGOCUNH821E running 64-bit major release  (build 9200)
//Command     : generate_target ex2_wrapper.bd
//Design      : ex2_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ex2_wrapper
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

  wire [7:0]an;
  wire btnC;
  wire clk;
  wire [6:0]seg;
  wire [15:0]sw;

  ex2 ex2_i
       (.an(an),
        .btnC(btnC),
        .clk(clk),
        .seg(seg),
        .sw(sw));
endmodule
