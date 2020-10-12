LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY IR IS
	PORT( 
            Mem             :IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            IRWrite         :IN STD_LOGIC;
            OP              :OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            RS, RT          :OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            RDI             :OUT STD_LOGIC_VECTOR (5 DOWNTO 0));
END IR;

    ARCHITECTURE options OF IR IS
	BEGIN
	PROCESS (Mem, IRWrite)
    BEGIN
    CASE IRWrite is
        WHEN '1' =>
            OP <= Mem(15 DOWNTO 12);
            RS <= Mem(11 DOWNTO 9);
            RT <= Mem(8 DOWNTO 6);
            RDI <= Mem(5 DOWNTO 0);

        WHEN OTHERS => NULL;

    END CASE;

    END PROCESS;
	END options;