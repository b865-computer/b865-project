    .module main
    .globl _main
    .globl _foo
    .area CODE

_main:
    jsr _foo
loop:
    jmp loop

    .area CODEIVT (ABS)
    .org 0xFFFE
    .word _main