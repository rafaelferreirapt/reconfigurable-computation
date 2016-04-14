//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
//Date        : Thu Apr 14 22:37:11 2016
//Host        : ubuntu running 64-bit Ubuntu 14.04.1 LTS
//Command     : generate_target ex4_wrapper.bd
//Design      : ex4_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ex4_wrapper
   (an,
    btnC,
    btnL,
    btnR,
    clk,
    seg,
    sw);
  output [7:0]an;
  input btnC;
  input btnL;
  input btnR;
  input clk;
  output [6:0]seg;
  input [4:0]sw;

  wire [7:0]an;
  wire btnC;
  wire btnL;
  wire btnR;
  wire clk;
  wire [6:0]seg;
  wire [4:0]sw;

  ex4 ex4_i
       (.an(an),
        .btnC(btnC),
        .btnL(btnL),
        .btnR(btnR),
        .clk(clk),
        .seg(seg),
        .sw(sw));
endmodule
