library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity aula5_ex2 is
    generic(number_of_bits : integer := 16);
    port ( clk : in std_logic;
        btnC : in std_logic;
        sw : in std_logic_vector(number_of_bits-1 downto 0);
        led : out std_logic_vector(7 downto 0); 
        seg : out std_logic_vector(6 downto 0);
        an : out std_logic_vector(7 downto 0));
end aula5_ex2;

architecture Behavioral of aula5_ex2 is

    signal A,B,FSM_A, FSM_B, FSM_A_next, FSM_B_next : integer range 0 to 255;
    type state_type is (init, run_state);
    signal C_S, N_S : state_type; -- current state, next state
    signal Res, Res_next : integer range 0 to 255;
    
begin
    A <= conv_integer(sw(15 downto 8)); 
    B <= conv_integer(sw(7 downto 0));
    
    process (clk) -- processo sequencial
    begin
        if rising_edge(clk) then
            if (btnC = '1') then 
                    C_S <= init;
                    
            else C_S <= N_S;
                FSM_A <= FSM_A_next; -- actual operadando A = proximo operando A
                FSM_B <= FSM_B_next; -- o mesmo para B
                Res <= Res_next; -- o mesmo para o resultado
            end if;
        end if;
end process;

process (C_S, A, B, FSM_A, FSM_B, Res) -- processo combinatório
begin
    N_S <= C_S;
    FSM_A_next <= FSM_A;
    FSM_B_next <= FSM_B;
    Res_next <= Res;
    
    case C_S is
        when init =>
            if ((A = 0) or (B = 0)) then 
                Res_next <= 0;
                N_S <= init;
                
            else FSM_A_next <= A;
                FSM_B_next <= B;
                N_S <= run_state;
            end if;
            
        when run_state =>
            if (FSM_B>0) then  -- pelo que percebi esta baseado nos slides da aula teorica 5
                N_S <= run_state;
                
            if (FSM_B>FSM_A) then 
                FSM_A_next <= FSM_B;
                FSM_B_next <= FSM_A;
                
            else 
                FSM_A_next <= FSM_B;
                FSM_B_next <= FSM_A rem FSM_B;
            end if;
            
            else Res_next <= FSM_A;
                N_S <= init;
            end if;
            
            when others => N_S <= init;
      end case;
end process;

led <= conv_std_logic_vector(Res,8);
an <= "11111110";
sed7disp : entity work.aula5_7segDisp(Behavioral)
            port map(switches => conv_std_logic_vector(Res,4), display => seg);
end Behavioral;
