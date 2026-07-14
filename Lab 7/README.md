# Lab 7: VHDL Implementation of Sequential Circuits — Flip-Flops

---

## Objective

The main objectives of this lab were:

* To design SR, D, JK, and T flip-flops using VHDL.
* To simulate and verify the behavior of each flip-flop.
* To understand how the clock signal controls the operation of sequential circuits.
* To observe how flip-flops store and update binary information on the rising edge of the clock.

---

## Theory

A flip-flop is a basic sequential logic component capable of storing one bit of binary information. Unlike combinational circuits, where the output depends only on the current input values, the output of a sequential circuit depends on both the current inputs and the previously stored state.

In this lab, all four flip-flops were designed as rising-edge-triggered devices. This means that their outputs are updated only when the clock signal changes from logic `0` to logic `1`. Any change in the input signals between two rising edges does not immediately affect the stored output.

Flip-flops are widely used in digital systems to construct registers, counters, memory units, frequency dividers, and finite state machines.

---

## 1. SR Flip-Flop

The SR flip-flop has two control inputs:

* `S` for Set
* `R` for Reset

When the Set input is active, the output becomes `1`. When the Reset input is active, the output becomes `0`. When both inputs are inactive, the flip-flop keeps its previous state.

The condition `S = 1` and `R = 1` is considered invalid or forbidden because it does not define a reliable next state in a standard SR flip-flop.

| S | R | Next State of Q        |
| - | - | ---------------------- |
| 0 | 0 | No change              |
| 0 | 1 | Reset to 0             |
| 1 | 0 | Set to 1               |
| 1 | 1 | Forbidden or undefined |

---

## 2. D Flip-Flop

The D flip-flop has a single data input called `D`. On every rising edge of the clock, the value available at the D input is transferred directly to the output.

The next-state equation is:

```text
Q(next) = D
```

The D flip-flop avoids the invalid condition found in the SR flip-flop because it uses only one data input. It is commonly used in registers, memory circuits, and data-storage applications.

---

## 3. JK Flip-Flop

The JK flip-flop is an improved version of the SR flip-flop. It uses two inputs, `J` and `K`, and removes the forbidden state of the SR design.

When both J and K are equal to `1`, the output toggles. This means that a stored `0` becomes `1`, while a stored `1` becomes `0`.

The characteristic equation of the JK flip-flop is:

```text
Q(next) = J·Q' + K'·Q
```

| J | K | Next State of Q |
| - | - | --------------- |
| 0 | 0 | No change       |
| 0 | 1 | Reset to 0      |
| 1 | 0 | Set to 1        |
| 1 | 1 | Toggle          |

---

## 4. T Flip-Flop

The T flip-flop has one control input called `T`, where T stands for Toggle.

When `T = 0`, the flip-flop keeps its current state. When `T = 1`, the output changes to its opposite value on every rising edge of the clock.

The next-state equation is:

```text
Q(next) = T ⊕ Q
```

| T | Next State of Q |
| - | --------------- |
| 0 | No change       |
| 1 | Toggle          |

The T flip-flop is commonly used in counters and frequency-divider circuits.

---

# Design Files

## 1. SR Flip-Flop

**Filename:** `sr_ff.vhd`

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_FF is
    port (
        CLK : in  std_logic;
        S   : in  std_logic;
        R   : in  std_logic;
        Q   : out std_logic;
        QB  : out std_logic
    );
end entity SR_FF;

architecture Behavioral of SR_FF is
    signal Q_int : std_logic := '0';
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if S = '0' and R = '0' then
                null;                   -- Hold previous state

            elsif S = '0' and R = '1' then
                Q_int <= '0';           -- Reset

            elsif S = '1' and R = '0' then
                Q_int <= '1';           -- Set

            else
                Q_int <= 'X';           -- Forbidden condition
            end if;
        end if;
    end process;

    Q  <= Q_int;
    QB <= not Q_int;
end architecture Behavioral;
```

The internal signal `Q_int` stores the current state of the flip-flop. The output changes only when a rising edge is detected on the clock signal.

For the forbidden input combination, the internal output is assigned `X` during simulation to clearly indicate an invalid state.

---

## 2. D Flip-Flop

**Filename:** `d_ff.vhd`

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF is
    port (
        CLK : in  std_logic;
        D   : in  std_logic;
        Q   : out std_logic;
        QB  : out std_logic
    );
end entity D_FF;

architecture Behavioral of D_FF is
    signal Q_int : std_logic := '0';
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            Q_int <= D;
        end if;
    end process;

    Q  <= Q_int;
    QB <= not Q_int;
end architecture Behavioral;
```

At every rising edge of the clock, the value of `D` is stored in `Q_int`. The outputs `Q` and `QB` then represent the stored value and its complement.

---

## 3. JK Flip-Flop

**Filename:** `jk_ff.vhd`

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FF is
    port (
        CLK : in  std_logic;
        J   : in  std_logic;
        K   : in  std_logic;
        Q   : out std_logic;
        QB  : out std_logic
    );
end entity JK_FF;

architecture Behavioral of JK_FF is
    signal Q_int : std_logic := '0';
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if J = '0' and K = '0' then
                null;                   -- Hold previous state

            elsif J = '0' and K = '1' then
                Q_int <= '0';           -- Reset

            elsif J = '1' and K = '0' then
                Q_int <= '1';           -- Set

            else
                Q_int <= not Q_int;     -- Toggle
            end if;
        end if;
    end process;

    Q  <= Q_int;
    QB <= not Q_int;
end architecture Behavioral;
```

The JK flip-flop behaves similarly to the SR flip-flop for the Set, Reset, and Hold conditions. However, when both J and K are equal to `1`, the stored output toggles instead of entering an undefined state.

---

## 4. T Flip-Flop

**Filename:** `t_ff.vhd`

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FF is
    port (
        CLK : in  std_logic;
        T   : in  std_logic;
        Q   : out std_logic;
        QB  : out std_logic
    );
end entity T_FF;

architecture Behavioral of T_FF is
    signal Q_int : std_logic := '0';
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if T = '1' then
                Q_int <= not Q_int;     -- Toggle
            end if;
        end if;
    end process;

    Q  <= Q_int;
    QB <= not Q_int;
end architecture Behavioral;
```

When the T input is active, the output changes state on every rising clock edge. When T is inactive, no assignment is made, so the previous state is retained.

---

# Testbench File

**Filename:** `ff_tb.vhd`

A single testbench was used to test all four flip-flops at the same time. A clock signal with a period of 20 ns was generated continuously.

Each input condition was maintained long enough to include at least one rising clock edge. This allowed the behavior of each flip-flop to be clearly observed in the waveform.

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FF_TB is
end entity FF_TB;

architecture Simulation of FF_TB is

    signal CLK                       : std_logic := '0';

    signal S, R                      : std_logic := '0';
    signal D                         : std_logic := '0';
    signal J, K                      : std_logic := '0';
    signal T                         : std_logic := '0';

    signal Q_SR, Q_D, Q_JK, Q_T     : std_logic;
    signal QB_SR, QB_D, QB_JK, QB_T : std_logic;

    constant CLK_PERIOD : time := 20 ns;

begin

    -- Clock generation
    CLK <= not CLK after CLK_PERIOD / 2;

    -- Flip-flop instances
    U1 : entity work.SR_FF
        port map (
            CLK => CLK,
            S   => S,
            R   => R,
            Q   => Q_SR,
            QB  => QB_SR
        );

    U2 : entity work.D_FF
        port map (
            CLK => CLK,
            D   => D,
            Q   => Q_D,
            QB  => QB_D
        );

    U3 : entity work.JK_FF
        port map (
            CLK => CLK,
            J   => J,
            K   => K,
            Q   => Q_JK,
            QB  => QB_JK
        );

    U4 : entity work.T_FF
        port map (
            CLK => CLK,
            T   => T,
            Q   => Q_T,
            QB  => QB_T
        );

    STIMULUS : process
    begin

        --------------------------------------------------
        -- SR flip-flop test
        --------------------------------------------------

        S <= '1';
        R <= '0';
        wait for 40 ns;              -- Set

        S <= '0';
        R <= '1';
        wait for 40 ns;              -- Reset

        S <= '0';
        R <= '0';
        wait for 40 ns;              -- Hold

        S <= '1';
        R <= '1';
        wait for 40 ns;              -- Forbidden condition

        S <= '0';
        R <= '0';

        --------------------------------------------------
        -- D flip-flop test
        --------------------------------------------------

        D <= '1';
        wait for 40 ns;              -- Store 1

        D <= '0';
        wait for 40 ns;              -- Store 0

        --------------------------------------------------
        -- JK flip-flop test
        --------------------------------------------------

        J <= '1';
        K <= '0';
        wait for 40 ns;              -- Set

        J <= '0';
        K <= '0';
        wait for 40 ns;              -- Hold

        J <= '1';
        K <= '1';
        wait for 40 ns;              -- Toggle

        J <= '0';
        K <= '1';
        wait for 40 ns;              -- Reset

        --------------------------------------------------
        -- T flip-flop test
        --------------------------------------------------

        T <= '1';
        wait for 80 ns;              -- Toggle on multiple rising edges

        T <= '0';
        wait for 40 ns;              -- Hold

        wait;
    end process;

end architecture Simulation;
```

Using named port mapping makes the testbench easier to read and reduces the possibility of connecting signals to the wrong ports.

---

# Simulation Commands

The following GHDL commands were used to analyze, elaborate, and simulate the VHDL files.

```bash
# Analyze the design files and testbench
ghdl -a sr_ff.vhd d_ff.vhd jk_ff.vhd t_ff.vhd ff_tb.vhd

# Elaborate the testbench
ghdl -e FF_TB

# Run the simulation and generate a VCD waveform file
ghdl -r FF_TB --vcd=flipflops.vcd --stop-time=600ns

# Open the generated waveform in GTKWave
gtkwave flipflops.vcd
```

The `--stop-time` option is useful because the testbench ends with an indefinite `wait` statement while the clock continues to run. Without a stop time, the simulation may continue indefinitely.

---

# Simulation Output File

**Filename:** `flipflops.vcd`

The Value Change Dump file was generated by GHDL during simulation. It recorded the changes in the clock, input, and output signals of all four flip-flops.

The file was then opened in GTKWave for visual analysis.

## Simulation Waveform

<p align="center">
  <img src="flipflops.png" alt="GTKWave simulation waveform for SR, D, JK, and T flip-flops" width="100%">
</p>

<p align="center">
  <em>Figure 1: GTKWave output showing the simulated behavior of the SR, D, JK, and T flip-flops.</em>
</p>

The following signals were examined:

* `CLK`
* `S`, `R`, `Q_SR`, and `QB_SR`
* `D`, `Q_D`, and `QB_D`
* `J`, `K`, `Q_JK`, and `QB_JK`
* `T`, `Q_T`, and `QB_T`

---

# Observations

The simulation waveform showed that all four flip-flops responded only at the rising edge of the clock signal.

### SR Flip-Flop

* When `S = 1` and `R = 0`, the output Q was set to `1`.
* When `S = 0` and `R = 1`, the output Q was reset to `0`.
* When `S = 0` and `R = 0`, the previous value of Q was retained.
* When `S = 1` and `R = 1`, the output entered the undefined `X` state in the simulation.

### D Flip-Flop

* When D was `1`, Q became `1` at the next rising edge.
* When D was `0`, Q became `0` at the next rising edge.
* Changes in D between clock edges did not immediately change the output.

### JK Flip-Flop

* When `J = 1` and `K = 0`, Q was set to `1`.
* When `J = 0` and `K = 1`, Q was reset to `0`.
* When `J = 0` and `K = 0`, Q retained its previous value.
* When `J = 1` and `K = 1`, Q toggled on every rising edge.

### T Flip-Flop

* When `T = 1`, Q changed to its opposite value on every rising edge.
* When `T = 0`, Q maintained its previous value.

For every valid output state, `QB` remained the logical complement of `Q`.

---

# Discussion

This lab clearly demonstrated the difference between combinational and sequential circuit behavior. The output of each flip-flop depended not only on the input signals but also on its previously stored value.

The clock signal played an important role in controlling when the state was allowed to change. Although the input signals could change at any time, the flip-flops only sampled those inputs at the rising edge of the clock.

The SR flip-flop demonstrated basic Set, Reset, and Hold operations, but it also contained a forbidden input condition. The D flip-flop removed this problem by using a single data input. The JK flip-flop provided additional functionality by converting the invalid SR condition into a toggle operation. The T flip-flop offered the simplest method of toggling a stored bit and is especially useful in counter circuits.

The unified testbench made it possible to compare the behavior of all four flip-flops under the same clock signal. GTKWave provided a clear visual representation of how the input conditions affected the outputs at each rising edge.

---

# Conclusion

In this lab, SR, D, JK, and T flip-flops were successfully designed and simulated using VHDL behavioral modeling.

The simulation results confirmed that:

* The SR flip-flop correctly performed Set, Reset, and Hold operations.
* The D flip-flop stored the value present at the D input.
* The JK flip-flop performed Set, Reset, Hold, and Toggle operations.
* The T flip-flop toggled its output whenever T was active.
* All output changes occurred only on the rising edge of the clock.
* The complementary output `QB` remained opposite to `Q`.

This experiment provided a practical understanding of clock-controlled storage elements and their importance in sequential digital systems. The concepts learned in this lab form the foundation for designing more advanced circuits such as registers, counters, memory systems, and finite state machines.
