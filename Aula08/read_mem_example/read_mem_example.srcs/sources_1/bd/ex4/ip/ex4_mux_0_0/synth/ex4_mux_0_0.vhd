-- (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: user.org:user:mux:1.0
-- IP Revision: 2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ex4_mux_0_0 IS
  PORT (
    port0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    port1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    port2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    port3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    port4 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    port5 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    port6 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    port7 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    select_port : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    port_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END ex4_mux_0_0;

ARCHITECTURE ex4_mux_0_0_arch OF ex4_mux_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : string;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF ex4_mux_0_0_arch: ARCHITECTURE IS "yes";

  COMPONENT mux IS
    GENERIC (
      data_width : INTEGER
    );
    PORT (
      port0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      port1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      port2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      port3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      port4 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      port5 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      port6 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      port7 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      select_port : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      port_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
  END COMPONENT mux;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF ex4_mux_0_0_arch: ARCHITECTURE IS "mux,Vivado 2015.4";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF ex4_mux_0_0_arch : ARCHITECTURE IS "ex4_mux_0_0,mux,{}";
BEGIN
  U0 : mux
    GENERIC MAP (
      data_width => 16
    )
    PORT MAP (
      port0 => port0,
      port1 => port1,
      port2 => port2,
      port3 => port3,
      port4 => port4,
      port5 => port5,
      port6 => port6,
      port7 => port7,
      select_port => select_port,
      port_out => port_out
    );
END ex4_mux_0_0_arch;
