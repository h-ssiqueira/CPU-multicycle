LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY ULA IS
	PORT( 	Cin				:IN	STD_LOGIC;
			ALUop			:IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
			X, Y			:IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
			S				:OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			Cout,Over		:OUT STD_LOGIC);
END ULA;
	
	ARCHITECTURE options OF ULA IS
	SIGNAL Result : STD_LOGIC_VECTOR(8 DOWNTO 0);
	BEGIN
	PROCESS (ALUop, X, Y, Result, Cin)
	BEGIN
		CASE ALUop IS
			WHEN "00" => -- AND
				S <= X AND Y;
				
				Cout <= '0';													-- Atribui 0 para overflow e carry out
				Over <= '0';
				
			WHEN "01" => -- OR
				S <= X OR Y; 
				
				Cout <= '0';													-- Atribui 0 para overflow e carry out
				Over <= '0';
				
			WHEN "10" => -- ADD
				Result <= ('0' & X) + Y + Cin;									-- Realiza a soma e guarda em uma variável auxiliar de 1 bit adicional
				
				S <= Result(7 DOWNTO 0);										-- Guarda a soma no output
				
				Cout <= Result(8);												-- Verifica se houve Cout
				Over <= Result(8) XOR X(7) XOR Y(7) XOR Result(7);				-- Verifica se houve Overflow
				
			WHEN "11" => -- SUB
				S <= X - Y;
				
				Cout <= Result(8);												-- Verifica se houve Cout
				Over <= Result(8) XOR X(7) XOR Y(7) XOR Result(7);				-- Verifica se houve Overflow
				
			WHEN OTHERS => NULL;
		END CASE; 
	END PROCESS;
	END options;