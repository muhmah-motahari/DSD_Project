library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GasDetector is
	Port ( 
				 clk          : in STD_LOGIC;
				 input_bit    : in STD_LOGIC;
				 output_bits  : out STD_LOGIC_VECTOR(2 downto 0)
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

	process(current_state, input_bit)
	begin
		next_state <= current_state; 

		case current_state is
			when s0 =>
				if input_bit = '1' then
					next_state <= s1;
				end if;

			when s1 =>
				if input_bit = '0' then
					next_state <= s2;
				end if;

			when s2 =>
				if input_bit = '1' then
					next_state <= s3;
				elsif input_bit = '0' then
					next_state <= s20;
				end if;

			when s3 =>
				if input_bit = '1' then
					next_state <= s4;
				else
					next_state <= s11;
				end if;

			when s4 =>
				if input_bit = '1' then
					next_state <= s5;
				else
					next_state <= s2;
				end if;

			when s5 =>
				if input_bit = '0' then
					next_state <= s6;
				else
					next_state <= s1;
				end if;

			when s6 =>
				if input_bit = '1' then
					next_state <= s7;
				else
					next_state <= s0;
				end if;

			when s7 =>
				if input_bit = '0' then
					next_state <= s8;
				else
					next_state <= s4;
				end if;

			when s8 =>
				if input_bit = '1' then
					next_state <= s9;
				else
					next_state <= s0;
				end if;

			when s9 =>
				if input_bit = '0' then
					next_state <= s10;
				else
					next_state <= s4;
				end if;

			when s10 =>
				if input_bit = '1' then
					next_state <= s3;
				else
					next_state <= s20;
				end if;

			when s11 =>
				if input_bit = '1' then
					next_state <= s12;
				else
					next_state <= s0;
				end if;

			when s12 =>
				if input_bit = '1' then
					next_state <= s1;
				else
					next_state <= s13;
				end if;

			when s13 =>
				if input_bit = '1' then
					next_state <= s12;
				else
					next_state <= s14;
				end if;

			when s14 =>
				if input_bit = '1' then
					next_state <= s15;
				else
					next_state <= s0;
				end if;

			when s15 =>
				if input_bit = '1' then
					next_state <= s1;
				else
					next_state <= s16;
				end if;

			when s16 =>
				if input_bit = '1' then
					next_state <= s2;
				else
					next_state <= s17;
				end if;

			when s17 =>
				if input_bit = '1' then
					next_state <= s18;
				else
					next_state <= s0;
				end if;

			when s18 =>
				if input_bit = '1' then
					next_state <= s19;
				else
					next_state <= s2;
				end if;

			when s19 =>
				if input_bit = '1' then
					next_state <= s1;
				else
					next_state <= s2;
				end if;

			when s20 =>
				if input_bit = '1' then
					next_state <= s21;
				else
					next_state <= s0;
				end if;

			when s21 =>
				if input_bit = '1' then
					next_state <= s1;
				else
					next_state <= s22;
				end if;

			when s22 =>
				if input_bit = '1' then
					next_state <= s1;
				else
					next_state <= s23;
				end if;

			when s23 =>
				if input_bit = '1' then
					next_state <= s24;
				else
					next_state <= s0;
				end if;

			when s24 =>
				if input_bit = '1' then
					next_state <= s1;
				else
					next_state <= s25;
				end if;

			when s25 =>
				if input_bit = '1' then
					next_state <= s1;
				else
					next_state <= s26;
				end if;

			when s26 =>
				if input_bit = '1' then
					next_state <= s24;
				else
					next_state <= s0;
				end if;

			when others =>
				next_state <= s0;  
		end case;


		case current_state is
			when s10 =>
				output_bits <= "001";

			when s19 =>
				output_bits <= "010";

			when s26 =>
				output_bits <= "100";

			when others =>
				output_bits <= "000";  
		end case;
	end process;

end architecture Behavioral;
