library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity my is
    Port (  btnC    : in    std_logic;
            sw      : in    std_logic_vector(15 downto 0);
            led     : out   std_logic_vector(15 downto 0));
 
end my;

architecture Behavioral of my is
    type bid_array_type is array (1 downto 0) of std_logic_vector(2 downto 0);
    type trid_array_type is array (3 downto 0) of bid_array_type;
    signal matrix : trid_array_type;
begin

led(15 downto 13) <= sw(15 downto 13);
led(2 downto 0) <= matrix(conv_integer(sw(15 downto 14)))(conv_integer(sw(13)));

process(btnC)
begin
    if btnC = '1' then
        matrix(conv_integer(sw(15 downto 14)))(conv_integer(sw(13))) <= sw(2 downto 0);
    end if;
end process;

process(matrix)
    variable counter : integer := 0;
begin
    counter := 0;
    for i in matrix'range loop
        for j in matrix(i)'range loop
            for k in matrix(i)(j)'range loop
                if matrix(i)(j)(k) = '1' then
                    counter := counter + 1;
                end if;
            end loop;
        end loop;
    end loop;
    led(11 downto 4) <= conv_std_logic_vector(counter, 8);
end process;

end Behavioral;