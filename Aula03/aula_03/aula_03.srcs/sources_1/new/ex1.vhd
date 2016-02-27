library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ex1 is
--  Port ( );
Port ( sw : in std_logic_vector (3 downto 0);
           seg : out std_logic_vector (6 downto 0);
           an : out std_logic_vector (7 downto 0));

end ex1;

architecture Behavioral of ex1 is
begin

process(sw)
begin

an <= (0 => '0', others => '1');
     if sw = "0000" then seg <= "1000000";
     elsif sw = "0001" then seg <= "1111001";
     elsif sw = "0010" then seg <= "0100100";
     elsif sw = "0011" then seg <= "0110000";
     elsif sw = "0100" then seg <= "0011001";
     elsif sw = "0101" then seg <= "0010010";
     elsif sw = "0110" then seg <= "0000010";
     elsif sw = "0111" then seg <= "1111000";
     elsif sw = "1000" then seg <= "0000000";
     elsif sw = "1001" then seg <= "0010000";
     elsif sw = "1010" then seg <= "0001000";
     elsif sw = "1011" then seg <= "0000011";
     elsif sw = "1100" then seg <= "1000110";
     elsif sw = "1101" then seg <= "0100001";
     elsif sw = "1110" then seg <= "0000110";
     elsif sw = "1111" then seg <= "0001110";
     else seg <= "1111111";
     
     end if;

end process;
end Behavioral;
