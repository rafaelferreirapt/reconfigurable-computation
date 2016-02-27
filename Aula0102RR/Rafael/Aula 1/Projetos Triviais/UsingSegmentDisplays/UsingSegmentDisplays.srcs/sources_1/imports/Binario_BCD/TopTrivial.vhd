library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TopTrivial is
    Port (      clk		   : in std_logic;
				sw 		   : in  STD_LOGIC_VECTOR (15 downto 0);
                led 	   : out  STD_LOGIC_VECTOR (15 downto 0);
			    seg		   : out std_logic_vector(6 downto 0);
			    sel_disp   : out std_logic_vector(7 downto 0));
end TopTrivial;

architecture Behavioral of TopTrivial is

signal	divided_clk	: std_logic;

type for_seg_disp is array (1 to 5) of std_logic_vector(3 downto 0); 
signal	digits : for_seg_disp; 

begin

led <= sw when divided_clk = '1' else (others => '0');

div			:	entity work.clock_divider 
				port map	( 	clk, '0', divided_clk);
				
				
DispCont		:	entity work.EightDisplayControl		
				port map(clk,	digits(1),digits(2),digits(3),digits(4),
									digits(5),"0000","0000","0000",sel_disp,seg);

binTO_BCD		: entity work.BinToBCD16
					port map ( clk,'0',open,sw,digits(5),digits(4),digits(3),digits(2),digits(1));

end Behavioral;

