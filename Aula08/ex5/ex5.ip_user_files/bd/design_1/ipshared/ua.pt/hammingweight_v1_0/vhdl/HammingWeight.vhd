library IEEE;
use IEEE.STD_LOGIC_1164.all; 

entity HW is
    port (      sw 		   : in  std_logic_vector (15 downto 0);
                led        : out  std_logic_vector (4 downto 0));
end HW;

architecture Behavioral of HW is

begin
par: process(sw)
	variable weight   : integer range 0 to 16;
begin
   weight := 0;
--   for i in sw'range loop
--	   if sw(i) = '1' then weight := weight + 1;
--	   end if;
--   end loop;
   
   led <= conv_std_logic_vector(weight,5);
end process par;

end Behavioral;

