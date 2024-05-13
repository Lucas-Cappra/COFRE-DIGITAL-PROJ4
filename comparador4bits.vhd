
library ieee;
use ieee.std_logic_1164.all;


entity comparador4bits is

  port (
	a  : in  STD_LOGIC_VECTOR(3 downto 0);
	b  : in  STD_LOGIC_VECTOR(3 downto 0);

	OAgtB : out std_logic;
	OAeqB : out std_logic;
	OAltB : out std_logic
    
    );

end comparador4bits;

architecture logica of comparador4bits is

  signal AgtbN : std_logic:= '0'; -- A greather than B (maior que)
  signal AeqbN : std_logic:= '0'; -- A equal than B (igual que)
  signal AltbN : std_logic:= '0'; -- A lower than B (menor que)

begin

  AgtbN <= (a(3) and not(b(3))) or
          (not(a(3) xor b(3)) and a(2) and not(b(2))) or
          (not(a(3) xor b(3)) and not(a(2) xor b(2)) and a(1) and not(b(1))) or
          (not(a(3) xor b(3)) and not(a(2) xor b(2)) and not(a(1) xor b(1)) and a(0) and not(b(0)));

  	AeqbN <= not((a(3) xor b(3)) or (a(2) xor b(2)) or (a(1) xor b(1)) or (a(0) xor b(0)));
  	AltbN <= not(AgtbN or AeqbN);

	OAGTB <= AgtbN or (AeqbN and (not(AeqbN) and not(AltbN)));
  	OALTB <= AltbN or (AeqbN and (not(AeqbN) and not(AgtbN)));
  	OAEQB <= AeqbN and AeqbN;

  
end logica;

