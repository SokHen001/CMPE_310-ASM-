# 8255 PPI – Seven-Segment Display

**Course:** CMPE 310 – Computer Organization  
**Lab:** Lab 9 – Programming the 8255 Programmable Peripheral Interface  
**Language:** x86 Assembly (GAS)

## Overview

This project uses 8086 GAS assembly to program the Intel 8255 Programmable Peripheral Interface (PPI) to display and scroll the letters "SHE" across an 8-digit seven-segment LED display.

The program uses multiplexing to control individual digits and continuously shifts the letters left and right.

## Hardware Configuration

The 8255 is configured in Mode 0 with all ports set as outputs.

| Port | Address | Purpose |
|---|---|---|
| Port A | `0x640` | Digit selection |
| Port B | `0x641` | Segment control |
| Port C | `0x642` | Unused |
| Control | `0x643` | 8255 configuration |

**Control word:** `0x80` (`10000000`)

## Seven-Segment Patterns

The display uses active-low logic, where `0` turns a segment ON and `1` turns it OFF.

| Character | Hex | Segments ON |
|---|---|---|
| S | `0x12` | a, c, d, f, g |
| H | `0x09` | b, c, e, f, g |
| E | `0x06` | a, d, e, f, g |
| Blank | `0x7F` | None |

## How It Works

1. Configure the 8255 in Mode 0.
2. Scan all eight digits using Port A.
3. Send the appropriate character pattern through Port B.
4. Refresh the display 300 times before shifting the letters.
5. Reverse the scrolling direction when "SHE" reaches either end.

### Expected Display Sequence

```text
S H E _ _ _ _ _
_ S H E _ _ _ _
_ _ S H E _ _ _
_ _ _ S H E _ _
_ _ _ _ S H E _
_ _ _ _ _ S H E
_ _ _ _ S H E _
...
```

## Implementation Notes

- `SI` tracks the starting position of "SHE".
- `BP` controls the scrolling direction.
- `CX` selects the current digit.
- `DI` controls the refresh count.
- `ROL` rotates the active-low digit-selection pattern.

## Testing

The program was written for the 8255-based display described in the lab assignment. Physical hardware operation has not been verified.

## Author

Sokha Heng  
University of Maryland, Baltimore County (UMBC)
