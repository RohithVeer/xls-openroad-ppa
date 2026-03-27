## XLS → OpenROAD PPA Exploration
-----

## Description

This project demonstrates a complete RTL-to-GDSII ASIC design flow using the OpenROAD toolchain. It focuses on evaluating Performance, Power, and Area (PPA) for matrix multiplication architectures, integrating RTL design, simulation, and physical implementation in a modern open-source VLSI workflow.

------
## Installation
1. Clone the repository
2. Ensure dependencies for OpenROAD and simulation tools are installed
3. Navigate to the project directory

----
## Run Simulation
```
cd sim
./run.sh
```
-------

## Manual Simulation Flow
```
iverilog -g2012 ../rtl/*.v -o test.out
vvp test.out
gtkwave wave.vcd
```
---------
## Run OpenROAD Flow

```
 cd OpenROAD-flow-scripts/flow
make DESIGN_CONFIG=./designs/nangate45/gcd/config.mk
```
----------------
### Features

1. Multiple matrix multiplication architectures:
       Systolic Array
      Unrolled Design
      Streaming Processing Elements
2. Full RTL-to-GDSII flow
3. Functional verification with waveform analysis
4. Automated PPA extraction (Timing, Power, Area)
5. Reusable framework for accelerator exploration

------------------------------
## Results
 
### Simulation Output

1. C00 = 19
2. C01 = 22
3. C10 = 43
4. C11 = 50
   
-----------------------------
## GTKwave Results

<img width="1520" height="729" alt="Screenshot 2026-03-27 125134" src="https://github.com/user-attachments/assets/99fb961e-5f17-4954-a05e-11421c982f2a" />

-------------------------------------
### PPA Metrics

1. Timing
2. WNS: -0.05 ns
3. TNS: -0.73 ns
4. Critical Path: 0.4138 ns
5. Max Frequency: ~1977 MHz
   
 --------------------------
 
### Power

1. Sequential: 0.000605 W
2. Combinational: 0.00283 W
3. Clock: 0.000303 W
4. Total: 3.74 mW

------------------------------------
### Area

1. Standard-cell implementation using Nangate45 library
2. Extracted post-placement and routing

------------------------------------------
## Analysis

1. Near timing closure with minor violations
2. Power dominated by combinational logic (~75%)
3. Successful placement, routing, and CTS
4. Clean GDSII with no critical DRC violations

-----------------------------------------------------
### Challenges

1. Resolving OpenROAD dependency issues
2. Debugging post-CTS timing violations
3. Ensuring correct simulation setup
4. Integrating RTL with physical design flow

 ---------------------------------------------------------

### Conclusion

This project provides a practical foundation for understanding RTL-to-GDS ASIC design using open-source tools and highlights real-world trade-offs between performance, power, and area.

 ----------------------------------------------------------
### Acknowledgements

- [Mehdi Saligane](https://github.com/msaligane)
- [Xinting Jiang](https://www.linkedin.com/in/xinting-jiang-74a42b28b/)

  
