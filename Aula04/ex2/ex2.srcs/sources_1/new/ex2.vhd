library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ex2 is
    Port ( btnC :   in  std_logic;
           sw   :   in  std_logic_vector(15 downto 0);
           led  :   out std_logic_vector(15 downto 0));
end ex2;

architecture Behavioral of ex2 is
    type bi_array_type is array (1 downto 0) of std_logic_vector(2 downto 0);
    type trid_array_type is array (3 downto 0) of bi_array_type;
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

--process(sw(15 downto 10), matrix)
--begin
--    led(15 downto 13) <= sw(15 downto 13);
--    led(2 downto 0) <= matrix(conv_integer(sw(15 downto 14)))(conv_integer(sw(13)));;
--end process;

end Behavioral;
