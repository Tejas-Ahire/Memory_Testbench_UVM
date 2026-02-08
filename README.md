Memory Verification using UVM
📌 Project Overview

This project focuses on verifying a parameterized memory module using Universal Verification Methodology (UVM) and SystemVerilog. The verification environment is designed to validate memory read and write operations using constrained random stimulus and coverage-driven verification techniques.

The goal is to ensure functional correctness, improve bug detection efficiency, and create a reusable verification environment.

🛠 Technologies Used

Language: SystemVerilog, Verilog

Methodology: UVM (Universal Verification Methodology)

Concepts:

Constrained Random Verification

Functional Coverage

Code Coverage

Assertions (Optional if used)

Tools: QuestaSim / ModelSim

🧱 Verification Environment Architecture

The UVM testbench consists of:

Test

Environment

Agent

Sequencer

Driver

Monitor

Scoreboard

Coverage Collector

Sequence & Sequence Items

⚙️ Features Implemented

✔ UVM-based reusable verification environment
✔ Constrained random stimulus generation
✔ Functional coverage model for memory operations
✔ Scoreboard for data integrity checking
✔ Transaction-level communication using TLM
✔ Phase-based UVM execution flow
✔ Virtual interface connection between DUT and TB

🧪 Test Scenarios Covered

Memory Write Operations

Memory Read Operations

Back-to-back Read/Write

Random Address Access

Boundary Address Testing

Reset Behavior Verification

📂 Project Structure
mem_uvm_project/
│
├── rtl/
│   └── memory.v
│
├── tb/
│   ├── mem_interface.sv
│   ├── mem_pkg.sv
│   ├── mem_test.sv
│   └── top.sv
│
├── uvm_tb/
│   ├── sequence_item.sv
│   ├── sequence.sv
│   ├── driver.sv
│   ├── monitor.sv
│   ├── agent.sv
│   ├── env.sv
│   ├── scoreboard.sv
│   └── coverage.sv
│
└── sim/
    └── run.do / compile.do

▶️ Simulation Steps

Compile RTL and Testbench

Compile UVM Library

Run Simulation using Test Name

Example:

vsim top +UVM_TESTNAME=mem_base_test
run -all

📊 Verification Goals

Achieve high functional coverage

Verify protocol correctness

Ensure data integrity between write and read operations

Detect corner case failures

🚀 Future Improvements

Add SystemVerilog Assertions (SVA)

Add Error Injection Tests

Extend to multi-port memory verification

Automate regression using scripts

👨‍💻 Author

Tejas Ahire
VLSI | Verification | UVM | SystemVerilog
