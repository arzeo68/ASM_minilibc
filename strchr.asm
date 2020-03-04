BITS 64

SECTION .text

GLOBAL strchr:function

strchr:

; reset tous les registre
 XOR RCX, RCX
 XOR R8, R8
 XOR RAX, RAX

loop:
	MOV R8B, [RDI+RCX]
	CMP R8B, SIL
        JE end_find
	CMP R8B, 0
	    JE end_not_find
	INC RCX
	JMP loop

end_find:
   ADD RDI, RCX
   MOV RAX, RDI
  RET

 end_not_find:
 MOV RAX, 0
  RET