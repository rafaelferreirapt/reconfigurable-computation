//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
//Date        : Wed Apr 13 14:31:45 2016
//Host        : ubuntu running 64-bit Ubuntu 14.04.1 LTS
//Command     : generate_target ex4.bd
//Design      : ex4
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ex4,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ex4,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=40,numReposBlks=40,numNonXlnxBlks=10,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "ex4.hwdef" *) 
module ex4
   (an,
    clk,
    led,
    seg);
  output [7:0]an;
  input clk;
  output [15:0]led;
  output [6:0]seg;

  wire [3:0]BinToBCD16_0_BCD0;
  wire [3:0]BinToBCD16_0_BCD1;
  wire [3:0]BinToBCD16_0_BCD2;
  wire [3:0]BinToBCD16_0_BCD3;
  wire [6:0]EightDisplayControl_0_segments;
  wire [7:0]EightDisplayControl_0_select_display;
  wire [15:0]blk_mem_gen_1_douta;
  wire [15:0]blk_mem_gen_2_douta;
  wire [15:0]blk_mem_gen_3_douta;
  wire [15:0]blk_mem_gen_4_douta;
  wire [15:0]blk_mem_gen_5_douta;
  wire [15:0]blk_mem_gen_6_douta;
  wire [15:0]blk_mem_gen_7_douta;
  wire [15:0]blk_mem_gen_8_douta;
  wire [5:0]c_addsub_0_S;
  wire [5:0]c_addsub_1_S;
  wire [5:0]c_addsub_2_S;
  wire [5:0]c_addsub_3_S;
  wire [6:0]c_addsub_4_S;
  wire [6:0]c_addsub_5_S;
  wire [7:0]c_addsub_6_S;
  wire clk_1;
  wire [4:0]hw_0_out_data;
  wire [4:0]hw_1_out_data;
  wire [4:0]hw_2_out_data;
  wire [4:0]hw_3_out_data;
  wire [4:0]hw_4_out_data;
  wire [4:0]hw_5_out_data;
  wire [4:0]hw_6_out_data;
  wire [4:0]hw_7_out_data;
  wire [15:0]xlconcat_0_dout;
  wire [2:0]xlconstant_0_dout;
  wire [2:0]xlconstant_1_dout;
  wire [2:0]xlconstant_2_dout;
  wire [2:0]xlconstant_3_dout;
  wire [2:0]xlconstant_4_dout;
  wire [2:0]xlconstant_5_dout;
  wire [2:0]xlconstant_6_dout;
  wire [2:0]xlconstant_7_dout;
  wire [7:0]xlconstant_8_dout;
  wire [0:0]xlconstant_9_dout;
  wire [3:0]xlslice_0_Dout;
  wire [3:0]xlslice_1_Dout;
  wire [3:0]xlslice_2_Dout;
  wire [3:0]xlslice_3_Dout;

  assign an[7:0] = EightDisplayControl_0_select_display;
  assign clk_1 = clk;
  assign led[15:0] = xlconcat_0_dout;
  assign seg[6:0] = EightDisplayControl_0_segments;
  ex4_BinToBCD16_0_0 BinToBCD16_0
       (.BCD0(BinToBCD16_0_BCD0),
        .BCD1(BinToBCD16_0_BCD1),
        .BCD2(BinToBCD16_0_BCD2),
        .BCD3(BinToBCD16_0_BCD3),
        .binary(xlconcat_0_dout),
        .clk(clk_1),
        .request(xlconstant_9_dout),
        .reset(1'b0));
  ex4_EightDisplayControl_0_1 EightDisplayControl_0
       (.clk(clk_1),
        .leftL(BinToBCD16_0_BCD3),
        .leftR(xlslice_3_Dout),
        .near_leftL(BinToBCD16_0_BCD2),
        .near_leftR(xlslice_2_Dout),
        .near_rightL(BinToBCD16_0_BCD1),
        .near_rightR(xlslice_1_Dout),
        .rightL(BinToBCD16_0_BCD0),
        .rightR(xlslice_0_Dout),
        .segments(EightDisplayControl_0_segments),
        .select_display(EightDisplayControl_0_select_display));
  ex4_blk_mem_gen_0_1 blk_mem_gen_1
       (.addra(xlconstant_0_dout),
        .clka(clk_1),
        .douta(blk_mem_gen_1_douta));
  ex4_blk_mem_gen_1_0 blk_mem_gen_2
       (.addra(xlconstant_2_dout),
        .clka(clk_1),
        .douta(blk_mem_gen_2_douta));
  ex4_blk_mem_gen_1_1 blk_mem_gen_3
       (.addra(xlconstant_1_dout),
        .clka(clk_1),
        .douta(blk_mem_gen_3_douta));
  ex4_blk_mem_gen_1_2 blk_mem_gen_4
       (.addra(xlconstant_3_dout),
        .clka(clk_1),
        .douta(blk_mem_gen_4_douta));
  ex4_blk_mem_gen_1_3 blk_mem_gen_5
       (.addra(xlconstant_4_dout),
        .clka(clk_1),
        .douta(blk_mem_gen_5_douta));
  ex4_blk_mem_gen_1_4 blk_mem_gen_6
       (.addra(xlconstant_5_dout),
        .clka(clk_1),
        .douta(blk_mem_gen_6_douta));
  ex4_blk_mem_gen_1_5 blk_mem_gen_7
       (.addra(xlconstant_6_dout),
        .clka(clk_1),
        .douta(blk_mem_gen_7_douta));
  ex4_blk_mem_gen_1_6 blk_mem_gen_8
       (.addra(xlconstant_7_dout),
        .clka(clk_1),
        .douta(blk_mem_gen_8_douta));
  ex4_c_addsub_0_0 c_addsub_0
       (.A(hw_0_out_data),
        .B(hw_1_out_data),
        .CLK(clk_1),
        .S(c_addsub_0_S));
  ex4_c_addsub_0_1 c_addsub_1
       (.A(hw_2_out_data),
        .B(hw_3_out_data),
        .CLK(clk_1),
        .S(c_addsub_1_S));
  ex4_c_addsub_1_0 c_addsub_2
       (.A(hw_4_out_data),
        .B(hw_5_out_data),
        .CLK(clk_1),
        .S(c_addsub_2_S));
  ex4_c_addsub_2_0 c_addsub_3
       (.A(hw_6_out_data),
        .B(hw_7_out_data),
        .CLK(clk_1),
        .S(c_addsub_3_S));
  ex4_c_addsub_0_2 c_addsub_4
       (.A(c_addsub_2_S),
        .B(c_addsub_1_S),
        .CLK(clk_1),
        .S(c_addsub_4_S));
  ex4_c_addsub_4_0 c_addsub_5
       (.A(c_addsub_0_S),
        .B(c_addsub_3_S),
        .CLK(clk_1),
        .S(c_addsub_5_S));
  ex4_c_addsub_5_0 c_addsub_6
       (.A(c_addsub_5_S),
        .B(c_addsub_4_S),
        .CLK(clk_1),
        .S(c_addsub_6_S));
  ex4_hw_0_1 hw_0
       (.in_data(blk_mem_gen_1_douta),
        .out_data(hw_0_out_data));
  ex4_hw_0_2 hw_1
       (.in_data(blk_mem_gen_3_douta),
        .out_data(hw_1_out_data));
  ex4_hw_0_3 hw_2
       (.in_data(blk_mem_gen_7_douta),
        .out_data(hw_2_out_data));
  ex4_hw_0_4 hw_3
       (.in_data(blk_mem_gen_8_douta),
        .out_data(hw_3_out_data));
  ex4_hw_0_5 hw_4
       (.in_data(blk_mem_gen_5_douta),
        .out_data(hw_4_out_data));
  ex4_hw_0_6 hw_5
       (.in_data(blk_mem_gen_6_douta),
        .out_data(hw_5_out_data));
  ex4_hw_4_0 hw_6
       (.in_data(blk_mem_gen_2_douta),
        .out_data(hw_6_out_data));
  ex4_hw_4_1 hw_7
       (.in_data(blk_mem_gen_4_douta),
        .out_data(hw_7_out_data));
  ex4_xlconcat_0_0 xlconcat_0
       (.In0(c_addsub_6_S),
        .In1(xlconstant_8_dout),
        .dout(xlconcat_0_dout));
  ex4_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  ex4_xlconstant_0_1 xlconstant_1
       (.dout(xlconstant_1_dout));
  ex4_xlconstant_1_0 xlconstant_2
       (.dout(xlconstant_2_dout));
  ex4_xlconstant_2_0 xlconstant_3
       (.dout(xlconstant_3_dout));
  ex4_xlconstant_2_1 xlconstant_4
       (.dout(xlconstant_4_dout));
  ex4_xlconstant_2_2 xlconstant_5
       (.dout(xlconstant_5_dout));
  ex4_xlconstant_2_3 xlconstant_6
       (.dout(xlconstant_6_dout));
  ex4_xlconstant_2_4 xlconstant_7
       (.dout(xlconstant_7_dout));
  ex4_xlconstant_8_0 xlconstant_8
       (.dout(xlconstant_8_dout));
  ex4_xlconstant_9_0 xlconstant_9
       (.dout(xlconstant_9_dout));
  ex4_xlslice_0_2 xlslice_0
       (.Din(xlconcat_0_dout),
        .Dout(xlslice_0_Dout));
  ex4_xlslice_0_3 xlslice_1
       (.Din(xlconcat_0_dout),
        .Dout(xlslice_1_Dout));
  ex4_xlslice_1_2 xlslice_2
       (.Din(xlconcat_0_dout),
        .Dout(xlslice_2_Dout));
  ex4_xlslice_2_0 xlslice_3
       (.Din(xlconcat_0_dout),
        .Dout(xlslice_3_Dout));
endmodule
