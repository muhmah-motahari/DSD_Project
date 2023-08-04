--this module used from X^8 + X^2 + X + 1 polynomial with CRC-8 bit formula
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity DanceLight is
    port (
        clk  : in  STD_LOGIC;                        -- Clock input
        load : in  STD_LOGIC;                        -- Load signal 
        din  : in  STD_LOGIC;                        -- Data input (1 bit)
        p    : in  STD_LOGIC_VECTOR(7 downto 0);     
        q    : inout STD_LOGIC_VECTOR(7 downto 0)      -- Dance light pattern 
    );
end entity DanceLight;

architecture Behavioral of DanceLight is
    signal p_reg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');  -- Register to store pattern 
    signal q0 : STD_LOGIC;

begin
    process (clk)
    begin
        if rising_edge(clk) then
          
            p_reg(7) <= din xor q0;
            p_reg(6) <= p_reg(7);
            p_reg(5) <= p_reg(6) xor q0;
            p_reg(4) <= p_reg(5) xor q0;
            p_reg(3) <= p_reg(4);
            p_reg(2) <= p_reg(3);
            p_reg(1) <= p_reg(2) xor q0;
            p_reg(0) <= p_reg(1) xor q0;

            if load = '1' then
                p_reg <= p;
            end if;

            q0 <= p_reg(0);
        end if;
    end process;
    q <= p_reg;

end Behavioral;
