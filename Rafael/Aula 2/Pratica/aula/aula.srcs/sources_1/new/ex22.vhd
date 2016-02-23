library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;	
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ex22 is
    generic 	(	how_fast			: integer := 50000000  );		
    port 		( 	clk, reset		: in std_logic;
                    divided_clk		: out std_logic	);
end ex22;

architecture Behavioral of ex22 is

signal d : integer range 0 to how_fast;
signal div_c : std_logic;

begin

process(clk, reset)
begin

if rising_edge(clk) then			
	if reset = '1' then
			d <= 0;
	else	
		if d < how_fast then
			d <= d+1;
		else
			d <=0;
			div_c <= not div_c;
		end if;
	end if;
			
		divided_clk <= div_c;

end if;
end process;	


end Behavioral;
