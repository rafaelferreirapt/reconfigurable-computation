library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ex2 is
--  Port ( );
Port ( sw : in std_logic_vector (15 downto 0);
        led : out std_logic_vector (15 downto 0));
end ex2;

architecture Behavioral of ex2 is
    function pairs(input: std_logic_vector (15 downto 0)) return std_logic_vector 
    is variable leds: std_logic_vector (15 downto 0);
    variable count : integer range 0 to 14;

    begin
    for i in sw'range loop
        if i /= 0 then 
            if sw(i) = '1' and sw(i-1) = '1' then count := count+1;
            end if;
        end if;
    end loop;
    case count is
           when 0 => leds := "000000000000000";
           when 1 => leds := "000000000000001";
           when 2 => leds := "000000000000011";
           when 3 => leds := "000000000000111";
           when 4 => leds := "000000000001111";
           when 5 => leds := "000000000011111";
           when 6 => leds := "000000000111111";
           when 7 => leds := "000000001111111";
           when 8 => leds := "000000011111111";
           when 9 => leds := "000000111111111";
           when 10 => leds := "000001111111111";
           when 11 => leds := "000011111111111";
           when 12 => leds := "000111111111111";
           when 13 => leds := "001111111111111";
           when 14 => leds := "011111111111111";
           when 15 => leds := "111111111111111";
    end case;
    return leds;
    end pairs;
begin
    led <= pairs(sw);
   
end Behavioral;
