.section .bss
.globl ram
.lcomm ram, 256         # Reserve 256 bytes of RAM (uninitialized memory)

.section .text
.globl fill_ram         # Make function visible to C program

fill_ram:
    # Store FFH into RAM location 50H - 58H using indirect addressing

    leal ram+0x50, %ebx 

    movb $0xFF, (%ebx)
    movb $0xFF, 1(%ebx)
    movb $0xFF, 2(%ebx)
    movb $0xFF, 3(%ebx)
    movb $0xFF, 4(%ebx)
    movb $0xFF, 5(%ebx)
    movb $0xFF, 6(%ebx)
    movb $0xFF, 7(%ebx)
    movb $0xFF, 8(%ebx)


    ret                     # Return control back to C program

.section .note.GNU-stack,"",@progbits
