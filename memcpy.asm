BITS 64

SECTION .text

GLOBAL memcpy:function

memcpy:

; reset tous les registre
 PUSH RBP
 MOV RBP, RSP
 MOV RAX, RDI
 XOR RCX, RCX
 XOR R8, R8
loop:
    CMP RDX,0
    JE end_loop
    MOV R8B, BYTE[RSI+RCX]
    MOV [RDI+RCX], R8B
    CMP R8B, 0
    JE end_loop
    INC RCX
    DEC RDX
	JMP loop
end_loop:
    LEAVE
    RET