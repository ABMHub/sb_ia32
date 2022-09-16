%include "io.mac"
section .data
path1 db "./myfile1.txt", 0
path2 db "./myfile2.txt", 0
n equ 3

section .bss
buffer resb n

global _start
section .text
_start:
  mov eax, 5
  mov ebx, path1
  mov ecx, 0
  mov edx, 777o
  int 80h

  mov ebx, eax
  mov eax, 3
  mov ecx, buffer
  mov edx, n
  int 80h

  mov edx, 0
  mov ecx, 0
loop:
  cmp ecx, n
  je fim
  add dl, [buffer + ecx]
  sub dl, 30h
  add ecx, 1
  jmp loop
fim:
  add dl, 30h
  mov [buffer], dl

  mov eax, 6
  int 80h

  mov eax, 8
  mov ebx, path2
  ;mov ecx, 1
  mov ecx, 700o
  int 80h

  mov ebx, eax
  mov eax, 4
  mov ecx, buffer
  mov edx, 1
  int 80h

  mov eax, 6
  int 80h

  mov eax, 1
  mov ebx, 0
  int 80h