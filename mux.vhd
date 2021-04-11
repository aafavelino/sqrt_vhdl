library ieee;
use ieee.std_logic_1164.all;


entity mux is 
port(	en1, en2		    : in std_logic_vector(3 downto 0);
		sel        			: in std_logic;
        saida           	: out std_logic_vector(3 downto 0));

end mux;

architecture execution of mux is
signal saida_aux  : std_logic_vector(3 downto 0);

begin
	
	saida <= saida_aux;
    
	process(sel)
      begin
      case sel is
          when '0' => 
          	saida_aux <= en1;
          when '1' => 
          	saida_aux <= en2;
          when others => 
          	saida_aux <= "0000";
      end case;
	end process;
end execution;
	