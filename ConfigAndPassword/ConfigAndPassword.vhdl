library ieee;
use ieee.std_logic_1164.all;


entity ConfigAndPassword is
	port(request : in std_logic;
			confirm : in std_logic;
			pass	:	in	std_logic_vector(1 downto 0);  --two bit input password 
			memIn	:	in	std_logic_vector(34 downto 0);  --set memory content
			memSel	:	in	std_logic_vector(2 downto 0);  --sel memory 
			clk	:	in	std_logic;
			memOut	:	out	std_logic_vector(34 downto 0));  --get memory content 
end entity;


architecture struct of ConfigAndPassword is

	component MemoryRegister is       --instantiate from memory register
		port(memIn	:	in	std_logic_vector(34 downto 0);
				 sel	:	in	std_logic_vector(2 downto 0);
				 memOut	:	out	std_logic_vector(34 downto 0));
	end component;

	function twobit_comp(a, b : std_logic_vector) return std_logic is
		variable res : std_logic := '0';
	begin
		if (a = b) then
			res := '1';
		end if;
		return res;
	end function;

	type t_state is (A, B, C, D);  --create fsm with 4 state
	signal state : t_state := A;
	signal memIn_tmp, memOut_tmp : std_logic_vector(34 downto 0);
	signal sel_tmp : std_logic_vector(2 downto 0);
begin
	lmr: MemoryRegister port map(memIn_tmp, sel_tmp, memOut_tmp);
	memOut <= memOut_tmp;
	state <= A when request = '0';
	
	process(clk) is
	begin
		if rising_edge(clk) and request = '1' then

			if(state = A) then
				state <= B;

			elsif(state = B)then
				if(confirm = '1' and twobit_comp(pass, memOut_tmp(34 downto 33)))then
					state <= C;   --correct pass entered 
				else
					state <= B;  -- incorrect pass entered 
				end if;

			elsif(state = C)then
				if(confirm = '1')then -- if 1 pressed goto update state (D)
					state <= D;
				end if;
			
			elsif(state = D)then  --update system configuration state
				memIn_tmp <= memIn;
				sel_tmp <= memSel;
			end if;

		end if;
	end process;


end architecture;
