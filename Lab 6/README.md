
# Arduino Lab 6 – External LED Blink

## Overview
This project demonstrates how to control external LEDs using an Arduino Uno. The objective is to blink two LEDs at different time intervals using digital output pins.

## Objectives
- Blink a single external LED.
- Control two LEDs at different time intervals.
- Understand how digital output pins work.

## Equipment
- Arduino Uno
- Breadboard
- 2 LEDs
- 2 × 330 Ω resistors
- Jumper wires
- USB cable

## Circuit Design
Two external LEDs are connected to the Arduino Uno through a breadboard. Each LED is connected in series with a 330 Ω resistor to limit current and protect the LED.

### Pin Connections

| Component | Arduino Pin |
|-----------|-------------|
| LED 1 (+) | Digital Pin 12 |
| LED 2 (+) | Digital Pin 11 |
| LED 1 (-) | GND |
| LED 2 (-) | GND |

## Task 1 – Single LED Blink
The first task involves blinking one external LED using an Arduino digital output pin.

The LED alternates between HIGH (ON) and LOW (OFF) using `digitalWrite()` and `delay()`.

## Task 2 – Dual LED Blink
The second task involves controlling two LEDs at different time intervals.

- **LED 1 (Pin 12):** ON for 1 second, OFF for 1 second.
- **LED 2 (Pin 11):** ON for 2 seconds, OFF for 2 seconds.

### Timing Sequence

| Time (seconds) | LED 1 (Pin 12) | LED 2 (Pin 11) |
|----------------|----------------|----------------|
| 0–1            | ON             | ON             |
| 1–2            | OFF            | ON             |
| 2–3            | ON             | OFF            |
| 3–4            | OFF            | OFF            |

The sequence repeats every 4 seconds.

## Code Explanation
The Arduino program uses the following functions:

- `pinMode()` – Configures digital pins as outputs.
- `digitalWrite()` – Sets the output pins to HIGH or LOW.
- `delay()` – Controls the time between state changes.

The `setup()` function runs once to initialize the pins, while `loop()` continuously repeats the blinking sequence.

## Determining Output Pin Signals
The output signals were determined by comparing the LED blinking patterns with the expected timing sequence.

- Pin 12 changes its output every second.
- Pin 11 changes its output every two seconds.
- HIGH represents approximately 5 V, while LOW represents approximately 0 V.

## Expected Results
LED 1 alternates between ON and OFF every second, while LED 2 alternates every two seconds. Both LEDs follow a repeating four-second sequence.

## Conclusion
This lab demonstrates how Arduino Uno digital output pins can control external LEDs at different time intervals. It provides practice with basic Arduino programming, circuit connections, and timing control.
