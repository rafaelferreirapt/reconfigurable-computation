----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2015 06:39:24 PM
-- Design Name: 
-- Module Name: MinSearchingNetwork - Behavioral
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

entity MinSearchingNetwork is
    Generic (N : integer := 8;
             M : integer := 32;
             p : integer := 3);
    Port ( data_in : in STD_LOGIC_VECTOR (N*M-1 downto 0);
           min_value : out STD_LOGIC_VECTOR (M-1 downto 0));
end MinSearchingNetwork;

architecture Behavioral of MinSearchingNetwork is

    -- Types
    type in_data is array(N-1 downto 0) of std_logic_vector(M-1 downto 0);

begin

    -- Searching Network process
    process (data_in)
        variable arr : in_data;
        variable tmp : std_logic_vector(M-1 downto 0);
    begin
        
        -- Fill arr with data
        for i in N-1 downto 0 loop
            arr(i) := data_in(M*(i+1)-1 downto M*i);
        end loop;
        
        -- Search minimum value
        for k in 0 to p-1 loop
            for i in 0 to N/(2**(k+1))-1 loop
                if (arr(2**(k+1)*i+(2**k)-1) < arr(2**(k+1)*i+(2**(k+1))-1)) then
                    tmp := arr(2**(k+1)*i+(2**k)-1);
                    arr(2**(k+1)*i+(2**k)-1) := arr(2**(k+1)*i+(2**(k+1))-1);
                    arr(2**(k+1)*i+(2**(k+1))-1) := tmp;
                end if;
            end loop;
        end loop;
        
        min_value <= arr(N-1);
    end process;

end Behavioral;
