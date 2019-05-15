section .data
EXIT_SUCCESS		equ		0
SYS_EXIT			equ		60

dquad1				ddq		0xA000000000000000
dquad2				ddq		0x8000000000000000
dqSum				ddq		0

section .text
global _start
_start:
	mov rax, qword [dquad1]
	mov rdx, qword [dquad1+8]

	add rax, qword [dquad2]
	adc rdx, qword [dquad2+8]

	mov qword [dqSum], rax
	mov qword [dqSum+8], rdx

last:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
