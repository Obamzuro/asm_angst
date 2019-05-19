section .data
SYS_EXIT equ 60
EXIT_SUCCESS equ 0

len equ 6

strPal db "beqweb"
isPal db 0

section .text
global _start
_start:
	mov rcx, len
	dec rcx
	mov rdx, 0
lp:
	cmp rdx, rcx ; boundary check
	jae yes

	mov al, byte [strPal+rdx] ; check if letters are the same
	cmp al, byte [strPal+rcx]
	jne no

	inc rdx
	loop lp

no:
	mov byte [isPal], 0
	jmp last
yes:
	mov byte [isPal], 1
last:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
