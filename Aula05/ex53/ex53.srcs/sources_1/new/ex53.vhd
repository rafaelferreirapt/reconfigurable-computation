----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2016 04:31:35 PM
-- Design Name: 
-- Module Name: ex53 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ex53 is
generic( number_of_bits : integer := 1000);
port (  clk : in std_logic;
        btnC : in std_logic;
        an : out STD_LOGIC_VECTOR (7 downto 0);
        seg : out STD_LOGIC_VECTOR (6 downto 0));
end ex53;

architecture Behavioral of ex53 is
    type state_type is (initial_state, final_state); -- enumeração de estados
    signal C_S, N_S : state_type;
    signal index, next_index : integer range 0 to 999;
    signal Res, next_Res : integer range 0 to 1000;
    signal n_o_ones, next_n_o_ones, max_ones : integer range 0 to 1000;
    signal result   : std_logic_vector(9 downto 0);
    signal vetor    : std_logic_vector(999 downto 0);
    signal random_num : std_logic_vector(999 downto 0);

begin

    process (clk) -- processo sequencial
    begin
        if rising_edge(clk) then
            if (btnC = '1') then 
                C_S <= initial_state; 
                index <= 0; 
                n_o_ones <= 0; 
                Res <= 0;
                vetor <= random_num;
                --max_ones <= 0;
            else 
                C_S <= N_S;
                index <= next_index; -- índice do vetor
                n_o_ones <= next_n_o_ones; -- número de uns
                Res <= next_Res; -- resultado
            end if;
        end if;
    end process;
    
    process (C_S, vetor, index, n_o_ones, Res) -- processo combinatório
    begin
        N_S <= C_S;
        next_index <= index;
        next_n_o_ones <= n_o_ones;
        next_Res <= Res;
        case C_S is
            when initial_state => 
                                    next_index <= index + 1; 
                                    N_S <= initial_state;
                                    if vetor(index) = '1' then
                                        next_n_o_ones <= n_o_ones + 1;
                                    else
                                        next_n_o_ones <= 0;
                                    end if;
                                    if next_n_o_ones > max_ones then
                                        max_ones <= next_n_o_ones;
                                    end if;
                                    if(index = number_of_bits - 1) then 
                                        N_S <= final_state;
                                    end if;
            when final_state => 
                                    N_S <= initial_state;
                                    next_Res <= max_ones; 
                                    next_n_o_ones <= 0; 
                                    next_index <= 0;
            when others => 
                                    N_S <= initial_state;
        end case;
    end process;
    
    result <= conv_std_logic_vector(Res,10);
    
    disp_cont:  entity work.EightDisplayControl
                port map (  clk=>clk, 
                            leftL=>"0000", 
                            near_leftL=>"0000",
                            near_rightL=>"0000", 
                            rightL=>"0000",
                            leftR=>"0000", 
                            near_leftR=>"00" & result(9 downto 8),
                            near_rightR=>result(7 downto 4), 
                            rightR=>result(3 downto 0),
                            select_display=>an,
                            segments=>seg);
                            
     RNG :  entity work.RanGen
            generic map (1000)
            port map (clk=>clk,random_num=>random_num); 

end Behavioral;
