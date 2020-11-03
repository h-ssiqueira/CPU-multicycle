LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CPU IS
	PORT(
            clock0, reset :IN   STD_LOGIC;
				R_0, R_1, R_2, R_3, R_4, R_5, R_6, R_7,R_00, R_11, R_22, R_33, R_44, R_55, R_66, R_77 : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0));
END CPU;

    ARCHITECTURE behavior OF CPU IS
	 
    COMPONENT memoria64x4 IS
        PORT(
            clock				:IN STD_LOGIC;
            address			:IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- VALOR DE PC
            memdata			:OUT STD_LOGIC_VECTOR(15 DOWNTO 0) -- SAIDA DE 16 BITS PARA INSTRUCTION REGISTER
        );
    END COMPONENT;
	 
    COMPONENT IRext IS
	PORT( 
            Mem              		            :IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            IRWrite1, clock1, RegDst1           :IN STD_LOGIC;
         	Opcode                              :OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           	Rs,Rt,Rd                            :OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
           	Immediate             	            :OUT STD_LOGIC_VECTOR (5 DOWNTO 0));
    END COMPONENT;
	 
    COMPONENT REGS IS
	PORT( 	RegWrite,clock					:IN	STD_LOGIC;							-- sinal do controlador de escrita
			MovtoReg						:IN STD_LOGIC_VECTOR(1 DOWNTO 0);		-- Sinal do multiplexador de escrita
			Rs, Rt, Rd						:IN	STD_LOGIC_VECTOR(2 DOWNTO 0); 		-- Controle dos registradores a serem usados
			ExtImmediate,ALUout				:IN	STD_LOGIC_VECTOR(7 DOWNTO 0); 		-- Informações a serem escritas em um registrador
			R0, R1, R2, R3, R4, R5, R6, R7	:BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0); 	-- Registradores
			RA, RB							:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); 	-- saída de informações dos registradores
    END COMPONENT;
	 
    COMPONENT SignExtend IS
	PORT( 	Immediate		:IN	STD_LOGIC_VECTOR(5 DOWNTO 0);
			ExtImmediate	:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT;
	 
    COMPONENT StateMachine IS
    PORT(   clock, reset                                        :IN STD_LOGIC;
            opcode                                              :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            PCWrite1, IRWrite1, REGWrite1, ALUSrcA1, RegDst1    :OUT STD_LOGIC;
            MovtoReg1, ALUSrcB1, ALUOp1                         :OUT STD_LOGIC_VECTOR(1 DOWNTO 0)    
    );
    END COMPONENT;
	 
    COMPONENT ULAExt IS
	PORT( ALUSrcA1,clock1		:IN	STD_LOGIC;
			ALUop1,ALUSrcB1	    :IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
			A1, B1,PC1,Imed1    :IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
			ALUout1 		    :OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT;
	 
	 SIGNAL MEMORY : STD_LOGIC_VECTOR(15 DOWNTO 0);
	 SIGNAL PC, ALURESULT,A,B,IMED8,AA,BB : STD_LOGIC_VECTOR(7 DOWNTO 0);
	 SIGNAL IMED6 : STD_LOGIC_VECTOR(5 DOWNTO 0);
	 SIGNAL OPcode : STD_LOGIC_VECTOR(3 DOWNTO 0);
	 SIGNAL RT,RS,RD : STD_LOGIC_VECTOR(2 DOWNTO 0);
	 SIGNAL MOVTOREG,ALUSRCB,ALUOP : STD_LOGIC_VECTOR(1 DOWNTO 0);
	 SIGNAL PCWRITE,IRWRITE,REGDST,REGWRITE,ALUSRCA : STD_LOGIC;
	 
	 
	 BEGIN
    --PROCESS(clock0,reset,MEMORY,PC,ALURESULT,A,B,IMED8,IMED6,OPcode,RT,RS,RD,MOVTOREG,ALUSRCB,ALUOP,PCWRITE,IRWRITE,REGWRITE,REGDST,ALUSRCA,R_0, R_1, R_2, R_3, R_4, R_5, R_6, R_7)
	 --BEGIN
			--IF reset = '0' THEN -- VER UMA IMPLETMENTAÇÃO QUE FUNCIONE PARA PC (PC COM PROCESS, SEM PORTMAP; PC SEM PROCESS, COM PORTMAP,PORÉM SEM MANIPULAÇÃO DE PC)
				--PC <= "00000000";
			--END IF;
			 --STATE MACHINE
			 STAT: StateMachine PORT MAP(clock0,reset,OPcode,PCWRITE,IRWRITE,REGWRITE,ALUSRCA,REGDST,MOVTOREG,ALUSRCB,ALUOP);
			 -- MEMORY
			 MMR: memoria64x4 PORT MAP(clock0,PC,MEMORY);
			 --INSTRUCTION REGISTER
			 IRS: IRext PORT MAP(MEMORY,IRWRITE,clock0,REGDST,OPcode,RS,RT,RD,IMED6);
			 -- SIGN - EXTEND
			 SIGN: SignExtend PORT MAP(IMED6,IMED8);
			 -- BANK REGISTER
			 BREG: REGS PORT MAP(REGWRITE,clock0,MOVTOREG,RS,RT,RD,IMED8,ALURESULT,R_0, R_1, R_2, R_3, R_4, R_5, R_6, R_7,A,B);
			 -- ALU
			 ULAF: ULAExt PORT MAP(ALUSRCA,clock0,ALUOP,ALUSRCB,A,B,PC,IMED8,ALURESULT);
			--IF PCWRITE = '1' THEN
				--PC <= ALURESULT;
			--END IF;
			--IF PC = "01000000" THEN
				--PC <= "00000000";
			--END IF;
			BREG1: REGS PORT MAP(REGWRITE,clock0,MOVTOREG,RS,RT,RD,IMED8,ALURESULT,R_00, R_11, R_22, R_33, R_44, R_55, R_66, R_77,AA,BB);
	--END PROCESS;									CONFLITO COM OS REGISTRADORES DAS DUAS CHAMADAS DO BANCO DE REGISTRADORES
	END behavior;
	