library IEEE;
use IEEE.std_logic_1164.all;

entity raiz_quadrada is
port(
    x : in  std_logic_vector(3 downto 0);
        clk : in std_logic; 
        reset : in std_logic;         
        r : out std_logic_vector(3 downto 0);
);
end raiz_quadrada;

architecture estrutura of raiz_quadrada is
signal gravarR_aux, gravar1_aux, gravarS_aux,gravarD_aux, gravar2_aux, gravar4_aux: std_logic;
signal saidaMuxR_aux, saidaMuxD_aux, saidaMuxS_aux: std_logic_vector(3 downto 0);
signal entradaSomadorR_aux, saidaSomadorR_aux, entradaMuxR_aux , entradaMuxD_aux,  entradaSomadorD_aux, saidaSomadorD_aux, entradaSomadorS_aux, saidaSomadorS_aux, entradaMuxS_aux, saidaSomadorS1_aux : std_logic_vector(3 downto 0);
signal selMuxR_aux, selMuxD_aux, selMuxS_aux: std_logic;


component mux is 
port( en1, en2        : in std_logic_vector(3 downto 0);
    sel             : in std_logic;
        saida             : out std_logic_vector(3 downto 0));
end component;

component registrador is
  port(
        clk: in std_logic; 
        reset: in std_logic;
        gravar: in std_logic; 
    entrada: in std_logic_vector(3 downto 0);
        saida: out std_logic_vector(3 downto 0));
end component;

component somador4bits is
  port(a4, b4: in std_logic_vector(3 downto 0);
       s4: out std_logic_vector(3 downto 0)
    );
end component;

begin

--while saidaSomadorS1_aux > x loop

--mapeamento de portas do registradorR com somador e multiplexador
registradorR  : registrador port map(clk, reset, gravarR_aux, saidaMuxR_aux, entradaSomadorR_aux);
registrador1  : registrador port map(clk, reset, gravar1_aux, "0001", entradaMuxR_aux);
muxR      : mux port map(saidaSomadorR_aux, entradaMuxR_aux, selMuxR_aux, saidaMuxR_aux);
somadorR    : somador4bits port map(entradaSomadorR_aux, entradaMuxR_aux, saidaSomadorR_aux);

--mapeamento de portas do registradorD com somador e multiplexador
registradorD  : registrador port map(clk, reset, gravarD_aux, saidaMuxD_aux, entradaSomadorD_aux);
registrador2  : registrador port map(clk, reset, gravar2_aux, "0010", entradaMuxD_aux);
muxD        : mux port map(saidaSomadorD_aux, entradaMuxD_aux, selMuxD_aux, saidaMuxD_aux);
somadorD    : somador4bits port map(entradaSomadorD_aux, entradaMuxD_aux, saidaSomadorD_aux);

--mapeamento de portas do registradorS com os dois somadores somador e multiplexador
registradorS : registrador port map(clk, reset, gravarS_aux, saidaMuxS_aux, entradaSomadorS_aux);
registrador4 : registrador port map(clk, reset, gravar4_aux, "0001", entradaMuxS_aux);
somadorS   : somador4bits port map(entradaSomadorS_aux,entradaMuxR_aux, saidaSomadorS_aux); --s+d
somadorS1  : somador4bits port map(saidaSomadorS_aux, saidaSomadorD_aux, saidaSomadorS1_aux); --(s+d)+1
muxS     : mux port map(saidaSomadorS1_aux, entradaMuxS_aux, selMuxS_aux, saidaMuxS_aux);  

--end loop;

end architecture;





