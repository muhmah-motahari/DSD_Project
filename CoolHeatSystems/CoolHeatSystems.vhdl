library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CoolHeatSystems is
	port(chs_conf	:	in	std_logic_vector(7 downto 0);   --input determine mode and power of the system
			chs_power	:	out	std_logic_vector(3 downto 0);  --adjust power of the fan
			chs_mode	:	out	std_logic);  -- determine mode of the system 
end entity;

architecture struct of CoolHeatSystems is
	signal count	:	integer	:=	0;

	function parityChecker(s : std_logic_vector) return integer is   --this function return number of ones in input vector 
	variable temp : natural := 0;
	begin
		for i in s'range loop
			if s(i) = '1' then temp := temp + 1; 
			end if;
		end loop;

		return temp;
	end function parityChecker;

	function evenParity(num : integer) return std_logic is --this function check even parity of the input
		variable res : std_logic;
	begin
		if (num mod 2) = 0 then
			res := '0';
		else
			res := '1';
		end if;
		return res;
	end function;
	
begin 
	process(chs_conf) 
	begin

		count <= parityChecker(chs_conf);

		chs_mode <= evenParity(count);

		chs_power <= std_logic_vector(to_unsigned(count, chs_power'length));

	end process;

end architecture;
