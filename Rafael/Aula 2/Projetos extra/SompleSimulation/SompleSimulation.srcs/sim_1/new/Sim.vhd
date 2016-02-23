library IEEE;	
use IEEE.std_logic_1164.all;
library xil_defaultlib;
entity for_example is
end for_example;
architecture behavior of for_example is 
    signal ssw   : STD_LOGIC_VECTOR (15 downto 0);
    signal lled  : STD_LOGIC_VECTOR (15 downto 0);
 --   constant clk_period 	: time := 50 ns;    
 begin
 uut: entity work.ForSim	
port map (sw=>ssw, led=>lled);
--clk_generator: process
--begin	
--   clk <= '0';	wait for clk_period/2;		
--   clk <= '1';  	wait for clk_period/2;
--end process clk_generator;
stim_proc: process			
begin		
   ssw <= "1111111100000000";	wait for 100 ns;	
   ssw <= "0101010101010101";	wait for 100 ns;	
end process;	
end behavior;
