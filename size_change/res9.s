	.text
	.file	"vli_decoder.c"
	.globl	lzma_vli_decode                 # -- Begin function lzma_vli_decode
	.type	lzma_vli_decode,@function
lzma_vli_decode:                        # @lzma_vli_decode
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
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
	ja	.LBB0_16
# %bb.6:                                # %lor.lhs.false
	movq	(%rdi), %rbx
	imull	$7, %ecx, %ecx
                                        # kill: def $cl killed $cl killed $ecx
	shrq	%cl, %rbx
	testq	%rbx, %rbx
	jne	.LBB0_16
# %bb.7:                                # %if.end9
	cmpq	%r8, (%r9)
	jb	.LBB0_9
# %bb.8:
	movl	$10, %eax
	jmp	.LBB0_16
.LBB0_1:                                # %if.then
	andq	$0, (%rdi)
	movq	%r10, %rsi
	cmpq	%r8, (%r9)
	jae	.LBB0_2
.LBB0_9:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r9), %rax
	movzbl	(%rdx,%rax), %ebx
	incq	%rax
	movq	%rax, (%r9)
	movl	%ebx, %eax
	andl	$127, %eax
	imull	$7, (%rsi), %ecx
                                        # kill: def $cl killed $cl killed $ecx
	shlq	%cl, %rax
	addq	%rax, (%rdi)
	movq	(%rsi), %rcx
	incq	%rcx
	movq	%rcx, (%rsi)
	testb	%bl, %bl
	jns	.LBB0_10
# %bb.13:                               # %cleanup
                                        #   in Loop: Header=BB0_9 Depth=1
	cmpq	$9, %rcx
	je	.LBB0_2
# %bb.14:                               # %do.cond
                                        #   in Loop: Header=BB0_9 Depth=1
	cmpq	%r8, (%r9)
	jb	.LBB0_9
# %bb.15:                               # %do.end
	xorl	%eax, %eax
	cmpq	%r10, %rsi
	sete	%al
	leal	(%rax,%rax,8), %eax
	jmp	.LBB0_16
.LBB0_2:
	movl	%r11d, %eax
.LBB0_16:                               # %cleanup41
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB0_10:                               # %if.then21
	.cfi_def_cfa_offset 16
	jne	.LBB0_12
# %bb.11:                               # %if.then21
	movl	%r11d, %eax
	cmpq	$1, %rcx
	ja	.LBB0_16
.LBB0_12:                               # %if.end28
	xorl	%eax, %eax
	cmpq	%r10, %rsi
	setne	%al
	jmp	.LBB0_16
.Lfunc_end0:
	.size	lzma_vli_decode, .Lfunc_end0-lzma_vli_decode
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 17.0.6 (git@github.com:webmiche/llvm-project.git 05dfeb4f83cb840f44d291a65e70580461bddbf7)"
	.section	".note.GNU-stack","",@progbits
