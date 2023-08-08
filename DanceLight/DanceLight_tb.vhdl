library ieee;
use ieee.std_logic_1164.all;

entity DanceLight_tb is
end entity;

architecture struct of DanceLight_tb is

	component DanceLight is
		port (
					 clk  : in  STD_LOGIC;                        -- Clock input
					 load : in  STD_LOGIC;                        -- Load signal 
					 din  : in  STD_LOGIC;                        -- Data input (1 bit)
					 p    : in  STD_LOGIC_VECTOR(7 downto 0);     
					 q    : inout STD_LOGIC_VECTOR(7 downto 0)      -- generated Dance light pattern 
				 );
	end component;

	signal clk, load, din : std_logic := '0';
	signal p, q : std_logic_vector(7 downto 0) := "00000000";
begin

	clk <= not clk after 5 ns;
	p <= "00001111";
	load <= not load after 12 ns;
	din <= not din after 22 ns;

	UUT: DanceLight port map(clk, load, din, p, q);

end architecture;
