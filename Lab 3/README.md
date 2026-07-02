# Lab 3: Design and Simulation of Encoder and Decoder using VHDL

## Objective

The objective of this lab is to design and simulate combinational logic circuits using VHDL.

The main objectives are:

* To design and implement a **4-to-2 Priority Encoder** using VHDL
* To design and implement a **2-to-4 Decoder** using VHDL
* To create a testbench for verifying the circuits
* To simulate the designs using GHDL
* To verify the output waveform using GTKWave

---

## Files Included

| File Name          | Description                                  |
| ------------------ | -------------------------------------------- |
| `encoder_4to2.vhd` | VHDL design file for 4-to-2 priority encoder |
| `decoder_2to4.vhd` | VHDL design file for 2-to-4 decoder          |
| `encoder_tb.vhd`   | Testbench file used for simulation           |
| `wave.vcd`         | Generated simulation waveform file           |
| `image.png`        | Output waveform screenshot                   |
| `README.md`        | Final lab report                             |

---

## Theory

Combinational circuits are digital circuits whose outputs depend only on the present input values. These circuits do not store any previous state or memory. Encoders and decoders are important combinational circuits used in digital systems, communication systems, memory devices, and microprocessor-based applications.

In this lab, two combinational circuits were designed and simulated:

1. 4-to-2 Priority Encoder
2. 2-to-4 Decoder

Both circuits were implemented using VHDL and verified through waveform simulation.

---

## 4-to-2 Priority Encoder

A priority encoder is a combinational circuit that converts multiple input lines into a smaller binary code. In a priority encoder, when more than one input is active at the same time, the input with the highest priority is selected.

In this lab, a 4-to-2 priority encoder was implemented. It has four input lines and two output lines.

### Priority Order

The priority order is:

```text id="zqvb5i"
I3 > I2 > I1 > I0
```

This means `I3` has the highest priority, and `I0` has the lowest priority.

### Truth Table of 4-to-2 Priority Encoder

| I3 | I2 | I1 | I0 | Y1 | Y0 |
| -- | -- | -- | -- | -- | -- |
| 0  | 0  | 0  | 1  | 0  | 0  |
| 0  | 0  | 1  | X  | 0  | 1  |
| 0  | 1  | X  | X  | 1  | 0  |
| 1  | X  | X  | X  | 1  | 1  |

Here, `X` means “don’t care”. It can be either 0 or 1 because a higher-priority input is already active.

---

## 2-to-4 Decoder

A decoder is a combinational circuit that converts binary input into one of several output lines. A 2-to-4 decoder has two input lines and four output lines.

For each input combination, only one output line becomes active.

### Truth Table of 2-to-4 Decoder

| A1 | A0 | Y3 | Y2 | Y1 | Y0 |
| -- | -- | -- | -- | -- | -- |
| 0  | 0  | 0  | 0  | 0  | 1  |
| 0  | 1  | 0  | 0  | 1  | 0  |
| 1  | 0  | 0  | 1  | 0  | 0  |
| 1  | 1  | 1  | 0  | 0  | 0  |

The decoder activates the output line corresponding to the binary value of the input.

---

## Software and Tools Used

| Tool    | Purpose                           |
| ------- | --------------------------------- |
| VHDL    | Hardware description language     |
| VS Code | Code editing                      |
| GHDL    | VHDL compilation and simulation   |
| GTKWave | Waveform viewing and verification |

---

## Implementation

The encoder and decoder circuits were written in separate VHDL files. Each design file contains an entity and architecture.

The testbench was used to apply different input combinations to the circuits. After simulation, the generated waveform was analyzed to verify whether the outputs matched the expected truth tables.

---

## Simulation Procedure

The simulation was performed using the following steps:

1. Write the VHDL code for the 4-to-2 priority encoder.
2. Write the VHDL code for the 2-to-4 decoder.
3. Create a testbench to apply input combinations.
4. Compile the design files using GHDL.
5. Compile the testbench file.
6. Run the simulation and generate the `.vcd` waveform file.
7. Open the waveform file in GTKWave.
8. Compare the waveform output with the truth tables.

---

## Commands Used

```bash id="r4qikc"
ghdl -a encoder_4to2.vhd
ghdl -a decoder_2to4.vhd
ghdl -a encoder_tb.vhd
ghdl -e encoder_tb
ghdl -r encoder_tb --vcd=wave.vcd
gtkwave wave.vcd
```

---

## Output

The simulation waveform generated using GTKWave is shown below:

![Lab 3 Simulation Output](image.png)

The waveform shows the input and output behavior of the priority encoder and decoder. The output signals changed according to the applied input combinations.

---

## Observations

From the simulation waveform, the following observations were made:

* The priority encoder generated the correct binary output based on the highest-priority active input.
* When multiple encoder inputs were active, the highest-priority input was selected.
* The decoder activated only one output line for each 2-bit input combination.
* The output waveform matched the expected truth tables.
* No functional errors were observed during simulation.

---

## Discussion

This lab helped in understanding the working principle of encoder and decoder circuits. The priority encoder showed how multiple input lines can be converted into a compact binary output while following a priority order.

The decoder demonstrated the reverse operation, where a binary input activates one corresponding output line. These circuits are very useful in digital electronics, memory addressing, data selection, and processor design.

The use of VHDL made it easier to describe the circuits clearly. The testbench helped apply different input combinations automatically, and GTKWave provided a visual way to verify the output signals.

By comparing the simulation waveform with the truth tables, the correctness of both circuits was confirmed.

---

## Conclusion

The 4-to-2 Priority Encoder and 2-to-4 Decoder were successfully designed and simulated using VHDL.

The simulation results verified that both circuits worked according to their truth tables. The priority encoder correctly selected the highest-priority active input, and the decoder correctly activated one output line for each input combination.

Overall, this lab improved understanding of combinational logic circuits, VHDL design, testbench creation, and waveform-based verification.

---

## Repository Structure

```text id="ss4rsi"
Lab3/
├── README.md
├── decoder_2to4.vhd
├── encoder_4to2.vhd
├── encoder_tb.vhd
├── image.png
└── wave.vcd
```
