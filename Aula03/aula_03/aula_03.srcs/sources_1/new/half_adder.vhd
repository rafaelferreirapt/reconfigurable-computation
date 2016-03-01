----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/29/2016 06:32:14 PM
-- Design Name: 
-- Module Name: half_adder - half_adder_behavior
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

entity half_adder is
    Port ( A            : in STD_LOGIC;
           B            : in STD_LOGIC;
           carry_out    : out STD_LOGIC;
           sum          : out STD_LOGIC);
end half_adder;

architecture half_adder_behavior of half_adder is

begin
    sum         <= A xor B;	
    carry_out   <= A and B;

end half_adder_behavior;
