section .data
print_res db 0, 0dh, 0ah

section .bss
num1 resb 1
num2 resb 1

section .text
global _start

soma_func:
  push ebp
  mov ebp, esp
  mov eax, [ebp + 8]
  mov ebx, [ebp + 12]

  mov cl, [ebx]
  add [eax], cl

  pop ebp
  ret 8

inp_func:
  push ebp
  mov ebp, esp
  mov eax, 3
  mov ebx, 0
  mov ecx, [ebp + 8]
  mov edx, 1
  int 80h

  mov eax, [ebp + 8]
  sub BYTE [eax], 30h
  pop ebp
  ret 4

_start:
  push num1
  call inp_func

  push num2
  call inp_func

  push dword num1
  push dword num2
  call soma_func

  mov dl, [eax]
  mov ecx, print_res
  mov [ecx], dl
  mov eax, 4
  mov ebx, 1
  add [ecx], byte 30h
  mov edx, 3
  int 80h

  mov eax, 1
  mov ebx, 0
  int 80h
