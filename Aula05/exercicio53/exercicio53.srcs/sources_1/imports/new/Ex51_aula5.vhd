----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2015 10:14:18 AM
-- Design Name: 
-- Module Name: Ex51_aula5 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ConsecutiveOnes is
    Generic ( size : integer := 16);
    Port ( clk : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (size-1 downto 0);
           reset : in STD_LOGIC;
           result : out integer);
end ConsecutiveOnes;

architecture Behavioral of ConsecutiveOnes is
    
    -- Types
    type state is (initial_state, final_state);
    
    -- Signals for state machine
    signal C_S, N_S : state;
    signal index, next_index : integer range 0 to size-1;
    signal n_ones, next_n_ones : integer range 0 to size;
    signal bigger, next_bigger : integer range 0 to size;
    signal res, next_res : integer range 0 to size;
    
begin

    -- Sequential process
    process (clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then -- Reset
                C_S <= initial_state;
                index <= 0;
                n_ones <= 0;
                bigger <= 0;
                res <= 0;
            else -- Update values
                C_S <= N_S;
                index <= next_index;
                n_ones <= next_n_ones;
                bigger <= next_bigger;
                res <= next_res;
            end if;
         end if;
    end process;

    -- Combinatory process
    process (C_S, index, n_ones, bigger, res)
    begin
        
        -- Initial step
        N_S <= C_S;
        next_index <= index;
        next_n_ones <= n_ones;
        next_bigger <= bigger;
        next_res <= res;
        
        -- Evaluate case
        case C_S is
            when initial_state => 
            
                N_S <= initial_state;
                next_index <= index + 1;
          
                if (input(index) = '0') then
                    if bigger < n_ones then
                        next_bigger <= n_ones;
                    end if;
                    next_n_ones <= 0;
                else
                    next_n_ones <= n_ones + 1;
                end if;
          
                if index = size-1 then
                    N_S <= final_state;
                end if;
            
            when final_state =>
            
                if bigger > n_ones then
                    next_res <= bigger;
                else
                    next_res <= n_ones;
                end if;
                
                N_S <= initial_state;
                next_index <= 0;
                next_n_ones <= 0;
                next_bigger <= 0;
                
            when others =>
            
                N_S <= initial_state;
                
        end case;
        
    end process;
                
    -- Set result value
    result <= res;

end Behavioral;
