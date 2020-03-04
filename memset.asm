BITS 64

SECTION .text

GLOBAL memset:function

memset:

; reset tous les registre
 XOR RCX, RCX
 XOR R8, R8
 PUSH RBP
 MOV RBP, RSP
 MOV RAX, RDI

 ;RDI ptr
 ;RSI val
 ;RDX count
loop:
    CMP RDX,0
    JE end_loop
    MOV BYTE[RDI+RCX], SIL
    INC RCX
    DEC RDX
	JMP loop
end_loop:
    LEAVE
    RET