library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.numeric_std.all;

entity TestSeqProc is
generic (  how_fast : integer := 30);
port (	   clk  : std_logic;
           sw 	: in   std_logic_vector(15 downto 0);		
	       led	: out std_logic_vector(15 downto 0);
	       btnL : in std_logic;
	       btnC : in std_logic;
	       btnR : in std_logic);		
end TestSeqProc;

architecture Behavioral of TestSeqProc is
   signal internal_clock 	: unsigned(how_fast downto 0);  -- how_fast = 30
   signal divided_clk       : std_logic;
   signal increment         : std_logic := btnL;
   signal positive_reset    : std_logic := btnC;
   signal count_enable      : std_logic := btnR;
   signal count             : std_logic_vector(14 downto 0);
begin

led(14 downto 0) <= count;
led(15) <= divided_clk;

sp1: process(clk)
begin
   if rising_edge(clk) then	internal_clock <= internal_clock+1;  
   end if;
   if falling_edge(clk) then		
       divided_clk <= internal_clock(internal_clock'left - conv_integer(sw));
   end if;
end process sp1;  			

sp2: process (divided_clk)    
begin
   if rising_edge(divided_clk) then   
	if  positive_reset = '1' then count <= (others=>'0'); 
	else
	   if count_enable = '1' then	
		if increment='0' then   count <= count + 1;
		else		     count <= count - 1;
		end if;
	   end if;
   	end if;
   end if;
end process sp2;


end Behavioral;
