library IEEE; use IEEE.STD_LOGIC_1164.all; use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
entity Counter is
    port ( 	    clk     		: in std_logic;
            	led		        : out std_logic_vector(3 downto 0) 	);
end Counter;

architecture Behavioral of Counter is
	signal count : std_logic_vector(3 downto 0);
    signal divided_clk : std_logic;
begin

	counter: process (divided_clk) 
	begin
   		if rising_edge(divided_clk) then
        			count <= count + 1;
   		end if;
	end process counter;

led <= count;

div	:	entity work.clock_divider 
		port map( clk, divided_clk);

end Behavioral;
