; Project main
    .area CODE

main:
loop:
    jmp loop

    .area CODEIVT (ABS)
    .org 0xFFFE
    .word main