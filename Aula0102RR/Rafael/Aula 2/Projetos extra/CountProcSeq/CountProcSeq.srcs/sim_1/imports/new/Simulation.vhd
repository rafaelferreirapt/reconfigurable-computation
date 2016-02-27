library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
entity testbench is
end    testbench;
architecture behavior of testbench is 
    signal clk      	     : std_logic;
    signal sw                : std_logic_vector(15 downto 0);
    signal led	             : std_logic_vector(15 downto 0);
    signal btnL              : std_logic;
    signal btnC              : std_logic;
    signal btnR              : std_logic;
constant clk_period	: time := 10 ns;
begin
uut: entity xil_defaultlib.TestSeqProc 	
port map (	   clk => clk,
               sw  => sw,		
	           led	=> led,
	           btnL => btnL,
	           btnC => btnC,
	           btnR => btnR);	

clock_gen: process
begin
clk <= '0';		 wait for clk_period/2;
clk <= '1';		 wait for clk_period/2;
end process clock_gen; 
stim_proc: process			
begin
   sw <= "0000000000011101";		 wait for 30 ns; 	
   btnC <= '1';		 wait for 50 ns;
   btnR <= '1';
   btnC <= '0';		 wait for 700 ns;
end process;	
end behavior;
