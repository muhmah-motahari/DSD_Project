library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity twobit_comp is
    Port (
        a : in STD_LOGIC_VECTOR(1 downto 0);
        b : in STD_LOGIC_VECTOR(1 downto 0);
        eq : out STD_LOGIC
    );
end entity twobit_comp;

architecture Behavioral of twobit_comp is
begin
    eq <= '1' when a = b else '0';

end architecture Behavioral;