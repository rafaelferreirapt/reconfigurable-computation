----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2015 07:52:53 PM
-- Design Name: 
-- Module Name: IerativeSorterFSM - Behavioral
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

entity IerativeSorterFSM is
    Generic ( L : integer := 8;
              M : integer := 32);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (L*M-1 downto 0);
           data_out : out STD_LOGIC_VECTOR (L*M-1 downto 0);
           cont : out integer range 0 to 2*L-1);
end IerativeSorterFSM;

architecture Behavioral of IerativeSorterFSM is

    -- Type
    type state is (initial, even, odd, completed);
    type in_data is array(L-1 downto 0) of std_logic_vector(M-1 downto 0);

    -- Signals
    signal C_S, N_S : state;
    signal arr, next_arr : in_data;
    signal sorting_completed, next_sorting_completed : std_logic;
    signal counter, next_counter : integer range 0 to 2*L-1 := 0;
    signal even_odd, next_even_odd : std_logic;

begin

    -- Sequential process
    process (clk) 
    begin
        if rising_edge(clk) then
            if reset = '1' then
                C_S <= initial;
                arr <= (others => (others => '0'));
                sorting_completed <= '0';
                counter <= 0;
                even_odd <= '0';
            else
                C_S <= N_S;
                arr <= next_arr;
                sorting_completed <= next_sorting_completed;
                counter <= next_counter;
                even_odd <= next_even_odd;
            end if;
        end if;
    end process;

    -- Combinatiry process
    process (C_S, arr, sorting_completed, counter, even_odd, data_in)
    begin
        
        -- Initial step
        N_S <= C_S;
        next_arr <= arr;
        next_sorting_completed <= sorting_completed;
        next_counter <= counter;
        next_even_odd <= even_odd;
        
        -- Evaluate state
        case C_S is
            when initial =>
            
                next_sorting_completed <= '0';
                next_counter <= 0;
                next_even_odd <= '0';
                
                for i in L-1 downto 0 loop
                    next_arr(i) <= data_in(M*(i+1)-1 downto M*i);
                end loop;
                
                if even_odd <= '0' then
                    N_S <= even;
                else
                    N_S <= odd;
                end if;
                
            when even =>
            
                next_even_odd <= '1';
                N_S <= odd;
                
                if sorting_completed = '0' then
                    
                    next_counter <= counter + 1;
                    next_sorting_completed <= '1';
                    
                    for i in 0 to L/2-1 loop
                        if arr(2*i) < arr(2*i+1) then
                            next_sorting_completed <= '0';
                            next_arr(2*i) <= arr(2*i+1);
                            next_arr(2*i+1) <= arr(2*i);
                        end if; 
                    end loop;
                
                else    
                    N_S <= completed;
                end if;
                
            when odd =>
                
                next_even_odd <= '0';
                N_S <= even;
                
                if sorting_completed = '0' then
                                    
                    next_counter <= counter + 1;
                    next_sorting_completed <= '1';
                    
                    for i in 0 to L/2-2 loop
                        if arr(2*i+1) < arr(2*i+2) then
                            next_sorting_completed <= '0';
                            next_arr(2*i+1) <= arr(2*i+2);
                            next_arr(2*i+2) <= arr(2*i+1);
                        end if; 
                    end loop;
                
                else    
                    N_S <= completed;
                end if;
                
            when completed =>
                N_S <= completed;
            when others =>
                N_S <= initial;
        end case;
        
    end process;

    -- Put arr values in data_out
    process (arr)
    begin
        for i in L-1 downto 0 loop
            data_out(M*(i+1)-1 downto M*i) <= arr(i);
        end loop;
    end process;

    -- Put counter values in output
    cont <= counter;

end Behavioral;
