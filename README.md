# Single-Port RAM in Verilog

## Project Overview
This project implements a **Single-Port RAM** in Verilog, designed to perform either a read or write operation during each clock cycle. The memory module supports bi-directional data flow, with shared read and write data lines, making it efficient for use in designs where simultaneous read and write operations are not required.

## Features
- **Single Access Port**: Supports either read or write operations per clock cycle, controlled by external signals.
- **Synchronized Operations**: The memory read and write operations are synchronized with a clock signal.
- **Reset Functionality**: Resets all memory locations to zero when triggered.
- **Bi-Directional Data Line**: The shared data line (`inout`) is used for both reading from and writing to memory.

## Inputs and Controls
- **clk**: The clock signal for synchronizing operations.
- **rst**: The reset signal, which clears the memory.
- **we_in**: Write Enable signal. When high, the RAM writes data to the specified address.
- **re_in**: Read Enable signal. When high, the RAM reads data from the specified address.
- **addr_in**: A 4-bit input that specifies the memory location for read/write operations.

## How It Works
- **Write Operation**: Data is written to the RAM at the specified address when the Write Enable (`we_in`) is active, and the Read Enable (`re_in`) is inactive.
- **Read Operation**: Data is read from the RAM when the Read Enable (`re_in`) is active, and the Write Enable (`we_in`) is inactive. The data is made available on the shared `data` line.
