%include "io.mac"

section .data
a dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
b dw -1, 10, -3, 8, -5, 6, -7, 4, -9, 2


section .text
global _start
global f4
_start:
  push dword 10
  push b
  push a

  call f4
  add esp, 12
  push ax

  PutInt [esp+2]

  mov eax,1
  mov ebx, 0
  int 80h

f4:
  push ebp
  mov ebp, esp
  push ebx
  push ecx
  push edx
  mov ecx, 0
  mov dx, 0
  
loop:
  cmp ecx, [ebp+16]
  je fim
  push dx
  mov eax, [ebp+8]
  mov ax, [eax+ecx*2]
  mov ebx, [ebp+12]
  mov bx, [ebx+ecx*2]
  mul bx
  pop dx
  add dx, ax
  add ecx, 1
  jmp loop
fim:
  mov ax, dx
  cwde
  pop edx
  pop ecx
  pop ebx
  pop ebp
  ret
