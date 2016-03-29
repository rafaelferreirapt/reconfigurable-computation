library IEEE;	
use IEEE.std_logic_1164.all;

entity IGCD_sim is
end IGCD_sim;
architecture behavior of IGCD_sim is 
   signal rst , clk     	: std_logic := '0';
   signal sw            	: std_logic_vector(15 downto 0);
   signal led           	: std_logic_vector(7 downto 0);
   constant clk_period 	    : time := 50 ns;    
 begin
 unit_to_test: entity work.FSM_new	
                port map (clk, rst, sw,led);
clk_generator: process
begin	
   clk <= '0';	     	wait for clk_period/2;		
   clk <= '1';  	    wait for clk_period/2;
end process clk_generator;
stim_proc: process			
begin		
   rst <= '1';	                                            	wait for 130 ns;	
   rst <= '0'; sw <= (15 downto 10 => '1', others => '0');  	wait for 1000 ns;
   rst <= '1';	                                            	wait for 130 ns;	
   rst <= '0'; sw <= "0001101100111111";       	            	wait for 1000 ns;
   rst <= '1';	                                            	wait for 130 ns;
   rst <= '0'; sw <= "0000111100001010";       	            	wait for 1000 ns;
   rst <= '1';	                                            	wait for 130 ns;
   rst <= '0'; sw <= "1111111111111111";       	            	wait for 1000 ns;	 	
end process;	
end behavior;