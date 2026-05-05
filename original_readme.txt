Hilbert Transform System on FPGA
================================

Overview
--------
This project implements a Hilbert Transform system using Xilinx Vivado and IP integrator. The system:

- Generates a sine wave using a DDS Compiler
- Processes the signal through a Hilbert Transform implemented with a FIR Compiler
- Outputs in-phase (I) and quadrature (Q) components of the analytic signal
- Monitors signals using an Integrated Logic Analyzer (ILA)
- Toggles an LED to verify the system is running

Block Diagram
-------------
See included "OverallSchematic.png" image in the "02_SCHEMATIC" folder showing DDS, FIR, ILA, and clocking structure.

Components
----------
1. Clock Wizard (clk_wiz_0)
   - Converts the input 'clk' to 'clk_out1' for the system 
   - Controlled by 'reset'

2. DDS Compiler (dds_compiler_0)
   - Generates a 14 bit digital sine wave
   - Output: signal_sine [15:0]

3. FIR Compiler (fir_compiler_0)
   - Implements Hilbert Transform FIR filter
   - Input: signal_sine
   - Output: Analytic signal with real and imaginary parts
     * signal_I = m_axis_data_tdata[13:0] (real component)
     * signal_Q = m_axis_data_tdata[29:16] (imaginary component)

4. Integrated Logic Analyzer (ila_0)
   - Probes internal signals:
     * probe0: Original DDS sine wave
     * probe1: In-phase component (I)
     * probe2: Quadrature component (Q)

5. LED Toggle Module (led_toggle)
   - Toggles an LED on the board

Top-Level Module
----------------
Module: top_module

Ports:
- clk     (input)  : Main clock input
- reset   (input)  : Active-high reset
- out_LED (output) : LED output

Requirements
------------
- Vivado
- Xilinx IP Cores:
  * DDS Compiler
  * FIR Compiler
  * Clock Wizard
  * ILA
- FPGA development board with LED and clock input

Usage Instructions
------------------
1. Open Vivado and open the "Hilbert_Transform_Module.xpr" file
2. Reconfigure the IPs if needed
3. Generate the bitstream
4. Program the FPGA
5. Use the ILA dashboard in Vivado to monitor signals
