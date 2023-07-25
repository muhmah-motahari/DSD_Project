library ieee;
use ieee.std_logic_1164.all;

entity FanSpeedTB is
	end entity;

architecture struct of FanSpeedTB is

	component FanSpeed is
		port(speed	:	in	std_logic_vector(3 downto 0);
				 clk	:	in	std_logic;
				 pwd_data	:	out	std_logic);
	end component;

	signal clk, pwd_data : std_logic := '0';
	signal speed : std_logic_vector(3 downto 0) := "0000";
begin

	UUT: FanSpeed port map(speed, clk, pwd_data);
	clk <= not clk after 5 ns;
	speed <= "0010";

end architecture;
