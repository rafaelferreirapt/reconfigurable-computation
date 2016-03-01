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
       led : out STD_LOGIC_VECTOR (15 downto 0);
       clk : in std_logic);
end ex4;

architecture Behavioral of ex4 is
signal divided_clk  : std_logic;
signal counter : std_logic_vector(1 downto 0);

function add(input: std_logic_vector (15 downto 0)) return integer 
    is variable res: integer range 0 to 512;
    
begin
   
    res := conv_integer(input(15 downto 8)) + conv_integer(input(7 downto 0));
    
    return res;
end add;

function sub(input: std_logic_vector (15 downto 0)) return integer 
    is variable res: integer range -256 to 256;
    
begin
    
    res := conv_integer(input(15 downto 8)) - conv_integer(input(7 downto 0));
    
    return res;
end sub;

function mult(input: std_logic_vector (15 downto 0)) return integer 
    is variable res: integer range 0 to 65536;
    
begin
    
    res := conv_integer(input(15 downto 8)) * conv_integer(input(7 downto 0));
    
    return res;
end mult;

function div(input: std_logic_vector (15 downto 0)) return integer 
    is variable res: integer range 0 to 256;
    
begin
    
    res := conv_integer(input(15 downto 8)) / conv_integer(input(7 downto 0));
    
    return res;
end div;
    
begin

process(divided_clk)
begin
if rising_edge(divided_clk) then
    if counter = "00" then
        counter <= "01";
    elsif counter = "01" then
        counter <= "10";
    elsif counter = "10" then
        counter <= "11";
    else
        counter <= "00";
    end if;
end if;
end process;

process(divided_clk, counter)
begin
    an <= "11111111";
    if counter = "00" then
        led <= std_logic_vector(to_unsigned(add(sw),16));  
    elsif counter = "01" then
        if conv_integer(sw(15 downto 8)) < conv_integer(sw(7 downto 0)) then
            seg <= "0111111";
            an <= "01111111";
            led <= not std_logic_vector(to_unsigned(sub(sw),16));
        else
            led <= std_logic_vector(to_unsigned(sub(sw),16));
        end if;
    elsif counter = "10" then
        led <= std_logic_vector(to_unsigned(mult(sw),16));
    elsif counter = "11" then
        if sw(7 downto 0) = "00000000" then
            seg <= "1000000";
            an <= "11111110";
            led <= "0000000000000000";
        else
            led <= std_logic_vector(to_unsigned(div(sw),16));
        end if;
     end if;
    
end process;

aa:    entity work.clock_divider
       port map (clk, divided_clk);

end Behavioral;
