LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY REGS IS
	PORT( 	RegWrite, load, reset			:IN	STD_LOGIC;							-- sinal do controlador e sinais de load e reset
			regA, regB, writeR				:IN	STD_LOGIC_VECTOR(2 DOWNTO 0); 		-- Controle dos registradores a serem usados
			data							:IN	STD_LOGIC_VECTOR(7 DOWNTO 0); 		-- Informações a serem escritas em um registrador
			R0, R1, R2, R3, R4, R5, R6, R7	:BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0); 	-- Registradores
			Rdata1, Rdata2					:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); 	-- saída de informações dos registradores
END REGS;
	
	ARCHITECTURE options OF REGS IS
	BEGIN
	PROCESS (RegWrite, regA, regB, writeR, data, load, reset, R0, R1, R2, R3, R4, R5, R6, R7)
	BEGIN
	
		CASE RESET IS -- RESET zera todos os registradores
		
			WHEN '1' =>
				R0 <= "00000000";
				R1 <= "00000000";
				R2 <= "00000000";
				R3 <= "00000000";
				R4 <= "00000000";
				R5 <= "00000000";
				R6 <= "00000000";
				R7 <= "00000000";
				
			WHEN OTHERS => NULL;
			
		END CASE;
		
		CASE LOAD IS	-- Load carrega os valores de 0 a 7 em cada registrador
		
			WHEN '1' =>
				R0 <= "00000000";
				R1 <= "00000001";
				R2 <= "00000010";
				R3 <= "00000011";
				R4 <= "00000100";
				R5 <= "00000101";
				R6 <= "00000110";
				R7 <= "00000111";
				
			WHEN OTHERS => NULL;
			
		END CASE;
		
		cASE RegWrite IS
		
			WHEN '0' => -- Sem escrita
				CASE regA IS
				
					WHEN "000" =>
						Rdata1 <= R0; -- Lê de R0 para a saída A
						
					WHEN "001" =>
						Rdata1 <= R1; -- Lê de R1 para a saída A
						
					WHEN "010" =>
						Rdata1 <= R2; -- Lê de R2 para a saída A
						
					WHEN "011" =>
						Rdata1 <= R3; -- Lê de R3 para a saída A
						
					WHEN "100" =>
						Rdata1 <= R4; -- Lê de R4 para a saída A
						
					WHEN "101" =>
						Rdata1 <= R5; -- Lê de R5 para a saída A
						
					WHEN "110" =>
						Rdata1 <= R6; -- Lê de R6 para a saída A
						
					WHEN "111" =>
						Rdata1 <= R7; -- Lê de R7 para a saída A

					WHEN OTHERS => NULL;
					
				END CASE;
				
				CASE regB IS
				
					WHEN "000" =>
						Rdata2 <= R0; -- Lê de R0 para a saída B
						
					WHEN "001" =>
						Rdata2 <= R1; -- Lê de R1 para a saída B
						
					WHEN "010" =>
						Rdata2 <= R2; -- Lê de R2 para a saída B
						
					WHEN "011" =>
						Rdata2 <= R3; -- Lê de R3 para a saída B

					WHEN "100" =>
						Rdata2 <= R4; -- Lê de R4 para a saída B
						
					WHEN "101" =>
						Rdata2 <= R5; -- Lê de R5 para a saída B
						
					WHEN "110" =>
						Rdata2 <= R6; -- Lê de R6 para a saída B
						
					WHEN "111" =>
						Rdata2 <= R7; -- Lê de R7 para a saída B
						
					WHEN OTHERS => NULL;
					
				END CASE;
			WHEN '1' => -- Com escrita
				CASE writeR IS
				
					WHEN "000" =>
						R0 <= data; -- Escreve em R0
						Rdata1 <= "00000000";
						Rdata2 <= "00000000";
						
					WHEN "001" =>
						R1 <= data; -- Escreve em R1
						Rdata1 <= "00000000";
						Rdata2 <= "00000000";
						
					WHEN "010" =>
						R2 <= data; -- Escreve em R2
						Rdata1 <= "00000000";
						Rdata2 <= "00000000";
						
					WHEN "011" =>
						R3 <= data; -- Escreve em R3
						Rdata1 <= "00000000";
						Rdata2 <= "00000000";
						
					WHEN "100" =>
						R4 <= data; -- Escreve em R4
						Rdata1 <= "00000000";
						Rdata2 <= "00000000";
						
					WHEN "101" =>
						R5 <= data; -- Escreve em R5
						Rdata1 <= "00000000";
						Rdata2 <= "00000000";
						
					WHEN "110" =>
						R6 <= data; -- Escreve em R6
						Rdata1 <= "00000000";
						Rdata2 <= "00000000";
						
					WHEN "111" =>
						R7 <= data; -- Escreve em R7
						Rdata1 <= "00000000";
						Rdata2 <= "00000000";

					WHEN OTHERS => NULL;
					
				END CASE;
				
			WHEN OTHERS => NULL;
			
		END CASE;
	END PROCESS;
	END options;
				
		