library IEEE;		
use IEEE.STD_LOGIC_1164.ALL;	 
use IEEE.STD_LOGIC_UNSIGNED.ALL;	

entity Multiplier_ROM is
generic (   NOp1      : integer := 8;
            NOp2      : integer := 8);
port (  	clk	      : in  std_logic;
            sw        : in std_logic_vector(15 downto 0); 
            seg       : out STD_LOGIC_VECTOR (6 downto 0);
            sel_disp  : out STD_LOGIC_VECTOR (7 downto 0)     );
end Multiplier_ROM;

architecture Behavioral of Multiplier_ROM is
signal data_in     : std_logic_vector(NOp1+NOp2-1 downto 0);
component blk_mem_gen_1 is
  port (
    clka    : in std_logic;
    addra   : in std_logic_vector(NOp1+NOp2-1 downto 0);
    douta   : out std_logic_vector(NOp1+NOp2-1 downto 0)
  );
end component;
signal Op1                          : std_logic_vector(NOp1-1 downto 0);
signal Op2                          : std_logic_vector(NOp2-1 downto 0);
signal address                      : std_logic_vector(NOp1+NOp2-1 downto 0) := Op1 & Op2;
signal BCD4, BCD3, BCD2, BCD1, BCD0 : std_logic_vector(3 downto 0);
begin
Op1 <= sw(15 downto 8);
Op2 <= sw(7 downto 0);
--address <= Op1 & Op2;

block_ROM :  blk_mem_gen_1
             port map (clk, address, data_in );

disp_cont: entity work.EightDisplayControl 
    port map ( clk=>clk, leftL=>"0000", near_leftL=>"0000",
               near_rightL=>"0000", rightL=>BCD4,
	           leftR=>BCD3, near_leftR=>BCD2,
	           near_rightR=>BCD1, rightR=>BCD0,
	           select_display=>sel_disp,segments=>seg);

BCD_dec:    entity work.BinToBCD16  
port map ( 	clk 	=> clk,
          	reset 	=> '0', 
         	ready 	=> open,
          	binary 	=> data_in,
          	request => '1',
          	BCD4 	=> BCD4,
          	BCD3 	=> BCD3,
          	BCD2 	=> BCD2,
          	BCD1 	=> BCD1,
          	BCD0 	=> BCD0);

            
end Behavioral;