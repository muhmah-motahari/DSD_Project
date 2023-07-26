library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LightingSystem is
	port(tcode, user_light, length	:	in	std_logic_vector(3 downto 0);
			 wshade, lights_num	:	out	std_logic_vector(3 downto 0);
			 light_state	:	out	std_logic_vector(15 downto 0));
end entity;


architecture struct of LightingSystem is


	function calAreEnv (len : in std_logic_vector(3 downto 0)) return std_logic_vector is
		variable n, n2, res : integer;
	begin
		n := to_integer(unsigned(len));
		n2 := n * n;
		res := n2 / (4*n);
		return std_logic_vector(to_unsigned(res, len'length));
	end function;


	function lights_on (lights_number : in std_logic_vector(3 downto 0)) return std_logic_vector is
		variable light_st : std_logic_vector(15 downto 0) := "0000000000000000";
		variable int_tmp : integer;
	begin

		int_tmp := to_integer(unsigned(lights_number));

		if(int_tmp > 0) then
			for i in 0 to int_tmp-1 loop
				light_st(i) := '1';
			end loop;
		end if;

		return light_st;

	end function;


begin

	light_state <= "0000000000000000" when tcode = "0001" or tcode = "0010" or tcode = "0000" else
								 lights_on(user_light) when tcode = "1000" else
								 lights_on(calAreEnv(length)) when tcode = "0100";

	wshade <= "1111" when tcode = "0001" else
						"1011" when tcode = "0010" else
						"0000" when tcode = "1000" or tcode = "0000" else
						user_light when tcode = "0100";

	lights_num <= "0000" when tcode = "0001" or tcode = "0010" or tcode = "0000" else
								calAreEnv(length) when tcode = "0100" else
								user_light when tcode = "1000";

end architecture;
