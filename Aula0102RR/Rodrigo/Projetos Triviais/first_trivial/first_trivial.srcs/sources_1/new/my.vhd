library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my is
  Port (--sw      : in  std_logic_vector(15 downto 0);
        btnL    : in  std_logic;
        btnC    : in  std_logic;
        btnR    : in  std_logic;
        btnU    : in  std_logic;
        btnD    : in  std_logic;
        led     : out  std_logic_vector(4 downto 0));
 
end my;

architecture Behavioral of my is

begin

--led <= sw;
led(0) <= btnL;
led(1) <= btnC;
led(2) <= btnR;
led(3) <= btnU;
led(4) <= btnD;

end Behavioral;
