----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2015 11:07:34 AM
-- Design Name: 
-- Module Name: Ex52_aula5 - Behavioral
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

entity Ex52_aula5 is
    Port ( sw : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           btnC : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end Ex52_aula5;

architecture Behavioral of Ex52_aula5 is
    
    -- Types
    type state is (init, run_state);
    
    -- Signals for state machine
    signal A, B : integer range 0 to 255;
    signal C_S, N_S : state;
    signal FSM_A, next_FSM_A : integer range 0 to 255;
    signal FSM_B, next_FSM_B : integer range 0 to 255;
    signal res, next_res : integer range 0 to 255;
    
    signal res_hex : std_logic_vector(7 downto 0);
    
begin

    -- Convert sw to integer
    A <= conv_integer(sw(15 downto 8));
    B <= conv_integer(sw(7 downto 0));
    
    -- Sequential process
    process (clk)
    begin
        if rising_edge(clk) then
            if btnC = '1' then
                C_S <= init;
            else
                C_S <= N_S;
                FSM_A <= next_FSM_A;
                FSM_B <= next_FSM_B;
                res <= next_res;
            end if;
        end if;        
    end process;

    -- Combinatory process
    process (C_S, A, B, FSM_A, FSM_B, res)
    begin
        -- Initial step
        N_S <= C_S;
        next_FSM_A <= FSM_A;
        next_FSM_B <= FSM_B;
        next_res <= res;
        
        -- Evaluate state
        case C_S is
            when init =>
                if (A = 0) or (B = 0) then
                    N_S <= init;
                    next_res <= 0;
                else
                    N_S <= run_state;
                    next_FSM_A <= A;
                    next_FSM_B <= B;
                end if;
            when run_state =>
                if FSM_B > 0 then
                    if FSM_B > FSM_A then
                        next_FSM_A <= FSM_B;
                        next_FSM_B <= FSM_A;
                        N_S <= run_state;
                    else
                        next_FSM_B <= FSM_A rem FSM_B;
                        next_FSM_A <= FSM_B;
                        N_S <= run_state;
                    end if;
                else
                    N_S <= init;
                    next_res <= FSM_A;
                end if;
            when others =>
                N_S <= init;
            end case;
    end process;

    -- Convert res to hex
    res_hex <= conv_std_logic_vector(res, 8);

    -- Show result in displays
    disp : entity work.EightDisplayControl
           port map (clk, "0000", "0000", "0000", "0000",
                     "0000", "0000", res_hex(7 downto 4), res_hex(3 downto 0),
                     an, seg);

end Behavioral;
