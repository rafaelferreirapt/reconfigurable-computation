//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
//Date        : Thu Apr 14 12:21:28 2016
//Host        : ubuntu running 64-bit Ubuntu 14.04.1 LTS
//Command     : generate_target ex4.bd
//Design      : ex4
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ex4,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ex4,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=9,numReposBlks=9,numNonXlnxBlks=4,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "ex4.hwdef" *) 
module ex4
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

  wire [6:0]EightDisplayControl_0_segments;
  wire [7:0]EightDisplayControl_0_select_display;
  wire [7:0]IterativeSorterFSM_0_led;
  wire [4:0]ROM_Reader1_0_addr;
  wire [511:0]ROM_Reader1_0_data_out;
  wire [15:0]blk_mem_gen_1_douta;
  wire btnC_1;
  wire clk_1;
  wire [15:0]smart_mux_0_port_out;
  wire [4:0]sw_1;
  wire [3:0]xlslice_0_Dout;
  wire [3:0]xlslice_1_Dout;
  wire [3:0]xlslice_2_Dout;
  wire [3:0]xlslice_3_Dout;

  assign an[7:0] = EightDisplayControl_0_select_display;
  assign btnC_1 = btnC;
  assign clk_1 = clk;
  assign led[7:0] = IterativeSorterFSM_0_led;
  assign seg[6:0] = EightDisplayControl_0_segments;
  assign sw_1 = sw[4:0];
  ex4_EightDisplayControl_0_1 EightDisplayControl_0
       (.clk(clk_1),
        .leftL({1'b0,1'b0,1'b0,1'b0}),
        .leftR(xlslice_3_Dout),
        .near_leftL({1'b0,1'b0,1'b0,1'b0}),
        .near_leftR(xlslice_2_Dout),
        .near_rightL({1'b0,1'b0,1'b0,1'b0}),
        .near_rightR(xlslice_1_Dout),
        .rightL({1'b0,1'b0,1'b0,1'b0}),
        .rightR(xlslice_0_Dout),
        .segments(EightDisplayControl_0_segments),
        .select_display(EightDisplayControl_0_select_display));
  ex4_IterativeSorterFSM_0_0 IterativeSorterFSM_0
       (.clk(clk_1),
        .data_in(ROM_Reader1_0_data_out),
        .led(IterativeSorterFSM_0_led),
        .reset(btnC_1));
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
  ex4_smart_mux_0_0 smart_mux_0
       (.port_in(ROM_Reader1_0_data_out),
        .port_out(smart_mux_0_port_out),
        .select_port(sw_1));
  ex4_xlslice_0_0 xlslice_0
       (.Din(smart_mux_0_port_out),
        .Dout(xlslice_0_Dout));
  ex4_xlslice_0_1 xlslice_1
       (.Din(smart_mux_0_port_out),
        .Dout(xlslice_1_Dout));
  ex4_xlslice_1_0 xlslice_2
       (.Din(smart_mux_0_port_out),
        .Dout(xlslice_2_Dout));
  ex4_xlslice_2_0 xlslice_3
       (.Din(smart_mux_0_port_out),
        .Dout(xlslice_3_Dout));
endmodule
