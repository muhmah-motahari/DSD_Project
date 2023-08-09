library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GasDetector is
	Port ( 
				 clk      : in STD_LOGIC;
				 din			: in STD_LOGIC;
				 gas_mode	: out STD_LOGIC_VECTOR(2 downto 0)
			 );
end entity;

architecture Behavioral of GasDetector is
	type StateType is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26);
	signal current_state, next_state : StateType := s0;

begin
	process(clk)
	begin
		if rising_edge(clk) then
			current_state <= next_state;
		end if;
	end process;

	process(current_state, din)
	begin
		next_state <= current_state; 

		case current_state is
			when s0 =>
				if din = '1' then
					next_state <= s1;
				end if;

			when s1 =>
				if din = '0' then
					next_state <= s2;
				end if;

			when s2 =>
				if din = '1' then
					next_state <= s3;
				elsif din = '0' then
					next_state <= s20;
				end if;

			when s3 =>
				if din = '1' then
					next_state <= s4;
				else
					next_state <= s11;
				end if;

			when s4 =>
				if din = '1' then
					next_state <= s5;
				else
					next_state <= s2;
				end if;

			when s5 =>
				if din = '0' then
					next_state <= s6;
				else
					next_state <= s1;
				end if;

			when s6 =>
				if din = '1' then
					next_state <= s7;
				else
					next_state <= s0;
				end if;

			when s7 =>
				if din = '0' then
					next_state <= s8;
				else
					next_state <= s4;
				end if;

			when s8 =>
				if din = '1' then
					next_state <= s9;
				else
					next_state <= s0;
				end if;

			when s9 =>
				if din = '0' then
					next_state <= s10;
				else
					next_state <= s4;
				end if;

			when s10 =>
				if din = '1' then
					next_state <= s3;
				else
					next_state <= s20;
				end if;

			when s11 =>
				if din = '1' then
					next_state <= s12;
				else
					next_state <= s0;
				end if;

			when s12 =>
				if din = '1' then
					next_state <= s1;
				else
					next_state <= s13;
				end if;

			when s13 =>
				if din = '1' then
					next_state <= s12;
				else
					next_state <= s14;
				end if;

			when s14 =>
				if din = '1' then
					next_state <= s15;
				else
					next_state <= s0;
				end if;

			when s15 =>
				if din = '1' then
					next_state <= s1;
				else
					next_state <= s16;
				end if;

			when s16 =>
				if din = '1' then
					next_state <= s2;
				else
					next_state <= s17;
				end if;

			when s17 =>
				if din = '1' then
					next_state <= s18;
				else
					next_state <= s0;
				end if;

			when s18 =>
				if din = '1' then
					next_state <= s19;
				else
					next_state <= s2;
				end if;

			when s19 =>
				if din = '1' then
					next_state <= s1;
				else
					next_state <= s2;
				end if;

			when s20 =>
				if din = '1' then
					next_state <= s21;
				else
					next_state <= s0;
				end if;

			when s21 =>
				if din = '1' then
					next_state <= s1;
				else
					next_state <= s22;
				end if;

			when s22 =>
				if din = '1' then
					next_state <= s1;
				else
					next_state <= s23;
				end if;

			when s23 =>
				if din = '1' then
					next_state <= s24;
				else
					next_state <= s0;
				end if;

			when s24 =>
				if din = '1' then
					next_state <= s1;
				else
					next_state <= s25;
				end if;

			when s25 =>
				if din = '1' then
					next_state <= s1;
				else
					next_state <= s26;
				end if;

			when s26 =>
				if din = '1' then
					next_state <= s24;
				else
					next_state <= s0;
				end if;

			when others =>
				next_state <= s0;  
		end case;


		case current_state is
			when s10 =>
				gas_mode <= "001";

			when s19 =>
				gas_mode <= "010";

			when s26 =>
				gas_mode <= "100";

			when others =>
				gas_mode <= "000";  
		end case;
	end process;

end architecture Behavioral;
