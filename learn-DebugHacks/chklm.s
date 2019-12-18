	.file	"chklm.c"
	.text
	.globl	cpuid
	.type	cpuid, @function
cpuid:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movl	%edi, -12(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rdx, -32(%rbp)
	movq	%rcx, -40(%rbp)
	movq	%r8, -48(%rbp)
	movl	-12(%rbp), %eax
#APP
# 8 "chklm.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movl	%ebx, %esi
	movq	-24(%rbp), %rdi
	movl	%eax, (%rdi)
	movq	-32(%rbp), %rax
	movl	%esi, (%rax)
	movq	-40(%rbp), %rax
	movl	%ecx, (%rax)
	movq	-48(%rbp), %rax
	movl	%edx, (%rax)
	nop
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	cpuid, .-cpuid
	.section	.rodata
	.align 8
.LC0:
	.string	"x86_64 Long Mode is supported."
	.align 8
.LC1:
	.string	"x86_64 Long Mode is not supported."
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	-16(%rbp), %rsi
	leaq	-12(%rbp), %rcx
	leaq	-8(%rbp), %rdx
	leaq	-4(%rbp), %rax
	movq	%rsi, %r8
	movq	%rax, %rsi
	movl	$-2147483648, %edi
	call	cpuid
	movl	-4(%rbp), %eax
	cmpl	$-2147483648, %eax
	jbe	.L8
	leaq	-16(%rbp), %rsi
	leaq	-12(%rbp), %rcx
	leaq	-8(%rbp), %rdx
	leaq	-4(%rbp), %rax
	movq	%rsi, %r8
	movq	%rax, %rsi
	movl	$-2147483647, %edi
	call	cpuid
	movl	-16(%rbp), %eax
	andl	$536870912, %eax
	testl	%eax, %eax
	je	.L9
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L7
.L8:
	nop
	jmp	.L4
.L9:
	nop
.L4:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
