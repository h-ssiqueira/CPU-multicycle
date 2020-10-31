LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY ULA IS
	PORT( ALUSrcA,clock		:IN	STD_LOGIC;
			ALUop,ALUSrcB	:IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
			A, B,PC,Imed	:IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
			ALUout 			:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ULA;

	ARCHITECTURE options OF ULA IS
	SIGNAL Result : STD_LOGIC_VECTOR(8 DOWNTO 0);
	SIGNAL RB, RA : STD_LOGIC_VECTOR(7 DOWNTO 0);
	BEGIN
	PROCESS (ALUop, A, B, Result, ALUSrcA,ALUSrcB,clock, PC,Imed)
	BEGIN
		IF clock'EVENT AND clock = '1' THEN
			CASE ALUSrcB  IS
				WHEN "00" => --carrega direto o valor de B
					RB <= B;
				WHEN "01" => --caregga o valo '4'
					RB <= "00000100";
				WHEN "10" => -- carrega o imediato
					RB <= Imed;
				WHEN OTHERS => NULL;
			END CASE;

			CASE ALUSrcA IS
				WHEN '0' => --pega o valor de PC
					RA <= PC;
				WHEN '1' => --pega o valor de A
					RA <= A;
				WHEN OTHERS => NULL;
				END CASE;
			CASE ALUop IS
				WHEN "00" => -- AND

					ALUout <= RA AND RB;

				WHEN "01" => -- OR
					ALUout <= RA OR RB; 
					
				WHEN "10" => -- ADD
					Result <= ('0'& RA) + RB ;	 	--- Realiza a soma e guarda em uma variável auxiliar de 1 bit adicional
					
					ALUout <= Result(7 DOWNTO 0);	-- Guarda a soma no output
					
				WHEN "11" => -- SUB
					Result <= ('0'& RA) - RB;		--Realiza a subtracao e guarda em uma variavel auxiliar de 1 bit adicional
					
					ALUout <= Result(7 DOWNTO 0);	-- Guarda a soma no output
				WHEN OTHERS => NULL;
			END CASE; 
		END IF;
	END PROCESS;
	END options;