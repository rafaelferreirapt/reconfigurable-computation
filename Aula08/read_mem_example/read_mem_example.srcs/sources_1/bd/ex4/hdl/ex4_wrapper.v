//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
//Date        : Wed Apr 13 20:59:59 2016
//Host        : ubuntu running 64-bit Ubuntu 14.04.1 LTS
//Command     : generate_target ex4_wrapper.bd
//Design      : ex4_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ex4_wrapper
   (btnC,
    clk,
    led,
    sw);
  input btnC;
  input clk;
  output [15:0]led;
  input [2:0]sw;

  wire btnC;
  wire clk;
  wire [15:0]led;
  wire [2:0]sw;

  ex4 ex4_i
       (.btnC(btnC),
        .clk(clk),
        .led(led),
        .sw(sw));
endmodule
