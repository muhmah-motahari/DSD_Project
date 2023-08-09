library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity;

architecture struct of testbench is

	component ConfigAndPassword is
		port(request : in std_logic;
				 confirm : in std_logic;
				 pass	:	in	std_logic_vector(1 downto 0);  --two bit input password 
				 memIn	:	in	std_logic_vector(34 downto 0);  --set memory content
				 memSel	:	in	std_logic_vector(2 downto 0);  --sel memory 
				 clk	:	in	std_logic;
				 memOut	:	out	std_logic_vector(34 downto 0));  --get memory content 
	end component;

	signal request, confirm, clk : std_logic := '0';
	signal pass : std_logic_vector(1 downto 0) := "00";
	signal memIn, memOut : std_logic_vector(34 downto 0);
	signal memSel : std_logic_vector(2 downto 0) := "001";
begin
	UUT: ConfigAndPassword port map(request, confirm, pass, memIn, memSel, clk, memOut);

	clk <= not clk after 5 ns;

	request <= '1' after 14 ns;

	pass <= "11";
	confirm <= '1';
	memIn <= "00111111111000000000000000000000000";
	memSel <= "101";

end architecture;
