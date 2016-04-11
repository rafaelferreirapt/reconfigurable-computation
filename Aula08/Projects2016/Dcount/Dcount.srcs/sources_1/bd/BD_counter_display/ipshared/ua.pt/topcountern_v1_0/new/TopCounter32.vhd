library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity TopCounterN is
    generic (size   : integer   := 32);
    port ( clk      : in std_logic;
           btnC     : in std_logic;
           data_out : out std_logic_vector (size-1 downto 0));
end TopCounterN;

architecture Behavioral of TopCounterN is
signal counter      : std_logic_vector (size-1 downto 0);
signal divided_clk  : std_logic;
begin

counter <= counter+1 when rising_edge(divided_clk);

data_out<=counter;

clock_div:  entity work.clock_divider	
            port map  (	clk,divided_clk);

end Behavioral;
