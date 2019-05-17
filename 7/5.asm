section .data
EXIT_SUCCESS	equ 0
SYS_EXIT		equ 60
N				equ 10

sum				dq 0

section .text
global _start
_start:
	mov rcx, N
	mov rbx, 1
loopSquare:
	mov rax, rbx
	mul rax
	add qword [sum], rax
	inc rbx
	loop loopSquare

last:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
