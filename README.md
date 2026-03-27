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

## RTl-GSDII Results

## Baseline Design

<img width="1536" height="766" alt="Screenshot 2026-03-27 120918" src="https://github.com/user-attachments/assets/028d669a-8480-4174-9628-a568908340fc" />

## Matmul_Systolic

<img width="1530" height="771" alt="Screenshot 2026-03-27 190911" src="https://github.com/user-attachments/assets/6e9efd5a-3757-4d23-98f5-27e364aa700d" />

## Matmul_Unrolled

<img width="1541" height="780" alt="Screenshot 2026-03-27 190954" src="https://github.com/user-attachments/assets/3fd60737-74d5-4c05-bc0a-83b607b93fb9" />

-------------------------------------
## GTKwave Results

<img width="1520" height="729" alt="Screenshot 2026-03-27 125134" src="https://github.com/user-attachments/assets/99fb961e-5f17-4954-a05e-11421c982f2a" />

-------------------------------------
##  RTL → GDS PPA Comparison

| Metric | Baseline Design | Systolic MatMul | Unrolled MatMul |
|--------|---------------|----------------|----------------|
| WNS (ns) | -0.05 | 0.00 | 0.00 |
| TNS (ns) | -0.73 | 0.00 | 0.00 |
| Worst Slack (ns) | — | +3.55 | +3.63 |
| Critical Path (ns) | 0.4138 | — | — |
| Max Frequency (MHz) | ~1977 | ~200 | ~200 |
| Sequential Power (W) | 0.000605 | 0.00081 | 0.00000 |
| Combinational Power (W) | 0.00283 | 0.0129 | 0.00375 |
| Clock Power (W) | 0.000303 | 0.000152 | 0.00000 |
| **Total Power** | **3.74 mW** | **13.9 mW** | **3.75 mW** |
| **Area (µm²)** | — | **8694** | **3629** |

------------------------------------

##  Observations

- The baseline design shows timing violations (negative WNS/TNS), while both systolic and unrolled architectures achieve full timing closure.
- The systolic design consumes higher power due to increased data movement and structured pipeline execution.
- The unrolled design is more area and power-efficient for small matrix sizes.
- The systolic architecture is expected to scale better for larger matrix dimensions

  ----------------------------------------------
### Area

- Standard cell implementation using Nangate45 library.
- Extracted from post placement and routing reports.

------------------------------------------
## Analysis

- Baseline design shows timing violations, while both systolic and unrolled architectures achieve full timing closure.
- Power is dominated by combinational logic due to  intensive MAC operations.
- Clean GDSII generation with no critical DRC violations.

-----------------------------------------------------
### Challenges

- Resolving OpenROAD dependency issues.
- Debugging timing violations after clock tree synthesis.
- Ensuring correct simulation setup and waveform validation.
- integrating RTL with full physical design flow

 ---------------------------------------------------------

### Conclusion

This project demonstrates a complete RTL-GDSII implementation using open-source tools and highlights trade-offs between performance, power, and area across different hardware architectures

 ----------------------------------------------------------
### Acknowledgements

- [Mehdi Saligane](https://github.com/msaligane)
- [Xinting Jiang](https://www.linkedin.com/in/xinting-jiang-74a42b28b/)

  

