library IEEE;	-- add this file selecting the option Add Sources and Add or Create Simulation Sources                  
use IEEE.std_logic_1164.all;
library xil_defaultlib;
entity for_example is
end for_example;
architecture behavior of for_example is 
   signal reset 		: std_logic := '0';
   signal clk 		: std_logic := '0';
 --  signal sw 	        	: std_logic_vector(7 downto 0);
   signal My_count 	    	: std_logic_vector(3 downto 0);
   constant clk_period 	: time := 50 ns;    	-- clk period definition (valid for simulation only)
 begin
 uut: entity xil_defaultlib.Counter	  -- instantiate the unit under test (uut) that is the Top entity
port map (clk => clk, reset => reset, My_count => My_count);
clk_generator: process			-- clk process definition
begin	-- the process generates clk pulses
   clk <= '0';
   wait for clk_period/2;			-- duty cycle for the clk is 50%
   clk <= '1';
   wait for clk_period/2;
end process clk_generator;
stim_proc: process				-- stimulus process
begin		
   reset <= '1';	--sw <= "10101011";		-- **reset<='1'**
   wait for 50 ns;	-- set the reset signal to '1' and wait for 50 ns
   reset <= '0';        	--sw <= "10101011";
   wait for 700 ns;	-- change signals as it is indicated above and wait for 500 ns
end process;	-- begin from the line **reset<='1'** after 50+100+100+100+500=850 ns
end behavior;
