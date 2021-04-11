library IEEE;
use IEEE.std_logic_1164.all;

entity somador4bits is
	port(a4, b4: in std_logic_vector(3 downto 0);
    	 s4: out std_logic_vector(3 downto 0)
    );
end somador4bits;

architecture estrutura of somador4bits is
signal cin_aux, cout_aux : std_logic_vector(4 downto 0);

component somador1bit is
	port(
    	a		: in 	std_logic;
        b		: in 	std_logic;
        cin 	: in 	std_logic;
        s		: out  	std_logic;
        cout	: out  	std_logic
    );
end component;


begin


somador0: somador1bit 
	port map(
    	a => a4(0),
        b => b4(0),
        cin => '0',
        s => s4(0),
        cout => cout_aux(0));
        
somador1: somador1bit
	port map(
    	a => a4(1),
        b => b4(1),
        cin => cout_aux(0),
        s => s4(1),
        cout => cout_aux(1));
       
       
somador2: somador1bit
	port map(
    	a => a4(2),
        b => b4(2),
        cin => cout_aux(1),
        s => s4(2),
        cout => cout_aux(2));
       
somador3: somador1bit
	port map(
    	a => a4(3),
        b => b4(3),
        cin => cout_aux(2),
        s => s4(3),
        cout => cout_aux(3));

end estrutura;
