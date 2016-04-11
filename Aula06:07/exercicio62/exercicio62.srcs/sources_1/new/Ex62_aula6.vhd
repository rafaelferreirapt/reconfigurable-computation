----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2015 03:47:48 PM
-- Design Name: 
-- Module Name: Ex62_aula6 - Behavioral
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

entity Ex62_aula6 is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end Ex62_aula6;

architecture Behavioral of Ex62_aula6 is

    -- Types
    type my_array is array(15 downto 0) of std_logic_vector(15 downto 0);

    -- Signals
    signal divided_clk : std_logic;
    signal random_number : std_logic_vector(255 downto 0);
    signal arr : my_array;
    signal number : std_logic_vector(15 downto 0);
    signal bcd0, bcd1, bcd2, bcd3, bcd4 : std_logic_vector(3 downto 0);

begin

    -- Divide clk (1Hz)
    div : entity work.clock_divider
          generic map (26)
          port map (clk, divided_clk);

    -- Generate random number each 1 second
    rand : entity work.Random
           generic map (256)
           port map (divided_clk, random_number);
           
    -- Extract 16 words of 16 bits to an array
    gen_for: for i in 15 downto 0 generate
        arr(i) <= random_number(16*(i+1)-1 downto 16*i);
    end generate gen_for;

    -- Number to show in displays
    number <= arr(conv_integer(sw));

    -- Convert number to decimal
    tobcd : entity work.BinToBCD16
            port map (clk, '0', open, number, '1',
                      bcd4, bcd3, bcd2, bcd1, bcd0);
                      
    -- Show number in displats
    disp : entity work.EightDisplayControl
           port map (clk, "0000", "0000", "0000", bcd4,
                          bcd3, bcd2, bcd1, bcd0, an, seg);

end Behavioral;
