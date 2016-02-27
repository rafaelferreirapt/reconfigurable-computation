library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity TestCombProc is	
port (	sw 	: in   std_logic_vector(7 downto 0);		
	led	: out std_logic_vector(7 downto 0));		
end TestCombProc;

architecture Behavioral of TestCombProc is
   constant low 	: integer := 5;
   constant high 	: integer := 10;
begin

process(sw)	
begin
   if (sw > low) and (sw < high) then led <= sw;
   elsif sw < low then led <= not sw;
   else led <= (others => '0');
   end if;
end process;

end Behavioral;
