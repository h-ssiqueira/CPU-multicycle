LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CPU IS
	PORT(
            clock0, reset :IN   STD_LOGIC;
				R_0, R_1, R_2, R_3, R_4, R_5, R_6, R_7 : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
				PC : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
				ALURESULT : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
				--MEMORY :BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
				A,B :BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0)
				--IMED8 :BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
				--IMED6 :BUFFER STD_LOGIC_VECTOR(5 DOWNTO 0);
				--OPcode :BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
				--RT,RS :BUFFER STD_LOGIC_VECTOR(2 DOWNTO 0);
				--MOVTOREG,ALUSRCB,ALUOP :BUFFER STD_LOGIC_VECTOR(1 DOWNTO 0);
				--PCWRITE,IRWRITE,REGDST,REGWRITE,ALUSRCA :BUFFER STD_LOGIC
				);
END CPU;

    ARCHITECTURE behavior OF CPU IS
	 
	 -- Componente da memória considerando PC como STD_LOGIC_VECTOR(7 DOWNTO 0)
    --COMPONENT memoria64x4 IS
        --PORT(
            --clock				:IN STD_LOGIC;
            --address			:IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- VALOR DE PC
            --memdata			:OUT STD_LOGIC_VECTOR(15 DOWNTO 0) -- SAIDA DE 16 BITS PARA INSTRUCTION REGISTER
        --);
    --END COMPONENT;
	 
	 -- Componente da memória considerando PC como inteiro (PC+memória como componente)
	 COMPONENT memoria64x4int IS
			PORT(
				clock,PCWrite1,reset1				:IN STD_LOGIC;
				memdata			:OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
		END COMPONENT;
	 
	 -- Componente externa do IR
    --COMPONENT IRext IS
	--PORT( 
            --Mem              		            :IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            --IRWrite1, clock1           :IN STD_LOGIC;
         	--Opcode                              :OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           	--Rs,Rt                            :OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
           	--Immediate             	            :OUT STD_LOGIC_VECTOR (5 DOWNTO 0));
    --END COMPONENT;
	 
	 -- Componente interna do IR
	 COMPONENT IR IS
	PORT( 
            Memdata         					:IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            IRWrite, clock    		:IN STD_LOGIC;
         	inst15_12               		:OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           	inst11_09,inst08_06	:OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
           	inst05_00             			:OUT STD_LOGIC_VECTOR (5 DOWNTO 0));
	END COMPONENT;
	 
	 -- Componente externa do banco de registradores
    --COMPONENT REGS IS
	--PORT( 	RegWrite,clock,RESET0,RegDst0					:IN	STD_LOGIC;							-- sinal do controlador de escrita
			--MovtoReg						:IN STD_LOGIC_VECTOR(1 DOWNTO 0);		-- Sinal do multiplexador de escrita
			--Rs, Rt						:IN	STD_LOGIC_VECTOR(2 DOWNTO 0); 		-- Controle dos registradores a serem usados
			--ExtImmediate,ALUout				:IN	STD_LOGIC_VECTOR(7 DOWNTO 0); 		-- Informações a serem escritas em um registrador
			--R0, R1, R2, R3, R4, R5, R6, R7	:BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0); 	-- Registradores
			--RA, RB							:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); 	-- saída de informações dos registradores
    --END COMPONENT;
	 
	 -- Componente interna do banco de registradores
	 COMPONENT REGSint IS
    PORT(
        RegWrite1,clock1,RESET1,RegDst						:IN	STD_LOGIC;							-- sinal do controlador de escrita
        MovtoReg1						:IN STD_LOGIC_VECTOR(1 DOWNTO 0);		-- Sinal do multiplexador de escrita
        Rs1, Rt1					:IN	STD_LOGIC_VECTOR(2 DOWNTO 0); 		-- Controle dos registradores a serem usados
        ExtImmediate1,ALUout1					:IN	STD_LOGIC_VECTOR(7 DOWNTO 0); 		-- Informações a serem escritas em um registrador
        R0, R1, R2, R3, R4, R5, R6, R7	:BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0); 	-- Registradores
        RA1, RB1						:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); 	-- saída de informações dos registradores
	END COMPONENT;
	 
	 -- Componente de sinal estendido
    COMPONENT SignExtend IS
	PORT( 	Immediate		:IN	STD_LOGIC_VECTOR(5 DOWNTO 0);
			ExtImmediate	:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT;
	 
	 -- Componente da máquina de estados
    COMPONENT StateMachine IS
    PORT(   clock, reset                                        :IN STD_LOGIC;
            opcode                                              :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            PCWrite1, IRWrite1, REGWrite1, ALUSrcA1, RegDst1    :OUT STD_LOGIC;
            MovtoReg1, ALUSrcB1, ALUOp1                         :OUT STD_LOGIC_VECTOR(1 DOWNTO 0)			
    );
    END COMPONENT;
	 
	 -- Componente externa da ULA
    --COMPONENT ULAExt IS
	--PORT( ALUSrcA1,clock1		:IN	STD_LOGIC;
			--ALUop1,ALUSrcB1	    :IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
			--A1, B1,PC1,Imed1    :IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
			--ALUout1 		    :OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    --END COMPONENT;
	
		-- Componente interna da ULA
	 COMPONENT ULA IS
	PORT( ALUSrcA,clock		:IN	STD_LOGIC;
			ALUop,ALUSrcB	:IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
			A, B,PC,Imed	:IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
			ALUout 			:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;
	 
	 -- Componente de PC (STD_LOGIC_VECTOR)
	 --COMPONENT PCATT IS
	--PORT( PCWrite1,CLOCK1		:IN STD_LOGIC;
			--ADDRESS		:IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
			--ADDRESSATT	:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	--END COMPONENT;
	 
	 SIGNAL MEMORY : STD_LOGIC_VECTOR(15 DOWNTO 0);
	 --SIGNAL A,B : STD_LOGIC_VECTOR(7 DOWNTO 0);
	 SIGNAL IMED8 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	 --SIGNAL ALURESULT :  STD_LOGIC_VECTOR(7 DOWNTO 0);
	 --SIGNAL PC :  STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
	 SIGNAL IMED6 : STD_LOGIC_VECTOR(5 DOWNTO 0);
	 SIGNAL OPcode : STD_LOGIC_VECTOR(3 DOWNTO 0);
	 SIGNAL RT,RS : STD_LOGIC_VECTOR(2 DOWNTO 0);
	 SIGNAL MOVTOREG,ALUSRCB,ALUOP : STD_LOGIC_VECTOR(1 DOWNTO 0);
	 SIGNAL PCWRITE,IRWRITE,REGDST,REGWRITE,ALUSRCA : STD_LOGIC;
	 
	 
	 BEGIN
    --PROCESS(clock0,reset,MEMORY,PC,ALURESULT,A,B,IMED8,IMED6,OPcode,RT,RS,RD,MOVTOREG,ALUSRCB,ALUOP,PCWRITE,IRWRITE,REGWRITE,REGDST,ALUSRCA,R_0, R_1, R_2, R_3, R_4, R_5, R_6, R_7)
	 --BEGIN
			--IF reset = '0' THEN 
				--PC := "00000000";
			--END IF;
			
			
			-- PC
			 --PCI: PCATT PORT MAP (PCWRITE,clock0,ALURESULT,PC);
			 
			 -- STATE MACHINE
			 STAT: StateMachine PORT MAP(clock0,reset,OPcode,PCWRITE,IRWRITE,REGWRITE,ALUSRCA,REGDST,MOVTOREG,ALUSRCB,ALUOP);
			 
			 -- MEMORY
			 --MMR: memoria64x4 PORT MAP(clock0,PC,MEMORY); -- Considerando PC como binário
			 MMR: memoria64x4int PORT MAP(clock0, PCWRITE,reset,MEMORY); -- União de PCATT com memoria64x4 (PC como inteiro)
			 
			 --INSTRUCTION REGISTER
			 --IRS: IRext PORT MAP(MEMORY,IRWRITE,clock0,REGDST,OPcode,RS,RT,IMED6); -- externa
			 IRS: IR PORT MAP(MEMORY,IRWRITE,clock0,OPcode,RS,RT,IMED6); -- interna
			 
			 -- SIGN - EXTEND
			 SIGN: SignExtend PORT MAP(IMED6,IMED8);
			 
			 -- BANK REGISTER
			 --BREG: REGS PORT MAP(REGWRITE,clock0,reset,MOVTOREG,RS,RT,RD,IMED8,ALURESULT,R_0, R_1, R_2, R_3, R_4, R_5, R_6, R_7,A,B); -- externa
			 BREG: REGSint PORT MAP(REGWRITE,clock0,reset,REGWRITE,MOVTOREG,RS,RT,IMED8,ALURESULT,R_0, R_1, R_2, R_3, R_4, R_5, R_6, R_7,A,B); -- interna
			 
			 -- ALU
			 --ULAF: ULAExt PORT MAP(ALUSRCA,clock0,ALUOP,ALUSRCB,A,B,PC,IMED8,ALURESULT); -- externa
			 ULAF: ULA PORT MAP(ALUSRCA,clock0,ALUOP,ALUSRCB,A,B,PC,IMED8,ALURESULT); -- interna
			
		
		
			--IF PCWRITE = '1' THEN
				--PC <= ALURESULT;
			--END IF;
			--IF PC = "01000000" THEN
				--PC <= "00000000";
			--END IF;
	--END PROCESS;									--CONFLITO COM OS REGISTRADORES DAS DUAS CHAMADAS DO BANCO DE REGISTRADORES E INUTILIZAÇÃO DO PORT MAP
	
	
	END behavior;
	