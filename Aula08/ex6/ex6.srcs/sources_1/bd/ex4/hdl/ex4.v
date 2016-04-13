//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
//Date        : Wed Apr 13 21:11:58 2016
//Host        : ubuntu running 64-bit Ubuntu 14.04.1 LTS
//Command     : generate_target ex4.bd
//Design      : ex4
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ex4,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ex4,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=34,numReposBlks=34,numNonXlnxBlks=11,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "ex4.hwdef" *) 
module ex4
   (an,
    btnC,
    clk,
    led,
    seg);
  output [7:0]an;
  input btnC;
  input clk;
  output [15:0]led;
  output [6:0]seg;

  wire [3:0]BinToBCD16_0_BCD0;
  wire [3:0]BinToBCD16_0_BCD1;
  wire [3:0]BinToBCD16_0_BCD2;
  wire [3:0]BinToBCD16_0_BCD3;
  wire [6:0]EightDisplayControl_0_segments;
  wire [7:0]EightDisplayControl_0_select_display;
  wire [2:0]ROM_Reader1_0_addr;
  wire [127:0]ROM_Reader1_0_data_out;
  wire [15:0]blk_mem_gen_1_douta;
  wire btnC_1;
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
  wire [7:0]xlconstant_8_dout;
  wire [0:0]xlconstant_9_dout;
  wire [3:0]xlslice_0_Dout;
  wire [15:0]xlslice_10_Dout;
  wire [15:0]xlslice_11_Dout;
  wire [3:0]xlslice_1_Dout;
  wire [3:0]xlslice_2_Dout;
  wire [3:0]xlslice_3_Dout;
  wire [15:0]xlslice_4_Dout;
  wire [15:0]xlslice_5_Dout;
  wire [15:0]xlslice_6_Dout;
  wire [15:0]xlslice_7_Dout;
  wire [15:0]xlslice_8_Dout;
  wire [15:0]xlslice_9_Dout;

  assign an[7:0] = EightDisplayControl_0_select_display;
  assign btnC_1 = btnC;
  assign clk_1 = clk;
  assign led[15:0] = xlslice_6_Dout;
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
       (.in_data(xlslice_6_Dout),
        .out_data(hw_0_out_data));
  ex4_hw_0_2 hw_1
       (.in_data(xlslice_5_Dout),
        .out_data(hw_1_out_data));
  ex4_hw_0_3 hw_2
       (.in_data(xlslice_10_Dout),
        .out_data(hw_2_out_data));
  ex4_hw_0_4 hw_3
       (.in_data(xlslice_9_Dout),
        .out_data(hw_3_out_data));
  ex4_hw_0_5 hw_4
       (.in_data(xlslice_4_Dout),
        .out_data(hw_4_out_data));
  ex4_hw_0_6 hw_5
       (.in_data(xlslice_11_Dout),
        .out_data(hw_5_out_data));
  ex4_hw_4_0 hw_6
       (.in_data(xlslice_7_Dout),
        .out_data(hw_6_out_data));
  ex4_hw_4_1 hw_7
       (.in_data(xlslice_8_Dout),
        .out_data(hw_7_out_data));
  ex4_xlconcat_0_0 xlconcat_0
       (.In0(c_addsub_6_S),
        .In1(xlconstant_8_dout),
        .dout(xlconcat_0_dout));
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
  ex4_xlslice_4_6 xlslice_10
       (.Din(ROM_Reader1_0_data_out),
        .Dout(xlslice_10_Dout));
  ex4_xlslice_4_7 xlslice_11
       (.Din(ROM_Reader1_0_data_out),
        .Dout(xlslice_11_Dout));
  ex4_xlslice_1_2 xlslice_2
       (.Din(xlconcat_0_dout),
        .Dout(xlslice_2_Dout));
  ex4_xlslice_2_0 xlslice_3
       (.Din(xlconcat_0_dout),
        .Dout(xlslice_3_Dout));
  ex4_xlslice_4_0 xlslice_4
       (.Din(ROM_Reader1_0_data_out),
        .Dout(xlslice_4_Dout));
  ex4_xlslice_4_1 xlslice_5
       (.Din(ROM_Reader1_0_data_out),
        .Dout(xlslice_5_Dout));
  ex4_xlslice_4_2 xlslice_6
       (.Din(ROM_Reader1_0_data_out),
        .Dout(xlslice_6_Dout));
  ex4_xlslice_4_3 xlslice_7
       (.Din(ROM_Reader1_0_data_out),
        .Dout(xlslice_7_Dout));
  ex4_xlslice_4_4 xlslice_8
       (.Din(ROM_Reader1_0_data_out),
        .Dout(xlslice_8_Dout));
  ex4_xlslice_4_5 xlslice_9
       (.Din(ROM_Reader1_0_data_out),
        .Dout(xlslice_9_Dout));
endmodule
