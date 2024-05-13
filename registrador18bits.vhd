library ieee;
use ieee.std_logic_1164.all;

entity registrador18bits is
   port (ck, clr, set    : in  std_logic;
                    s012 : in  STD_LOGIC_VECTOR(2 downto 0);
                       d : in  STD_LOGIC_VECTOR(5 downto 0);
                 PWD_COMP: OUT STD_LOGIC
         );
end registrador18bits;

architecture logica of registrador18bits is

------------------- Componente 1 -------------------------
COMPONENT ffd IS
   port (ck, clr, set, d  : in  std_logic;
         q: out std_logic
         );
         
         
	END COMPONENT;	
	
	------------------- Componente 2 -------------------------
COMPONENT COMPARADOR_3BITS IS
   Port(
        A, B : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        GT, LT, EQ: OUT STD_LOGIC
    );
         
         
	END COMPONENT;	
	
	------------------- Componente 3 -------------------------
COMPONENT mux_2x1 IS
    Port (
        A, B : in  STD_LOGIC;
        C    : in  STD_LOGIC;
        Y    : out STD_LOGIC
    );
         
	END COMPONENT;	

-----------------------------COMPONENTE 4-----------------------
COMPONENT COMPARADOR IS
Port(
        A, B: IN STD_LOGIC;
        GT, LT, EQ: OUT STD_LOGIC
    );
END COMPONENT COMPARADOR;
	
	
------------------- SINAIS LÓGICOS -------------------------
--signal estado000        : std_logic;
signal estado000        : STD_LOGIC_VECTOR(2 downto 0);
signal estado001        : STD_LOGIC_VECTOR(2 downto 0);
signal estado010        : STD_LOGIC_VECTOR(2 downto 0);

signal igualq0        : std_logic;
signal igualq1        : std_logic;
signal igualq2        : std_logic;
signal maior         : std_logic;
signal menorq        : std_logic;

------------------- SINAIS REGISTRADORES 1 -------------------------
signal y0         : STD_LOGIC_VECTOR(5 downto 0);
signal y01        : STD_LOGIC_VECTOR(5 downto 0);
signal y02        : STD_LOGIC_VECTOR(5 downto 0);


signal q0        : STD_LOGIC_VECTOR(5 downto 0):=(others => '0');
signal q1        : STD_LOGIC_VECTOR(5 downto 0):=(others => '0');
signal q2        : STD_LOGIC_VECTOR(5 downto 0):=(others => '0');

SIGNAL GT0, LT0, EQ0, GT1, LT1, EQ1, GT2, LT2, EQ2: STD_LOGIC;
SIGNAL GT3, LT3, EQ3, GT4, LT4, EQ4, GT5, LT5, EQ5: STD_LOGIC;
SIGNAL GT6, LT6, EQ6, GT7, LT7, EQ7, GT8, LT8, EQ8: STD_LOGIC;
SIGNAL GT9, LT9, EQ9, GT10, LT10, EQ10, GT11, LT11, EQ11: STD_LOGIC;
SIGNAL GT12, LT12, EQ12, GT13, LT13, EQ13, GT14, LT14, EQ14: STD_LOGIC;
SIGNAL GT15, LT15, EQ15, GT16, LT16, EQ16, GT17, LT17, EQ17: STD_LOGIC;

begin
    
estado000 <= "000";
estado001 <= "001";
estado010 <= "010";


    comparador1: COMPARADOR_3BITS PORT MAP(S012, estado000, maior,  menorq, igualq0);
    comparador2: COMPARADOR_3BITS PORT MAP(S012, estado001, maior,  menorq, igualq1);
    comparador3: COMPARADOR_3BITS PORT MAP(S012, estado010, maior,  menorq, igualq2);
  
  ------------------- REGISTRADOR 1 -------------------------
  
    mux10: mux_2x1 PORT MAP(q0(0), d(0), igualq0, y0(0));
    mux11: mux_2x1 PORT MAP(q0(1), d(1), igualq0, y0(1));
    mux12: mux_2x1 PORT MAP(q0(2), d(2), igualq0, y0(2));
    mux13: mux_2x1 PORT MAP(q0(3), d(3), igualq0, y0(3));
    mux14: mux_2x1 PORT MAP(q0(4), d(4), igualq0, y0(4));
    mux15: mux_2x1 PORT MAP(q0(5), d(5), igualq0, y0(5));
    
      
    ffd10: ffd PORT MAP(ck, '1', '1', y0(0), q0(0));
    ffd11: ffd PORT MAP(ck, '1', '1', y0(1), q0(1));
    ffd12: ffd PORT MAP(ck, '1', '1', y0(2), q0(2));
    ffd13: ffd PORT MAP(ck, '1', '1', y0(3), q0(3));
    ffd14: ffd PORT MAP(ck, '1', '1', y0(4), q0(4));
    ffd15: ffd PORT MAP(ck, '1', '1', y0(5), q0(5));
      
   
  
  ------------------- REGISTRADOR 2 -------------------------
  
    mux20: mux_2x1 PORT MAP(q1(0), d(0), igualq1, y01(0));
    mux21: mux_2x1 PORT MAP(q1(1), d(1), igualq1, y01(1));
    mux22: mux_2x1 PORT MAP(q1(2), d(2), igualq1, y01(2));
    mux23: mux_2x1 PORT MAP(q1(3), d(3), igualq1, y01(3));
    mux24: mux_2x1 PORT MAP(q1(4), d(4), igualq1, y01(4));
    mux25: mux_2x1 PORT MAP(q1(5), d(5), igualq1, y01(5));
      
    ffd20: ffd PORT MAP(ck, '1', '1', y01(0), q1(0));
    ffd21: ffd PORT MAP(ck, '1', '1', y01(1), q1(1));
    ffd22: ffd PORT MAP(ck, '1', '1', y01(2), q1(2));
    ffd23: ffd PORT MAP(ck, '1', '1', y01(3), q1(3));
    ffd24: ffd PORT MAP(ck, '1', '1', y01(4), q1(4));
    ffd25: ffd PORT MAP(ck, '1', '1', y01(5), q1(5));
      

  ------------------- REGISTRADOR 3 -------------------------  
  
    mux30: mux_2x1 PORT MAP(q2(0), d(0), igualq2, y02(0));
    mux31: mux_2x1 PORT MAP(q2(1), d(1), igualq2, y02(1));
    mux32: mux_2x1 PORT MAP(q2(2), d(2), igualq2, y02(2));
    mux33: mux_2x1 PORT MAP(q2(3), d(3), igualq2, y02(3));
    mux34: mux_2x1 PORT MAP(q2(4), d(4), igualq2, y02(4));
    mux35: mux_2x1 PORT MAP(q2(5), d(5), igualq2, y02(5));
     
    ffd30: ffd PORT MAP(ck, '1', '1', y02(0), q2(0));
    ffd31: ffd PORT MAP(ck, '1', '1', y02(1), q2(1));
    ffd32: ffd PORT MAP(ck, '1', '1', y02(2), q2(2));
    ffd33: ffd PORT MAP(ck, '1', '1', y02(3), q2(3));
    ffd34: ffd PORT MAP(ck, '1', '1', y02(4), q2(4));
    ffd35: ffd PORT MAP(ck, '1', '1', y02(5), q2(5));
  

CMP0: COMPARADOR PORT MAP (Q0(0),'0',GT0, LT0,EQ0);
CMP1: COMPARADOR PORT MAP (Q0(1),'0',GT1, LT1,EQ1);
CMP2: COMPARADOR PORT MAP (Q0(2),'0',GT2, LT2,EQ2);
CMP3: COMPARADOR PORT MAP (Q0(3),'1',GT3, LT3,EQ3);
CMP4: COMPARADOR PORT MAP (Q0(4),'1',GT4, LT4,EQ4);
CMP5: COMPARADOR PORT MAP (Q0(5),'0',GT5, LT5,EQ5);
 
CMP6: COMPARADOR PORT MAP (q1(0),'1',GT6, LT6,EQ6);
CMP7: COMPARADOR PORT MAP (q1(1),'0',GT7, LT7,EQ7);
CMP8: COMPARADOR PORT MAP (q1(2),'1',GT8, LT8,EQ8);
CMP9: COMPARADOR PORT MAP (q1(3),'0',GT9, LT9,EQ9);
CMP10: COMPARADOR PORT MAP (q1(4),'0',GT10, LT10,EQ10);
CMP11: COMPARADOR PORT MAP (q1(5),'0',GT11, LT11,EQ11);
  
CMP12: COMPARADOR PORT MAP (q2(0),'1',GT12, LT12,EQ12);
CMP13: COMPARADOR PORT MAP (q2(1),'0',GT13, LT13,EQ13);
CMP14: COMPARADOR PORT MAP (q2(2),'1',GT14, LT14,EQ14);
CMP15: COMPARADOR PORT MAP (q2(3),'1',GT15, LT15,EQ15);
CMP16: COMPARADOR PORT MAP (q2(4),'0',GT16, LT16,EQ16);
CMP17: COMPARADOR PORT MAP (q2(5),'0',GT17, LT17,EQ17);


PWD_COMP <= (EQ0 AND EQ1 AND EQ2 AND EQ3 AND EQ4 AND EQ5 AND EQ6 AND EQ7 AND EQ8 AND EQ9 AND EQ10 AND EQ11 AND EQ12 AND EQ13 AND EQ14 AND EQ15 AND EQ16 AND EQ17);

end logica;

