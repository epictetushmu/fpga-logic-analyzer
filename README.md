# Logic Analyzr (Implemented on FPGA)
Logic Analyzr is a standalone, real-time digital signal monitoring and visualization platform. Built on the **Nexys2 FPGA board**, it harnesses on-chip Spartan-3E logic and native VGA output to capture multiple signals and present their waveforms instantly. No computer or external oscilloscope needed—just plug in your digital signals and analyze them on any VGA monitor.

## Features

### Graphical User Interface (GUI) Integration

- Waveform Zooming: Pinpoint details in your captured data with zoomable waveforms.
- Cursor-Based Measurements: Measure time intervals or durations using intuitive on-screen cursors.
- Customizable Display: Tweak grid lines, colors, and scaling settings for a personalized view.
- Multi-Signal Visualization: Overlay and distinguish multiple logic channels with clarity.
- Trigger Markers: Spot events and transitions with on-screen highlights.
- Interactive Controls: Adjust settings in real time using Nexys2 push-buttons or switches.

### Real-Time Signal Capture

- High-Speed Sampling: Utilizes the 50 MHz FPGA clock for accurate, responsive waveform acquisition.
- Flexible Triggering: Configure edge or pattern triggers for precise capture moments.

### Direct VGA Output

- Standalone Display: Waveforms are rendered live to VGA—no PC or extra software required.
- User Adjustable Settings: Change acquisition and display parameters with onboard controls.

## Hardware Specifications

- FPGA: Xilinx Spartan-3E (Nexys2)
- Clock: 50 MHz onboard source
- Inputs: 40-pin expansion header
- VGA Output: 12-bit color, supports 640x480 or 1024x768
- Memory: SRAM for buffering captured waveforms
- Controls: Push-buttons and slide switches
- Input Voltage: 3.3V logic (5V-tolerant inputs); >5V signals require level-shifting

## How It Works

1. **Signal Capture:** Connect digital inputs to the Nexys2 header.
2. **Trigger & Sampling:** User-defined trigger logic (edge/pattern) starts sample capture.
3. **Data Buffering:** Onboard SRAM stores real-time sample data.
4. **VGA Controller:** FPGA generates sync signals to draw captured waveforms on VGA.
5. **Visualization Logic:** Pixel-level waveform rendering with clear time and logic grids.

## Why Our Logic Analyzr is Cool

- **Totally Independent:** No computer necessary—portable, self-contained signal analysis.
- **Fast:** Captures quick transitions using fast onboard clocking.
- **Expandable:** Modular design for adding features (UART/USB export, advanced UI controls).
- **Affordable:** Brings powerful analysis to students, makers, and embedded engineers.


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
