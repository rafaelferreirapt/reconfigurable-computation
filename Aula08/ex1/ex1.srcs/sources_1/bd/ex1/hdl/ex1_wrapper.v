//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
//Date        : Mon Apr 11 15:49:47 2016
//Host        : RAFAELFERRE2C9F running 64-bit major release  (build 9200)
//Command     : generate_target ex1_wrapper.bd
//Design      : ex1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ex1_wrapper
   (clk,
    led);
  input clk;
  output [2:0]led;

  wire clk;
  wire [2:0]led;

  ex1 ex1_i
       (.clk(clk),
        .led(led));
endmodule
