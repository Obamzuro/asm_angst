%macro absq 1
	cmp %1, 0
	jge %%done
	neg %1
%%done:
%endmacro


section .data
SYS_EXIT		equ 60
EXIT_SUCCESS	equ 0

var				db 55

qVar1			dq 22

ans1			dd 7

lst			dq 1, 3, 5, 7, 9

section .text
global _start
_start:
	mov eax, -3
	absq(eax)

last:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
