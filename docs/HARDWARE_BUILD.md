# Hardware Build & Modifications

## Overview

This document provides an overview of my personal hardware implementation of the **ErgonoMouse MK XX**, originally designed by [Jose L. González](https://www.printables.com/model/974592-ergonomouse-mk-xx-6dof-controller-knob-joystick-wi).

The build is largely based on the components listed in the original Bill of Materials (BOM), with a few modifications to reduce costs and adapt the hardware to the components and materials I already had available.

The optional LED ring was omitted to keep the overall cost as low as possible.

Rather than following every part of the original assembly process, I developed my own solution for mounting and wiring the Hall-effect joysticks using hand-made perfboard assemblies.

![Completed SpaceMouse](../../Images/hardware/spacemouse-botom-overview.jpg)

## 1. Hall-Effect Joysticks

For this build, I decided to use **PS5-compatible Hall-effect joysticks** instead of conventional potentiometer-based joysticks.

Since both types were available at approximately the same price, Hall-effect joysticks seemed like the more reasonable choice.

Their contactless magnetic sensing technology reduces wear-related sensor drift and can support accurate position measurements with relatively small dead zones when properly calibrated.

However, unlike conventional joystick modules with breakout boards, the Hall-effect joystick units I purchased were supplied without suitable mounting PCBs.

This required an alternative solution.

## 2. Custom Perfboard Assemblies

Dedicated adapter PCBs for these joysticks are commercially available. Designing and ordering custom PCBs would also have been possible, but the additional costs and production time were difficult to justify for a small personal project.

Since I already had some unused perfboards at home, I decided to manufacture my own joystick mounting boards by hand.

### Determining the Dimensions

The main challenge was achieving sufficiently accurate dimensions and mounting-hole positions to ensure proper mechanical alignment inside the SpaceMouse.

To solve this, I used a dimensional reference sketch of an existing joystick adapter PCB as a starting point.

I imported the reference into **Autodesk Fusion** and calibrated its scale using a known distance between two reference points.

Once the reference was scaled, I recreated the relevant board outline and mounting geometry in a Fusion sketch.

This provided a practical dimensional reference for the physical manufacturing process.

### Manufacturing the Boards

Using the dimensions obtained from Fusion, I prepared a prototype board from standard perfboard material.

The manufacturing process involved:

1. Measuring and marking the board outline using a caliper and set square.
2. Cutting the perfboard to the required dimensions using a precision craft knife.
3. Marking the necessary mounting-hole positions.
4. Drilling the holes using drill bits.
5. Checking the joystick's mechanical fit and alignment.

Once the first board fitted correctly, I used it as a physical template to reproduce the remaining three boards.

The result was a set of four individually manufactured joystick mounting boards.

![Custom Perfboard Assemblies](../../Images/hardware/pcbs-overview.jpg)

## 3. Electrical Connections & Wiring

After preparing the mounting boards, I soldered the Hall-effect joysticks into their corresponding perfboards.

Electrical connections between the joystick terminals were made using approximately 0.5 mm copper wire soldered directly to the perfboard pads.

Each joystick provides the following connections:

| Connection | Function |
|---|---|
| VCC | Sensor supply voltage |
| GND | Ground reference |
| X | Analog X-axis output |
| Y | Analog Y-axis output |
| SW | Integrated joystick push-button |

To keep costs and component requirements low, I decided not to use additional plug connectors.

Instead, the required connections were wired directly to the microcontroller using flexible stranded wires.

I also established a consistent wire color scheme to make the assembly easier to understand, maintain, and troubleshoot.

Although the integrated joystick push-buttons are not currently used by the firmware configuration, I routed their connections out of the assemblies and stored them safely inside the housing.

This leaves the option of using the push-buttons in a future modification without having to disassemble and resolder the joystick modules.

![Installed Joystick Assemblies](../../Images/hardware/josticks-overiew.jpg)

## 4. Joystick Caps & Final Assembly

The joystick caps were manufactured using the original 3D-printable hardware design.

Before assembly, the printed parts were sanded to improve their fit and surface finish.

The caps were then attached to the joystick shafts using a small amount of cyanoacrylate adhesive (super glue).

During bonding, the joysticks were positioned upside down to reduce the risk of adhesive flowing into the internal mechanical components.

After the adhesive had cured, the joystick assemblies were installed in the SpaceMouse housing and connected to the microcontroller.

Further information about the printed parts and surface finishing is available in the [3D Printing & Surface Finishing documentation](../3d-printing.md).

## 5. Final Result

The completed hardware demonstrates that a functional SpaceMouse controller can be assembled using relatively inexpensive components and commonly available prototyping materials.

Although the hand-made perfboard assemblies are not as refined as professionally manufactured PCBs, they provided a practical and cost-effective solution for this personal build.

The main objective was to achieve a functional and maintainable hardware assembly without unnecessary expenses.

The finished controller serves as the hardware platform for my [SpaceMouse Calibration & Diagnostics Utility](../../README.md).

---

**Attribution:** The original ErgonoMouse MK XX mechanical design belongs to Jose L. González and remains subject to its original licensing terms. This document describes my personal hardware assembly and modifications. No third-party PCB design files or reference drawings are redistributed here.
