# 🧪 Lab 2: VHDL Implementation and Verification of Basic Logic Gates

## 🎯 Objective

To design and simulate the fundamental logic gates (AND, OR, NOT, NAND, NOR, XOR, and XNOR) using VHDL and verify their functionality through waveform analysis using GTKWave.

---

## 📖 Theory

Logic gates are the fundamental building blocks of digital systems. They operate on binary inputs and generate outputs according to predefined logical rules based on Boolean algebra.

VHDL provides built-in logical operators that allow direct implementation of these gates. By describing the behavior of each gate in VHDL, digital circuits can be modeled, simulated, and verified before hardware realization.

| Logic Gate | VHDL Operator | Boolean Function |
| ---------- | ------------- | ---------------- |
| AND        | and           | Y = A · B        |
| OR         | or            | Y = A + B        |
| NOT        | not           | Y = A̅           |
| NAND       | nand          | Y = (A · B)̅     |
| NOR        | nor           | Y = (A + B)̅     |
| XOR        | xor           | Y = A ⊕ B        |
| XNOR       | xnor          | Y = (A ⊕ B)̅     |

---

## 💻 Implementation

Separate VHDL source files were created for each logic gate. Corresponding testbenches were also developed to apply different input combinations and observe the resulting outputs.

The designs were compiled and simulated using GHDL, while GTKWave was used to visualize and analyze the generated waveforms.

### Simulation Procedure

1. Write the VHDL code for the required logic gate.
2. Create a testbench to generate input patterns.
3. Compile the design and testbench using GHDL.
4. Run the simulation and generate a VCD waveform file.
5. Open the waveform file in GTKWave for verification.

---

## 📊 Simulation Results

### Output Waveform
![Output Waveform](Output.png)

*Figure: Simulated waveform showing input-output behavior of the implemented logic gate(s).*

### Observations

* All possible input combinations were applied successfully.
* Output signals changed according to the expected logical operations.
* Simulation waveforms matched the corresponding truth tables.
* No functional errors were observed during verification.

---

## 💬 Discussion

This experiment provided practical experience in describing digital circuits using VHDL. The use of testbenches demonstrated how circuit functionality can be validated before implementation on hardware. Waveform analysis in GTKWave offered a clear visualization of signal transitions and helped confirm the correctness of each logic gate design.

The lab also strengthened understanding of the relationship between Boolean logic expressions and their hardware representations.

---

## 📌 Conclusion

The basic logic gates (AND, OR, NOT, NAND, NOR, XOR, and XNOR) were successfully implemented using VHDL and verified through simulation. The generated waveforms confirmed that all gates operated according to their respective truth tables. This experiment enhanced understanding of digital logic design, VHDL coding, and simulation-based verification techniques.

---
