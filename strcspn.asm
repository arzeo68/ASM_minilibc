
BITS 64

SECTION .text

GLOBAL strcspn:function
strcspn:
; reset tous les registre
 XOR RCX, RCX
 XOR RDX, RDX
 XOR R8, R8
 XOR R9, R9
 XOR RAX, RAX

 loop_main:
    MOV R8B, [RDI+RCX]
    CMP R8B, 0
        JE end_loop
    loop_second:
       MOV R9B, [RSI+RDX]
       CMP R9B, 0
           JE loop_third
       CMP R8B, R9B
           JE end_loop
       INC RDX
       JMP loop_second
  loop_third:
  XOR RDX, RDX
  INC RCX
  JMP loop_main


 end_loop:
     MOV RAX, RCX
     XOR R8, R8
     XOR R9, R9
     ret

