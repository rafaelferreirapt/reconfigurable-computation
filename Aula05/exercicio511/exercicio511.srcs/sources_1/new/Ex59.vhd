----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2015 07:28:31 PM
-- Design Name: 
-- Module Name: Ex59_aula3 - Behavioral
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

entity Ex59_aula3 is
    Port ( clk : STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end Ex59_aula3;

architecture Behavioral of Ex59_aula3 is
    
    -- Signals
    signal result : std_logic_vector(7 downto 0);
    signal bcd: std_logic_vector(11 downto 0);
    
    -- Function binary to bcd
    function binary_to_bcd(input : std_logic_vector(7 downto 0)) return std_logic_vector(11 downto 0) is
        variable bcd : std_logic_vector(11 downto 0);
        variable bint : std_logic_vector(7 downto 0) := input;
    begin
            
        for i in input'range loop -- repeating 8 times.
            bcd(11 downto 1) := bcd(10 downto 0); --shifting the bits.
            bcd(0) := bint(7);
            bint(7 downto 1) := bint(6 downto 0);
            bint(0) := '0';
            
            if (i < 7 and bcd(3 downto 0) > "0100") then -- add 3 if BCD digit is greater than 4.
                bcd(3 downto 0) := bcd(3 downto 0) + "0011";
            end if; 
            
            if(i < 7 and bcd(7 downto 4) > "0100") then --add 3 if BCD digit is greater than 4.
                bcd(7 downto 4) := bcd(7 downto 4) + "0011";
            end if;
            
            if(i < 7 and bcd(11 downto 8) > "0100") then  --add 3 if BCD digit is greater than 4.
                bcd(11 downto 8) := bcd(11 downto 8) + "0011";
            end if;
        end loop;
        
        return bcd;       
    end binary_to_bcd;
    
begin
    
    -- Get result
    gcd : entity work.FSM_new
          generic map (16)
          port map (clk, '0', sw, result);
          
    -- Convert to decimal
    bcd <= binary_to_bcd(result);
    
    -- Show values in the displays
    disp : entity work.EightDisplayControl
           port map (clk, "0000", "0000", "0000", "0000", "0000", 
                     bcd(11 downto 8), bcd(7 downto 4), bcd(3 downto 0), an, seg);
    
end Behavioral;
