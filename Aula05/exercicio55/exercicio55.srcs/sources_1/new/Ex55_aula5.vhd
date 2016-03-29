----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2015 04:24:38 PM
-- Design Name: 
-- Module Name: Ex55_aula5 - Behavioral
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

entity Ex55_aula5 is
    Port ( clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end Ex55_aula5;

architecture Behavioral of Ex55_aula5 is

    -- Function to count the number of one in a vector
    function numberOfOnes(input : std_logic_vector(7 downto 0)) return integer is
        variable count : integer := 0;
    begin
        for i in input'range loop
            if input(i) = '1' then
                count := count + 1;
            end if;
        end loop;
        
        return count;
    end numberOfOnes;

    -- Signals
    signal address : std_logic_vector(5 downto 0) := (others => '0');
    signal number : std_logic_vector(7 downto 0);
    signal divided_clk : std_logic;
    signal result : integer;
    
    -- LUT component
    component dist_mem_gen_0
        PORT (
        a : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
        spo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    end component;

begin
    
    -- Divided clk
    div : entity work.clock_divider
          generic map (26)
          port map (clk, divided_clk);
          
    -- Increment address
    address <= address + 1 when rising_edge(divided_clk);

    -- Get number from Lut
    lut : dist_mem_gen_0
          port map (address, number);
          
    -- Get number of ones
    result <= numberOfOnes(number);
          
    -- Show result in displays
    disp : entity work.EightDisplayControl
           port map (clk, "0000", "0000", "0000", "0000", "0000", "0000", "0000",
                     conv_std_logic_vector(result, 4), an, seg);

end Behavioral;
