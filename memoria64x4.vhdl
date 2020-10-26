LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY memoria64x4 IS
    PORT(
        address:         IN INTEGER RANGE 0 TO 256; -- VALOR DE PC (INTEIRO)
        memdata:       OUT STD_ULOGIC_VECTOR(15 DOWNTO 0) -- SAIDA DE 16 BITS PARA INSTRUCTION REGISTER
    );
END ENTITY;

ARCHITECTURE MEMORY OF memoria64x4 IS
    TYPE rom IS ARRAY (0 TO 63) OF STD_ULOGIC_VECTOR (3 DOWNTO 0);
    CONSTANT rom: rom_array := ("0001","0000","0000","0010","0000","0000","1101","1000","0010","0000","1100","1000","0011","0011","0100","0011","0100","1010","0001","0000","1001","0011","0000","0110","0110","1001","0111","1000","0111","0101","1000","0111","1000","1111","1011","0000","0101","0011","0000","0010","0000","1001","1111","1000","0010","1000","0010","0000","0101","1101","0100","0001","1001","0110","1100","0100","0110","0010","1001","0000","0001","0000","0000","0111");

    -- op | rs | rt | rd | 000
    -- op | rs | rt | imediato
BEGIN
    memdata <= rom (address);-- load 4
    memdata <= memdata sll 4 -- shift 4
    memdata <= rom (address+1);-- load 4
    memdata <= memdata sll 4 -- shift 4
    memdata <= rom (address+2);-- load 4
    memdata <= memdata sll 4 -- shift 4
    memdata <= rom (address+3);-- load 4
END ARCHITECTURE;


--0000 0000 0000 0000
--0000 0000 0000 1000
--0000 0000 1000 0110
--0000 1000 0110 0011
--1000 0110 0011 0111