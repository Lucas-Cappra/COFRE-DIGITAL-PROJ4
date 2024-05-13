LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ACESSO IS
	PORT(
		S: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
		CLK, CLR, SET: IN STD_LOGIC;
		S_OUT: OUT STD_LOGIC
);
END ENTITY ACESSO;


ARCHITECTURE ACESSO OF ACESSO IS
	COMPONENT mux_2x1 is
    	Port (
       		A, B : in  STD_LOGIC;
        	C    : in  STD_LOGIC;
        	Y    : out STD_LOGIC
    	);
	END COMPONENT mux_2x1;


	COMPONENT ffd is
   		PORT (ck, clr, set, d : in  std_logic; --NÃO ESQUECER QUE COLOCAR O CLOCK_DIV
                       q : out std_logic);
	END COMPONENT ffd;

	COMPONENT Somador_Completo is
		Port(
        	A_SC, B_SC, CI_SC: IN STD_LOGIC;
        	S_SC, CO_SC: OUT STD_LOGIC
    	);
	END COMPONENT  Somador_Completo;

	COMPONENT COMPARADOR IS
    		Port(
        	A, B: IN STD_LOGIC;
        	GT, LT, EQ: OUT STD_LOGIC
	);
	END COMPONENT COMPARADOR;

	SIGNAL S_MUX, Q_REG, OUT_AND: STD_LOGIC;
	SIGNAL GT0, LT0, EQ0, GT1, LT1, EQ1, GT2, LT2, EQ2, GT3, LT3, EQ3: STD_LOGIC;
BEGIN

MUX: MUX_2X1 PORT MAP ('0', '1', OUT_AND, S_MUX);

REG: FFD PORT MAP (CLK, CLR, SET, S_MUX, Q_REG);

COMP0: COMPARADOR PORT MAP(S(0), '0', GT0, LT0, EQ0);
COMP1: COMPARADOR PORT MAP(S(1), '0', GT1, LT1, EQ1);
COMP2: COMPARADOR PORT MAP(S(2), '1', GT2, LT2, EQ2);

OUT_AND <= EQ0 AND EQ1 AND EQ2;

S_OUT <= OUT_AND;

END ARCHITECTURE ACESSO;