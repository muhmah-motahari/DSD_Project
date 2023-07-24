library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity;

architecture struct of testbench is

	component CoolHeatSystems is
		port(chs_conf	:	in	std_logic_vector(7 downto 0);
				 chs_power	:	out	std_logic_vector(3 downto 0);
				 chs_mode	:	out	std_logic);
	end component;
	signal chs_conf	:	std_logic_vector(7 downto 0) := "00000000";
	signal chs_power	:	std_logic_vector(3 downto 0);
	signal chs_mode	:	std_logic;

begin

	UUT: CoolHeatSystems port map(chs_conf, chs_power, chs_mode);

	chs_conf(0) <= not chs_conf(0) after 2 ns;
	chs_conf(1) <= not chs_conf(1) after 4 ns;
	chs_conf(2) <= not chs_conf(2) after 8 ns;
	chs_conf(3) <= not chs_conf(3) after 16 ns;
	chs_conf(4) <= not chs_conf(4) after 32 ns;
	chs_conf(5) <= not chs_conf(5) after 64 ns;
	chs_conf(6) <= not chs_conf(6) after 128 ns;
	chs_conf(7) <= not chs_conf(7) after 256 ns;
	
	--chs_conf <= "00000000", "00000111" after 5 ns, "00000011" after 10 ns;

end architecture;
