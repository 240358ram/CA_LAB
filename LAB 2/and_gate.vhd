library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_GATE is
    Port (
        A_tb : in STD_LOGIC;
        B_tb : in STD_LOGIC;
        Y_tb : out STD_LOGIC
    );
end AND_GATE;

architecture Behavioral of AND_GATE is
begin
    Y <= A and B;
end Behavioral;