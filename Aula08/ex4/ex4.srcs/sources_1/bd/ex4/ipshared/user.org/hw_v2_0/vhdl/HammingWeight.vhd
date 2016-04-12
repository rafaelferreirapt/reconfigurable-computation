library IEEE;
use IEEE.STD_LOGIC_1164.all; 

entity HW is
    generic(data_width      : integer := 32;
            n               : integer := 4  );
    port (      in_vector 	: in  std_logic_vector (data_width downto 0);
                out_n       : out  std_logic_vector (n downto 0));
end HW;

architecture Behavioral of HW is

begin

par: process(in_vector)
	variable par : std_logic;
	variable i   : integer range 0 to data_width;
begin
   par := '0'; i := 0;
   while i <= in_vector'left loop	-- HW para sw(15), sw(14), � , sw(0)
	   par := par xor in_vector(i); i := i+1;
   end loop;
   if (par = '1') then out_n <= (others => '1'); 
   else out_n <= (others => '0');
   end if;
end process par;

end Behavioral;

