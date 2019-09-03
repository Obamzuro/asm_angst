section .data
SYS_EXIT equ 60
EXIT_SUCCESS equ 0

section .text
global _start
_start:
	push rbp
	mov rbp, rsp
	sub rsp, 8

readBuffer:
	mov rax, 0
	mov rdi, 0
	mov rsi, rsp
	mov rdx, 8
	syscall

	mov r8, 0
	mov rsi, rsp
	add rsi, 7
	xor rbx, rbx
toInt:
	inc r8
	movzx rax, byte [rsi]
	sub rax, 48
	mov rcx, r8
	dec rcx
	cmp rcx, 0	
	je afterPower
power:
	imul rax, 10
	loop power
afterPower:
	add rbx, rax
	dec rsi
	cmp r8, 8
	jne toInt

	

	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
