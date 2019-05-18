section .data
SYS_EXIT equ 60
EXIT_SUCCESS equ 0

list dd 4, 9, 2, 10, 5, 9, 2
len dw 7
swapped db 0

section .text
global _start
_start:
	movzx rcx, word [len] ; first iter
	dec rcx
lp:
	mov rdx, 0 ; second iter
	mov rax, list ; left element
	mov byte [swapped], 0
	lpInside:
		mov ebx, dword [rax+4] ; right element (unpointered)
		cmp dword [rax], ebx
		jle NoSwap
		mov esi, dword [rax]
		mov dword [rax], ebx
		mov dword [rax+4], esi
		mov byte [swapped], 1
		NoSwap:
		inc rdx
		add rax, 4
		cmp rdx, rcx
		jne lpInside
	cmp dword[swapped], 0
	je last
	loop lp

last:
	mov rax, SYS_EXIT
	mov edi, EXIT_SUCCESS
	syscall
