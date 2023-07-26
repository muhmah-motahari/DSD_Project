library ieee;
use ieee.std_logic_1164.all;


entity MemoryRegister is
	port(memIn	:	in	std_logic_vector(34 downto 0);
			sel	:	in	std_logic_vector(2 downto 0);
			memOut	:	out	std_logic_vector(34 downto 0));
end entity;


architecture struct of MemoryRegister is
	signal mem	:	std_logic_vector(34 downto 0) := (others => '0');
begin
	memOut <= mem;

	process(memIn, sel)
	begin

		case sel is
			when "001" =>
				mem(7 downto 0) <= memIn(7 downto 0);
			when "011" =>
				mem(15 downto 8) <= memIn(15 downto 8);
			when "100" =>
				mem(23 downto 16) <= memIn(23 downto 16);
			when "101" =>
				mem(32 downto 24) <= memIn(32 downto 24);
			when "111" =>
				mem(34 downto 33) <= memIn(34 downto 33);
			when others =>
				mem <= (others => 'X');
		end case;

	end process;


end architecture;
