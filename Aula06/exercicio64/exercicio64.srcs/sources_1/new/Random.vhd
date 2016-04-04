----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2015 03:12:14 PM
-- Design Name: 
-- Module Name: Random - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Random is
    Generic ( size : integer := 32);
    Port ( clk : in STD_LOGIC;
           random_number : out STD_LOGIC_VECTOR(size-1 downto 0));
end Random;

architecture Behavioral of Random is    
    
begin

    -- Random process
    process (clk) 
        variable rand_tmp : std_logic_vector(size-1 downto 0) := (size-1 => '1', others => '0');
        variable tmp : std_logic := '0';
    begin
        if rising_edge(clk) then
            tmp := rand_tmp(size-1) xor rand_tmp(size-2);
            rand_tmp(size-1 downto 1) := rand_tmp(size-2 downto 0);
            rand_tmp(0) := tmp;
        end if;
        random_number <= rand_tmp;
    end process;

end Behavioral;
