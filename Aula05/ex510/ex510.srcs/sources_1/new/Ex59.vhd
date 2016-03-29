----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2015 04:42:40 PM
-- Design Name: 
-- Module Name: Ex59 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ex59 is
    Port ( clk : in STD_LOGIC;
           btnC : in STD_LOGIC;
           btnL : in STD_LOGIC;
           btnU : in STD_LOGIC;
           btnR : in STD_LOGIC;
           btnD : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           sw : in STD_LOGIC_VECTOR (15 downto 0));
end Ex59;

architecture Behavioral of Ex59 is

    signal operation : std_logic_vector(1 downto 0);
    signal result : std_logic_vector(7 downto 0);
    signal result_int : integer;
    signal bcd2, bcd1, bcd0 : std_logic_vector(3 downto 0);
    signal disp2, disp1, disp0 : std_logic_vector(3 downto 0);
    signal divided_clk : std_logic;

begin
    
    div : entity work.clock_divider
          generic map (26)
          port map (clk, divided_clk);
    
    process (divided_clk)
    begin
        if rising_edge(divided_clk) then
            operation <= operation + 1;
        end if;
    end process;
    
    result_int <= conv_integer(sw(15 downto 8)) + conv_integer(sw(7 downto 0)) when operation = "00" else
                  conv_integer(sw(15 downto 8)) - conv_integer(sw(7 downto 0)) when operation = "01" else
                  conv_integer(sw(15 downto 8)) * conv_integer(sw(7 downto 0)) when operation = "10" else
                  conv_integer(sw(15 downto 8)) / conv_integer(sw(7 downto 0)) when operation = "11" else
                  0;
    result <= conv_std_logic_vector(result_int, 8);
                  
    -- Convert to BCD
    bcd : entity work.BinToBCD8
          port map (clk, '0', open, result, bcd2, bcd1, bcd0);
                  
    process (clk, btnC)
    begin
        if rising_edge(clk) then
            if btnC = '1' then
                disp2 <= bcd2;
                disp1 <= bcd1;
                disp0 <= bcd0;
            else
                disp2 <= "0000";
                disp1 <= result(7 downto 4);
                disp0 <= result(3 downto 0);
            end if;
        end if;
    end process;

    -- Put in disp
    disp : entity work.EightDisplayControl
           port map (clk, "0000", "0000", "0000", "0000", "0000", disp2, disp1, disp0, an, seg);

end Behavioral;
