BITS 64

SECTION .text

GLOBAL strstr:function

strstr:
loop:
	XOR RCX, RCX
	XOR R8, R8
        XOR R9, R9

	cmp_loop:
		MOV R8B, [RDI+RCX] ; first str char
		MOV R9B, [RSI+RCX] ; second str char
		CMP R9B, 0
                JE found
		CMP R8B, 0
		JE not_found
		CMP R8B, R9B
                JNE end_cmp_loop
		INC RCX
		JMP cmp_loop
	end_cmp_loop:

	CMP BYTE[RDI], 0
	JE not_found ; test end of first str
	INC RDI
	JMP loop

not_found:
	MOV RAX, 0
	JMP end

found:
	MOV RAX, RDI
	JMP end

end:
 RET