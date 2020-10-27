LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY ULA IS
	PORT( 	Cin				:IN	STD_LOGIC;
			ALUop			:IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
			X, Y			:IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
			S				:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ULA;
	
	ARCHITECTURE options OF ULA IS
	SIGNAL Result : STD_LOGIC_VECTOR(8 DOWNTO 0);
	BEGIN
	PROCESS (ALUop, X, Y, Result, Cin)
	BEGIN
		CASE ALUop IS
			WHEN "00" => -- AND
				S <= X AND Y;
				
			WHEN "01" => -- OR
				S <= X OR Y; 
				
			WHEN "10" => -- ADD
				Result <= ('0' & X) + Y + Cin;									-- Realiza a soma e guarda em uma variável auxiliar de 1 bit adicional
				
				S <= Result(7 DOWNTO 0);										-- Guarda a soma no output
				
			WHEN "11" => -- SUB
				S <= X - Y;
				
			WHEN OTHERS => NULL;
		END CASE; 
	END PROCESS;
	END options;