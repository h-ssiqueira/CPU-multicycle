LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CPU IS
    PORT( clock, reset             :IN STD_LOGIC
    
    
    );
            
END CPU;

    ARCHITECTURE options OF CPU IS
    TYPE STATE_TYPE IS (Fetch, Decode, OpAdd, OpSub, OpAnd, OpOr, WriteBack);
    SIGNAL state: STATE_TYPE;
    SIGNAL PCWrite, IRWrite, RegDst, ALUScrA, RegWrite : STD_LOGIC;
    SIGNAL MovtoReg, ALUOp, ALUScrB : STD_LOGIC_VECTOR(1 DOWNTO 0);
	 SIGNAL OPCODE : STD_LOGIC_VECTOR(3 DOWNTO 0);
	BEGIN
	PROCESS (clock, reset)
    BEGIN

        IF reset = '1' THEN
            state <= Fetch;
        ELSIF clock'EVENT AND clock = '1' THEN
            CASE state IS 
                WHEN Fetch	=>
                CASE OPCODE IS
                    WHEN "0000" => state <= Decode;
                    WHEN "0010" => state <= Decode;
                    WHEN "0011" => state <= Decode;
                    WHEN "0100" => state <= Decode; 
                    WHEN "0001" => state <= Decode; 
                    WHEN "0101" => state <= Decode;
                    WHEN "0110" => state <= Decode;
                    WHEN "0111" => state <= Decode; 
                    WHEN "1000" => state <= Decode;
                    WHEN "1001" => state <= Decode;
                    WHEN OTHERS => state <= Fetch;
                END CASE;

                WHEN Decode	=>
                CASE OPCODE IS
                    WHEN "0000" => state <= WriteBack;
                    WHEN "0001" => state <= WriteBack;
                    WHEN "0010" => state <= OpAdd;
                    WHEN "0011" => state <= OpAdd;
                    WHEN "0100" => state <= OpSub; 
                    WHEN "0101" => state <= OpSub;
                    WHEN "0110" => state <= OpAnd;
                    WHEN "0111" => state <= OpAnd; 
                    WHEN "1000" => state <= OpOr;
                    WHEN "1001" => state <= OpOr;
                    WHEN OTHERS => state <= Fetch;
                END CASE;

                WHEN OpAdd	=>
                CASE OPCODE IS
                    WHEN "0010" => state <= WriteBack;
                    WHEN "0011" => state <= WriteBack;
                    WHEN OTHERS => state <= Fetch;
                END CASE;

                WHEN OpSub	=>
                CASE OPCODE IS
                    WHEN "0100" => state <= WriteBack;
                    WHEN "0101" => state <= WriteBack;
                    WHEN OTHERS => state <= Fetch;
                END CASE;

                WHEN OpAnd	=>
                CASE OPCODE IS
                    WHEN "0110" => state <= WriteBack;
                    WHEN "0111" => state <= WriteBack;
                    WHEN OTHERS => state <= Fetch;
                END CASE;

                WHEN OpOr	=>
                CASE OPCODE IS
                    WHEN "1000" => state <= WriteBack;
                    WHEN "1001" => state <= WriteBack;
                    WHEN OTHERS => state <= Fetch;
                END CASE;

                WHEN WriteBack	=>
                CASE OPCODE IS
                    WHEN "0000" => state <= Fetch;
                    WHEN "0001" => state <= Fetch;
                    WHEN "0010" => state <= Fetch;
                    WHEN "0011" => state <= Fetch;
                    WHEN "0100" => state <= Fetch; 
                    WHEN "0101" => state <= Fetch;
                    WHEN "0110" => state <= Fetch;
                    WHEN "0111" => state <= Fetch; 
                    WHEN "1000" => state <= Fetch;
                    WHEN "1001" => state <= Fetch;
                    WHEN OTHERS => state <= Fetch;
                END CASE;
            END CASE;
        END IF;
    END PROCESS;

    WITH state SELECT 
	PCWrite       <='1' 	WHEN Fetch,
					'0'		WHEN Decode,
					'0'		WHEN OpAdd,
					'0'		WHEN OpSub,
					'0' 	WHEN OpAnd,
					'0'		WHEN OpOr,
                    '0'		WHEN WriteBack;
    WITH state SELECT 
	IRWrite       <='1' 	WHEN Fetch,
					'0'		WHEN Decode,
					'0'		WHEN OpAdd,
					'0'		WHEN OpSub,
					'0' 	WHEN OpAnd,
					'0'		WHEN OpOr,
					'0'		WHEN WriteBack;
    --WITH state SELECT
	--RegDst         <='0' 	WHEN Fetch,
		--			'0'		WHEN Decode,
		--			'0'		WHEN OpAdd,
		--			'0'		WHEN OpSub,
		--			'0' 	WHEN OpAnd,
		--			'0'		WHEN OpOr,
      --              '0'		WHEN (WriteBack AND (OPCODE(0) = '1')),
      --              '1'		WHEN (WriteBack AND (OPCODE(0) = '0'));
		CASE state IS
			WHEN Fetch =>
				RegDst <= '0';
			WHEN Decode =>
				RegDst <= '0';
			WHEN OpAdd =>
				RegDst <= '0';
			WHEN OpSub =>
				RegDst <= '0';
			WHEN OpAnd =>
				RegDst <= '0';
			WHEN OpOr =>
				RegDst <= '0';
			WHEN WriteBack =>
				CASE OPCODE(0) IS
					WHEN '1' =>
						RegDst <= '0';
					WHEN '0' =>
						RegDst <= '1';	
					WHEN OTHERS => NULL;
				END CASE;
			WHEN OTHERS => NULL;
		END CASE;
		
		
    WITH state SELECT
	MovtoReg         <= "00" 	    WHEN Fetch,
                        "00"		WHEN Decode,
                        "00"		WHEN OpAdd,
					    "00"		WHEN OpSub,
					    "00" 	    WHEN OpAnd,
					    "00"		WHEN OpOr,
                        "00"		WHEN (WriteBack AND NOT (OPCODE = "0000" OR OPCODE = "0001")),
                        "10"		WHEN (WriteBack AND (OPCODE = "0000")),
                        "01"		WHEN (WriteBack AND (OPCODE = "0001"));
    WITH state SELECT
	ALUOp            <= "10" 	    WHEN Fetch,
                        "00"		WHEN Decode,
                        "10"		WHEN (OpAdd AND (OPCODE = "0010" OR OPCODE = "0011")),
                        "00"		WHEN (OpAdd AND NOT (OPCODE = "0010" OR OPCODE = "0011")),
                        "11"		WHEN (OpSub AND (OPCODE = "0100" OR OPCODE = "0101")),
                        "00"		WHEN (OpSub AND NOT (OPCODE = "0100" OR OPCODE = "0101")),
					    "00" 	    WHEN OpAnd,
                        "01"		WHEN (OpOr AND (OPCODE = "1000" OR OPCODE = "1001")),
                        "01"		WHEN (OpOr AND NOT (OPCODE = "1000" OR OPCODE = "1001")),
                        "00"		WHEN WriteBack;
    WITH state SELECT
	ALUScrA         <='0' 	WHEN Fetch,
					'0'		WHEN Decode,
					'1'		WHEN OpAdd,
					'1'		WHEN OpSub,
					'1' 	WHEN OpAnd,
					'1'		WHEN OpOr,
                    '0'		WHEN WriteBack;
    WITH state SELECT
	ALUScrB            <= "01" 	    WHEN Fetch,
                        "00"		WHEN Decode,
                        "10"		WHEN (OpAdd AND (OPCODE = "0011")),
                        "00"		WHEN (OpAdd AND NOT (OPCODE = "0011")),
                        "10"		WHEN (OpSub AND (OPCODE = "0101")),
                        "00"		WHEN (OpSub AND NOT (OPCODE = "0101")),
					    "10"		WHEN (OpAnd AND (OPCODE = "0111")),
                        "00"		WHEN (OpAnd AND NOT (OPCODE = "0111")),
                        "10"		WHEN (OpOr AND (OPCODE = "1001")),
                        "00"		WHEN (OpOr AND NOT (OPCODE = "1001")),
                        "00"		WHEN WriteBack;
    WITH state SELECT
	RegWrite         <='0' 	WHEN Fetch,
					'0'		WHEN Decode,
					'0'		WHEN OpAdd,
					'0'		WHEN OpSub,
					'0' 	WHEN OpAnd,
					'0'		WHEN OpOr,
                    '1'		WHEN WriteBack;

    --IF IRWrite
    -- execução do circuito
    
	END options;