library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
entity testbench is
end    testbench;
architecture behavior of testbench is 
    signal clk      	: std_logic;
    signal rst    	: std_logic;
    signal divided_clk    : std_logic;
constant clk_period	: time := 50 ns;
begin
div: entity xil_defaultlib.clock_divider 	
port map (clk, rst, divided_clk);
clock_gen: process
begin
clk <= '0';		 wait for clk_period/2;
clk <= '1';		 wait for clk_period/2;
end process clock_gen; 
stim_proc: process			
begin
   rst <= '1';		 wait for 30 ns; 	
   rst <= '0';		 wait for 3000 ns;
end process;	
end behavior;
