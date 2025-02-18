	.text
	.file	"vli_decoder.c"
	.globl	lzma_vli_decode                 # -- Begin function lzma_vli_decode
	.type	lzma_vli_decode,@function
lzma_vli_decode:                        # @lzma_vli_decode
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rcx, %r9
	leaq	-8(%rsp), %r10
	andq	$0, (%r10)
	movl	$9, %r11d
	testq	%rsi, %rsi
	je	.LBB0_1
# %bb.3:                                # %if.else
	movq	(%rsi), %rcx
	testq	%rcx, %rcx
	jne	.LBB0_5
# %bb.4:                                # %if.then4
	andq	$0, (%rdi)
	movq	(%rsi), %rcx
.LBB0_5:                                # %if.end5
	movl	$11, %eax
	cmpq	$8, %rcx
	ja	.LBB0_17
# %bb.6:                                # %lor.lhs.false
	movq	(%rdi), %rbx
	imull	$7, %ecx, %ecx
	movq	%rbx, %r14
                                        # kill: def $cl killed $cl killed $ecx
	shrq	%cl, %r14
	testq	%r14, %r14
	jne	.LBB0_17
# %bb.7:                                # %if.end9
	movq	(%r9), %rax
	cmpq	%r8, %rax
	jb	.LBB0_10
# %bb.8:
	movl	$10, %eax
	jmp	.LBB0_17
.LBB0_1:                                # %if.then
	andq	$0, (%rdi)
	movq	(%r9), %rax
	cmpq	%r8, %rax
	jae	.LBB0_2
# %bb.9:
	xorl	%ebx, %ebx
	movq	%r10, %rsi
.LBB0_10:                               # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %r14
	movzbl	(%rdx,%rax), %r15d
	incq	%rax
	movq	%rax, (%r9)
	movl	%r15d, %ebx
	andl	$127, %ebx
	imull	$7, (%rsi), %ecx
                                        # kill: def $cl killed $cl killed $ecx
	shlq	%cl, %rbx
	addq	%r14, %rbx
	movq	%rbx, (%rdi)
	movq	(%rsi), %rcx
	incq	%rcx
	movq	%rcx, (%rsi)
	testb	%r15b, %r15b
	jns	.LBB0_11
# %bb.14:                               # %cleanup
                                        #   in Loop: Header=BB0_10 Depth=1
	cmpq	$9, %rcx
	je	.LBB0_2
# %bb.15:                               # %do.cond
                                        #   in Loop: Header=BB0_10 Depth=1
	movq	(%r9), %rax
	cmpq	%r8, %rax
	jb	.LBB0_10
# %bb.16:                               # %do.end
	xorl	%eax, %eax
	cmpq	%r10, %rsi
	sete	%al
	leal	(%rax,%rax,8), %eax
	jmp	.LBB0_17
.LBB0_2:
	movl	%r11d, %eax
.LBB0_17:                               # %cleanup41
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB0_11:                               # %if.then21
	.cfi_def_cfa_offset 32
	jne	.LBB0_13
# %bb.12:                               # %if.then21
	movl	%r11d, %eax
	cmpq	$1, %rcx
	ja	.LBB0_17
.LBB0_13:                               # %if.end28
	xorl	%eax, %eax
	cmpq	%r10, %rsi
	setne	%al
	jmp	.LBB0_17
.Lfunc_end0:
	.size	lzma_vli_decode, .Lfunc_end0-lzma_vli_decode
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 17.0.6 (git@github.com:webmiche/llvm-project.git 05dfeb4f83cb840f44d291a65e70580461bddbf7)"
	.section	".note.GNU-stack","",@progbits
