	.file	"hello.c"
	.intel_syntax noprefix
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "c = %d\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB13:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 32
	call	___main
	mov	DWORD PTR [esp+28], 10
	mov	DWORD PTR [esp+24], 30
	mov	edx, DWORD PTR [esp+28]
	mov	eax, DWORD PTR [esp+24]
	add	eax, edx
	mov	DWORD PTR [esp+20], eax
	mov	eax, DWORD PTR [esp+20]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_printf
	mov	eax, 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.ident	"GCC: (i686-posix-dwarf-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
