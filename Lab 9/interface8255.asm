.code16
.section .data


.section .text
.globl _start

_start:

    mov $0b10000000,%al     # D7=1 for mode set, remaining bits=0 for outputs      
    mov $0x643,%dx          # 8255 control register
    out %al,%dx             # send control to 8255


    mov $0, %si
    mov $1, %bp

loop1:
    mov $300, %di           # Refresh 300 times before moving SHE

loop2:
    mov $0, %cx             # start scanning from digit 0

digitloop:
    mov $0xFF, %al          # Turn off all digits (1 = OFF)
    mov $0x640, %dx         # Port A selects the digits
    out %al, %dx

    mov %cx, %ax            # Copy current digit to AX
    sub %si, %ax            # Find distance from start of SHE

    cmp $0, %ax             # Current digit is S position?
    je show_S

    cmp $1, %ax             # Current digit is H position?
    je show_H

    cmp $2, %ax             # Current digit is E position?
    je show_E

    mov $0x7F, %bl          # No letter here, leave digit blank
    jmp outputC

show_S:
    mov $0x12, %bl          # Light segments a, c, d, f, g
    jmp outputC

show_H:
    mov $0x09, %bl          # Light segments b, c, e, f, g
    jmp outputC

show_E:
    mov $0x06, %bl          # Light segments a, d, e, f, g

outputC:
    mov %bl, %al            
    mov $0x641, %dx         # Port B controls the segments
    out %al, %dx            

    mov $0xFE, %al          # selects digit 0
    rol %cl, %al            # rotate to the current digit
    mov $0x640, %dx
    out %al, %dx

    push %cx
    mov $1000, %cx          # delay

waitloop:
    loop waitloop           # Count down to 0
    pop %cx

    inc %cx                 # Check next digit
    cmp $8, %cx             # Stop after all 8 digits
    jl digitloop

    dec %di                 # One full refresh completed
    jnz loop2               # Keep refreshing until DI = 0

    add %bp, %si            # Shift SHE left or right
    cmp $5, %si             # SHE reached the right end?
    je moveLeft

    cmp $0, %si             # SHE reached the left end?
    je moveRight

    jmp loop1               # Repeat at new position

moveLeft:
    mov $-1, %bp            # Change direction to left
    jmp loop1

moveRight:
    mov $1, %bp             # Change direction to right
    jmp loop1
