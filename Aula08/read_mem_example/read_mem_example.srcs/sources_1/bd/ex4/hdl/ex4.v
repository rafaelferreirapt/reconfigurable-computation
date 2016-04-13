//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
//Date        : Wed Apr 13 20:59:59 2016
//Host        : ubuntu running 64-bit Ubuntu 14.04.1 LTS
//Command     : generate_target ex4.bd
//Design      : ex4
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ex4,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ex4,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=11,numReposBlks=11,numNonXlnxBlks=2,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "ex4.hwdef" *) 
module ex4
   (btnC,
    clk,
    led,
    sw);
  input btnC;
  input clk;
  output [15:0]led;
  input [2:0]sw;

  wire [2:0]ROM_Reader1_0_addr;
  wire [127:0]ROM_Reader1_0_data_out;
  wire [15:0]blk_mem_gen_0_douta;
  wire btnC_1;
  wire clk_1;
  wire [15:0]mux_0_port_out;
  wire [2:0]sw_1;
  wire [15:0]xlslice_0_Dout;
  wire [15:0]xlslice_1_Dout;
  wire [15:0]xlslice_2_Dout;
  wire [15:0]xlslice_3_Dout;
  wire [15:0]xlslice_4_Dout;
  wire [15:0]xlslice_5_Dout;
  wire [15:0]xlslice_6_Dout;
  wire [15:0]xlslice_7_Dout;

  assign btnC_1 = btnC;
  assign clk_1 = clk;
  assign led[15:0] = mux_0_port_out;
  assign sw_1 = sw[2:0];
  ex4_ROM_Reader1_0_0 ROM_Reader1_0
       (.addr(ROM_Reader1_0_addr),
        .clk(clk_1),
        .data_in(blk_mem_gen_0_douta),
        .data_out(ROM_Reader1_0_data_out),
        .rst(btnC_1));
  ex4_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(ROM_Reader1_0_addr),
        .clka(clk_1),
        .douta(blk_mem_gen_0_douta));
  ex4_mux_0_0 mux_0
       (.port0(xlslice_0_Dout),
        .port1(xlslice_1_Dout),
        .port2(xlslice_2_Dout),
        .port3(xlslice_3_Dout),
        .port4(xlslice_4_Dout),
        .port5(xlslice_5_Dout),
        .port6(xlslice_6_Dout),
        .port7(xlslice_7_Dout),
        .port_out(mux_0_port_out),
        .select_port(sw_1));
  ex4_xlslice_0_0 xlslice_0
       (.Din(ROM_Reader1_0_data_out),
        .Dout(xlslice_0_Dout));
  ex4_xlslice_0_1 xlslice_1
       (.Din(ROM_Reader1_0_data_out),
        .Dout(xlslice_1_Dout));
  ex4_xlslice_1_0 xlslice_2
       (.Din(ROM_Reader1_0_data_out),
        .Dout(xlslice_2_Dout));
  ex4_xlslice_2_0 xlslice_3
       (.Din(ROM_Reader1_0_data_out),
        .Dout(xlslice_3_Dout));
  ex4_xlslice_3_0 xlslice_4
       (.Din(ROM_Reader1_0_data_out),
        .Dout(xlslice_4_Dout));
  ex4_xlslice_4_0 xlslice_5
       (.Din(ROM_Reader1_0_data_out),
        .Dout(xlslice_5_Dout));
  ex4_xlslice_5_0 xlslice_6
       (.Din(ROM_Reader1_0_data_out),
        .Dout(xlslice_6_Dout));
  ex4_xlslice_6_0 xlslice_7
       (.Din(ROM_Reader1_0_data_out),
        .Dout(xlslice_7_Dout));
endmodule
