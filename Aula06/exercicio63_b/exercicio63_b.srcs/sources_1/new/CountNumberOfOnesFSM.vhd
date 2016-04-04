----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2015 05:42:19 PM
-- Design Name: 
-- Module Name: CountNumberOfOnesFSM - Behavioral
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

entity CountNumberOfOnesFSM is
    Generic (size : integer := 32);
    Port ( clk : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (size-1 downto 0);
           number_of_ones : out integer range 0 to size);
end CountNumberOfOnesFSM;

architecture Behavioral of CountNumberOfOnesFSM is

    -- Types
    type state is (init, final);
    
    -- Signals
    signal C_S, N_S : state;
    signal index, next_index : integer range 0 to size-1;
    signal n_ones, next_n_ones : integer range 0 to size;
    signal res, next_res : integer range 0 to size;

begin

    -- Sequential process
    process (clk)
    begin
        if rising_edge(clk) then
            C_S <= N_S;
            index <= next_index;
            n_ones <= next_n_ones;
            res <= next_res;
        end if;
    end process;

    -- Combinatory process
    process (C_S, index, n_ones, res)
    begin
        
        -- Initial step
        N_S <= C_S;
        next_index <= index;
        next_n_ones <= n_ones;
        next_res <= res;
        
        -- Evaluate state
        case C_S is
            when init =>
                N_S <= init;
                next_index <= index + 1;
                if input(index) = '1' then
                    next_n_ones <= n_ones + 1;
                end if;
                if index = size-1 then
                    N_S <= final;
                end if;
            when final =>
                N_S <= init;
                next_index <= 0;
                next_n_ones <= 0;
                next_res <= n_ones;
            when others =>
                N_S <= init;
        end case;
        
    end process;

    -- Copy result to output
    number_of_ones <= res;

end Behavioral;
