	.file	"main.c"
	.text
	.globl	foo
	.type	foo, @function
foo:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	leaq	16(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	leaq	24(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, (%rdx)
	movq	-24(%rbp), %rax
	movq	$1, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	foo, .-foo
	.section	.rodata
	.align 8
.LC1:
	.string	"Time for foo_precise: %f seconds\n"
	.align 8
.LC2:
	.string	"Time for foo_relaxed: %f seconds\n"
.LC3:
	.string	"Time for foo: %f seconds\n"
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
	addq	$-128, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	call	clock@PLT
	movq	%rax, -112(%rbp)
	movl	$0, -128(%rbp)
	jmp	.L3
.L4:
	leaq	-88(%rbp), %rdx
	leaq	-48(%rbp), %rcx
	leaq	-80(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	foo_precise@PLT
	addl	$1, -128(%rbp)
.L3:
	cmpl	$99999999, -128(%rbp)
	jle	.L4
	call	clock@PLT
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rax
	subq	-112(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	call	clock@PLT
	movq	%rax, -112(%rbp)
	movl	$0, -124(%rbp)
	jmp	.L5
.L6:
	leaq	-88(%rbp), %rdx
	leaq	-48(%rbp), %rcx
	leaq	-80(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	foo_relaxed@PLT
	addl	$1, -124(%rbp)
.L5:
	cmpl	$99999999, -124(%rbp)
	jle	.L6
	call	clock@PLT
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rax
	subq	-112(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	call	clock@PLT
	movq	%rax, -112(%rbp)
	movl	$0, -120(%rbp)
	jmp	.L7
.L8:
	leaq	-88(%rbp), %rdx
	leaq	-48(%rbp), %rcx
	leaq	-80(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	foo_precise@PLT
	addl	$1, -120(%rbp)
.L7:
	cmpl	$99999999, -120(%rbp)
	jle	.L8
	call	clock@PLT
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rax
	subq	-112(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	call	clock@PLT
	movq	%rax, -112(%rbp)
	movl	$0, -116(%rbp)
	jmp	.L9
.L10:
	leaq	-88(%rbp), %rdx
	leaq	-48(%rbp), %rcx
	leaq	-80(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	foo_relaxed@PLT
	addl	$1, -116(%rbp)
.L9:
	cmpl	$99999999, -116(%rbp)
	jle	.L10
	call	clock@PLT
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rax
	subq	-112(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1093567616
	.ident	"GCC: (GNU) 14.2.1 20250128"
	.section	.note.GNU-stack,"",@progbits
