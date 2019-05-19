section .data
SYS_EXIT equ 60
EXIT_SUCCESS equ 0

strPal db "    A man,,,, a plan!!,,, a-- canal - Panama!     "
len equ 50
isPal db 0

ignoredChars db ' ', ',', '-', '!'
icLen equ 4

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
	mov rdi, 0
mbIgnoreStack:
	movzx r8, byte[ignoredChars+rdi]
	cmp rax, r8
	je skip
	inc rdi
	cmp rdi, icLen
	jne mbIgnoreStack

checkStr:
	movzx rbx, byte [strPal+rsi]
	mov rdi, 0
mbIgnoreStr:
	movzx r8, byte[ignoredChars+rdi]
	cmp rbx, r8
	je skipWithIterate
	inc rdi
	cmp rdi, icLen
	jne mbIgnoreStr

	or rax, 0x20 ; cast to lowercase
	or rbx, 0x20
	cmp rax, rbx
	jne no
	inc rsi
skip:
	loop check
	jmp yes

skipWithIterate:
	inc rsi
	cmp rsi, len
	ja no
	jmp checkStr

no:
	mov byte [isPal], 0
	jmp last
yes:
	mov byte [isPal], 1
last:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
