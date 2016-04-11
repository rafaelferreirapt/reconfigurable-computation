library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end    testbench;

architecture behavior of testbench is 
    signal clk   : std_logic;
    signal data  : std_logic_vector(31 downto 0);
    signal sw    : std_logic_vector(2 downto 0);
constant clk_period	: time := 50 ns;
begin
blk: entity work.nivel_topo 	
port map (clk, sw, data);
clock_gen: process
begin
clk <= '0';		 wait for clk_period/2;
clk <= '1';		 wait for clk_period/2;
end process clock_gen; 
stim_proc: process			
begin
   sw <= "000";		 wait for 500 ns; 	
   sw <= "010";		 wait for 500 ns;
   sw <= "101";		 wait for 500 ns; 	
   sw <= "111";         wait for 500 ns;
end process;	
end behavior;
