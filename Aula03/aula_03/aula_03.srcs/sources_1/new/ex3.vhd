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
Port ( clk : in  std_logic;
       sw  : in  std_logic_vector (15 downto 0);
       seg : out STD_LOGIC_VECTOR (6 downto 0);
       an  : out STD_LOGIC_VECTOR (7 downto 0));
end ex3;

architecture Behavioral of ex3 is
    signal quo: std_logic_vector(7 downto 0);
    signal res: std_logic_vector(7 downto 0);
    signal result_quo: integer range 0 to 256;
    signal result_res: integer range 0 to 256;
    signal select_disp: integer range 0 to 1;
    signal divided_clk  : std_logic;
    
    function to_bcd(var: std_logic_vector(7 downto 0)) return std_logic_vector
    is variable bcd: std_logic_vector(6 downto 0);
    begin
       if var = "00000000" then
           bcd :=  "1000000";
       elsif var = "00000001" then
           bcd := "1111001";
       elsif var = "00000010" then
           bcd := "0100100";
       elsif var = "00000011" then
           bcd := "0110000";
       elsif var = "00000100" then
           bcd := "0011001";
       elsif var = "00000101" then
           bcd := "0010010";
       elsif var = "00000110" then
           bcd := "0000010";
       elsif var = "00000111" then
           bcd := "1111000";
       elsif var = "00001000" then
           bcd := "0000000";
       elsif var = "00001001" then
           bcd := "0010000";       
       elsif var = "00001010" then
           bcd := "0001000"; 
       elsif var = "00001011" then
           bcd := "0000011";                                                   
       elsif var = "00001100" then
           bcd := "1000110";
       elsif var = "00001101" then
           bcd := "0100001";
       elsif var = "00001110" then
           bcd := "0000110";
       elsif var = "00001111" then
           bcd := "0001110";
       else
           bcd := "1111111";
       end if;
       return bcd;
    end to_bcd;
begin
    process(divided_clk)
    begin
    if rising_edge(divided_clk) then
        if select_disp = 0 then
            select_disp <= 1;
        else
            select_disp <= 0;
        end if; 
    end if;
    end process;
    
    process(select_disp)
    begin
        if select_disp = 0 then
            an <= "11111101";
            seg <= to_bcd(quo);
        else
            an <= "11111110";
            seg <= to_bcd(res);
        end if; 
    end process;

    process(sw)
    begin
        if (sw(7 downto 0) = "00000000") then
            res <= "00000000";
            quo <= "00000000";
        else
            result_quo <= conv_integer(sw(15 downto 8)) / conv_integer(sw(7 downto 0));
            result_res <= conv_integer(sw(15 downto 8)) mod conv_integer(sw(7 downto 0));
            
            quo <= std_logic_vector(to_unsigned(result_quo, 8));
            res <= std_logic_vector(to_unsigned(result_res, 8));
        end if;
    end process;
    
aa:    entity work.clock_divider
       port map (clk, divided_clk);
end Behavioral;
