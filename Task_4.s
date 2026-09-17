.section .bss
.globl ram
.lcomm ram, 256         # Reserve 256 bytes of RAM (uninitialized memory)

.section .text
.globl fill_ram         # Make function visible to C program

fill_ram:
    # series 1+2+3+….+N (N=10) and put the sum into memory location 0x50

    xorb %al, %al
    movb $1, %bl

    sum_loop:
        addb %bl, %al
        incb %bl
        cmpb $11, %bl
        jne sum_loop

        movb %al, ram+0x50

    ret                     # Return control back to C program

.section .note.GNU-stack,"",@progbits