----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2015 05:56:03 PM
-- Design Name: 
-- Module Name: Ex54 - Behavioral
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

entity Ex54 is
    Port ( clk : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           btnC : in STD_LOGIC);
end Ex54;

architecture Behavioral of Ex54 is
    
    -- Component
    component blk_mem_gen_0
      PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(1023 DOWNTO 0)
      );
    END component;
    
    -- Types
    type state is (init, final);
    
    -- Signals
    signal C_S, N_S : state;
    signal index, next_index : integer;
    signal n_ones, next_n_ones : integer;
    signal res, next_res : integer;
    
    signal number : std_logic_vector(1023 downto 0);
    signal result : std_logic_vector(10 downto 0);
    
begin

    -- Get number
    lut : blk_mem_gen_0
          port map (clk, "000", number);

    -- Sequential process
    process (clk)
    begin
        if rising_edge(clk) then
            if btnC = '1' then
                C_S <= init;
                index <= 0;
                n_ones <= 0;
                res <= 0;
            else
                C_S <= N_S;
                index <= next_index;
                n_ones <= next_n_ones;
                res <= next_res;
            end if;
        end if;
    end process;

    -- Combinatory process
    process (C_S, index, n_ones, res)
    begin
        N_S <= C_S;
        next_index <= index;
        next_n_ones <= n_ones;
        next_res <= res;
        
        case C_S is
            when init =>
                N_S <= init;
                next_index <= index + 1;
                next_n_ones <= n_ones + conv_integer(number(index));
                if index = 1023 then
                    N_S <= final;
                end if;
            when final =>
                next_res <= n_ones;
                N_S <= init;
                next_index <= 0;
                next_n_ones <= 0;
            when others =>
                N_S <= init;
        end case;
    end process;

    result <= conv_std_logic_vector(res, 11);

    -- Disp
    disp : entity work.EightDisplayControl
           port map (clk, "0000", "0000", "0000", "0000", "0000",
                          "0" & result(10 downto 8), result(7 downto 4), result(3 downto 0), an, seg);

end Behavioral;
