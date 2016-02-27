library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ForSim is
    Port ( sw : in STD_LOGIC_VECTOR (15 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0));
end ForSim;

architecture Behavioral of ForSim is

begin

led <= sw;

end Behavioral;
