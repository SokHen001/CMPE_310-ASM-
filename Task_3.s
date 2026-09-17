.section .bss
.globl ram
.lcomm ram, 256         # Reserve 256 bytes of RAM (uninitialized memory)

.section .text
.globl fill_ram         # Make function visible to C program

fill_ram:
    # clear RAM locations starting at RAM address 0x50 to 0x58

    leal ram+0x50, %ebx 

    movb $0x00, (%ebx)
    movb $0x00, 1(%ebx)
    movb $0x00, 2(%ebx)
    movb $0x00, 3(%ebx)
    movb $0x00, 4(%ebx)
    movb $0x00, 5(%ebx)
    movb $0x00, 6(%ebx)
    movb $0x00, 7(%ebx)
    movb $0x00, 8(%ebx)

    ret                     # Return control back to C program

.section .note.GNU-stack,"",@progbits