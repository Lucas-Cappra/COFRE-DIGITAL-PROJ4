LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SENHA is
    Port(
        PWR: IN STD_LOGIC;
	      PWD: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	        S: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
          PWD_COMP: OUT STD_LOGIC
    );
END SENHA;

ARCHITECTURE SENHA OF SENHA IS

	COMPONENT COMPARADOR_18BITS IS
   	 Port(
        	A, B: IN STD_LOGIC_VECTOR (17 DOWNTO 0);
        	GT, LT, EQ: OUT STD_LOGIC
    	);
	END COMPONENT COMPARADOR_18BITS;
	
	COMPONENT registrador18bits IS
   	 Port(ck, clr,  set    : in  std_logic;
                      s012 : in  STD_LOGIC_VECTOR(2 downto 0);
                         d : in  STD_LOGIC_VECTOR(5 downto 0);
                       q00 : out  STD_LOGIC_VECTOR(17 downto 0)
         );
	END COMPONENT registrador18bits;
	
	COMPONENT COMPARADOR_3BITS IS
   	 Port(
        	A, B : STD_LOGIC_VECTOR(2 DOWNTO 0);
        	GT, LT, EQ: OUT STD_LOGIC
    	);
		END COMPONENT COMPARADOR_3BITS;
	
	SIGNAL PWD_18: STD_LOGIC_VECTOR(17 DOWNTO 0);
	SIGNAL GT_PWD, LT_PWD, EQ_PWD: STD_LOGIC;
	SIGNAL maiorq, menorq, igualq: STD_LOGIC;
	SIGNAL estado : STD_LOGIC_VECTOR(2 downto 0):=(others => '0');
	SIGNAL ck, clr, set: STD_LOGIC;
	SIGNAL and1: STD_LOGIC;

BEGIN
  estado(0) <= '1';

comparadorinicial: COMPARADOR_3BITS PORT MAP (S, estado , maiorq, menorq, igualq);

and1 <= igualq and '1';

senharegistrada: registrador18bits  PORT MAP (ck, '1', and1, S, PWD, PWD_18);
  
comparadorfinal: COMPARADOR_18BITS PORT MAP (PWD_18, "000110100010110000", GT_PWD, LT_PWD, EQ_PWD);

PWD_COMP <= EQ_PWD;

END ARCHITECTURE;
