library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity;

architecture struct of testbench is

	component LightingSystem is
		port(tcode, user_light, length	:	in	std_logic_vector(3 downto 0);
		wshade, lights_num	:	out	std_logic_vector(3 downto 0);
		light_state	:	out	std_logic_vector(15 downto 0));
	end component;

	signal tcode, user_light, length, wshade, lights_num : std_logic_vector(3 downto 0) := "0000";
	signal light_state : std_logic_vector(15 downto 0) := "0000000000000000";

begin
	UUT: LightingSystem port map(tcode, user_light, length, wshade, lights_num, light_state);

	tcode <= "0001", "0010" after 10 ns, "0100" after 20 ns, "1000" after 30 ns, "0000" after 40 ns;
	user_light <= "0011";
	length <= "0100";


end architecture;
