%include "io.mac"
section .data
space db " ", 0
nl db 0dh, 0ah, 0
rows db 10
columns db 10
matrix1
  dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
matrix2
  dw 10, 9, 8, 0, 6, 5, 4, 3, 2, 1
  dw 10, 9, 8, 1, 6, 5, 4, 3, 2, 1
  dw 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
  dw 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
  dw 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
  dw 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
  dw 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
  dw 10, 9, 8, 7, 6, 5, 4, 20, 2, 1
  dw 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
  dw 10, 9, 8, 7, 6, 5, 4, 3, 2, 1

section .bss
matrix3 resw 100

section .text
global _start
_start:
  mov edx, 0
  mov ecx, 0
continua_loop:
  mov bx, [matrix1 + edx + ecx*2]
  add bx, [matrix2 + edx + ecx*2]
  mov [matrix3 + edx + ecx*2], bx
  add ecx, 1
  cmp ecx, 20
  jne continua_loop
  mov ecx, 0
  add edx, 20
  cmp edx, 200
  jne continua_loop

  mov edx, 0
  mov ecx, 0
continua_loop_print:
  push ecx
  add ecx, edx
  add ecx, matrix3
  PutInt [ecx]
  pop ecx
  add ecx, 2
  cmp ecx, 20
  PutStr space
  jne continua_loop_print
  mov ecx, 0
  add edx, 20
  cmp edx, 200
  PutStr nl
  jne continua_loop_print

  mov eax, 1
  mov ebx, 0
  int 80h