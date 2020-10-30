LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY ULA IS
	PORT( 	Cin,clock				:IN	STD_LOGIC;
			ALUop			:IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
			A, B			:IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
			ALUout			:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ULA;
	
	ARCHITECTURE options OF ULA IS
	SIGNAL Result : STD_LOGIC_VECTOR(8 DOWNTO 0);
	BEGIN
	PROCESS (ALUop, A, B, Result, Cin,clock)
	BEGIN
		IF clock'EVENT AND clock = '1' THEN
			CASE ALUop IS
				WHEN "00" => -- AND
					ALUout <= A AND B;
					
				WHEN "01" => -- OR
					ALUout <= A OR B; 
					
				WHEN "10" => -- ADD
					Result <= ('0' & A) + B + Cin;									-- Realiza a soma e guarda em uma variável auxiliar de 1 bit adicional
					
					ALUout <= Result(7 DOWNTO 0);										-- Guarda a soma no output
					
				WHEN "11" => -- SUB
					ALUout <= A - B;
					
				WHEN OTHERS => NULL;
			END CASE; 
		END IF;
	END PROCESS;
	END options;