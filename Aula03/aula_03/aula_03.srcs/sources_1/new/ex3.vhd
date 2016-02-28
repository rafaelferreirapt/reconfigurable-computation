----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2016 03:53:09 PM
-- Design Name: 
-- Module Name: ex3 - Behavioral
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

entity ex3 is
Port ( sw : in std_logic_vector (15 downto 0);
       seg : out STD_LOGIC_VECTOR (6 downto 0);
       an : out STD_LOGIC_VECTOR (7 downto 0));
end ex3;

architecture Behavioral of ex3 is
    signal quo: std_logic_vector(7 downto 0);
    signal res: std_logic_vector(7 downto 0);
    signal result_quo: integer range 0 to 256;
    signal result_res: integer range 0 to 256;
begin
process(sw)
begin
    if (sw(7 downto 0) = "00000000") then
        res <= "00000000";
        quo <= "00000000";
    else
        result_quo <= conv_integer(sw(15 downto 7)) / conv_integer(sw(6 downto 0));
        result_res <= conv_integer(sw(15 downto 7)) rem conv_integer(sw(6 downto 0));
        
        quo <= std_logic_vector(to_unsigned(result_quo, 8));
        res <= std_logic_vector(to_unsigned(result_res, 8));
    end if;
end process;
    an <= (0 => '0', others => '1');
    seg <=  "1000000" when res = "00000000" else
            "1111001" when res = "00000001" else
            "0100100" when res = "00000010" else
            "0110000" when res = "00000011" else
            "0011001" when res = "00000100" else
            "0010010" when res = "00000101" else
            "0000010" when res = "00000110" else
            "1111000" when res = "00000111" else
            "0000000" when res = "00001000" else
            "0010000" when res = "00001001" else
            "0001000" when res = "00001010" else
            "0000011" when res = "00001011" else
            "1000110" when res = "00001100" else
            "0100001" when res = "00001101" else
            "0000110" when res = "00001110" else
            "0001110" when res = "00001111" else
            "1111111";
    
    an <= (1 => '0', others => '1');
    seg <=  "1000000" when quo = "00000000" else
            "1111001" when quo = "00000001" else
            "0100100" when quo = "00000010" else
            "0110000" when quo = "00000011" else
            "0011001" when quo = "00000100" else
            "0010010" when quo = "00000101" else
            "0000010" when quo = "00000110" else
            "1111000" when quo = "00000111" else
            "0000000" when quo = "00001000" else
            "0010000" when quo = "00001001" else
            "0001000" when quo = "00001010" else
            "0000011" when quo = "00001011" else
            "1000110" when quo = "00001100" else
            "0100001" when quo = "00001101" else
            "0000110" when quo = "00001110" else
            "0001110" when quo = "00001111" else
            "1111111";
end Behavioral;
