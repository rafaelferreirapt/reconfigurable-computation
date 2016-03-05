library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ex1 is
    Port ( btnC : in  std_logic;
           sw   : in  std_logic_vector(15 downto 0);
           led  : out std_logic_vector(15 downto 0));
end ex1;

architecture Behavioral of ex1 is
    type colunas is array (7 downto 0) of std_logic;
    type linhas is array (3 downto 0) of colunas;
    signal matrix : linhas;
begin

led(15 downto 13) <= sw(15 downto 13);

process(btnC)
begin
    if btnC = '1' then
        for i in matrix(conv_integer(sw(15 downto 14)))'range loop
            matrix(conv_integer(sw(15 downto 14)))(i) <= sw(i);
        end loop;
    end if;
end process;

process(sw(15 downto 14), matrix)
begin
    for i in matrix(conv_integer(sw(15 downto 14)))'range loop
        led(i) <= matrix(conv_integer(sw(15 downto 14)))(i);
    end loop;
    led(15) <= sw(15);
    led(14) <= sw(14);
end process;

end Behavioral;
