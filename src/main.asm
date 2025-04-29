    .module main
    .globl _main
    .area CODE

DDR0 = 0x0200
PORT0 = 0x0201

_main:

    mov r0 #0x01
    mov DDR0 r0

loop:
    inx
    and x r0
    mov PORT0 x
    jmp loop

    .area CODEIVT (ABS)
    .org 0xFFFE
    .dw _main
