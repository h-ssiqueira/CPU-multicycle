LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY IR IS
	PORT( 
            Memdata         					:IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            IRWrite, clock, RegDst    		:IN STD_LOGIC;
         	inst15_12               		:OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           	inst11_09,inst08_06,inst05_03	:OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
           	inst05_00             			:OUT STD_LOGIC_VECTOR (5 DOWNTO 0));
END IR;

    ARCHITECTURE options OF IR IS
	BEGIN
	PROCESS (IRWrite, clock)
    BEGIN
	IF clock'EVENT AND clock = '1' AND IRWrite = '1' THEN
		inst15_12 <= Memdata(15 DOWNTO 12);
		inst11_09 <= Memdata(11 DOWNTO 9);
		inst08_06 <= Memdata(8 DOWNTO 6);
		IF RegDst = '0' THEN
			inst05_03 <= Memdata(8 DOWNTO 6); -- USA RT PARA ESCRITA (TIPO I)
		ELSE
			inst05_03 <= Memdata(5 DOWNTO 3); -- USA RD -> TIPO R
		END IF;
		inst05_00 <= Memdata(5 DOWNTO 0); -- PEGA O IMEDIATO
	END IF;
    END PROCESS;
	END options;
	