# Lab 1: Introduction to VHDL Programming and Open-Source Simulation Environment

## Objective

* Set up and configure the VHDL development environment using **VS Code**, **GHDL**, and **GTKWave**.
* Understand the fundamental structure and components of a VHDL design.
* Write, simulate, and visualize a basic VHDL program.

---

# Theory

## Introduction to VHDL

VHDL (VHSIC Hardware Description Language) is an IEEE-standard hardware description language used to model digital systems at different abstraction levels, ranging from algorithmic descriptions to gate-level implementations.

Unlike conventional programming languages, VHDL models hardware behavior concurrently, meaning multiple operations can occur simultaneously, similar to real digital circuits.

---

# VHDL Structure

A VHDL design typically consists of three main components:

1. **Libraries and Packages**
2. **Entity**
3. **Architecture**

---

## 1. Libraries and Packages

Libraries contain predefined data types, constants, and functions.

### Commonly Used Libraries

### `std` Library

Automatically included in every VHDL design.

Provides basic data types such as:

* `bit`
* `integer`
* `boolean`
* `character`

### `IEEE` Library

Provides standard logic types used in hardware design.

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
```

* `STD_LOGIC_1164` provides `std_logic` and `std_logic_vector`
* `NUMERIC_STD` provides arithmetic operations

---

# Entity

The **entity** defines the external interface of a circuit.

It specifies:

* Input ports
* Output ports
* Signal directions
* Data types

## General Syntax

```vhdl
entity <entity_name> is
    port (
        <port_name> : <direction> <data_type>;
        <port_name> : <direction> <data_type>
    );
end entity <entity_name>;
```

## Port Directions

| Direction | Description          |
| --------- | -------------------- |
| `in`      | Input signal         |
| `out`     | Output signal        |
| `inout`   | Bidirectional signal |

## Example: 2-Input AND Gate Entity

```vhdl
entity AND_GATE is
    port (
        A : in std_logic;
        B : in std_logic;
        Y : out std_logic
    );
end entity AND_GATE;
```

---

# Architecture

The **architecture** defines the internal behavior of the entity.

## General Syntax

```vhdl
architecture <arch_name> of <entity_name> is
    -- Internal declarations
begin
    -- Logic description
end architecture <arch_name>;
```

## Example: AND Gate Architecture

```vhdl
architecture Behavioral of AND_GATE is
begin
    Y <= A and B;
end architecture Behavioral;
```

The statement:

```vhdl
Y <= A and B;
```

is a **concurrent signal assignment**, meaning it continuously monitors the inputs and updates the output whenever changes occur.

---

# Types of Architectural Models

## 1. Behavioral Model

Describes circuit behavior using sequential statements inside a `process` block.

```vhdl
architecture Behavioral of AND_GATE is
begin
    process(A, B)
    begin
        Y <= A and B;
    end process;
end architecture Behavioral;
```

---

## 2. Dataflow Model

Uses concurrent signal assignments.

```vhdl
architecture Dataflow of AND_GATE is
begin
    Y <= A and B;
end architecture Dataflow;
```

---

## 3. Structural Model

Builds circuits using interconnected components.

```vhdl
architecture Structural of AND_GATE is

    component AND2
        port (
            X, Z : in std_logic;
            W    : out std_logic
        );
    end component;

begin

    U1 : AND2
        port map (
            X => A,
            Z => B,
            W => Y
        );

end architecture Structural;
```

---

# Basic Data Types and Signals

## `std_logic`

Represents a single-bit signal.

Possible values include:

* `'0'`
* `'1'`
* `'Z'` (High Impedance)
* `'U'` (Uninitialized)

---

## `std_logic_vector`

Represents multiple bits (a bus).

Example:

```vhdl
std_logic_vector(7 downto 0)
```

Represents an 8-bit bus.

---

## Signals

Signals act as internal wires within an architecture.

```vhdl
architecture Behavioral of MY_CIRCUIT is

    signal internal_wire : std_logic;
    signal data_bus : std_logic_vector(7 downto 0);

begin

end architecture Behavioral;
```

---

# VHDL Design Cycle

The simulation workflow includes the following stages:

## 1. Analysis (Compilation)

* Checks syntax errors
* Verifies language rules

## 2. Elaboration

* Binds entities and architectures
* Connects signals

## 3. Simulation

* Applies input stimuli
* Verifies circuit behavior over time

## 4. Visual Verification

* GTKWave reads generated `.vcd` files
* Displays timing diagrams

---

# Discussion

The primary objective of this experiment was to design and simulate a digital system using VHDL within an open-source environment.

The transition from conceptual logic diagrams to hardware description demonstrated the concurrent nature of VHDL. Unlike sequential software programming, VHDL models signal propagation simultaneously, closely matching real hardware behavior.

The generated timing diagrams in GTKWave verified the correct operation of the designed circuit.

---

# Conclusion

This lab successfully demonstrated the workflow of digital design using VHDL and the open-source toolchain consisting of:

* VS Code
* GHDL
* GTKWave

The experiment provided practical experience in writing, compiling, simulating, and visualizing VHDL designs while reinforcing the concepts of concurrent hardware modeling.

---
