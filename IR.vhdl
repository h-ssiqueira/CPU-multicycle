LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY IR IS
	PORT( 
            Memdata         :IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            IRWrite         :IN STD_LOGIC;
            OP              :OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            RS, RT          :OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            RDI             :OUT STD_LOGIC_VECTOR (5 DOWNTO 0));
END IR;

    ARCHITECTURE options OF IR IS
	BEGIN
	PROCESS (Memdata, IRWrite)
    BEGIN
    CASE IRWrite is
        WHEN '1' =>
            OP <= Memdata(15 DOWNTO 12);
            RS <= Memdata(11 DOWNTO 9);
            RT <= Memdata(8 DOWNTO 6);
            RDI <= Memdata(5 DOWNTO 0);

        WHEN OTHERS => NULL;

    END CASE;

    END PROCESS;
	END options;