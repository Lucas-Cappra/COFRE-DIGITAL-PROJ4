
library ieee;
use ieee.std_logic_1164.all;


entity comparador5bits is

  port (
	a  : in  STD_LOGIC_VECTOR(4 downto 0);
	b  : in  STD_LOGIC_VECTOR(4 downto 0);

	OAeqB : out std_logic
    
    );

end comparador5bits;

architecture logica of comparador5bits is

  signal AgtbN : std_logic:= '0'; -- A greather than B (maior que)
  signal AeqbN : std_logic:= '0'; -- A equal than B (igual que)
  signal AltbN : std_logic:= '0'; -- A lower than B (menor que)

begin
  
  	AeqbN <= not((a(4) xor b(4)) or (a(3) xor b(3)) or (a(2) xor b(2)) or (a(1) xor b(1)) or (a(0) xor b(0)));
  	
  	OAEQB <= AeqbN and AeqbN;

  
end logica;



