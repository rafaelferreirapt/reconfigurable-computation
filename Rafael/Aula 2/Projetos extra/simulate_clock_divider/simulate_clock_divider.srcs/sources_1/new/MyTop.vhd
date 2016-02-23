library IEEE;	
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;		 
use IEEE.STD_LOGIC_UNSIGNED.all;
entity clock_divider is		
port 	( clk, reset	    : in std_logic;
	  divided_clk  : out std_logic	);
end clock_divider;
architecture Behavioral of clock_divider is
   signal internal_clock : std_logic_vector (2 downto 0);
begin
process(clk)
begin
if rising_edge(clk) then		
   if reset = '1' then 	-- reset sincrono
        	internal_clock <= (others=>'0');
   else	internal_clock <= internal_clock+1;
   end if;
end if;
end process;	
divided_clk <= internal_clock(internal_clock'left); 
end Behavioral;