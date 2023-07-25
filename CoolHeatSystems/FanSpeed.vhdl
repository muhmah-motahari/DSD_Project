library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FanSpeed is
	port(speed	:	in	std_logic_vector(3 downto 0);
			 clk	:	in	std_logic;
			 pwd_data	:	out	std_logic);
end entity;

architecture struct of FanSpeed is
	signal onesNumber : integer := 0;
	signal counter : natural range 0 to 127 := 0;
begin

	onesNumber <= (((to_integer(unsigned(speed)) * 100) / 4) * 128) / 100;

	process(clk)
	begin

		if(clk = '1') then

			if(counter < 127)then
				counter <= counter + 1;
			else
				counter <= 0;
			end if;

			if counter < onesNumber then
				pwd_data <= '1';
			else
				pwd_data <= '0';
			end if;

		end if;

	end process;

end architecture;
