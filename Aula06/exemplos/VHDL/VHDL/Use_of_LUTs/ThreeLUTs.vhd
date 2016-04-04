library IEEE;   			
use IEEE.STD_LOGIC_1164.all;	
use IEEE.STD_LOGIC_UNSIGNED.all; 

entity LUT_6to3 is
    port (  sw	: in  std_logic_vector (5 downto 0);
	        led : out  std_logic_vector (2 downto 0));
end LUT_6to3;

architecture Behavioral of LUT_6to3 is

type LUT is array (2 downto 0) of std_logic_vector(63 downto 0); 

constant conf_LUT  :   LUT := (	X"fee8e880e8808000",     	
                                X"8117177e177e7ee8",   
                                X"6996966996696996");
begin		
led 	<= 	conf_LUT(2)(conv_integer(sw)) &
			conf_LUT(1)(conv_integer(sw)) &
			conf_LUT(0)(conv_integer(sw));
			
-- alterativamente o código seguinte pode ser usado
--gen: for i in conf_LUT'range generate
--	led(i) <= conf_LUT(i)(conv_integer(sw));
--end generate gen; 

end Behavioral;  
