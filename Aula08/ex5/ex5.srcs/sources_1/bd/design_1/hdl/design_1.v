//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
//Date        : Wed Apr 13 14:14:52 2016
//Host        : DESKTOP-87HGRSN running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=18,numReposBlks=18,numNonXlnxBlks=5,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (an,
    clk,
    seg,
    sw);
  output [7:0]an;
  input clk;
  output [6:0]seg;
  input [3:0]sw;

  wire [6:0]EightDisplayControl_0_segments;
  wire [7:0]EightDisplayControl_0_select_display;
  wire [4:0]HammingWeight_0_led;
  wire [4:0]HammingWeight_1_led;
  wire [4:0]HammingWeight_2_led;
  wire [4:0]HammingWeight_3_led;
  wire [63:0]blk_mem_gen_1_douta;
  wire [6:0]c_addsub_0_S;
  wire [5:0]c_addsub_1_S;
  wire [5:0]c_addsub_2_S;
  wire clk_1;
  wire [3:0]sw_1;
  wire [3:0]xlconcat_0_dout;
  wire [3:0]xlconstant_0_dout;
  wire [0:0]xlconstant_1_dout;
  wire [15:0]xlslice_0_Dout;
  wire [15:0]xlslice_1_Dout;
  wire [15:0]xlslice_2_Dout;
  wire [15:0]xlslice_3_Dout;
  wire [3:0]xlslice_4_Dout;
  wire [2:0]xlslice_5_Dout;

  assign an[7:0] = EightDisplayControl_0_select_display;
  assign clk_1 = clk;
  assign seg[6:0] = EightDisplayControl_0_segments;
  assign sw_1 = sw[3:0];
  design_1_EightDisplayControl_0_0 EightDisplayControl_0
       (.clk(clk_1),
        .leftL(xlconstant_0_dout),
        .leftR(xlconstant_0_dout),
        .near_leftL(xlconstant_0_dout),
        .near_leftR(xlconstant_0_dout),
        .near_rightL(xlconstant_0_dout),
        .near_rightR(xlconcat_0_dout),
        .rightL(xlconstant_0_dout),
        .rightR(xlslice_4_Dout),
        .segments(EightDisplayControl_0_segments),
        .select_display(EightDisplayControl_0_select_display));
  design_1_HammingWeight_0_2 HammingWeight_0
       (.led(HammingWeight_0_led),
        .sw(xlslice_0_Dout));
  design_1_HammingWeight_0_3 HammingWeight_1
       (.led(HammingWeight_1_led),
        .sw(xlslice_1_Dout));
  design_1_HammingWeight_0_4 HammingWeight_2
       (.led(HammingWeight_2_led),
        .sw(xlslice_2_Dout));
  design_1_HammingWeight_0_5 HammingWeight_3
       (.led(HammingWeight_3_led),
        .sw(xlslice_3_Dout));
  design_1_blk_mem_gen_1_0 blk_mem_gen_1
       (.addra(sw_1),
        .clka(clk_1),
        .douta(blk_mem_gen_1_douta));
  design_1_c_addsub_0_0 c_addsub_0
       (.A(c_addsub_1_S),
        .B(c_addsub_2_S),
        .CLK(clk_1),
        .S(c_addsub_0_S));
  design_1_c_addsub_0_1 c_addsub_1
       (.A(HammingWeight_0_led),
        .B(HammingWeight_1_led),
        .CLK(clk_1),
        .S(c_addsub_1_S));
  design_1_c_addsub_0_2 c_addsub_2
       (.A(HammingWeight_2_led),
        .B(HammingWeight_3_led),
        .CLK(clk_1),
        .S(c_addsub_2_S));
  design_1_xlconcat_0_0 xlconcat_0
       (.In0(xlslice_5_Dout),
        .In1(xlconstant_1_dout),
        .dout(xlconcat_0_dout));
  design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  design_1_xlconstant_1_0 xlconstant_1
       (.dout(xlconstant_1_dout));
  design_1_xlslice_0_0 xlslice_0
       (.Din(blk_mem_gen_1_douta),
        .Dout(xlslice_0_Dout));
  design_1_xlslice_0_1 xlslice_1
       (.Din(blk_mem_gen_1_douta),
        .Dout(xlslice_1_Dout));
  design_1_xlslice_0_2 xlslice_2
       (.Din(blk_mem_gen_1_douta),
        .Dout(xlslice_2_Dout));
  design_1_xlslice_0_3 xlslice_3
       (.Din(blk_mem_gen_1_douta),
        .Dout(xlslice_3_Dout));
  design_1_xlslice_0_4 xlslice_4
       (.Din(c_addsub_0_S),
        .Dout(xlslice_4_Dout));
  design_1_xlslice_0_5 xlslice_5
       (.Din(c_addsub_0_S),
        .Dout(xlslice_5_Dout));
endmodule
