%include "io.mac"

section .bss
num1 resw 1
res resw 1

section .text
global _start
_start:
  GetInt [num1]
  push word [num1]
  call fib
  mov [res], ax
  PutInt [res]
  mov ax, 1
  mov bx, 0
  int 80h

fib:
  push ebp
  mov ebp, esp
  push ebx
  push ecx
  push edx
  mov cx, [ebp+8]
  cmp cx, 1
  je fim_alternativo
  mov ax, 1
  mov bx, 0
  sub cx, 2
  cmp cx, 0
  je fim
fib_loop:
  mov dx, ax
  add ax, bx
  mov bx, dx
  loop fib_loop
  jmp fim
fim_alternativo:
  mov ax, 0
fim:
  pop edx
  pop ecx
  pop ebx
  pop ebp
  ret 4
  
