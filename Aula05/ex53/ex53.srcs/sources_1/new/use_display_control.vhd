library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity use_random2 is
    generic (N       : integer := 32);
    port ( clk       : in std_logic;
           btnC      : in std_logic;
           sw        : in STD_LOGIC_VECTOR (15 downto 0);
           seg       : out STD_LOGIC_VECTOR (6 downto 0);
           sel_disp  : out STD_LOGIC_VECTOR (7 downto 0));
end use_random2;

architecture Behavioral of use_random2 is
signal count        : std_logic_vector(N-1 downto 0) := (others => '0');
signal random_num   : std_logic_vector(N-1 downto 0) := (others => '0');
begin

count <= random_num when rising_edge(clk) and (btnC='1');
random_num <= random_num+1 when rising_edge(clk);

disp_cont: entity work.EightDisplayControl 
    port map ( clk=>clk, leftL=>count(31 downto 28), near_leftL=>count(27 downto 24), 
                         near_rightL=>count(23 downto 20), rightL=>count(19 downto 16),
	                     leftR=>count(15 downto 12), near_leftR=>count(11 downto 8), 
	                     near_rightR=>count(7 downto 4), rightR=>count(3 downto 0),
	           select_display=>sel_disp,segments=>seg);

end Behavioral;
