----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2015 02:29:47 PM
-- Design Name: 
-- Module Name: Ex54_aula5 - Behavioral
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

entity Ex54_aula5 is
    Port ( clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end Ex54_aula5;

architecture Behavioral of Ex54_aula5 is
    
    -- Signals
    signal address : std_logic_vector(5 downto 0) := (others => '0');
    signal number : std_logic_vector(7 downto 0);
    signal divided_clk : std_logic;
    signal result : integer range 0 to 8;
    signal result_hex : std_logic_vector(3 downto 0);
    
    -- LUT component
    component dist_mem_gen_0
        PORT (
        a : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
        spo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    end component;
    
begin

    -- Divide clock
    div : entity work.clock_divider
          generic map (26)
          port map (clk, divided_clk);

    -- Get new address
    address <= address + 1 when rising_edge(divided_clk);
    
    -- Get number from LUT
    lut1 : dist_mem_gen_0
           port map (address, number);
           
    -- Count consecutive number of ones
    ones : entity work.ConsecutiveOnes
           generic map (8)
           port map (clk, number, '0', result);
           
    -- Show result in display
    result_hex <= conv_std_logic_vector(result, 4);
    
    disp : entity work.EightDisplayControl
           port map (clk, "0000", "0000", "0000", "0000", "0000", "0000", 
                     "0000", result_hex, an, seg);

end Behavioral;
