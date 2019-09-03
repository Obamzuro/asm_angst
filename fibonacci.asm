section .data
SYS_EXIT equ 60
EXIT_SUCCESS equ 0

nahStr db "Not polindrome!"
normStr db "Polindrome!"

section .text
global _start
_start:
	push rbp
	mov rbp, rsp
	sub rsp, 8

readBuffer:
	mov rax, 0
	mov rdi, 0
	mov rsi, rbp
	sub rsi, 8
	mov rdx, 8
	syscall

palindrome:
	mov rcx, 8
	mov rsi, rbp
	sub rsi, 8
loopPol:
	movzx rax, byte [rsi]
	push rax
	inc rsi
	loop loopPol

	mov rcx, 8
	mov rsi, rbp
	sub rsi, 9
check:
	inc rsi
	pop rax
	mov bl, byte [rsi]
	cmp al, bl
	jne nah
	loop check
	je norm

nah:
	mov rax, 1
	mov rdi, 1
	mov rsi, nahStr
	mov rdx, 15
	syscall
	jmp exitMain
	
norm:
	mov rax, 1
	mov rdi, 1
	mov rsi, normStr
	mov rdx, 11
	syscall
	
exitMain:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
