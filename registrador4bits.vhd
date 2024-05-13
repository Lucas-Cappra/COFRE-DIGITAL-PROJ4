library ieee;
use ieee.std_logic_1164.all;

entity registrador4bits is
   port (ck, clr, set    : in  std_logic;
                       d : in  STD_LOGIC_VECTOR(3 downto 0);
                       q : out  STD_LOGIC_VECTOR(3 downto 0)
         );
end registrador4bits;

architecture logica of registrador4bits is

------------------- Componente 1 -------------------------
COMPONENT ffd IS
   port (ck, clr, set, d  : in  std_logic;
         q: out std_logic
         );
         
         
	END COMPONENT;	

begin
  
    ffd0: ffd PORT MAP(ck, clr, set, d(0), q(0));
    ffd1: ffd PORT MAP(ck, clr, set, d(1), q(1));
    ffd2: ffd PORT MAP(ck, clr, set, d(2), q(2));
    ffd3: ffd PORT MAP(ck, clr, set, d(3), q(3));

  
end logica;