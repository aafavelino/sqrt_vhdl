-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity somador1bit is
	port(
    	a, b	: in 	std_logic;
        cin 	: in 	std_logic;
        s		: out  	std_logic;
        cout	: out  	std_logic);
end somador1bit;

architecture comportamento of somador1bit is
begin

	s <= a xor b xor cin;
    cout <= (a and b) or (a and cin) or (b and cin);

end architecture comportamento;