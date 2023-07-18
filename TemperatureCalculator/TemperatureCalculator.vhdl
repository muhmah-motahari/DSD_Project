library ieee;
use ieee.std_logic_1164.all;


entity TemperatureCalculator is
	port(base 		: in	std_logic_vector(31 downto 0);
			 ref			:	in	std_logic_vector(7 downto 0);
			 adc_data	:	in	std_logic_vector(15 downto 0);
			 tempc		:	out	std_logic_vector(31 downto 0));
end entity;


architecture struct of TemperatureCalculator is

	component AdderSubtractor is
		generic(n : natural := 32);
		port(a, b :	in	std_logic_vector(n-1 downto 0);
				 mode : in	std_logic;
				 res	: out	std_logic_vector(n-1 downto 0));
	end component ;

	component multiplier is
		generic(n : natural := 8);
		port(a, b : in std_logic_vector(n-1 downto 0);
				 res	:	out std_logic_vector(2*n downto 0));
	end component;

	component Divider64 is
		generic(n	:	natural	:=	32);
		port(a		:	in	std_logic_vector(n-1 downto 0);
				 res	:	out	std_logic_vector(n-1 downto 0));
	end component ;
	
	signal ref2, adc	: std_logic_vector(15 downto 0);
	signal p32, p32_n	:	std_logic_vector(31 downto 0);

begin
	adc <= '0' & adc_data(14 downto 0);

	lM1:	multiplier generic map(8) port map(ref, ref, ref2);
	lM2:	multiplier generic map(16) port map(ref2, adc, p32);

	lD1:	Divider64	generic map(32)	port map(p32, p32_n);

	lA1:	AdderSubtractor generic map(32) port map(base, p32_n, adc_data(15), tempc);

end architecture;
