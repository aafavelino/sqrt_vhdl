library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;

entity registrador is
  port(
      	clk: in std_logic; 
        reset: in std_logic;
      	gravar: in std_logic; 
		entrada: in std_logic_vector(3 downto 0);
      	saida: out std_logic_vector(3 downto 0));
end registrador;

architecture comportamento of registrador is
begin
	process (clk, gravar)
	begin
    	if (reset = '1') then
        	saida <= "0000";
        elsif (clk'event AND clk = '1') then
			if (gravar = '1') then
				saida <= entrada;
			end if;
        end if; 
      end process;
  end architecture comportamento;