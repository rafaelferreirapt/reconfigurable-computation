----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2016 03:53:33 PM
-- Design Name: 
-- Module Name: ex5 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ex5 is
Port (	sw 		: in  STD_LOGIC_VECTOR (15 downto 0);
		led			: out STD_LOGIC_VECTOR(8 downto 0));
		--a : in  STD_LOGIC_VECTOR (7 downto 0);
        --b : in  STD_LOGIC_VECTOR (7 downto 0);
        --cin : in  STD_LOGIC;
        --o : out  STD_LOGIC_VECTOR (7 downto 0);
        --cout : out  STD_LOGIC);

end ex5;

architecture Behavioral of ex5 is

component full_adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           carry_in : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry_out : out  STD_LOGIC);
end component;

signal c: std_logic_vector(7 downto 1) := (others => '0');
signal o: std_logic_vector(7 downto 0);
signal cout: std_logic;
begin

C1: full_adder port map( A => sw(0), B => sw(8), carry_in => '0', sum => o(0), carry_out => c(1) );
C2: full_adder port map( A => sw(1), B => sw(9), carry_in => c(1), sum => o(1), carry_out => c(2) );
C3: full_adder port map( A => sw(2), B => sw(10), carry_in => c(2), sum => o(2), carry_out => c(3) );
C4: full_adder port map( A => sw(3), B => sw(11), carry_in => c(3), sum => o(3), carry_out => c(4) );
C5: full_adder port map( A => sw(4), B => sw(12), carry_in => c(4), sum => o(4), carry_out => c(5) );
C6: full_adder port map( A => sw(5), B => sw(13), carry_in => c(5), sum => o(5), carry_out => c(6) );
C7: full_adder port map( A => sw(6), B => sw(14), carry_in => c(6), sum => o(6), carry_out => c(7) );
C8: full_adder port map( A => sw(7), B => sw(15), carry_in => c(7), sum => o(7), carry_out => cout );

process(sw)

led(7 downto 0) <= o;
led(8)<=cout;

end process;

end Behavioral;
