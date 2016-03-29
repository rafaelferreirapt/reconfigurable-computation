library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RanGen is
   generic (	width 		: integer :=  32   );	-- tamanho de números aleatórios
   port (   	clk 		: in std_logic;	-- relógio
	            random_num 	: out std_logic_vector (width-1 downto 0)	); -- número gerado
end RanGen;

architecture Behavioral of RanGen is
begin
process(clk)
   variable rand_temp 	: std_logic_vector(width-1 downto 0):=(width-1 => '1', others => '0');
   variable temp 	    : std_logic := '0';
begin
   if(rising_edge(clk)) then
      temp 			:= rand_temp(width-1) xor rand_temp(width-2);
      rand_temp(width-1 downto 1) 	:= rand_temp(width-2 downto 0);
      rand_temp(0) 		:= temp;
   end if;
   random_num <= rand_temp;
end process;
end Behavioral;
