library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CoolHeatSystems is
	port(chs_conf	:	in	std_logic_vector(7 downto 0);
			chs_power	:	out	std_logic_vector(3 downto 0);  --adjust power of the fan
			chs_mode	:	out	std_logic);  -- determine mode of the system 
end entity;

architecture struct of CoolHeatSystems is
	signal count	:	integer	:=	0;

	function parityChecker(s : std_logic_vector) return integer is
	variable temp : natural := 0;
	begin
		for i in s'range loop
			if s(i) = '1' then temp := temp + 1; 
			end if;
		end loop;

		return temp;
	end function parityChecker;
	
begin 
	process(chs_conf)
	begin

		count <= parityChecker(chs_conf);

		if (count mod 2) = 0 then
			chs_mode <= '0';
		else
			chs_mode <= '1';
		end if;

		chs_power <= std_logic_vector(to_unsigned(count, chs_power'length));

	end process;

end architecture;
