library ieee;
use ieee.std_logic_1164.all;

entity GasSensor is
	port(din, clk	:	in	std_logic;
			gas_mode	:	out	std_logic_vector(2 downto 0));
end entity;

architecture struct of GasSensor is
	type state is (s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9, s1_10,
								s2_1, s2_2, s2_3, s2_4, s2_5, s2_6, s2_7, s2_8, s2_9, s2_10, s2_11, s2_12,
								s3_1, s3_2, s3_3, s3_4, s3_5, s3_6, s3_7, s3_8, s3_9);
	signal gas1, gas2, gas3 : std_logic := '0';
	signal state

begin

	process(din, clk)
	begin
		if(clk'event and clk = '1')
			if
		end if;

	end process;

	gas_mod <= gas1 & gas2 & gas3;

end architecture;
