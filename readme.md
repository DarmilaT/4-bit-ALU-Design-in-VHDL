# 4-bit ALU Design in VHDL

## Overview

This repository contains a 4-bit Arithmetic Logic Unit (ALU) implemented in VHDL. The ALU is designed to perform a variety of arithmetic and logic operations on two 4-bit inputs, A and B. The operations are selected using an `opcode` and the mode (M) controls whether the operation is arithmetic or logical.

### **Key Features**:

- Arithmetic operations (e.g., addition, subtraction, transfer, etc.)
- Logic operations (e.g., AND, OR, XOR, XNOR)
- 4-bit input size
- Overflow handling (carry bit)
- Written in VHDL for FPGA synthesis and simulation

## Project Structure

- **ALU_4bit.vhd**: The main VHDL file containing the ALU entity and architecture.
- **ALU_testbench.vhd**: A testbench file to simulate and verify the functionality of the ALU.
- **README.md**: This documentation file.

## Design

The ALU is designed with the following components:

1. **Inputs**:
   - `A`: 4-bit signed input operand.
   - `B`: 4-bit signed input operand.
   - `M`: Mode selector for operation type (0 = arithmetic, 1 = logic).
   - `opcode`: 3-bit control signal to select the operation type.
2. **Outputs**:

   - `Y`: 4-bit result of the operation.
   - `carry`: 1-bit carry/overflow flag.

3. **Arithmetic Operations (M = 0)**:

   - `000`: Transfer A
   - `001`: A + 1
   - `010`: A + B
   - `011`: A + B + 1
   - `100`: A + Ones complement of B
   - `101`: A - B
   - `110`: Ones complement of A + B
   - `111`: B - A

4. **Logic Operations (M = 1)**:
   - `000`: A AND B
   - `001`: A OR B
   - `010`: A XOR B
   - `011`: A XNOR B

## Test Cases

The following table shows some test cases for the ALU operations based on the values of `M`, `A`, `B`, and `opcode`:

### **1. Arithmetic Operations (M = 0)**

| **M** | **A** | **B** | **Opcode** | **Operation**            | **Y (Output)** |
| ----- | ----- | ----- | ---------- | ------------------------ | -------------- |
| 0     | 1001  | 0011  | 000        | Transfer A               | 1001           |
| 0     | 1001  | 0011  | 001        | A + 1                    | 1010           |
| 0     | 1001  | 0011  | 010        | A + B                    | 1100           |
| 0     | 1001  | 0011  | 011        | A + B + 1                | 1101           |
| 0     | 1001  | 0011  | 100        | A + Ones complement of B | 0101           |
| 0     | 1001  | 0011  | 101        | A – B                    | 0110           |
| 0     | 1001  | 0011  | 110        | Ones complement of A + B | 1001           |
| 0     | 1001  | 0011  | 111        | B – A                    | 1010           |

### **2. Logic Operations (M = 1)**

| **M** | **A** | **B** | **Opcode** | **Operation** | **Y (Output)** |
| ----- | ----- | ----- | ---------- | ------------- | -------------- |
| 1     | 1010  | 1100  | 000        | A AND B       | 1000           |
| 1     | 1010  | 1100  | 001        | A OR B        | 1110           |
| 1     | 1010  | 1100  | 010        | A XOR B       | 0110           |
| 1     | 1010  | 1100  | 011        | A XNOR B      | 1001           |

## How to Simulate

1. **VHDL Simulator**:
   - You can simulate the design using any VHDL simulation tool such as ModelSim, Vivado, or GHDL.
2. **Steps**:
   - Compile the **ALU_4bit.vhd** and **ALU_testbench.vhd** files.
   - Run the simulation to verify the functionality of the ALU.
   - The test cases can be run directly from the testbench.

## Requirements

- VHDL-compatible simulator (e.g., ModelSim, Vivado, or GHDL).
- Basic understanding of VHDL syntax and simulation.

## Future Improvements

- Support for more arithmetic operations.
- Addition of support for larger bit-width inputs.
- Optimizations for faster synthesis.
- More detailed simulation reports.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
