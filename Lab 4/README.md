Lab 4: VHDL Implementation of Multiplexer and Demultiplexer
Objective
To design and simulate a 4-to-1 Multiplexer and a 1-to-4 Demultiplexer using VHDL.

Theory
4-to-1 Multiplexer
A multiplexer (MUX) is a combinational circuit that selects one input from multiple inputs and forwards it to a single output based on select lines.

In a 4-to-1 MUX, there are 4 inputs and 2 select lines. The output depends on the select input combination.

1-to-4 Demultiplexer
A demultiplexer (DEMUX) does the opposite of a multiplexer. It takes one input and routes it to one of many outputs based on select lines.

A 1-to-4 DEMUX has 1 input, 2 select lines, and 4 outputs.

Truth Table
4-to-1 MUX
S1	S0	Output
0	0	D0
0	1	D1
1	0	D2
1	1	D3
1-to-4 DEMUX
S1	S0	Y0	Y1	Y2	Y3
0	0	D	0	0	0
0	1	0	D	0	0
1	0	0	0	D	0
1	1	0	0	0	D
Output
Multiplexer Simulation Output
MUX Output

Demultiplexer Simulation Output
DEMUX Output

Conclusion
In this lab, we successfully designed and simulated a 4-to-1 Multiplexer and a 1-to-4 Demultiplexer using VHDL. The results verified correct selection and data routing based on select lines.
 

