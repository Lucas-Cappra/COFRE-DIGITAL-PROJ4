library ieee;
use ieee.std_logic_1164.all;

entity temporizador20segestrela is
   port (clock           : in  std_logic;
         s012            : in  STD_LOGIC_VECTOR(2 downto 0);
         tm20            : out  std_logic;
         ledG            : out  std_logic
         );
end temporizador20segestrela;

architecture logica of temporizador20segestrela is

------------------- Componente 1 subtrator -------------------------
COMPONENT subtrator IS
   port (A_subtrator     : IN std_logic;
         P_subtrator     : IN std_logic;
         C_IN_subtrator  : IN std_logic;
		     O_subtrator     : OUT std_logic;
         C_OUT_subtrator : OUT std_logic
);
         
	END COMPONENT;	
	
------------------- Componente 2 registrador4bits -------------------------
COMPONENT registrador5bits IS
   port (ck, clr, set    : in  std_logic;
                       d : in  STD_LOGIC_VECTOR(4 downto 0);
                       q : out  STD_LOGIC_VECTOR(4 downto 0)
         );
         
	END COMPONENT;	

------------------- Componente 3 ck -------------------------
--COMPONENT ck IS
--   port (ck_in : in  std_logic;
--         ck_out: out std_logic
--);
         
--	END COMPONENT;	

------------------- Componente 4 comparador4bits -------------------------
COMPONENT comparador5bits IS
   port (
	a  : in  STD_LOGIC_VECTOR(4 downto 0);
	b  : in  STD_LOGIC_VECTOR(4 downto 0);

	OAeqB : out std_logic
    
    );
         
	END COMPONENT;	
	
	------------------- Componente 5 comparador3bits -------------------------
COMPONENT COMPARADOR_3BITS IS
   Port(
        A, B: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        GT, LT, EQ: OUT STD_LOGIC
    );
         
	END COMPONENT;	
	
	------------------- Componente 6 ffd -------------------------
COMPONENT ffd IS
   port (ck, clr, set, d : in  std_logic;
                       q : out std_logic
    
    );
         
	END COMPONENT;	
	
	
	------------------- Componente 7 subtrator -------------------------
COMPONENT mux_2x1 IS
    Port (
        A, B : in  STD_LOGIC;
        C    : in  STD_LOGIC;
        Y    : out STD_LOGIC
    );
         
	END COMPONENT;	
	
------------------- SINAIS INICIALIZAÇÃO -------------------------
signal estado20         : STD_LOGIC_VECTOR(2 downto 0):=(others => '0');
signal zero, um, bin20  : STD_LOGIC_VECTOR(4 downto 0):=(others => '0');
signal clr             : std_logic:= '0';


------------------- SINAIS REGISTRADOR -------------------------
signal r1  : STD_LOGIC_VECTOR(4 downto 0);
signal r2  : std_logic;


------------------- SINAIS COMPARADORES -------------------------
signal Aeqb : std_logic:= '0'; -- A equal than B (igual que)

------------------- SINAIS LÓGICOS -------------------------
signal and1        : std_logic;
signal nor1        : STD_LOGIC_VECTOR(4 downto 0);
signal saidatm20    : std_logic:= '1';
signal z00         : STD_LOGIC_VECTOR(5 downto 0);
signal z0          : std_logic:= '0';
signal z1          : std_logic:= '0';
signal z2          : std_logic:= '0';
signal dmux1       : std_logic:= '0';

------------------- SINAIS SUBTRATOR -------------------------
signal sub1    : STD_LOGIC_VECTOR(4 downto 0):=(others => '0');

begin
  
  estado20(1)  <= '1';
  um(0)        <= '1';
  bin20(2)     <= '1';
  bin20(4)     <= '1';
  --Clocka: ck port map (clock, clock1);
    
  comparador1: COMPARADOR_3BITS PORT MAP(s012, estado20, z0, z00(0), aeqb);
    
  and1 <= (AeqB) and (clock);
  ledG <= (AeqB) and '1' ;
  
  registrador1: registrador5bits PORT MAP(and1, r2, '1', sub1, r1);
    
  subtrator1: subtrator PORT MAP(r1(0), '1', '0',    sub1(0), z00(1));
  subtrator2: subtrator PORT MAP(r1(1), '0', z00(1), sub1(1), z00(2));
  subtrator3: subtrator PORT MAP(r1(2), '0', z00(2), sub1(2), z00(3));
  subtrator4: subtrator PORT MAP(r1(3), '0', z00(3), sub1(3), z00(4));
  subtrator5: subtrator PORT MAP(r1(4), '0', z00(4), sub1(4), z00(5));
    
  nor1 <= sub1 nor zero;
  
  comparador2: comparador5bits PORT MAP(nor1, bin20, saidatm20);
  
  mux1: mux_2x1 PORT MAP('0', '1', aeqb, dmux1);
  
  registrador2: ffd PORT MAP(clock, '1', '1', dmux1, r2);
  
  tm20 <= saidatm20;
  --
end logica;


