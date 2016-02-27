library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Counter is
    port (  
            reset   : in std_logic;
            clk     : in std_logic;
            My_count: out std_logic_vector(3 downto 0) 
            );
end Counter;

architecture Behavioral of Counter is
signal count : std_logic_vector(3 downto 0);
begin

counter: process (clk) 
begin
   if rising_edge(clk) then
        if reset = '1' then 	
            count <= (others => '0');
        else  	count <= count + 1;
        end if;
   end if;
end process counter;

My_count <= count;

end Behavioral;
