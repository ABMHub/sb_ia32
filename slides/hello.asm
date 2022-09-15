section .data
string db "Hello World!", 0dh, 0ah

global _start
section .text
_start:
mov eax, 4
mov ebx, 0
mov ecx, string
mov edx, 14
int 80h
mov eax,1
mov ebx,0
int 80h