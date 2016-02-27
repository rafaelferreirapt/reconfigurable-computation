library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.numeric_std.all;

entity TestSeqProc is
port (	   clk  : std_logic;		
	       led	: out std_logic_vector(15 downto 0);
	       btnL : in std_logic;
	       btnC : in std_logic;
	       btnR : in std_logic);		
end TestSeqProc;

architecture Behavioral of TestSeqProc is
   signal increment         : std_logic := btnL;
   signal positive_reset    : std_logic := btnC;
   signal count_enable      : std_logic := btnR;
   signal count             : std_logic_vector(14 downto 0);
begin

led(14 downto 0) <= count;
led(15) <= clk;
increment <= btnL;
positive_reset  <= btnC;
count_enable      <= btnR;

sp2: process (clk)    
begin
   if rising_edge(clk) then   
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
