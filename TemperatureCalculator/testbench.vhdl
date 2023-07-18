library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity;

architecture struct of testbench is

	component TemperatureCalculator is
		port(base 		: in	std_logic_vector(31 downto 0);
				 ref			:	in	std_logic_vector(7 downto 0);
				 adc_data	:	in	std_logic_vector(15 downto 0);
				 tempc		:	out	std_logic_vector(31 downto 0));
	end component;

	signal base, tempc	:	std_logic_vector(31 downto 0);
	signal ref	:	std_logic_vector(7 downto 0);
	signal adc_data	:	std_logic_vector(15 downto 0);

begin

	

end architecture;
