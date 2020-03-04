BITS 64

SECTION .text

GLOBAL strpbrk:function

strpbrk:
 XOR RAX, RAX
 XOR R8, R8
 CMP RDI, 0
 JE end

loop:
	CMP BYTE[RDI+R8], 0
	JE end

	XOR R9, R9
	test_loop:
		MOV R10, [RSI+R9]
		CMP R10B, BYTE[RDI+R8]
		JNE end_check
		ADD RDI, R8
		MOV RAX, RDI
		JMP end
		end_check:
		CMP BYTE[RSI+R9], 0
		JE end_accept_loop
		INC R9
		JMP test_loop
	end_accept_loop:

	INC R8
	JMP loop

end:
 RET