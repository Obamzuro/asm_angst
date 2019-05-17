section .data
EXIT_SUCCESS equ 0
SYS_EXIT equ 60

dNum1 dd 1
dNum2 dd -2
dNum3 dd -3
dNum4 dd 4

dAns1 dd 5
dAns2 dd 6
dAns3 dd 7
dAns4 dd 8
dAns5 dd 9
dAns6 dd 10
dAns7 dd 11
dAns8 dd 12
dAns9 dd 13

dRem  dd 14

qNum1 dq -16
qAns1 dq 16
qAns2 dq 17
qAns3 dq 18

section .text
global _start
_start:
	;1. dAns1 = dNum1 + dNum2
	mov eax, dword [dNum1]
	add eax, dword [dNum2]
	mov dword [dAns1], eax

	;4. dAns4 = dNum1 - dNum2
	mov eax, dword [dNum1]
	sub eax, dword [dNum2]
	mov dword [dAns4], eax

	;7. qAns1 = dNum1 * dNum3
	mov eax, dword [dNum1]
	cdq
	imul dword [dNum3]
	mov dword [qAns1], eax
	mov dword [qAns1+4], edx

	;10. dAns1 = dNum1 / dNum2
	mov eax, dword [dNum1]
	cdq
	idiv dword [dNum2]
	mov dword [dAns1], eax

	;13. dRem = qNum1 % dNum3
	mov eax, dword [qNum1]
	mov edx, dword [qNum1+4]
	idiv dword [dNum3]
	mov dword [dRem], edx

last:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
