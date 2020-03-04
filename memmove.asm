BITS 64

SECTION .text

GLOBAL memmove:function

memmove:

; reset tous les registre
 PUSH RBP
 MOV RBP, RSP
 XOR RCX, RCX
 XOR R8, R8
 MOV RAX, RDI
loop:
    CMP RDX,0
    JE end_loop
    MOV R8B, [RSI+RCX]
    MOV [RDI+RCX], R8B
    CMP R8B, 0
    JE end_loop
    INC RCX
    DEC RDX
	JMP loop
end_loop:
    LEAVE
    RET