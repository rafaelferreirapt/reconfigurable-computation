library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ParallelCounterComparator is
  port (	sw	: in std_logic_vector(15 downto 0);
	        led	: out std_logic_vector(4 downto 0));
end ParallelCounterComparator;

architecture Behavioral of ParallelCounterComparator is
   signal R1, R2, R3, R4, R2_1, R2_2, R2_3, R2_4, R3_1, R3_2, R3_3 	  : std_logic;
   signal COut1, COut2, COut3, COut4 		 		                  : std_logic;
   signal COut2_1, COut2_2, COut2_3, COut2_4 	 		              : std_logic;
   signal COut3_1, COut3_2, COut3_3		 		                      : std_logic;
   signal PC_out					                                  : std_logic_vector(3 downto 0);
   signal B						                                      : std_logic_vector(15 downto 0);    		
begin
   B <= sw;		
   FA0	     :  entity work.FullAdder	port map(B(0), B(1), B(2), R1, COut1);
   FA1	     :  entity work.FullAdder	port map(B(3), B(4), B(5), R2, COut2);
   FA2	     :  entity work.FullAdder	port map(B(6), B(7), B(8), R3, COut3);
   FA3	     :  entity work.FullAdder	port map(B(9), B(10), B(11), R4, COut4);
   FA2_0	 :  entity work.FullAdder	port map(R1, R2, B(12), R2_1, COut2_1);
   FA2_1	 :  entity work.FullAdder	port map(COut1, COut2, COut2_1, R2_2, COut2_2);
   FA2_2	 :  entity work.FullAdder	port map(R3, R4, B(13), R2_3, COut2_3);
   FA2_3	 :  entity work.FullAdder	port map(COut3, COut4, COut2_3, R2_4, COut2_4);
   FA3_0	 :  entity work.FullAdder  	port map(R2_1, R2_3, B(14), R3_1, COut3_1);
   FA3_1	 :  entity work.FullAdder  	port map(R2_2, R2_4, COut3_1, R3_2, COut3_2);
   FA3_2	 :  entity work.FullAdder	port map(COut2_2, COut2_4, COut3_2, R3_3, COut3_3);
   PC_out <= COut3_3 & R3_3 & R3_2 & R3_1;
   led <= PC_out + ("0000" & B(15)); 		-- peso de Hamming
end Behavioral;
