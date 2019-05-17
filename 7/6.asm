section .data
EXIT_SUCCESS	equ 0
SYS_EXIT		equ 60
N				equ 10

result			dq 0

section .text
global _start
_start:
	mov rbx, 1 ;iter
	mov rax, 0 ;sum
	mov rcx, qword N
loopSquare:
	add rax, rbx
	inc rbx
	loop loopSquare

	mul rax
	mov qword [result], rax

last:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
