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
           sw : in STD_LOGIC_VECTOR(2 downto 0);
           btnU : in STD_LOGIC;
           btnC : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end Ex61_aula6;

architecture Behavioral of Ex61_aula6 is

    -- Types
    type my_array is array (7 downto 0) of std_logic_vector(31 downto 0);

    -- Signal
    signal random_number : std_logic_vector(255 downto 0);
    signal number, sorted : std_logic_vector(255 downto 0) := (others => '0');
    signal arr : my_array;
    signal divided_clk : std_logic;
    signal number_to_display : std_logic_vector(31 downto 0);
    signal cont : integer;
    signal higher3, higher2, higher1, higher0, smaller3, smaller2, smaller1, smaller0 : std_logic_vector(31 downto 0);

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
    number <= random_number when btnU = '1';

    -- Sort array
    sort : entity work.IerativeSorterFSM
           generic map (8, 32)
           port map (clk, btnC, number, sorted, cont);
           
    -- Fill arr with sorted values, all values are already ordered higher in top, smaler in bottom
    process (sorted)
    begin
        for i in 7 downto 0 loop
            arr(i) <= sorted(32*(i+1)-1 downto 32*i);
        end loop;
    end process;
    
    higher3 <= arr(7);
    higher2 <= arr(6);
    higher1 <= arr(5);
    higher0 <= arr(4);
    smaller3 <= arr(3);
    smaller2 <= arr(2);
    smaller1 <= arr(1);
    smaller0 <= arr(0);

    -- Get number to display taking in account the switches value and buttons
    process (sw, arr, higher3, higher2, higher1, higher0, smaller3, smaller2, smaller1, smaller0)
    begin
        if sw(2) = '1' then
            case sw(1 downto 0) is
                when "11" => number_to_display <= higher3;
                when "10" => number_to_display <= higher2;
                when "01" => number_to_display <= higher1;
                when "00" => number_to_display <= higher0;
                when others => number_to_display <= (others => '0');
            end case;
        else
                case sw(1 downto 0) is
                    when "11" => number_to_display <= smaller3;
                    when "10" => number_to_display <= smaller2;
                    when "01" => number_to_display <= smaller1;
                    when "00" => number_to_display <= smaller0;
                    when others => number_to_display <= (others => '0');
                end case;
        end if;    
    end process;    

    -- Show values in the displays
    disp : entity work.EightDisplayControl
           port map (clk, number_to_display(31 downto 28), number_to_display(27 downto 24), 
                          number_to_display(23 downto 20), number_to_display(19 downto 16),
                          number_to_display(15 downto 12), number_to_display(11 downto 8),
                          number_to_display(7 downto 4), number_to_display(3 downto 0),
                          an, seg);

end Behavioral;
