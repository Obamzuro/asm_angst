section .data
SYS_EXIT equ 60
EXIT_SUCCESS equ 0

len equ 7

strPal db "beewqeb"
isPal db 0

section .text
global _start
_start:
	mov rcx, len
	mov rsi, 0
pushString:
	movzx rax, byte [strPal+rsi]
	push rax
	inc rsi
	loop pushString

	mov rcx, len
	mov rsi, 0
check:
	pop rax
	movzx rbx, byte [strPal+rsi]
	cmp rax, rbx
	jne no
	inc rsi
	loop check
	jmp yes

no:
	mov byte [isPal], 0
	jmp last
yes:
	mov byte [isPal], 1
last:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
