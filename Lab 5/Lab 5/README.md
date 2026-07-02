# 2-Bit Comparator using VHDL

## Lab 5

This project implements a **2-bit digital comparator** using VHDL. The comparator compares two 2-bit binary inputs, `A` and `B`, and generates three output signals:

- `EQ = 1` when `A = B`
- `GT = 1` when `A > B`
- `LT = 1` when `A < B`

The design is written using the `IEEE.NUMERIC_STD` package so that the `STD_LOGIC_VECTOR` inputs can be safely compared as unsigned binary numbers.

---

## Project Structure

```text
Lab 5/
├── COMPARATOR_2BIT.vhd      # Main VHDL design file
├── COMPARATOR_TB.vhd        # Testbench file
├── README.md                # Project documentation
└── image.png                # Simulation/output image
```

---

## Output Image

> Keep `image.png` in the same folder as this `README.md` file.

![2-Bit Comparator Simulation Output](image.png)

---

## Design Description

A comparator is a combinational digital circuit that compares two binary numbers and shows the relationship between them. In this project, both inputs are 2-bit numbers, so each input can represent values from `0` to `3`.

The comparator checks the following conditions:

1. If `A` is equal to `B`, then `EQ` becomes `1`.
2. If `A` is greater than `B`, then `GT` becomes `1`.
3. If `A` is less than `B`, then `LT` becomes `1`.

Only one output is active at a time.

---

## Entity Declaration

```vhdl
entity COMPARATOR_2BIT is
    port (
        A  : in  STD_LOGIC_VECTOR(1 downto 0);
        B  : in  STD_LOGIC_VECTOR(1 downto 0);
        EQ : out STD_LOGIC;
        GT : out STD_LOGIC;
        LT : out STD_LOGIC
    );
end entity COMPARATOR_2BIT;
```

---

## Port Description

| Signal | Direction | Size | Description |
|---|---:|---:|---|
| `A` | Input | 2-bit | First binary input |
| `B` | Input | 2-bit | Second binary input |
| `EQ` | Output | 1-bit | High when `A = B` |
| `GT` | Output | 1-bit | High when `A > B` |
| `LT` | Output | 1-bit | High when `A < B` |

---

## Main VHDL Code

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity COMPARATOR_2BIT is
    port (
        A  : in  STD_LOGIC_VECTOR(1 downto 0);
        B  : in  STD_LOGIC_VECTOR(1 downto 0);
        EQ : out STD_LOGIC;  -- A = B
        GT : out STD_LOGIC;  -- A > B
        LT : out STD_LOGIC   -- A < B
    );
end entity COMPARATOR_2BIT;

architecture Behavioral of COMPARATOR_2BIT is
begin
    process(A, B)
    begin
        if unsigned(A) = unsigned(B) then
            EQ <= '1';
            GT <= '0';
            LT <= '0';

        elsif unsigned(A) > unsigned(B) then
            EQ <= '0';
            GT <= '1';
            LT <= '0';

        else
            EQ <= '0';
            GT <= '0';
            LT <= '1';
        end if;
    end process;
end architecture Behavioral;
```

---

## Testbench Code

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMPARATOR_TB is
end entity COMPARATOR_TB;

architecture Simulation of COMPARATOR_TB is

    signal A, B : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal EQ, GT, LT : STD_LOGIC;

begin

    DUT : entity work.COMPARATOR_2BIT
        port map (
            A  => A,
            B  => B,
            EQ => EQ,
            GT => GT,
            LT => LT
        );

    STIMULUS : process
    begin
        A <= "00"; B <= "00"; wait for 10 ns; -- EQ = 1
        A <= "01"; B <= "00"; wait for 10 ns; -- GT = 1
        A <= "00"; B <= "01"; wait for 10 ns; -- LT = 1
        A <= "10"; B <= "11"; wait for 10 ns; -- LT = 1
        A <= "11"; B <= "10"; wait for 10 ns; -- GT = 1
        A <= "11"; B <= "11"; wait for 10 ns; -- EQ = 1

        wait;
    end process;

end architecture Simulation;
```

---

## Test Cases

| Time | A | B | Expected EQ | Expected GT | Expected LT | Result |
|---:|---|---|---:|---:|---:|---|
| 0 ns | `00` | `00` | 1 | 0 | 0 | A = B |
| 10 ns | `01` | `00` | 0 | 1 | 0 | A > B |
| 20 ns | `00` | `01` | 0 | 0 | 1 | A < B |
| 30 ns | `10` | `11` | 0 | 0 | 1 | A < B |
| 40 ns | `11` | `10` | 0 | 1 | 0 | A > B |
| 50 ns | `11` | `11` | 1 | 0 | 0 | A = B |

---

## How to Run

### Using Xilinx Vivado

1. Create a new RTL project.
2. Add `COMPARATOR_2BIT.vhd` as the design source.
3. Add `COMPARATOR_TB.vhd` as the simulation source.
4. Set `COMPARATOR_TB` as the simulation top module.
5. Run behavioral simulation.
6. Observe the waveform for `A`, `B`, `EQ`, `GT`, and `LT`.

### Using ModelSim/QuestaSim

```bash
vlib work
vcom COMPARATOR_2BIT.vhd
vcom COMPARATOR_TB.vhd
vsim work.COMPARATOR_TB
run 70 ns
```

### Using GHDL

```bash
ghdl -a COMPARATOR_2BIT.vhd
ghdl -a COMPARATOR_TB.vhd
ghdl -e COMPARATOR_TB
ghdl -r COMPARATOR_TB --wave=comparator_2bit.ghw
```

---

## Expected Output

The waveform should show that:

- `EQ` is high only when both inputs are equal.
- `GT` is high only when input `A` is greater than input `B`.
- `LT` is high only when input `A` is less than input `B`.
- At any time, only one output among `EQ`, `GT`, and `LT` should be high.

---

## Conclusion

The 2-bit comparator was successfully designed and verified using a VHDL testbench. The simulation confirms that the circuit correctly identifies whether input `A` is equal to, greater than, or less than input `B`.
