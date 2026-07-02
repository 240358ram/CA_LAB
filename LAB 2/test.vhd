library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_and_gate is
end tb_and_gate;

architecture sim of tb_and_gate is
  component AND_GATE port(A, B : in STD_LOGIC; Y : out STD_LOGIC); end component;
  signal A_tb, B_tb, Y_tb : STD_LOGIC := '0';
begin
  uut: AND_GATE port map(A => A_tb, B => B_tb, Y => Y_tb);
  process
  begin
    A_tb <= '0'; B_tb <= '0'; wait for 20 ns;
    A_tb <= '0'; B_tb <= '1'; wait for 20 ns;
    A_tb <= '1'; B_tb <= '0'; wait for 20 ns;
    A_tb <= '1'; B_tb <= '1'; wait for 20 ns;
  end process;
end sim;