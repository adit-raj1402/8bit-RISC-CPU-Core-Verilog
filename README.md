🚀 8-bit RISC CPU Core (Logic to Synthesis)
A functional 8-bit Single-Cycle RISC CPU designed in Verilog and synthesized using the SkyWater 130nm PDK. This project demonstrates a complete digital design flow, moving from high-level RTL logic to technology-mapped gate-level results.

📌 Project Overview
Designed an 8-bit RISC architecture with a focus on single-cycle execution and efficient hardware mapping.

Key Specifications:
Word Size: 8-bit.

Architecture: Single-Cycle RISC (CPI = 1).

Instruction Set: Supports Arithmetic (ADD, SUB), Logical (AND), and Control Flow (JMP/Branch).

Memory Interface: Integrated Instruction ROM and 8-word general-purpose Register File.

📊 PPA & Timing Analysis (Sign-off)
The design was analyzed for Power, Performance, and Area (PPA) using the OpenSTA engine within the ChipVerify environment.

1. Performance & Power Estimation
Max Frequency: 207.9 MHz.

Critical Path Delay: 4.810 ns.

Total Power: 59.4 µW.

Dynamic Power: 49.5 µW (83.3% of total).

Leakage Power: 9.9 µW (16.7% of total).

2. Static Timing Analysis (STA)
Setup Slack: +4.420 ns (MET).

Hold Slack: -0.130 ns (VIOLATED).

3. Area Analysis
Total Cells: 198.

Chip Area: 2380.02 µm².

Cell Breakdown: High utilization of clkinv_1 (17.2%) and nand2_1 (16.7%) for logic implementation.

🖼️ Functional Verification
Functional correctness was verified via testbench simulation. The waveform below confirms the fetch-decode-execute cycle and correct Program Counter (PC) branching behavior.

🛠️ Technical Insights: Timing Closure
The Hold Time Violation (-0.130 ns) detected is a common characteristic of synthesis before physical layout. In a standard ASIC flow, this would be addressed during the Physical Design phase by inserting buffer chains to meet hold requirements without impacting the setup slack.

📂 Repository Structure
rtl/: Core Verilog design files.

testbench/: Verification environment.

images/: High-resolution simulation and PPA reports.
