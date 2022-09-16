section .data
string db "KANGAROO", 0dh, 0ah
size dd 10

global _start
section .text

print_k:
  mov eax, 4
  mov ebx, 0
  mov ecx, string
  mov edx, [size]
  int 80h

  ret

_start:
  call print_k

  mov ecx, 8
  mov eax, string
  mov ebx, 0
l1:
  add DWORD [eax+ebx], 020h
  add ebx, 1
  loop l1

  call print_k

  mov eax, 1
  mov ebx, 0
  int 80h