library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nivel_topo is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (31 downto 0));
end nivel_topo;

architecture Behavioral of nivel_topo is

component blk_mem_gen_0 IS
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END component;

begin

mem: blk_mem_gen_0
  PORT map (
    clka => clk,
    addra => sw,
    douta => data  );

end Behavioral;
