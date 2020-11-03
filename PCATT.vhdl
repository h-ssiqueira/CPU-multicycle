LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY PCATT IS
	PORT( PCWrite1		:IN STD_LOGIC;
			ADDRESS		:IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
			ADDRESSATT	:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END PCATT;

ARCHITECTURE options OF PCATT IS
BEGIN
	PROCESS(PCWrite1, ADDRESS)
	BEGIN
    IF PCWrite1 = '1' THEN
		ADDRESSATT <= ADDRESS;
	END IF;
	END PROCESS;
END options;