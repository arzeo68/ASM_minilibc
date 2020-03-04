BITS 64

SECTION .text

GLOBAL strcmp:function

strcmp:

; reset tous les registre
 XOR RCX, RCX
 XOR R8, R8
 XOR R9, R9
 XOR RAX, RAX

loop:
	MOV R8B, [RDI+RCX]
	MOV R9B, [RSI+RCX]
	CMP R8B, 0
	JE end
	CMP R9B, 0
	JE end
	CMP R8B, R9B
    JNE end
	INC RCX
	JMP loop

end:
 SUB R8, R9
 MOV RAX, R8
 RET