library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity my is
    Port (  clk     : in    std_logic;
            btnC    : in    std_logic;
            sw      : in    std_logic_vector(15 downto 0);
            led     : out   std_logic_vector(15 downto 0);
            seg     : out STD_LOGIC_VECTOR (6 downto 0);
            an      : out STD_LOGIC_VECTOR (7 downto 0));

end my;

architecture Behavioral of my is
    type bid_array_type is array (1 downto 0) of std_logic_vector(2 downto 0);
    type trid_array_type is array (3 downto 0) of bid_array_type;
    signal matrix : trid_array_type;
    
    function to_bcd(var: std_logic_vector(7 downto 0)) return std_logic_vector
    is variable bcd: std_logic_vector(6 downto 0);
    begin
       if var = "00000000" then
           bcd :=  "1000000";
       elsif var = "00000001" then
           bcd := "1111001";
       elsif var = "00000010" then
           bcd := "0100100";
       elsif var = "00000011" then
           bcd := "0110000";
       elsif var = "00000100" then
           bcd := "0011001";
       elsif var = "00000101" then
           bcd := "0010010";
       elsif var = "00000110" then
           bcd := "0000010";
       elsif var = "00000111" then
           bcd := "1111000";
       elsif var = "00001000" then
           bcd := "0000000";
       elsif var = "00001001" then
           bcd := "0010000";       
       elsif var = "00001010" then
           bcd := "0001000"; 
       elsif var = "00001011" then
           bcd := "0000011";                                                   
       elsif var = "00001100" then
           bcd := "1000110";
       elsif var = "00001101" then
           bcd := "0100001";
       elsif var = "00001110" then
           bcd := "0000110";
       elsif var = "00001111" then
           bcd := "0001110";
       else
           bcd := "1111111";
       end if;
       return bcd;
    end to_bcd;
begin

led(15 downto 13) <= sw(15 downto 13);
led(2 downto 0) <= matrix(conv_integer(sw(15 downto 14)))(conv_integer(sw(13)));

process(clk)
begin
    if rising_edge(clk) then
        if btnC = '1' then
            matrix(conv_integer(sw(15 downto 14)))(conv_integer(sw(13))) <= sw(2 downto 0);
        end if;
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
    
    an <= "11111110";
    seg <= to_bcd(conv_std_logic_vector(counter, 8));
end process;

end Behavioral;
