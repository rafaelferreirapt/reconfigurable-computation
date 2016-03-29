----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2015 11:45:27 AM
-- Design Name: 
-- Module Name: Ex53_aula5 - Behavioral
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

entity Ex53_aula5 is
    Port ( clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           btnC : in STD_LOGIC);
end Ex53_aula5;

architecture Behavioral of Ex53_aula5 is
    signal random_number : std_logic_vector(999 downto 0);
    signal number : std_logic_vector(999 downto 0) := (others => '0');
    signal result : integer;
    signal result_hex : std_logic_vector(9 downto 0);
begin

    -- Use random number generator component
    random : entity work.RanGen
             generic map (width => 1000)
             port map (clk, random_number);

    -- When btnC is pressed get a new number
    number <= random_number when btnC = '1';

    -- Use Consecutive ones component
    ones : entity work.ConsecutiveOnes
           generic map (size => 1000)
           port map (clk => clk, input => random_number, reset => '0', result => result);

    -- Convert result to hex
    result_hex <= conv_std_logic_vector(result, 10);

    -- Show result in displays
    disp : entity work.EightDisplayControl
           port map(clk, "0000", "0000", "0000", "0000", "0000",
                    "00" & result_hex(9 downto 8), result_hex(7 downto 4), result_hex(3 downto 0));

end Behavioral;
