library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Divider64 is
	generic(n	:		natural	:=	32);
	port(a	:	in	std_logic_vector(n-1 downto 0);
			res	:	out	std_logic_vector(n-1 downto 0));
end entity;


architecture struct of Divider64 is

begin

	res <= std_logic_vector(shift_right(unsigned(a), 6));

end architecture;
