    .module foo
    .globl _foo
    .area CODE
_foo::
    mov r0 #0x01
    mov 0x0201 r0
    rts