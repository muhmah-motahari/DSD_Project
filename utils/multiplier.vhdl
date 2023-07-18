library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity multiplier is
	generic(n : natural := 8);
	port(a, b : in std_logic_vector(n-1 downto 0);
			 res	:	out std_logic_vector(2*n downto 0));
end entity;


architecture struct of multiplier is
	signal a_integer_value, b_integer_value, res_integer_value : integer;
	component to_int is
		generic(n : natural := 8);
		port(bin : in std_logic_vector(n-1 downto 0);
				 res : out integer);
	end component;
begin

	cT1: to_int generic map (n) port map(a, a_integer_value);
	cT2: to_int generic map (n) port map(b, b_integer_value);

	res_integer_value <= a_integer_value * b_integer_value;

	res <= conv_std_logic_vector(res_integer_value, res'length);

end architecture;
