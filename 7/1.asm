section .data
EXIT_SUCCESS equ 0
SYS_EXIT equ 60

bNum1 db 1
bNum2 db 2
bNum3 db 3
bNum4 db 4

bAns1 db 5
bAns2 db 6
bAns3 db 7
bAns4 db 8
bAns5 db 9
bAns6 db 10
bAns7 db 11
bAns8 db 12
bAns9 db 13

bRem  db 14

wNum1 dw 15
wAns1 dw 16
wAns2 dw 17
wAns3 dw 18

section .text
global _start
_start:
	;1. bAns1 = bNum1 + bNum2
	mov al, byte [bNum1]
	add al, byte [bNum2]
	mov byte [bAns1], al

	;2. bAns2 = bNum1 + bNum3
	mov al, byte [bNum1]
	add al, byte [bNum3]
	mov byte [bAns2], al

	;3. bAns3 = bNum3 + bNum4
	mov al, byte [bNum3]
	add al, byte [bNum4]
	mov byte [bAns3], al

	;4. bAns4 = bNum1 - bNum2
	mov al, byte [bNum1]
	sub al, byte [bNum2]
	mov byte [bAns4], al

	;7. wAns1 = bNum1 * bNum3
	mov al, byte [bNum1]
	mov ah, 0
	mul byte [bNum3]
	mov word [wAns1], ax

	;10. bAns1 = bNum1 / bNum2
	mov al, byte [bNum1]
	mov ah, 0
	div byte [bNum2]
	mov byte [bAns1], al

	;13. bRem = wNum1 % bNum3
	mov ax, word [wNum1]
	div byte [bNum3]
	mov byte [bRem], ah

last:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
