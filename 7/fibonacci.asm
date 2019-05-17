section .data
SYS_EXIT		equ 60
EXIT_SUCCESS	equ 0
N				equ 10

fibonacci		dq 1
prev			dq 0

section .text
global _start
_start:
	mov rcx, qword N
	cmp rcx, 2
	jae AboveEqualTwo
	mov qword [fibonacci], rcx
	jmp last
AboveEqualTwo:
	sub rcx, 1 ; start from calculating 2nd fibo number
loopFibo:
	mov rax, qword [prev]
	mov rbx, qword [fibonacci]
	add qword [fibonacci], rax
	mov qword[prev], rbx
loopEnd:
	dec rcx
	cmp rcx, 0
	jne loopFibo

last:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
