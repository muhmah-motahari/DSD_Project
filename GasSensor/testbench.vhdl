library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity;

architecture struct of testbench is

	component GasDetector is
		Port ( 
					 clk          : in STD_LOGIC;
					 input_bit    : in STD_LOGIC;
					 output_bits  : out STD_LOGIC_VECTOR(2 downto 0)
				 );
	end component;

	signal clk, input_bit : std_logic := '0';
	signal output_bits : std_logic_vector(2 downto 0);
begin

	UUT: GasDetector port map(clk, input_bit, output_bits);

	clk <= not clk after 5 ns;
	input_bit <= '1' after 4 ns, '0' after 14 ns, '1' after 24 ns, '1' after 34 ns, '1' after 44 ns, '0' after 54 ns, '1' after 64 ns, '0' after 74 ns, '1' after 84 ns, '0' after 94 ns, 
	'1' after 104 ns, '0' after 114 ns, '1' after 124 ns, '0' after 134 ns, '1' after 144 ns, '0' after 154 ns, '0' after 164 ns, '1' after 174 ns, '0' after 184 ns, '0' after 194 ns, '1' after 204 ns, '1' after 214 ns, 
	'1' after 224 ns, '0' after 234 ns, '0' after 244 ns, '1' after 254 ns, '0' after 264 ns, '0' after 274 ns, '1' after 284 ns, '0' after 294 ns, '0' after 304 ns;

end architecture;
