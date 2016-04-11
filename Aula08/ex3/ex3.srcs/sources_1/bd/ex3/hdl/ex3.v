//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
//Date        : Mon Apr 11 21:34:11 2016
//Host        : ubuntu running 64-bit Ubuntu 14.04.1 LTS
//Command     : generate_target ex3.bd
//Design      : ex3
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ex3,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ex3,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=10,numReposBlks=10,numNonXlnxBlks=3,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "ex3.hwdef" *) 
module ex3
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

  wire [3:0]BinToBCD16_0_BCD0;
  wire [3:0]BinToBCD16_0_BCD1;
  wire [3:0]BinToBCD16_0_BCD2;
  wire [3:0]BinToBCD16_0_BCD3;
  wire [6:0]EightDisplayControl32inputs_0_segments;
  wire [7:0]EightDisplayControl32inputs_0_select_display;
  wire [31:0]My_Conc_0_out32;
  wire [15:0]blk_mem_gen_0_douta;
  wire btnC_1;
  wire btnL_1;
  wire clk_1;
  wire [3:0]sw_1;
  wire [15:0]xlconcat_0_dout;
  wire [31:0]xlconcat_1_dout;
  wire [31:0]xlconcat_2_dout;
  wire [15:0]xlconstant_0_dout;
  wire [0:0]xlconstant_1_dout;
  wire [15:0]xlconstant_2_dout;

  assign an[7:0] = EightDisplayControl32inputs_0_select_display;
  assign btnC_1 = btnC;
  assign btnL_1 = btnL;
  assign clk_1 = clk;
  assign seg[6:0] = EightDisplayControl32inputs_0_segments;
  assign sw_1 = sw[3:0];
  ex3_BinToBCD16_0_1 BinToBCD16_0
       (.BCD0(BinToBCD16_0_BCD0),
        .BCD1(BinToBCD16_0_BCD1),
        .BCD2(BinToBCD16_0_BCD2),
        .BCD3(BinToBCD16_0_BCD3),
        .binary(blk_mem_gen_0_douta),
        .clk(clk_1),
        .request(xlconstant_1_dout),
        .reset(btnC_1));
  ex3_EightDisplayControl32inputs_0_0 EightDisplayControl32inputs_0
       (.clk(clk_1),
        .data_in(My_Conc_0_out32),
        .segments(EightDisplayControl32inputs_0_segments),
        .select_display(EightDisplayControl32inputs_0_select_display));
  ex3_My_Conc_0_0 My_Conc_0
       (.in1(xlconcat_1_dout),
        .in2(xlconcat_2_dout),
        .out32(My_Conc_0_out32),
        .sel(btnL_1));
  ex3_blk_mem_gen_0_1 blk_mem_gen_0
       (.addra(sw_1),
        .clka(clk_1),
        .douta(blk_mem_gen_0_douta));
  ex3_xlconcat_0_0 xlconcat_0
       (.In0(BinToBCD16_0_BCD0),
        .In1(BinToBCD16_0_BCD1),
        .In2(BinToBCD16_0_BCD2),
        .In3(BinToBCD16_0_BCD3),
        .dout(xlconcat_0_dout));
  ex3_xlconcat_1_0 xlconcat_1
       (.In0(xlconcat_0_dout),
        .In1(xlconstant_0_dout),
        .dout(xlconcat_1_dout));
  ex3_xlconcat_1_1 xlconcat_2
       (.In0(blk_mem_gen_0_douta),
        .In1(xlconstant_2_dout),
        .dout(xlconcat_2_dout));
  ex3_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  ex3_xlconstant_1_1 xlconstant_1
       (.dout(xlconstant_1_dout));
  ex3_xlconstant_0_1 xlconstant_2
       (.dout(xlconstant_2_dout));
endmodule
