library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.numeric_std.all;

entity arith_op is	
port ( sw 				              : in std_logic_vector(7 downto 0);
	   led				              : out std_logic_vector(8 downto 0);
	   btnU, btnC, btnD, btnL, btnR   : in std_logic); 
end arith_op;

-- btnR  division
-- btnL  multiplication
-- btnD  addition
-- btnC  subtraction
-- btnU  rest of division

architecture Behavioral of arith_op is
   signal result 	  : integer range 0 to 256;
   signal but	      : std_logic_vector(4 downto 0);
begin
   but <= btnU & btnC & btnD & btnL & btnR;	 
   process(but,sw)
   begin
    if conv_integer(sw(3 downto 0)) /= 0 then
        case but is
            when "00001" => result <= conv_integer(sw(7 downto 4)) / conv_integer(sw(3 downto 0));
            when "00010" => result <= conv_integer(sw(7 downto 4)) * conv_integer(sw(3 downto 0));
            when "00100" => result <= conv_integer(sw(7 downto 4)) + conv_integer(sw(3 downto 0));
            when "01000" => result <= conv_integer(sw(7 downto 4)) - conv_integer(sw(3 downto 0));
            when "10000" => result <= conv_integer(sw(7 downto 4)) rem conv_integer(sw(3 downto 0)); 
            when others => result <= 0;
        end case;    
   else result <= 256;
   end if;
   end process;  
   
   led(7 downto 0) <= std_logic_vector(to_unsigned(result,8));

end Behavioral;
