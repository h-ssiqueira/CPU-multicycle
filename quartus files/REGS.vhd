LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY REGS IS
	PORT( 	RegWrite,clock,RESET0,RegDst0						:IN	STD_LOGIC;							-- sinal do controlador de escrita
			MovtoReg						:IN STD_LOGIC_VECTOR(1 DOWNTO 0);		-- Sinal do multiplexador de escrita
			Rs, Rt						:IN	STD_LOGIC_VECTOR(2 DOWNTO 0); 		-- Controle dos registradores a serem usados
			ExtImmediate,ALUout					:IN	STD_LOGIC_VECTOR(7 DOWNTO 0); 		-- Informações a serem escritas em um registrador
			R0, R1, R2, R3, R4, R5, R6, R7	:BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0); 	-- Registradores
			RA, RB							:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); 	-- saída de informações dos registradores
END REGS;
	
	ARCHITECTURE opcao OF REGS IS
	COMPONENT REGSint IS
    PORT(
        RegWrite1,clock1,RESET1,RegDst						:IN	STD_LOGIC;							-- sinal do controlador de escrita
        MovtoReg1						:IN STD_LOGIC_VECTOR(1 DOWNTO 0);		-- Sinal do multiplexador de escrita
        Rs1, Rt1					:IN	STD_LOGIC_VECTOR(2 DOWNTO 0); 		-- Controle dos registradores a serem usados
        ExtImmediate1,ALUout1					:IN	STD_LOGIC_VECTOR(7 DOWNTO 0); 		-- Informações a serem escritas em um registrador
        R0, R1, R2, R3, R4, R5, R6, R7	:BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0); 	-- Registradores
        RA1, RB1						:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); 	-- saída de informações dos registradores
	END COMPONENT;
	BEGIN
	REG: REGSint PORT MAP (RegWrite,clock,RESET0, RegDst0, MovtoReg, Rs, Rt, ExtImmediate, ALUout, R0, R1, R2, R3, R4, R5, R6, R7, RA, RB);
		
	END opcao;