//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
//Date        : Thu Apr 14 12:21:28 2016
//Host        : ubuntu running 64-bit Ubuntu 14.04.1 LTS
//Command     : generate_target ex4_wrapper.bd
//Design      : ex4_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ex4_wrapper
   (an,
    btnC,
    clk,
    led,
    seg,
    sw);
  output [7:0]an;
  input btnC;
  input clk;
  output [7:0]led;
  output [6:0]seg;
  input [4:0]sw;

  wire [7:0]an;
  wire btnC;
  wire clk;
  wire [7:0]led;
  wire [6:0]seg;
  wire [4:0]sw;

  ex4 ex4_i
       (.an(an),
        .btnC(btnC),
        .clk(clk),
        .led(led),
        .seg(seg),
        .sw(sw));
endmodule
