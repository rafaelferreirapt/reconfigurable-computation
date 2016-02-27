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
Port ( sw : in std_logic_vector (15 downto 0);
        led : out std_logic_vector (15 downto 0));
end ex1;

architecture Behavioral of ex1 is
    function left_sw(input: std_logic_vector (15 downto 0)) return std_logic_vector 
    is variable leds: std_logic_vector(15 downto 0);
    begin
    for i in sw'range loop
        if sw(i) = '1' then leds(i) := '1'; exit;
        end if;
    end loop;
    return leds;
    end left_sw;
begin
    led <= left_sw(sw);
end Behavioral;
