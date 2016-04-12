//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
//Date        : Tue Apr 12 22:39:06 2016
//Host        : ubuntu running 64-bit Ubuntu 14.04.1 LTS
//Command     : generate_target ex4.bd
//Design      : ex4
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ex4,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ex4,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=10,numReposBlks=10,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "ex4.hwdef" *) 
module ex4
   (btnC,
    clk,
    led);
  input btnC;
  input clk;
  output [15:0]led;

  wire [2:0]Unroll_ROM_last_0_addr;
  wire [127:0]Unroll_ROM_last_0_data_out;
  wire [15:0]blk_mem_gen_0_douta;
  wire btnC_1;
  wire clk_1;
  wire [15:0]xlslice_1_Dout;

  assign btnC_1 = btnC;
  assign clk_1 = clk;
  assign led[15:0] = xlslice_1_Dout;
  ex4_Unroll_ROM_last_0_0 Unroll_ROM_last_0
       (.addr(Unroll_ROM_last_0_addr),
        .clk(clk_1),
        .data_in(blk_mem_gen_0_douta),
        .data_out(Unroll_ROM_last_0_data_out),
        .rst(btnC_1));
  ex4_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(Unroll_ROM_last_0_addr),
        .clka(clk_1),
        .douta(blk_mem_gen_0_douta));
  ex4_xlslice_0_0 xlslice_0
       (.Din(Unroll_ROM_last_0_data_out));
  ex4_xlslice_0_1 xlslice_1
       (.Din(Unroll_ROM_last_0_data_out),
        .Dout(xlslice_1_Dout));
  ex4_xlslice_0_2 xlslice_2
       (.Din(Unroll_ROM_last_0_data_out));
  ex4_xlslice_2_0 xlslice_3
       (.Din(Unroll_ROM_last_0_data_out));
  ex4_xlslice_2_1 xlslice_4
       (.Din(Unroll_ROM_last_0_data_out));
  ex4_xlslice_2_2 xlslice_5
       (.Din(Unroll_ROM_last_0_data_out));
  ex4_xlslice_5_0 xlslice_6
       (.Din(Unroll_ROM_last_0_data_out));
  ex4_xlslice_6_0 xlslice_7
       (.Din(Unroll_ROM_last_0_data_out));
endmodule
