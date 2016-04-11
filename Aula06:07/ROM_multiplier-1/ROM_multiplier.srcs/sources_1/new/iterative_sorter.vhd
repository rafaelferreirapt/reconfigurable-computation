library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.all;

entity IterativeSorter is
generic(	N				:integer:=8;	
			M				:integer:=8);
port (	    clk			    : in std_logic;
			reset			: in std_logic;
			led	            : out std_logic_vector(7 downto 0);
			data_in         : in std_logic_vector(N*M-1 downto 0);
			data_out        : out std_logic_vector(N*M-1 downto 0));
end entity IterativeSorter;

architecture Behavioral of IterativeSorter is
type in_data is array (N-1 downto 0) of std_logic_vector(M-1 downto 0);
signal MyAr : in_data;
signal sorting_completed             : std_logic;
signal counter	                     : integer range 0 to N-1 := 0;

begin


sorting: process (clk)
variable even_odd_switcher	: std_logic := '0';
begin
if rising_edge(clk) then
  if reset = '1' then sorting_completed <= '0'; even_odd_switcher := '0'; counter <= 0;
            for i in N-1 downto 0 loop
              MyAr(i) <= data_in(8*(i+1)-1 downto 8*i);
            end loop;
  else 
    if (sorting_completed = '0') then counter <= counter+1;
        if even_odd_switcher = '0' then even_odd_switcher := '1'; 
           sorting_completed <= '1';
	       for i in 0 to N/2-1 loop
		      if MyAr(2*i) < MyAr(2*i+1) then
		             sorting_completed <= '0';
			         MyAr(2*i) <= MyAr(2*i+1);
			         MyAr(2*i+1) <= MyAr(2*i);
		      else    null;
		      end if;
	       end loop;
        else even_odd_switcher := '0';
           sorting_completed <= '1';
	       for i in 0 to N/2-2 loop
		      if MyAr(2*i+1) < MyAr(2*i+2) then
			         sorting_completed <= '0';
			         MyAr(2*i+1) <= MyAr(2*i+2);
			         MyAr(2*i+2) <= MyAr(2*i+1);
		      else   null;
		      end if;
	       end loop;
        end if;
    else null; 
    end if;
  end if;
end if; 
end process;

process (MyAr)
begin
    for i in N-1 downto 0 loop
		  data_out(8*(i+1)-1 downto 8*i) <= MyAr(i);
	end loop;
end process;

led <= conv_std_logic_vector(counter,8);

end Behavioral;

--library IEEE;
--use IEEE.std_logic_1164.all;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.std_logic_unsigned.all;

--entity IterativeSorter is
--generic(	N				:integer:=8;	
--			M				:integer:=8);
--port (	    clk			    : in std_logic;
--			reset			: in std_logic;
--			led	            : out std_logic_vector(7 downto 0);
--			data_in         : in std_logic_vector(N*M-1 downto 0);
--			data_out        : out std_logic_vector(N*M-1 downto 0));
--end entity IterativeSorter;

--architecture Behavioral of IterativeSorter is
--type state_type is (initial_state, even, odd, completed); 	-- enumeration type for the FSM states
--signal C_S, N_S                                 : state_type;
--type in_data is array (N-1 downto 0) of std_logic_vector(M-1 downto 0);
--signal MyAr, N_MyAr                             : in_data;
--signal sorting_completed, N_sorting_completed   : std_logic;
--signal counter, N_counter	                    : integer range 0 to N-1 := 0;
--signal even_odd_switcher, N_even_odd_switcher   : std_logic;

--begin

--process (clk)			 -- this is a sequential process 
--begin
--   if rising_edge(clk) then 
--      if (reset = '1') then C_S <= initial_state; even_odd_switcher <= '0'; counter <= 0; MyAr <= (others=>(others => '0'));
--      else	   C_S               <= N_S;
--               MyAr              <= N_MyAr;
--	           counter 	         <= N_counter;  	
--	           even_odd_switcher <= N_even_odd_switcher;	          	
--      end if;
--   end if;
--end process;

--process (C_S, data_in, sorting_completed, counter)  -- this is a combinational process    
--begin
--   N_S 		                <= C_S;
--   N_MyAr                   <= MyAr;
--   N_counter                <= counter;
--   N_even_odd_switcher		<= even_odd_switcher;
--case C_S is
--	when initial_state => 
--	   N_sorting_completed <= '0'; N_even_odd_switcher <= '0'; N_counter <= 0;
--       for i in N-1 downto 0 loop
--            N_MyAr(i) <= data_in(8*(i+1)-1 downto 8*i);
--       end loop;
--       if even_odd_switcher = '0' then N_S <= even;
--       else N_S <= odd;
--       end if;
--	when even => N_even_odd_switcher <= '1'; N_S <= odd;
--	 if (sorting_completed = '0') then counter <= counter+1;
--	   N_sorting_completed <= '1';
--               for i in 0 to N/2-1 loop
--                  if MyAr(2*i) < MyAr(2*i+1) then
--                         N_sorting_completed <= '0';
--                         N_MyAr(2*i) <= MyAr(2*i+1);
--                         N_MyAr(2*i+1) <= MyAr(2*i);
--                  else    null;
--                  end if;
--               end loop;
--     else N_S <= completed;
--     end if;
--	when odd => N_even_odd_switcher <= '0';  N_S <= even;
--	  if (sorting_completed = '0') then counter <= counter+1;
--	   sorting_completed <= '1';
--               for i in 0 to N/2-2 loop
--                  if MyAr(2*i+1) < MyAr(2*i+2) then
--                         N_sorting_completed <= '0';
--                         N_MyAr(2*i+1) <= MyAr(2*i+2);
--                         N_MyAr(2*i+2) <= MyAr(2*i+1);
--                  else   null;
--                  end if;
--               end loop;
--     else N_S <= completed;
--     end if;
--    when completed => N_S <= completed;
--	when others => N_S <= initial_state;
--end case;
--end process;

--process (MyAr)
--begin
--    for i in N-1 downto 0 loop
--		  data_out(8*(i+1)-1 downto 8*i) <= MyAr(i);
--	end loop;
--end process;

--led <= conv_std_logic_vector(counter,8);

--end Behavioral;

