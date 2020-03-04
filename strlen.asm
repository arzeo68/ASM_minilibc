[BITS 64]

global strlen
section .text

strlen:
	xor rax,rax

loop:
	cmp byte[rdi+rax], 0
	    je  end
	inc rax
	jmp loop

end:
	ret