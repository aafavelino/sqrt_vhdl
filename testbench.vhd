-- Testbench for raiz
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component design is 
port(
    x : in  std_logic_vector(3 downto 0);
        clk : in std_logic; 
        reset : in std_logic;         
        r : out std_logic_vector(3 downto 0);
);
end component;

signal x_aux, r_aux : std_logic_vector(3 downto 0);
signal clk_aux: std_logic;
signal Stop  : BOOLEAN;
constant Period: TIME := 25 NS;
signal reset_aux: std_logic;


begin



reg: design port map(x_aux, clk_aux, reset_aux, r_aux);

  Clock_gen: process
  begin
    while not Stop loop
      clk_aux <= '1';
      wait for Period/2;
      clk_aux <= '0';
      wait for Period/2;
    end loop;
    wait;
  end process Clock_gen;

 teste_raiz: process
 begin
    x_aux <= '1001';
    wait for Period;
    
  
    Stop <= TRUE;    
    wait;
end process teste_raiz;


 end tb;
    