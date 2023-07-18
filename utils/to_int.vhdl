library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity to_int is
	generic(n : natural := 8);
	port(bin : in std_logic_vector(n-1 downto 0);
			 res : out integer);
end entity;


architecture struct of to_int is
begin

	res <= to_integer(signed(bin));

end architecture;
