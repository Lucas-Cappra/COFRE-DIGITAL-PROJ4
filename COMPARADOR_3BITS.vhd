LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY COMPARADOR_3BITS IS
    Port(
        A, B: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        GT, LT, EQ: OUT STD_LOGIC
    );
END COMPARADOR_3BITS;

ARCHITECTURE COMPARADOR_3BITS OF COMPARADOR_3BITS IS

COMPONENT COMPARADOR IS
    Port(
        A, B: IN STD_LOGIC;
        GT, LT, EQ: OUT STD_LOGIC
    );
END COMPONENT COMPARADOR;


SIGNAL GT0, LT0, EQ0, GT1, LT1, EQ1, GT2, LT2, EQ2: STD_LOGIC;

BEGIN
C0: COMPARADOR PORT MAP (A(0), B(0), GT0, LT0, EQ0);
C1: COMPARADOR PORT MAP (A(1), B(1), GT1, LT1, EQ1);
C2: COMPARADOR PORT MAP (A(2), B(2), GT2, LT2, EQ2);

GT <= GT0 OR GT1 OR GT2;
LT <= LT0 OR LT1 OR LT2;
EQ <= EQ0 AND EQ1 AND EQ2;

END ARCHITECTURE COMPARADOR_3BITS;