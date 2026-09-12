# 8-bit-ALU-RTL-Design-Verification
Designed a 16-operation 8-bit ALU in Verilog (arithmetic, shift, and bitwise operations) with 4-bit opcode decoding and a 16-bit result path.
Built three independent Verilog testbenches with varied operand/opcode stimulus sets to functionally validate all 16 operations via waveform-based output checking in Vivado behavioral simulation.
Synthesized and implemented the design on Xilinx 7-series FPGA; reviewed post-implementation schematic and resource utilization (217 LUTs, 37 CARRY4s) to understand RTL-to-gate mapping
