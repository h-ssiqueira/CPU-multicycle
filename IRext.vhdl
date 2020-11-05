LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY IRext IS
	PORT( 
            Mem              		            :IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            IRWrite1, clock1            :IN STD_LOGIC;
         	Opcode                              :OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           	Rs,Rt                            :OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
           	Immediate             	            :OUT STD_LOGIC_VECTOR (5 DOWNTO 0));
END IRext;

    ARCHITECTURE options OF IRext IS
        COMPONENT IR
        PORT( 
            Memdata         		 	        :IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            IRWrite, clock          :IN STD_LOGIC;
         	inst15_12                       :OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           	inst11_09,inst08_06   :OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            inst05_00             	        :OUT STD_LOGIC_VECTOR (5 DOWNTO 0));
        END COMPONENT;
	BEGIN
    CPU: IR PORT MAP (Mem, IRWrite1, clock1, Opcode, Rs, Rt, Immediate);
	 --PROCESS(RegDst, clock1, IRWrite1)
	 --BEGIN
    -- MUX
    --IF clock1'EVENT AND clock1 = '1' AND RegDst = '0' AND IRWrite1 = '1' THEN -- caso tipo R
    --    Rd <= Rt;
    --END IF;
	 --END PROCESS;
	END options;
	