----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2015 05:14:01 PM
-- Design Name: 
-- Module Name: Ex63_aula6_a - Behavioral
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

entity Ex63_aula6_a is
    Port ( clk : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0));
end Ex63_aula6_a;

architecture Behavioral of Ex63_aula6_a is

    -- Hamming Weight function
    function hamming_weight(input : std_logic_vector(255 downto 0)) return integer is
        variable counter : integer := 0;
    begin
        for i in input'range loop
            if input(i) = '1' then
                counter := counter + 1;
            end if;
        end loop;
        return counter;
    end hamming_weight;
    
    -- Signals
    signal divided_clk : std_logic;
    signal random_number : std_logic_vector(255 downto 0);
    signal hammingWeightResult : std_logic_vector(7 downto 0);
    signal bcd0, bcd1, bcd2 : std_logic_vector(3 downto 0);

begin

    -- Divide clock
    div : entity work.clock_divider
          generic map (26)
          port map (clk, divided_clk);
          
    -- Generate random number
    rand : entity work.Random
           generic map (256)
           port map (divided_clk, random_number);
           
    -- Calculate hamming weight
    hammingWeightResult <= conv_std_logic_vector(hamming_weight(random_number), 8);
    
    -- Convert to decimal
    tobcd : entity work.BinToBCD8
            port map (clk, '0', open, hammingWeightResult,
                      bcd2, bcd1, bcd0);

    -- Show value in displays
    disp : entity work.EightDisplayControl
           port map (clk, "0000", "0000", hammingWeightResult(7 downto 4), hammingWeightResult(3 downto 0),
                     "0000", bcd2, bcd1, bcd0, an, seg);

end Behavioral;
