----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2015 10:58:51 PM
-- Design Name: 
-- Module Name: Ex65_fixe - Behavioral
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

entity Ex65_fixe is
    Port ( clk : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           btnC : in STD_LOGIC;
           btnL : in STD_LOGIC;
           btnR : in STD_LOGIC);
end Ex65_fixe;

architecture Behavioral of Ex65_fixe is
    
    -- Types
    type in_data is array (31 downto 0) of std_logic_vector(7 downto 0);
    
    -- Signals
    signal divided_clk, divided_clk1, divided_clk2 : std_logic;
    signal bigNumber, sortedNumber : std_logic_vector(255 downto 0);
    signal addr : STD_LOGIC_VECTOR(4 DOWNTO 0) := (others => '0');
    signal number : std_logic_vector(7 downto 0);
    signal sortedArr : in_data;
    signal to_display : std_logic_vector(31 downto 0);
    signal shift : std_logic_vector(255 downto 0);
    
    -- Component
    component blk_mem_gen_0
      PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
    END component;
    
begin

    -- Generate big number from lut
    lut : blk_mem_gen_0
          port map (clk, addr, number);
    
    process (clk)
    begin
        if rising_edge(clk) then
            bigNumber(8*(conv_integer(addr)+1)-1 downto 8*conv_integer(addr)) <= number;
            addr <= addr + 1;
        end if;
    end process;
    
    -- Divided clk
    div : entity work.clock_divider
          generic map (26)
          port map (clk, divided_clk1);
          
    div2 : entity work.clock_divider
          generic map (27)
          port map (clk, divided_clk2);
                   
    -- Choose divided_clk
    process (btnR, divided_clk2, divided_clk1, clk)
    begin
        if rising_edge(clk) then
            if btnR = '1' then
                divided_clk <= divided_clk2;
            else
                divided_clk <= divided_clk1;
            end if;
        end if;
    end process;
                   
    -- Choose number to show
    process (divided_clk, btnL)
    begin
        if rising_edge(divided_clk) then
            if btnC = '1' then
                shift <= bigNumber;
            elsif btnL = '1' then
                shift <= shift(247 downto 0) & shift(255 downto 248);
            else
                shift <= shift(7 downto 0) & shift(255 downto 8);
            end if;
        end if;
    end process;

    to_display <= shift(31 downto 0);

    -- Displays
    disp : entity work.EightDisplayControl
           port map (clk, to_display(31 downto 28), to_display(27 downto 24), to_display(23 downto 20), to_display(19 downto 16), to_display(15 downto 12), to_display(11 downto 8),
                     to_display(7 downto 4), to_display(3 downto 0), an, seg);

end Behavioral;
