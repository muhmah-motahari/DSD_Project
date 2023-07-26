library ieee;
use ieee.std_logic_1164.all;


entity ConfigAndPassword is
	port(request : in std_logic;
			confirm : in std_logic;
			pass	:	in	std_logic_vector(1 downto 0);
			memIn	:	in	std_logic_vector(34 downto 0);
			memSel	:	in	std_logic_vector(2 downto 0);
			clk	:	in	std_logic;
			memOut	:	out	std_logic_vector(34 downto 0));
end entity;


architecture struct of ConfigAndPassword is

	component MemoryRegister is
		port(memIn	:	in	std_logic_vector(34 downto 0);
				 sel	:	in	std_logic_vector(2 downto 0);
				 memOut	:	out	std_logic_vector(34 downto 0));
	end component;

	type t_state is (A, B, C, D);
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
				if(confirm = '1' and pass = memOut_tmp(34 downto 33))then
					state <= C;
				else
					state <= B;
				end if;

			elsif(state = C)then
				if(confirm = '1')then
					state <= D;
				end if;
			
			elsif(state = D)then
				memIn_tmp <= memIn;
				sel_tmp <= memSel;
			end if;

		end if;
	end process;


end architecture;
