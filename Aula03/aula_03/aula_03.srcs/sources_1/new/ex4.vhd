----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2016 03:53:20 PM
-- Design Name: 
-- Module Name: ex4 - Behavioral
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
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ex4 is
Port ( sw : in std_logic_vector (15 downto 0);
       seg : out STD_LOGIC_VECTOR (6 downto 0);
       an : out STD_LOGIC_VECTOR (7 downto 0);
       led : out STD_LOGIC_VECTOR (8 downto 0));
end ex4;

architecture Behavioral of ex4 is
signal divided_clk  : std_logic;

--procedure display(variable input : std_logic_vector (8 downto 0);
--                  variable sw1   : std_logic_vector (7 downto 0);
--                  variable sw2   : std_logic_vector (7 downto 0);
--                  variable op    : std_logic_vector (1 downto 0))
--is 
--begin
--if sw2 = "00000000" and op = "11" then
--    seg <= "1000000";
--    an <= "11111110";
--elsif (to_integer(unsigned(sw1)) < to_integer(unsigned(sw2))) and op = "01" then
--    seg <= "0111111";
--    an <= "01111111";
--    led <= input;
--else
--    led <= input;
--end if;
--end display;

function add(input: std_logic_vector (15 downto 0)) return std_logic_vector 
    is variable res: std_logic_vector (8 downto 0);
    
begin
    
    res := std_logic_vector(unsigned(input(15 downto 8) + unsigned(input(7 downto 0))));
    
    return res;
end add;

function sub(input: std_logic_vector (15 downto 0)) return std_logic_vector 
    is variable res: std_logic_vector (8 downto 0);
    
begin
    
    res := std_logic_vector(unsigned(input(15 downto 8) - unsigned(input(7 downto 0))));
    
    return res;
end sub;

function mult(input: std_logic_vector (15 downto 0)) return std_logic_vector 
    is variable res: std_logic_vector (8 downto 0);
    
begin
    
    res := std_logic_vector(unsigned(input(15 downto 8) * unsigned(input(7 downto 0))));
    
    return res;
end mult;

function div(input: std_logic_vector (15 downto 0)) return std_logic_vector 
    is variable res: std_logic_vector (8 downto 0);
    
begin
    
    res := std_logic_vector(unsigned(input(15 downto 8) / unsigned(input(7 downto 0))));
    
    return res;
end div;
    
begin

process(divided_clk)
variable res : std_logic_vector(8 downto 0);
begin
    res := add(sw);    
    led <= res;
   
    wait for 1000000000 ns;
    res := sub(sw);
    if (to_integer(unsigned(sw(7 downto 0))) < to_integer(unsigned(sw(15 downto 8)))) and op = "01" then
        seg <= "0111111";
        an <= "01111111";
        led <= res;
    else
        led <= res;
    end if;
        
    wait for 1000000000 ns;
    res := mult(sw);
    led <= res;

    wait for 1000000000 ns;
    res := div(sw);
    if sw(7 downto 0) = "00000000" and op = "11" then
        seg <= "1000000";
        an <= "11111110";
    else
        led <= res;

end process;

div:    entity xil_defaultlib.clock_divider
        port map (clk, divided_clk);

end Behavioral;
