library ieee;
use ieee.std_logic_1164.all;
entity mde_moore1p is
   port (ck, rst, PWR : in  std_logic;
	ADD, TEMP5, TEMP20, PWD_LEN, PWD_CMP: in  std_logic;
        q : out std_logic_vector(2 downto 0));
end mde_moore1p;


architecture logica of mde_moore1p is
  type st is (FECHADO, INICIANDO, VALOR, SENHA, ABERTO, CANCELANDO);  
  signal estado : st;                          
begin
  process (ck, rst)
  begin
    if rst = '1' then                 
      estado <= FECHADO;                   
    elsif (ck'event and ck ='1') then    
      case estado is
        when FECHADO =>                         
          if PWR = '1' then estado <= INICIANDO; 
          end if;
        when INICIANDO=>                         
          if TEMP5 = '1' then estado <= VALOR; 
          end if;
        when VALOR =>                         
          if PWR = '1' then estado <= CANCELANDO;
          elsif ADD='1' THEN estado <= SENHA; 
          end if;
        when SENHA =>                         
          if (TEMP5 = '1'  AND PWD_LEN ='1' AND PWD_CMP='1') then estado <= ABERTO;
          elsif (TEMP5 ='1' AND PWD_LEN='0') THEN estado <= VALOR;
          elsif (TEMP5 = '1'  AND PWD_LEN ='1' AND PWD_CMP='0') THEN estado <= FECHADO;
          end if;
        when ABERTO =>                         
          if (TEMP20 = '1') then estado <= FECHADO;
          end if;
        when CANCELANDO =>                         
          if (TEMP5 = '1') then estado <= FECHADO;
          end if;
       end case;
    end if;
  end process;
  
with estado select  
    Q <= "000" when FECHADO,
	 "001" when INICIANDO, 
	 "010" when VALOR, 
	 "011" when SENHA, 
	 "100" when ABERTO,
	 "101" when CANCELANDO;
end logica; 
