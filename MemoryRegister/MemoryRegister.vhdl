library ieee;
use ieee.std_logic_1164.all;


entity MemoryRegister is
	port(memIn	:	in	std_logic_vector(34 downto 0);  --memory input 
			sel	:	in	std_logic_vector(2 downto 0); --sel pin of memory 
			memOut	:	out	std_logic_vector(34 downto 0));  --memory output
end entity;


architecture struct of MemoryRegister is
	signal mem	:	std_logic_vector(34 downto 0) := "11000000000000000000000000000000000"; --temp signal to store memory instructions 
begin
	memOut <= mem;

	process(memIn, sel)
	begin

		case sel is
			when "001" => 
				mem(7 downto 0) <= memIn(7 downto 0); --setting  for module 1 
			when "011" =>
				mem(15 downto 8) <= memIn(15 downto 8); --setting  for module 3
			when "100" =>
				mem(23 downto 16) <= memIn(23 downto 16); --setting  for module 4
			when "101" =>
				mem(32 downto 24) <= memIn(32 downto 24); --setting  for module 5
			when "111" =>
				mem(34 downto 33) <= memIn(34 downto 33); --setting  for module 7
			when others =>
				null;
		end case;

	end process;


end architecture;
