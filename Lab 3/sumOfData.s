.globl sumOfData

sumOfData:

    movl $0, %eax
    movq $0, %rcx

loop:

    cmpq %rsi, %rcx
    jge done

    addl (%rdi, %rcx, 4), %eax

    addq $1, %rcx

    jmp loop

done: 

    ret
