LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TEMPORIZADOR is
    Port(
        S: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
	CK: IN STD_LOGIC;
	LEDG: OUT STD_LOGIC;
        TEMP5, TEMP20: OUT STD_LOGIC
    );
END TEMPORIZADOR;

ARCHITECTURE TEMPORIZADOR OF TEMPORIZADOR IS
	COMPONENT  temporizador5segestrela is
	port (clock           : in  std_logic;
		s012            : in  STD_LOGIC_VECTOR(2 downto 0);
		tm5             : out  std_logic
	 );
	END COMPONENT temporizador5segestrela;

	SIGNAL TEMP5_AUX, TEMP20_AUX, LEDG_AUX: STD_LOGIC;

	COMPONENT  temporizador20segestrela is
	port (clock           : in  std_logic;
		s012            : in  STD_LOGIC_VECTOR(2 downto 0);
        	tm20            : out  std_logic;
         	ledG            : out  std_logic
         );
	END COMPONENT temporizador20segestrela;

BEGIN

T20: temporizador20segestrela PORT MAP (CK,S,TEMP20_AUX, LEDG_AUX);
T5: temporizador5segestrela PORT MAP (CK, S, TEMP5_AUX);

TEMP5 <= TEMP5_AUX;
TEMP20 <= TEMP20_AUX;
LEDG <= LEDG_AUX;

END ARCHITECTURE TEMPORIZADOR;
