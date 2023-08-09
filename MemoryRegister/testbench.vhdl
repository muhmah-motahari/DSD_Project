library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity;

architecture struct of testbench is

	component MemoryRegister is
		port(memIn	:	in	std_logic_vector(34 downto 0);
				 sel	:	in	std_logic_vector(2 downto 0);
				 memOut	:	out	std_logic_vector(34 downto 0));
	end component;

	signal memIn, memOut : std_logic_vector(34 downto 0) := "00000000000000000000000000000000000";
	signal sel : std_logic_vector(2 downto 0);
begin

	UUT: MemoryRegister port map(memIn, sel, memOut);

	memIn <= "00000000000000000000000000011111111" after 5 ns, "11000000000000000000000000000000000" after 20 ns;
	sel <= "001" after 5 ns, "111" after 20 ns;

end architecture;
