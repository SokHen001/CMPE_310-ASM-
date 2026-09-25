.section .data

cin1:
    .ascii "Enter first string: "
    cin1_length = . - cin1

cin2:
    .ascii "Enter second string: "
    cin2_length = . - cin2

cout:
    .ascii "Hamming distance: "
    cout_length = . - cout

nextLine:
    .ascii "\n"

.section .bss
.lcomm string1, 256
.lcomm string2, 256
.lcomm output, 4

.section .text
.global _start

_start:

    # prompt 1
    mov $1, %rax
    mov $1, %rdi
    mov $cin1, %rsi
    mov $cin1_length, %rdx
    syscall

    mov $0, %rax
    mov $0, %rdi
    mov $string1, %rsi
    mov $255, %rdx
    syscall

    mov %rax, %r8

    # prompt 2
    mov $1, %rax
    mov $1, %rdi
    mov $cin2, %rsi
    mov $cin2_length, %rdx
    syscall

    mov $0, %rax
    mov $0, %rdi
    mov $string2, %rsi
    mov $255, %rdx
    syscall

    mov %rax, %r9

    dec %r8
    dec %r9

    mov %r8, %rcx

    cmp %r9, %r8
    jbe compare_strings

    mov %r9, %rcx

# to compare strings
compare_strings:
    mov $0, %r10
    mov $0, %r11

# Compare characters
character_loop:
    cmp %rcx, %r11
    jae done

    movb string1(,%r11,1), %al
    movb string2(,%r11,1), %bl

    # XOR the two characters
    xorb %bl, %al

    mov $8, %rdx

# check each bit, if carry is 1, hamming distance + 1
bit_loop:

    shrb $1, %al
    jc different_bit
    jmp next_bit

# hamming distance + 1
different_bit:
    inc %r10

# Continue checking bits, then move to the next character
next_bit:

    dec %rdx
    cmp $0, %rdx
    jne bit_loop
    inc %r11
    jmp character_loop

# Print message and fetch result
done:

    mov $1, %rax
    mov $1, %rdi
    mov $cout, %rsi
    mov $cout_length, %rdx
    syscall

    mov $output+4, %rsi
    mov %r10, %rax
    mov $10, %rbx
    mov $0, %rcx

# convert result to ASCII
convert_loop:

    mov $0, %rdx
    div %rbx
    addb $'0', %dl
    dec %rsi
    movb %dl, (%rsi)
    inc %rcx
    cmp $0, %rax
    jne convert_loop

    mov $1, %rax
    mov $1, %rdi
    mov %rcx, %rdx
    syscall

    mov $1, %rax
    mov $1, %rdi
    mov $nextLine, %rsi
    mov $1, %rdx
    syscall

    mov $60, %rax
    mov $0, %rdi
    syscall
