# FPGA Logic Analyzer

Welcome to the **FPGA Logic Analyzer** project! This project implements a real-time digital signal monitoring tool using the **Nexys A7 FPGA Board**. The FPGA captures multiple input signals, processes them on the fly, and visually presents waveforms directly on a **VGA display**. This means you can perform signal analysis without needing an external oscilloscope—just plug in your signals and watch them appear in real-time on the screen.

## Features

### Graphical User Interface (GUI) Integration
- **Waveform Zooming**: Zoom in and out of captured signals for detailed analysis.
- **Cursor-Based Measurements**: Place cursors on waveforms to measure time intervals and signal durations.
- **Customizable Display Settings**: Modify grid settings, color schemes, and scaling factors.
- **Multi-Signal Display**: Visualize multiple signals simultaneously with clear differentiation.
- **Trigger Event Indicators**: Highlight trigger points for easy reference and debugging.
- **Interactive Controls**: Use FPGA push buttons or external inputs to modify settings in real-time.

### Real-Time Signal Capture
- **High-Speed Sampling**: Utilizes the FPGA's internal clock to ensure accurate waveform representation.
- **Trigger Mechanism**: Detects edges and patterns to start signal recording at the right moment.

### Display on VGA Monitor
- **On-Screen Waveform Display**: Display waveforms directly on a **VGA monitor** without requiring an external PC.
- **User-Controlled Parameters**: Adjust trigger levels and time scales with simple switches or buttons.

## Hardware Specifications

- **FPGA Chip**: Xilinx Artix-7 (XC7A35T)
- **Clock Source**: 100 MHz onboard clock
- **I/O Interfaces**: 40-pin expansion ports for signal input
- **VGA Output**: 12-bit VGA to drive a 1024x768 display
- **Memory**: Onboard SRAM for waveform storage
- **User Controls**: Push-buttons and slide switches for adjusting settings
- **Input Voltage Limitations**: Operates at 3.3V logic levels, 5V-tolerant inputs. Signals exceeding 5V must be level-shifted to avoid FPGA damage.

## How It Works

1. **Signal Capture**: Digital signals are fed into the FPGA through expansion ports.
2. **Trigger System**: Edge detection logic (implemented in VHDL) monitors signal transitions and triggers data capture.
3. **Data Buffering**: Captured signal data is stored in the FPGA's onboard SRAM for efficient processing.
4. **VGA Controller**: The FPGA generates synchronization signals to map waveform data onto a 640x480 VGA display.
5. **Display Logic**: Signals are rendered as pixel-based waveforms, with time divisions and voltage levels clearly marked.

## Why This is Cool

- **Standalone Operation**: No computer is needed—just connect the FPGA to a VGA monitor.
- **High-Speed Sampling**: Utilizes the Nexys A7’s clock to capture fast transitions.
- **Customizable Features**: The design is expandable, allowing for future enhancements like UART/USB data export or cursor-based measurements.
- **Affordable & Practical**: An FPGA-based alternative to expensive digital oscilloscopes and logic analyzers.

## Getting Started

1. **Hardware Requirements**:
   - Nexys A7 FPGA Board by Digilent
   - VGA monitor
   - External signal sources (digital signals)

2. **Software Requirements**:
   - Vivado for synthesizing and programming the FPGA
   - VHDL knowledge to modify or extend the design

3. **Installation Steps**:
   1. Clone the repository:
      ```bash
      git clone https://github.com/Epictetus20/fpga-logic-analyzer.git
      ```
   2. Open the project in Vivado.
   3. Compile the design and upload it to your Nexys A7 FPGA board.
   4. Connect a VGA monitor to the board and external digital signals to the I/O ports.
   5. Power on the FPGA, and the waveforms will appear on the screen!

## Contributing

We welcome contributions to improve the FPGA Logic Analyzer. If you'd like to contribute, please fork the repository and submit a pull request with your changes.

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them.
4. Push your changes to your forked repository.
5. Open a pull request.

## License

This project is open-source and available under the [GPL-3.0](LICENSE).

---

Thank you for checking out the FPGA Logic Analyzer project! Enjoy building and experimenting with your own signal analysis tool powered by FPGA!
