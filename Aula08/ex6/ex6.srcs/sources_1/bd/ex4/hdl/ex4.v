//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
//Date        : Wed Apr 13 21:42:23 2016
//Host        : ubuntu running 64-bit Ubuntu 14.04.1 LTS
//Command     : generate_target ex4.bd
//Design      : ex4
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ex4,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ex4,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=13,numReposBlks=13,numNonXlnxBlks=4,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "ex4.hwdef" *) 
module ex4
   (an,
    btnC,
    clk,
    seg);
  output [7:0]an;
  input btnC;
  input clk;
  output [6:0]seg;

  wire [6:0]EightDisplayControl_0_segments;
  wire [7:0]EightDisplayControl_0_select_display;
  wire [15:0]Max_circuit_0_max_value;
  wire [15:0]Min_circuit_0_max_value;
  wire [4:0]ROM_Reader1_0_addr;
  wire [511:0]ROM_Reader1_0_data_out;
  wire [15:0]blk_mem_gen_1_douta;
  wire btnC_1;
  wire clk_1;
  wire [3:0]xlslice_0_Dout;
  wire [3:0]xlslice_1_Dout;
  wire [3:0]xlslice_2_Dout;
  wire [3:0]xlslice_3_Dout;
  wire [3:0]xlslice_4_Dout;
  wire [3:0]xlslice_5_Dout;
  wire [3:0]xlslice_6_Dout;
  wire [3:0]xlslice_7_Dout;

  assign an[7:0] = EightDisplayControl_0_select_display;
  assign btnC_1 = btnC;
  assign clk_1 = clk;
  assign seg[6:0] = EightDisplayControl_0_segments;
  ex4_EightDisplayControl_0_1 EightDisplayControl_0
       (.clk(clk_1),
        .leftL(xlslice_3_Dout),
        .leftR(xlslice_4_Dout),
        .near_leftL(xlslice_2_Dout),
        .near_leftR(xlslice_5_Dout),
        .near_rightL(xlslice_1_Dout),
        .near_rightR(xlslice_6_Dout),
        .rightL(xlslice_0_Dout),
        .rightR(xlslice_7_Dout),
        .segments(EightDisplayControl_0_segments),
        .select_display(EightDisplayControl_0_select_display));
  ex4_Max_circuit_0_0 Max_circuit_0
       (.data_in(ROM_Reader1_0_data_out),
        .max_value(Max_circuit_0_max_value));
  ex4_Min_circuit_0_0 Min_circuit_0
       (.data_in(ROM_Reader1_0_data_out),
        .max_value(Min_circuit_0_max_value));
  ex4_ROM_Reader1_0_0 ROM_Reader1_0
       (.addr(ROM_Reader1_0_addr),
        .clk(clk_1),
        .data_in(blk_mem_gen_1_douta),
        .data_out(ROM_Reader1_0_data_out),
        .rst(btnC_1));
  ex4_blk_mem_gen_0_1 blk_mem_gen_1
       (.addra(ROM_Reader1_0_addr),
        .clka(clk_1),
        .douta(blk_mem_gen_1_douta));
  ex4_xlslice_0_0 xlslice_0
       (.Din(Max_circuit_0_max_value),
        .Dout(xlslice_0_Dout));
  ex4_xlslice_0_1 xlslice_1
       (.Din(Max_circuit_0_max_value),
        .Dout(xlslice_1_Dout));
  ex4_xlslice_0_4 xlslice_2
       (.Din(Max_circuit_0_max_value),
        .Dout(xlslice_2_Dout));
  ex4_xlslice_0_5 xlslice_3
       (.Din(Max_circuit_0_max_value),
        .Dout(xlslice_3_Dout));
  ex4_xlslice_3_0 xlslice_4
       (.Din(Min_circuit_0_max_value),
        .Dout(xlslice_4_Dout));
  ex4_xlslice_4_8 xlslice_5
       (.Din(Min_circuit_0_max_value),
        .Dout(xlslice_5_Dout));
  ex4_xlslice_5_0 xlslice_6
       (.Din(Min_circuit_0_max_value),
        .Dout(xlslice_6_Dout));
  ex4_xlslice_5_1 xlslice_7
       (.Din(Min_circuit_0_max_value),
        .Dout(xlslice_7_Dout));
endmodule
