----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2015 03:11:52 PM
-- Design Name: 
-- Module Name: Ex61_aula6 - Behavioral
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

entity Ex61_aula6 is
    Port ( clk : in STD_LOGIC;
           btnU : in STD_LOGIC;
           btnC : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end Ex61_aula6;

architecture Behavioral of Ex61_aula6 is

    -- Signal
    signal random_number : std_logic_vector(255 downto 0);
    signal number, shift: std_logic_vector(255 downto 0) := (others => '0');
    signal divided_clk : std_logic;
    signal number_to_display : std_logic_vector(31 downto 0);

begin
              
    -- Divided clk
    div : entity work.clock_divider
          generic map (26)
          port map (clk, divided_clk);

    -- Generate random number (1 second to generate each number)
    rnd : entity work.Random
          generic map (256)
          port map (divided_clk, random_number);
          
    -- Use a button to get a new number (note that numbers are generated each second)
    -- Shifter process
    process (divided_clk)
    begin
        if rising_edge(divided_clk) then
            if btnU = '1' then
                number <= random_number;
            else
                if btnC = '0' then -- left
                    number <= number(251 downto 0) & number(255 downto 252);
                else -- right
                    number <= number(3 downto 0) & number(255 downto 4);
                end if;
            end if;
        end if;
    end process;

    -- Get number to show in display
    number_to_display <= number(255 downto 224);

    -- Show values in the displays
    disp : entity work.EightDisplayControl
           port map (clk, number_to_display(31 downto 28), number_to_display(27 downto 24), 
                          number_to_display(23 downto 20), number_to_display(19 downto 16),
                          number_to_display(15 downto 12), number_to_display(11 downto 8),
                          number_to_display(7 downto 4), number_to_display(3 downto 0),
                          an, seg);

end Behavioral;
