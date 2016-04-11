library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdder is
port( 	A 		: in std_logic;
        B 		: in std_logic;
	CarryIn		: in std_logic;
	Result 		: out std_logic;
	CarryOut	: out std_logic);
end FullAdder;

architecture Behavioral of FullAdder is
begin
	CarryOut <= (A and B) or (A and CarryIn) or (B and CarryIn);
	Result 	  <= A xor B xor CarryIn;
end Behavioral;