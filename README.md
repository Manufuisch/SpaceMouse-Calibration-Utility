# SpaceMouse-Calibration-Utility
A graphical calibration and diagnostics utility for the AndunHH SpaceMouse firmware, built with Java and Processing.

## Project Overview

The SpaceMouse Calibration & Diagnostics Utility is a graphical desktop application developed in Java using the Processing framework. It provides a more intuitive way to monitor, diagnose, and calibrate joystick sensor values from the open-source AndunHH SpaceMouse firmware.
The application communicates directly with the microcontroller through the firmware's existing serial debugging interface.
**No modifications to the original firmware are required**.

The utility provides four interactive screens:

COM Port Selection:
* Select the serial port connected to the SpaceMouse.

Function Check:
* Monitor raw joystick sensor values in real time.
  
Hall-Effect Joystick Centering:
* Mechanically adjust the joystick center positions using color-coded visual feedback.
  
Min/Max Calibration:
* Continuously record the minimum and maximum joystick values and generate configuration arrays for config.h.

The main goal is to simplify the calibration process by replacing continuously scrolling serial monitor output with a structured and easy-to-read graphical interface.
This project is an independent companion utility and does not replace the original SpaceMouse firmware.

![min max calibration](images/Screenshots/min-max-calibration.png)

## Motivation – Why I Created This Utility

The original AndunHH SpaceMouse firmware already provides several debugging and calibration functions through the serial monitor. While these functions work well, continuously updating sensor values can become difficult to follow, especially when monitoring multiple joystick axes simultaneously.

I wanted to make this process more intuitive by developing a graphical interface that displays the sensor values in fixed positions instead of continuously scrolling through the serial monitor.

Another important goal was to simplify the mechanical centering of Hall-effect joysticks through color-coded visual feedback.

For the Min/Max calibration, I wanted to combine automatic value tracking with the flexibility of the manual calibration method. Unlike the firmware's time-limited semi-automatic calibration, my utility continuously records and displays the measured minimum and maximum values, allowing users to move each joystick for as long as needed and verify the results in real time.

**The goal was not to replace the existing firmware or its calibration functions, but to make the entire calibration process more transparent, accessible, and user-friendly.**

## Features & Screenshots

The utility provides four screens that guide the user through the connection, diagnostics, and calibration process.

### 1. COM Port Selection

![COM Port Selection](images/Screenshots/com-port-selection.png)

Displays the available serial ports and allows the user to select the port connected to the SpaceMouse controller.

Once connected, the application communicates with the original AndunHH firmware through its serial debugging interface.

### 2. Function Check

![Function Check](images/Screenshots/function-check.png)

Displays the raw 10-bit ADC readings (0–1023) of the selected joystick in real time using Debug Mode 1.

This screen helps verify the electrical connections, identify incorrect axis assignments, and determine whether an axis needs to be inverted in the firmware configuration.

### 3. Hall-Effect Joystick Centering

![Joystick Centering](images/Screenshots/joystick-centering.png)

Provides visual assistance for mechanically centering Hall-effect joysticks.

The raw X/Y readings are evaluated against a theoretical center value of 512. Color-coded indicators show the deviation from the ideal center position, making mechanical adjustments easier to perform.

The displayed tolerances are intended as practical alignment guidelines rather than mandatory sensor specifications.

### 4. Min/Max Calibration

![Min/Max Calibration](images/Screenshots/min-max-calibration.png)

Continuously monitors the centered joystick values using Debug Mode 2 and records the minimum and maximum readings reached on all eight axes.

Unlike the firmware's time-limited calibration mode, the measurement remains active without a fixed time limit, allowing users to verify the full movement range of each joystick.

The recorded values are automatically formatted into `MINVALS` and `MAXVALS` arrays, ready to be copied into the firmware's `config.h` file.
