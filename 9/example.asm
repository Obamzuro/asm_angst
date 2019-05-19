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
	mov rsi, 0
	mov rcx, 5
lp1:
	push qword [lst+rsi*8]
	inc rsi
	loop lp1
	mov rsi, 0
	mov rcx, 5
lp2:
	pop qword [lst+rsi*8]
	inc rsi
	loop lp2
	mov rbx, qword [lst]

last:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
