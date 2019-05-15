section .data
EXIT_SUCCESS	equ 0
SYS_EXIT		equ 60

bVar1			db 17
bVar2			db 9
bResult			db 0

qVar			dq 2000

section .text
global _start
_start:
	mov rax, qword [qVar]

last:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
