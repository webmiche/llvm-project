	.text
	.file	"vli_decoder.c"
	.globl	lzma_vli_decode                 # -- Begin function lzma_vli_decode
	.type	lzma_vli_decode,@function
lzma_vli_decode:                        # @lzma_vli_decode
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rcx, %r9
	movl	$9, %r11d
	leaq	-8(%rsp), %r10
	testq	%rsi, %rsi
	je	.LBB0_1
# %bb.8:                                # %if.else
	movq	(%rsi), %rbx
	movl	$11, %eax
	testq	%rbx, %rbx
	je	.LBB0_9
# %bb.10:                               # %if.end5
	cmpq	$8, %rbx
	ja	.LBB0_20
# %bb.11:                               # %if.end5.lor.lhs.false_crit_edge
	movq	(%rdi), %r14
	jmp	.LBB0_12
.LBB0_1:                                # %if.then
	andq	$0, (%rdi)
	movq	(%r9), %rax
	cmpq	%r8, %rax
	jae	.LBB0_19
# %bb.2:
	xorl	%r14d, %r14d
	xorl	%ebx, %ebx
	movq	%r10, %rsi
	jmp	.LBB0_3
.LBB0_9:                                # %if.end5.thread
	andq	$0, (%rdi)
	xorl	%r14d, %r14d
.LBB0_12:                               # %lor.lhs.false
	imull	$7, %ebx, %ecx
	movq	%r14, %r15
                                        # kill: def $cl killed $cl killed $ecx
	shrq	%cl, %r15
	testq	%r15, %r15
	jne	.LBB0_20
# %bb.13:                               # %if.end9
	movq	(%r9), %rax
	cmpq	%r8, %rax
	jae	.LBB0_14
.LBB0_3:                                # %if.end13
	leaq	1(%rax), %r15
	cmpq	%r15, %r8
	cmovaq	%r8, %r15
	imulq	$7, %rbx, %rcx
	addq	%rax, %rdx
	xorl	%r12d, %r12d
.LBB0_4:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%r14, %r13
	movzbl	(%rdx,%r12), %ebp
	movl	%ebp, %r14d
	andl	$127, %r14d
	shlq	%cl, %r14
	addq	%r13, %r14
	leaq	(%rax,%r12), %r13
	incq	%r13
	testb	%bpl, %bpl
	jns	.LBB0_5
# %bb.15:                               # %cleanup
                                        #   in Loop: Header=BB0_4 Depth=1
	leaq	(%rbx,%r12), %rbp
	addq	$-8, %rbp
	testq	%rbp, %rbp
	je	.LBB0_18
# %bb.16:                               # %do.cond
                                        #   in Loop: Header=BB0_4 Depth=1
	addq	$7, %rcx
	incq	%r12
	cmpq	%r8, %r13
	jb	.LBB0_4
# %bb.17:                               # %do.end
	movq	%r15, (%r9)
	addq	%r12, %rbx
	movq	%rbx, (%rsi)
	movq	%r14, (%rdi)
	xorl	%eax, %eax
	cmpq	%r10, %rsi
	sete	%al
	leal	(%rax,%rax,8), %eax
	jmp	.LBB0_20
.LBB0_5:                                # %if.then21
	movq	%r13, (%r9)
	leaq	1(%rbx,%r12), %rcx
	movq	%rcx, (%rsi)
	movq	%r14, (%rdi)
	jne	.LBB0_7
# %bb.6:                                # %if.then21
	movl	%r11d, %eax
	cmpq	$1, %rcx
	ja	.LBB0_20
.LBB0_7:                                # %if.end28
	xorl	%eax, %eax
	cmpq	%r10, %rsi
	setne	%al
	jmp	.LBB0_20
.LBB0_18:                               # %cleanup41.loopexit
	movq	%r13, (%r9)
	movq	$9, (%rsi)
	movq	%r14, (%rdi)
.LBB0_19:                               # %cleanup41
	movl	%r11d, %eax
	jmp	.LBB0_20
.LBB0_14:
	movl	$10, %eax
.LBB0_20:                               # %cleanup41
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	lzma_vli_decode, .Lfunc_end0-lzma_vli_decode
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 17.0.6 (git@github.com:webmiche/llvm-project.git 05dfeb4f83cb840f44d291a65e70580461bddbf7)"
	.section	".note.GNU-stack","",@progbits
