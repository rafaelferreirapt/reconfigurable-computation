library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity exercise is
    generic (number_of_bits : integer := 16);
    Port ( clk : in std_logic;
           btnC : in std_logic;
           btnD : in std_logic;
           sw : in std_logic_vector(15 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           led : out std_logic_vector(4 downto 0));
end exercise;

architecture Behavioral of exercise is

    type state_type is (initial_state, final_state);
    signal C_S, N_S  : state_type;
    signal index, next_index : integer range 0 to number_of_bits-1;
    signal res, next_res : integer range 0 to number_of_bits;
    signal c_ones, next_c_ones : integer range 0 to number_of_bits;
    signal max_c_ones, next_max_c_ones: integer range 0 to number_of_bits;
    signal res_max, next_res_max : integer range 0 to number_of_bits;
    signal n_o_ones, next_n_o_ones : integer range 0 to number_of_bits;
    signal result : std_logic_vector(7 downto 0);
    signal output : std_logic_vector(7 downto 0);
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if (btnC = '1') then 
                C_S <= initial_state; 
                index <= 0;
                n_o_ones <= 0;
                res <= 0;
                c_ones <= 0;
                max_c_ones <= 0;
            else
                C_S <= N_S;
                index <= next_index;
                n_o_ones <= next_n_o_ones;
                c_ones <= next_c_ones;
                max_c_ones <= next_max_c_ones;
                res_max <= next_res_max;
                res <= next_res;
            end if;
        end if;
    end process;
    
    process (C_S, Sw, index, n_o_ones, Res) -- processo combinat?rio
    begin
        N_S <= C_S;
        next_index <= index;
        next_n_o_ones <= n_o_ones;
        next_Res <= Res;
        next_c_ones <= c_ones;
        next_max_c_ones <= max_c_ones;
        next_res_max <= res_max;
        case C_S is
            when initial_state => 
                next_index <= index + 1; 
                N_S <= initial_state;
                next_n_o_ones <= n_o_ones + conv_integer(sw(index));
                if conv_integer(sw(index)) = 1 then
                    next_c_ones <= c_ones + 1;
                    if next_c_ones > max_c_ones then
                        next_max_c_ones <= next_c_ones;
                    end if;
                else
                    next_c_ones <= 0;
                end if;
                if(index = number_of_bits-1) then 
                    N_S <= final_state;
                end if;
            when final_state => 
                N_S <= initial_state;
                next_Res <= n_o_ones;
                next_res_max <= max_c_ones;
                next_n_o_ones <= 0; 
                next_c_ones <= 0;
                next_max_c_ones <= 0;
                next_index <= 0;
            when others => N_S <= initial_state;
        end case;
    end process;
    
    led <= conv_std_logic_vector(res, 5);
    
    result <= conv_std_logic_vector(res, 8);
    
    output <= conv_std_logic_vector(max_c_ones, 8) when btnD = '1' else
            result;
    -- Display
    disp : entity work.EightDisplayControl
               port map (clk, output(3 downto 0), output(7 downto 4),"0000","0000", "0000", "0000", "0000","0000", an, seg);

end Behavioral;
