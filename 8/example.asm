section .data
SYS_EXIT		equ 60
EXIT_SUCCESS	equ 0

var				db 55

qVar1			dq 22

ans1			dd 7

list			dd 2, 7, 4, 5, 6, 3

section .text
global _start
_start:
	mov rbx, list
	mov rsi, 1
	mov rcx, 2
	mov eax, 0
	mov edx, dword [rbx+4]
lp:
	add eax, dword [rbx+rsi*4]
	add rsi, 2
	loop lp
	imul dword [rbx]

last:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
