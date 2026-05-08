# FPGA Analytic Signal Generator

This repository contains an FPGA DSP demo for analytic signal generation. I worked on a Hilbert Transform based signal chain using Verilog and Xilinx IP cores.

The design uses a DDS Compiler for sine wave generation, a FIR Compiler for Hilbert Transform processing, and an ILA for observing internal signals.

## What I Did

- Built a top-level Verilog design for the signal chain.
- Used DDS, FIR, Clock Wizard, and ILA IP cores.
- Generated in-phase and quadrature signal components.
- Added schematic and simulation figures.
- Added a simple LED toggle module to check that the design is running.

## Repository Structure

```text
src/        Verilog and Xilinx IP-related files
figures/    Block diagrams and simulation results
```
