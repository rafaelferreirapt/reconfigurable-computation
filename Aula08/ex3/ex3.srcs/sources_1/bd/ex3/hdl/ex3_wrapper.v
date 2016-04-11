//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
//Date        : Mon Apr 11 21:34:11 2016
//Host        : ubuntu running 64-bit Ubuntu 14.04.1 LTS
//Command     : generate_target ex3_wrapper.bd
//Design      : ex3_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ex3_wrapper
   (an,
    btnC,
    btnL,
    clk,
    seg,
    sw);
  output [7:0]an;
  input btnC;
  input btnL;
  input clk;
  output [6:0]seg;
  input [3:0]sw;

  wire [7:0]an;
  wire btnC;
  wire btnL;
  wire clk;
  wire [6:0]seg;
  wire [3:0]sw;

  ex3 ex3_i
       (.an(an),
        .btnC(btnC),
        .btnL(btnL),
        .clk(clk),
        .seg(seg),
        .sw(sw));
endmodule
