library IEEE;		
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_UNSIGNED.ALL;	

entity embedded_ROM is
port (  	clk   		    : in  std_logic; 
            seg       : out STD_LOGIC_VECTOR (6 downto 0);
            sel_disp  : out STD_LOGIC_VECTOR (7 downto 0)     );
end embedded_ROM;

architecture Behavioral of embedded_ROM is
signal divided_clk  : std_logic;
signal address      : std_logic_vector(7 downto 0) := (others=>'0');
signal data32bit    : std_logic_vector(31 downto 0);
component blk_mem_gen_0 is
  port (
    clka    : in std_logic;
    addra   : in std_logic_vector(7 downto 0);
    douta   : out std_logic_vector(31 downto 0)
  );
end component;

begin

address <= address+1 when rising_edge(divided_clk);

block_ROM :  blk_mem_gen_0
            port map (divided_clk, address, data32bit );
  
div: entity work.clock_divider     
            port  map (   clk, '0',divided_clk);

disp_cont: entity work.EightDisplayControl 
    port map ( clk=>clk, leftL=>data32bit(31 downto 28), near_leftL=>data32bit(27 downto 24),
               near_rightL=>data32bit(23 downto 20), rightL=>data32bit(19 downto 16),
	           leftR=>data32bit(15 downto 12), near_leftR=>data32bit(11 downto 8),
	           near_rightR=>data32bit(7 downto 4), rightR=>data32bit(3 downto 0),
	           select_display=>sel_disp,segments=>seg);
            
end Behavioral;