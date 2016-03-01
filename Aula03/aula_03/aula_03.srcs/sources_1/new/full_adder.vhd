----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2016 06:40:12 PM
-- Design Name: 
-- Module Name: full_adder - struct
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           carry_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry_out : out STD_LOGIC);
end full_adder;

architecture struct of full_adder is
    signal s1, s2, s3 : std_logic;
    
component half_adder	 
  port(	A,B       		: in   std_logic;
          	carry_out, sum	: out std_logic);
          	
end component;

begin
	u1:    half_adder    	port map(A, B, s2, s1);		u2:    half_adder    	port map(s1, carry_in, s3, sum);	
	carry_out <= s2 or s3;

end struct;
