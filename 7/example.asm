section .data
EXIT_SUCCESS	equ 0
SYS_EXIT		equ 60

bVar1			db 17
bVar2			db -9
bResult			db 0

dVar			dd 20

qVar1			dq 2000
qVar2			dq 3000

section .text
global _start
_start:
	imul rax, qword [qVar1], 0x12345678

last:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
