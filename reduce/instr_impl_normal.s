	.text
	.file	""
	.globl	price_out_impl                  # -- Begin function price_out_impl
	.p2align	4, 0x90
	.type	price_out_impl,@function
price_out_impl:                         # @price_out_impl
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%r9d, %ebp
	movl	%r8d, %r13d
	movq	%rcx, %r12
	movq	%rdx, 16(%rsp)                  # 8-byte Spill
	movq	%rsi, %r15
	movq	%rdi, %rbx
	xorl	%edi, %edi
	callq	malloc@PLT
	testb	$1, 96(%rsp)
	je	.LBB0_19
# %bb.1:                                # %if.end40
	movq	%rax, %r14
	movq	128(%rsp), %rdx
	movl	112(%rsp), %esi
	movq	104(%rsp), %rdi
	movl	%ebp, %eax
	movq	(%rbx), %rbp
	movl	%r13d, 4(%rsp)                  # 4-byte Spill
                                        # kill: def $r13b killed $r13b killed $r13d
	xorb	$1, %r13b
	movl	%eax, (%rsp)                    # 4-byte Spill
	orb	%al, %r13b
	xorl	%eax, %eax
	imulq	$72, 120(%rsp), %rcx
	movq	%rcx, 24(%rsp)                  # 8-byte Spill
	movq	%r15, 8(%rsp)                   # 8-byte Spill
.LBB0_2:                                # %for.cond82.outer
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
                                        #     Child Loop BB0_10 Depth 2
	movq	%r12, 32(%rsp)                  # 8-byte Spill
.LBB0_3:                                # %for.cond82
                                        #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	%rdi, %rax
	jge	.LBB0_4
# %bb.6:                                # %if.then87
                                        #   in Loop: Header=BB0_3 Depth=2
	testb	$1, %r13b
	jne	.LBB0_8
# %bb.7:                                # %if.then93
                                        #   in Loop: Header=BB0_3 Depth=2
	xorl	%edi, %edi
	movl	%esi, %r12d
	xorl	%esi, %esi
	movq	%rdx, %r15
	callq	switch_arcs@PLT
	movq	104(%rsp), %rdi
	movl	%r12d, %esi
	movq	32(%rsp), %r12                  # 8-byte Reload
	movq	%r15, %rdx
	movq	8(%rsp), %r15                   # 8-byte Reload
	movq	16(%rsp), %rax                  # 8-byte Reload
	andq	$0, (%rax)
.LBB0_8:                                # %if.end111
                                        #   in Loop: Header=BB0_3 Depth=2
	testl	%esi, %esi
	movq	%rdx, %rax
	je	.LBB0_3
# %bb.9:                                # %while.cond.outer.preheader
                                        #   in Loop: Header=BB0_2 Depth=1
	movq	%rbx, %rax
.LBB0_10:                               # %while.cond
                                        #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testq	%rax, %rax
	je	.LBB0_11
# %bb.12:                               # %if.end140
                                        #   in Loop: Header=BB0_10 Depth=2
	testq	%r12, %r12
	movq	%r15, %rax
	jns	.LBB0_10
# %bb.13:                               # %if.else159
                                        #   in Loop: Header=BB0_10 Depth=2
	testb	$1, 4(%rsp)                     # 1-byte Folded Reload
	je	.LBB0_15
# %bb.14:                               # %if.then163
                                        #   in Loop: Header=BB0_10 Depth=2
	pushq	$9
	.cfi_adjust_cfa_offset 8
	popq	%rcx
	.cfi_adjust_cfa_offset -8
	xorl	%edi, %edi
	movq	%rbx, %rsi
	rep;movsq (%rsi), %es:(%rdi)
	movq	%r12, (%rbx)
	movq	%rdx, %r15
	callq	replace_weaker_arc@PLT
	movq	104(%rsp), %rdi
	movl	112(%rsp), %esi
	movq	%r15, %rdx
	movq	8(%rsp), %r15                   # 8-byte Reload
	jmp	.LBB0_17
.LBB0_15:                               # %if.else177
                                        #   in Loop: Header=BB0_10 Depth=2
	testb	$1, (%rsp)                      # 1-byte Folded Reload
	je	.LBB0_17
# %bb.16:                               # %if.then180
                                        #   in Loop: Header=BB0_10 Depth=2
	movq	(%rbx), %rax
	movq	%r12, (%r14)
	movq	16(%rsp), %rcx                  # 8-byte Reload
	andq	$0, (%rcx)
	movq	24(%rsp), %rcx                  # 8-byte Reload
	andl	$0, (%rax,%rcx)
.LBB0_17:                               # %if.then201
                                        #   in Loop: Header=BB0_10 Depth=2
	andq	$0, (%rbx)
	xorl	%eax, %eax
	jmp	.LBB0_10
.LBB0_11:                               #   in Loop: Header=BB0_2 Depth=1
	movq	%rdi, %rax
	jmp	.LBB0_2
.LBB0_19:                               # %common.ret
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
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
.LBB0_4:                                # %while.cond214.preheader
	.cfi_def_cfa_offset 96
	testb	$1, (%rsp)                      # 1-byte Folded Reload
	je	.LBB0_18
.LBB0_5:                                # %while.cond214
                                        # =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	switch_arcs@PLT
	jmp	.LBB0_5
.LBB0_18:                               # %for.body268
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbp), %rax
	andq	$0, (%rax)
	jmp	.LBB0_18
.Lfunc_end0:
	.size	price_out_impl, .Lfunc_end0-price_out_impl
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
