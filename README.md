# BasicCalculator

### FPGA-Based Basic Arithmetic Module

This Verilog code presents a basic arithmetic module implemented on an FPGA. The module, named `basicmath`, performs various arithmetic operations based on provided inputs. It includes functionality for addition, subtraction, multiplication, and division, utilizing separate modules for individual operations.

- **Module Breakdown**:
  - **`basicmath`**: This module receives inputs for two operands (`op1` and `op2`) and control signals (`sub`, `add`, `mult`, `div`) to indicate the desired operation. It includes internal modules for multiplication (`multiplier`), addition/subtraction (`adder`), and division (`divider`).
  - **`multiplier`**: A module that performs multiplication of the provided operands using bitwise operations.
  - **`adder`**: An adder/subtractor module that calculates addition or subtraction based on control signals.
  - **`divider`**: A module implementing a division algorithm to compute quotient and remainder.

- **Output Display**: The output of the arithmetic operations is shown on 4 LEDs of the FPGA board. Each LED might represent a specific bit of the resulting value.

- **Simulation**: The code is designed for FPGA implementation and has not been simulated directly. However, the output has been displayed virtually using an FPGA simulation environment.

**Note**: The commented-out section at the end (`basicmath_new`) showcases an alternative implementation using a case statement for arithmetic operations.

This project serves as a foundational example of basic arithmetic operations implemented in Verilog for FPGA-based systems.
