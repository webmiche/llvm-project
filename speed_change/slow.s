	.text
	.file	"sff.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function seconds
.LCPI0_0:
	.quad	0x3fb999999999999a              # double 0.10000000000000001
	.text
	.globl	seconds
	.p2align	4, 0x90
	.type	seconds,@function
seconds:                                # @seconds
	.cfi_startproc
# %bb.0:                                # %entry
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = mem[0],zero
	retq
.Lfunc_end0:
	.size	seconds, .Lfunc_end0-seconds
	.cfi_endproc
                                        # -- End function
	.globl	myroc                           # -- Begin function myroc
	.p2align	4, 0x90
	.type	myroc,@function
myroc:                                  # @myroc
	.cfi_startproc
# %bb.0:                                # %entry
	testl	%ecx, %ecx
	js	.LBB1_1
# %bb.2:                                # %if.else
	movl	%edx, %r8d
	movl	%edi, %eax
	cltd
	idivl	%esi
	cltd
	idivl	%r8d
	xorl	%eax, %eax
	cmpl	%ecx, %edx
	sete	%al
	retq
.LBB1_1:
	xorl	%eax, %eax
	retq
.Lfunc_end1:
	.size	myroc, .Lfunc_end1-myroc
	.cfi_endproc
                                        # -- End function
	.globl	get_nr_debug                    # -- Begin function get_nr_debug
	.p2align	4, 0x90
	.type	get_nr_debug,@function
get_nr_debug:                           # @get_nr_debug
	.cfi_startproc
# %bb.0:                                # %entry
	xorl	%eax, %eax
	retq
.Lfunc_end2:
	.size	get_nr_debug, .Lfunc_end2-get_nr_debug
	.cfi_endproc
                                        # -- End function
	.globl	get_blocksize                   # -- Begin function get_blocksize
	.p2align	4, 0x90
	.type	get_blocksize,@function
get_blocksize:                          # @get_blocksize
	.cfi_startproc
# %bb.0:                                # %entry
	movl	blocksize(%rip), %eax
	retq
.Lfunc_end3:
	.size	get_blocksize, .Lfunc_end3-get_blocksize
	.cfi_endproc
                                        # -- End function
	.globl	get_mytaskid                    # -- Begin function get_mytaskid
	.p2align	4, 0x90
	.type	get_mytaskid,@function
get_mytaskid:                           # @get_mytaskid
	.cfi_startproc
# %bb.0:                                # %entry
	xorl	%eax, %eax
	retq
.Lfunc_end4:
	.size	get_mytaskid, .Lfunc_end4-get_mytaskid
	.cfi_endproc
                                        # -- End function
	.globl	get_numtasks                    # -- Begin function get_numtasks
	.p2align	4, 0x90
	.type	get_numtasks,@function
get_numtasks:                           # @get_numtasks
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$1, %eax
	retq
.Lfunc_end5:
	.size	get_numtasks, .Lfunc_end5-get_numtasks
	.cfi_endproc
                                        # -- End function
	.globl	mpierror                        # -- Begin function mpierror
	.p2align	4, 0x90
	.type	mpierror,@function
mpierror:                               # @mpierror
	.cfi_startproc
# %bb.0:                                # %entry
	testl	%edi, %edi
	js	.LBB6_2
# %bb.1:                                # %if.end
	xorl	%eax, %eax
	retq
.LBB6_2:                                # %if.then
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$1, %edi
	callq	exit@PLT
.Lfunc_end6:
	.size	mpierror, .Lfunc_end6-mpierror
	.cfi_endproc
                                        # -- End function
	.globl	reducerror                      # -- Begin function reducerror
	.p2align	4, 0x90
	.type	reducerror,@function
reducerror:                             # @reducerror
	.cfi_startproc
# %bb.0:                                # %entry
	testl	%edi, %edi
	js	.LBB7_2
# %bb.1:                                # %mpierror.exit
	xorl	%eax, %eax
	retq
.LBB7_2:                                # %if.then.i
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$1, %edi
	callq	exit@PLT
.Lfunc_end7:
	.size	reducerror, .Lfunc_end7-reducerror
	.cfi_endproc
                                        # -- End function
	.globl	mpifinalize                     # -- Begin function mpifinalize
	.p2align	4, 0x90
	.type	mpifinalize,@function
mpifinalize:                            # @mpifinalize
	.cfi_startproc
# %bb.0:                                # %entry
	xorl	%eax, %eax
	retq
.Lfunc_end8:
	.size	mpifinalize, .Lfunc_end8-mpifinalize
	.cfi_endproc
                                        # -- End function
	.globl	mpiinit                         # -- Begin function mpiinit
	.p2align	4, 0x90
	.type	mpiinit,@function
mpiinit:                                # @mpiinit
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$0, (%rdx)
	movl	$1, (%rcx)
	xorl	%eax, %eax
	retq
.Lfunc_end9:
	.size	mpiinit, .Lfunc_end9-mpiinit
	.cfi_endproc
                                        # -- End function
	.globl	getxyz                          # -- Begin function getxyz
	.p2align	4, 0x90
	.type	getxyz,@function
getxyz:                                 # @getxyz
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movzbl	dim(%rip), %ecx
	addl	$3, %ecx
	callq	getxyzw
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end10:
	.size	getxyz, .Lfunc_end10-getxyz
	.cfi_endproc
                                        # -- End function
	.globl	getxyzw                         # -- Begin function getxyzw
	.p2align	4, 0x90
	.type	getxyzw,@function
getxyzw:                                # @getxyzw
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
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%ecx, %ebx
	movq	%rdx, 8(%rsp)                   # 8-byte Spill
	movq	%rsi, %r15
	movq	(%rdi), %r12
	testq	%r12, %r12
	je	.LBB11_2
# %bb.1:                                # %lor.lhs.false
	cmpb	$0, (%r12)
	je	.LBB11_2
# %bb.3:                                # %if.else
	movq	%rdi, %r13
	movl	$.L.str, %esi
	movq	%r12, %rdi
	callq	strcmp@PLT
	testl	%eax, %eax
	je	.LBB11_2
# %bb.4:                                # %if.else4
	movl	$.L.str.1, %esi
	movq	%r12, %rdi
	callq	fopen@PLT
	movq	%rax, %r14
	testq	%rax, %rax
	jne	.LBB11_5
# %bb.14:                               # %if.then.i.i
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	(%r13), %rdx
	movl	$.L.str.2, %esi
	xorl	%eax, %eax
	callq	fprintf@PLT
	movl	$1, %edi
	callq	exit@PLT
.LBB11_2:                               # %if.then
	movq	stdin@GOTPCREL(%rip), %rax
	movq	(%rax), %r14
.LBB11_5:                               # %if.end18
	leaq	48(%rsp), %r13
	movq	%r13, %rdi
	movl	$82, %esi
	movq	%r14, %rdx
	callq	ggets@PLT
	movl	$.L.str.3, %esi
	movq	%r13, %rdi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	__isoc99_sscanf@PLT
	movq	%r13, %rdi
	movl	$82, %esi
	movq	%r14, (%rsp)                    # 8-byte Spill
	movq	%r14, %rdx
	callq	ggets@PLT
	movl	(%r15), %eax
	imull	%ebx, %eax
	testl	%eax, %eax
	jle	.LBB11_11
# %bb.6:                                # %for.body.lr.ph
	leal	-1(%rbx), %r14d
	xorl	%r13d, %r13d
	leaq	16(%rsp), %rbp
	jmp	.LBB11_7
	.p2align	4, 0x90
.LBB11_10:                              # %for.inc
                                        #   in Loop: Header=BB11_7 Depth=1
	incq	%r13
	imull	%ebx, %eax
	cltq
	cmpq	%rax, %r13
	jge	.LBB11_11
.LBB11_7:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	%r13d, %eax
	cltd
	idivl	%ebx
	movl	%edx, %r12d
	leal	(,%r12,4), %eax
	leal	(%rax,%rax,4), %eax
	leaq	(%rsp,%rax), %rsi
	addq	$48, %rsi
	movl	$20, %edx
	movq	%rbp, %rdi
	callq	strncpy@PLT
	movb	$0, 36(%rsp)
	movq	%rbp, %rdi
	xorl	%esi, %esi
	callq	strtod@PLT
	movq	8(%rsp), %rax                   # 8-byte Reload
	movsd	%xmm0, (%rax,%r13,8)
	movl	(%r15), %eax
	cmpl	%r14d, %r12d
	jne	.LBB11_10
# %bb.8:                                # %land.lhs.true
                                        #   in Loop: Header=BB11_7 Depth=1
	movl	%eax, %ecx
	imull	%ebx, %ecx
	decl	%ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, %r13
	jge	.LBB11_10
# %bb.9:                                # %if.then37
                                        #   in Loop: Header=BB11_7 Depth=1
	leaq	48(%rsp), %rdi
	movl	$82, %esi
	movq	(%rsp), %rdx                    # 8-byte Reload
	callq	ggets@PLT
	movl	(%r15), %eax
	jmp	.LBB11_10
.LBB11_11:                              # %for.end
	movq	stdin@GOTPCREL(%rip), %rax
	movq	(%rsp), %rdi                    # 8-byte Reload
	cmpq	(%rax), %rdi
	je	.LBB11_13
# %bb.12:                               # %if.then42
	callq	fclose@PLT
.LBB11_13:                              # %if.end48
	xorl	%eax, %eax
	addq	$136, %rsp
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
.Lfunc_end11:
	.size	getxyzw, .Lfunc_end11-getxyzw
	.cfi_endproc
                                        # -- End function
	.globl	putxyz                          # -- Begin function putxyz
	.p2align	4, 0x90
	.type	putxyz,@function
putxyz:                                 # @putxyz
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movzbl	dim(%rip), %ecx
	addl	$3, %ecx
	callq	putxyzw
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end12:
	.size	putxyz, .Lfunc_end12-putxyz
	.cfi_endproc
                                        # -- End function
	.globl	putxyzw                         # -- Begin function putxyzw
	.p2align	4, 0x90
	.type	putxyzw,@function
putxyzw:                                # @putxyzw
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
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%ecx, %ebp
	movq	%rdx, %rbx
	movq	%rsi, %r14
	movq	%rdi, %r12
	movq	(%rdi), %r15
	movl	$.L.str, %esi
	movq	%r15, %rdi
	callq	strcmp@PLT
	testl	%eax, %eax
	je	.LBB13_1
# %bb.2:                                # %if.else
	movl	$.L.str.4, %esi
	movq	%r15, %rdi
	callq	fopen@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.LBB13_3
# %bb.12:                               # %if.then.i.i
	movq	(%r12), %rdx
	movl	$.L.str.5, %esi
	movl	$1, %edi
	callq	rt_errormsg_s@PLT
	movl	$1, %edi
	callq	exit@PLT
.LBB13_1:                               # %if.then2
	movq	stdout@GOTPCREL(%rip), %rax
	movq	(%rax), %r15
.LBB13_3:                               # %if.then9
	movl	(%r14), %edx
	movl	$.L.str.6, %esi
	movq	%r15, %rdi
	xorl	%eax, %eax
	callq	fprintf@PLT
	movl	(%r14), %eax
	imull	%ebp, %eax
	testl	%eax, %eax
	jle	.LBB13_9
# %bb.4:                                # %for.body.lr.ph
	cmpl	$3, %ebp
	jne	.LBB13_7
# %bb.5:                                # %for.body.us.preheader
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB13_6:                               # %for.body.us
                                        # =>This Inner Loop Header: Depth=1
	movsd	(%rbx,%r12,8), %xmm0            # xmm0 = mem[0],zero
	movsd	8(%rbx,%r12,8), %xmm1           # xmm1 = mem[0],zero
	movsd	16(%rbx,%r12,8), %xmm2          # xmm2 = mem[0],zero
	movl	$.L.str.7, %esi
	movq	%r15, %rdi
	movb	$3, %al
	callq	fprintf@PLT
	addq	$3, %r12
	movslq	(%r14), %rax
	leaq	(%rax,%rax,2), %rax
	cmpq	%rax, %r12
	jl	.LBB13_6
	jmp	.LBB13_9
.LBB13_7:                               # %for.body.preheader
	movslq	%ebp, %r12
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB13_8:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movsd	(%rbx,%r13,8), %xmm0            # xmm0 = mem[0],zero
	movsd	8(%rbx,%r13,8), %xmm1           # xmm1 = mem[0],zero
	movsd	16(%rbx,%r13,8), %xmm2          # xmm2 = mem[0],zero
	movsd	24(%rbx,%r13,8), %xmm3          # xmm3 = mem[0],zero
	movl	$.L.str.8, %esi
	movq	%r15, %rdi
	movb	$4, %al
	callq	fprintf@PLT
	addq	%r12, %r13
	movslq	(%r14), %rax
	imulq	%r12, %rax
	cmpq	%rax, %r13
	jl	.LBB13_8
.LBB13_9:                               # %for.end
	movq	stdout@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	je	.LBB13_11
# %bb.10:                               # %if.then36
	movq	%r15, %rdi
	callq	fclose@PLT
.LBB13_11:                              # %reducerror.exit
	xorl	%eax, %eax
	addq	$8, %rsp
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
.Lfunc_end13:
	.size	putxyzw, .Lfunc_end13-putxyzw
	.cfi_endproc
                                        # -- End function
	.globl	strindex                        # -- Begin function strindex
	.p2align	4, 0x90
	.type	strindex,@function
strindex:                               # @strindex
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$-1, %eax
	cmpb	$0, (%rdi)
	je	.LBB14_8
# %bb.1:                                # %for.cond2.preheader.lr.ph
	movzbl	(%rsi), %ecx
	testb	%cl, %cl
	je	.LBB14_8
# %bb.2:                                # %for.cond2.preheader.preheader
	xorl	%edx, %edx
	movq	%rdi, %r8
.LBB14_3:                               # %for.cond2.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB14_4 Depth 2
	xorl	%r9d, %r9d
	movl	%ecx, %r10d
	.p2align	4, 0x90
.LBB14_4:                               # %land.rhs
                                        #   Parent Loop BB14_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	%r10b, (%r8,%r9)
	jne	.LBB14_7
# %bb.5:                                # %for.inc
                                        #   in Loop: Header=BB14_4 Depth=2
	movzbl	1(%rsi,%r9), %r10d
	incq	%r9
	testb	%r10b, %r10b
	jne	.LBB14_4
	jmp	.LBB14_6
	.p2align	4, 0x90
.LBB14_7:                               # %for.inc25
                                        #   in Loop: Header=BB14_3 Depth=1
	incq	%r8
	cmpb	$0, 1(%rdi,%rdx)
	leaq	1(%rdx), %rdx
	jne	.LBB14_3
.LBB14_8:                               # %cleanup
	retq
.LBB14_6:                               # %cleanup.loopexit22
	movl	%edx, %eax
	retq
.Lfunc_end14:
	.size	strindex, .Lfunc_end14-strindex
	.cfi_endproc
                                        # -- End function
	.globl	getxv                           # -- Begin function getxv
	.p2align	4, 0x90
	.type	getxv,@function
getxv:                                  # @getxv
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
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r8, 8(%rsp)                    # 8-byte Spill
	movq	%rcx, %r12
	movq	%rdx, %r13
	movq	%rsi, %r15
	movq	(%rdi), %r14
	testq	%r14, %r14
	je	.LBB15_2
# %bb.1:                                # %lor.lhs.false
	cmpb	$0, (%r14)
	je	.LBB15_2
# %bb.3:                                # %if.else
	movq	%rdi, %rbp
	movl	$.L.str, %esi
	movq	%r14, %rdi
	callq	strcmp@PLT
	testl	%eax, %eax
	je	.LBB15_2
# %bb.4:                                # %if.else4
	movl	$.L.str.1, %esi
	movq	%r14, %rdi
	callq	fopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.LBB15_5
# %bb.23:                               # %if.then.i.i
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	(%rbp), %rdx
	movl	$.L.str.9, %esi
	xorl	%eax, %eax
	callq	fprintf@PLT
	movl	$1, %edi
	callq	exit@PLT
.LBB15_2:                               # %if.then
	movq	stdin@GOTPCREL(%rip), %rax
	movq	(%rax), %rbx
.LBB15_5:                               # %if.end18
	leaq	32(%rsp), %rbp
	movq	%rbp, %rdi
	movl	$82, %esi
	movq	%rbx, %rdx
	callq	ggets@PLT
	movq	%rbp, %rdi
	movl	$82, %esi
	movq	%rbx, %rdx
	callq	ggets@PLT
	movq	$0, (%r13)
	xorl	%r14d, %r14d
	movl	$.L.str.10, %esi
	movq	%rbp, %rdi
	movq	%r15, %rdx
	movq	%r13, %rcx
	xorl	%eax, %eax
	callq	__isoc99_sscanf@PLT
	movq	%rbp, %rdi
	movl	$82, %esi
	movq	%rbx, (%rsp)                    # 8-byte Spill
	movq	%rbx, %rdx
	callq	ggets@PLT
	cmpl	$0, (%r15)
	jle	.LBB15_11
# %bb.6:                                # %for.body.lr.ph
	leaq	19(%rsp), %r13
	xorl	%ebp, %ebp
	jmp	.LBB15_7
	.p2align	4, 0x90
.LBB15_10:                              # %for.inc
                                        #   in Loop: Header=BB15_7 Depth=1
	incq	%rbp
	movslq	(%r15), %rax
	leaq	(%rax,%rax,2), %rax
	addl	$12, %r14d
	cmpq	%rax, %rbp
	jge	.LBB15_11
.LBB15_7:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbp, %rax
	movabsq	$-6148914691236517205, %rcx     # imm = 0xAAAAAAAAAAAAAAAB
	mulq	%rcx
	shrq	$2, %rdx
	leal	(%rdx,%rdx,2), %eax
	leal	5(,%rax,2), %ebx
	movl	%ebp, %eax
	movl	$2863311531, %ecx               # imm = 0xAAAAAAAB
	imulq	%rcx, %rax
	shrq	$34, %rax
	shll	$3, %eax
	leal	(%rax,%rax,8), %eax
	movl	%r14d, %ecx
	subl	%eax, %ecx
	leaq	(%rsp,%rcx), %rsi
	addq	$32, %rsi
	movl	$12, %edx
	movq	%r13, %rdi
	callq	strncpy@PLT
	movb	$0, 31(%rsp)
	movq	%r13, %rdi
	xorl	%esi, %esi
	callq	strtod@PLT
	movsd	%xmm0, (%r12,%rbp,8)
	cmpl	%ebp, %ebx
	jne	.LBB15_10
# %bb.8:                                # %land.lhs.true
                                        #   in Loop: Header=BB15_7 Depth=1
	movslq	(%r15), %rax
	leaq	(%rax,%rax,2), %rax
	decq	%rax
	cmpq	%rax, %rbp
	jge	.LBB15_10
# %bb.9:                                # %if.then38
                                        #   in Loop: Header=BB15_7 Depth=1
	leaq	32(%rsp), %rdi
	movl	$82, %esi
	movq	(%rsp), %rdx                    # 8-byte Reload
	callq	ggets@PLT
	jmp	.LBB15_10
.LBB15_11:                              # %for.end
	leaq	32(%rsp), %rdi
	movl	$82, %esi
	movq	(%rsp), %rdx                    # 8-byte Reload
	callq	ggets@PLT
	movl	(%r15), %ecx
	testq	%rax, %rax
	je	.LBB15_17
# %bb.12:                               # %for.cond46.preheader
	testl	%ecx, %ecx
	jle	.LBB15_20
# %bb.13:                               # %for.body49.lr.ph
	xorl	%ebx, %ebx
	movl	$2863311531, %r14d              # imm = 0xAAAAAAAB
	leaq	19(%rsp), %r12
	xorl	%ebp, %ebp
	jmp	.LBB15_14
	.p2align	4, 0x90
.LBB15_16:                              # %for.inc68
                                        #   in Loop: Header=BB15_14 Depth=1
	incq	%rbp
	movslq	(%r15), %rax
	leaq	(%rax,%rax,2), %rax
	addl	$12, %ebx
	cmpq	%rax, %rbp
	jge	.LBB15_20
.LBB15_14:                              # %for.body49
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbp, %rax
	movabsq	$-6148914691236517205, %rcx     # imm = 0xAAAAAAAAAAAAAAAB
	mulq	%rcx
	shrq	$2, %rdx
	leal	(%rdx,%rdx,2), %eax
	leal	5(,%rax,2), %r13d
	movl	%ebp, %eax
	imulq	%r14, %rax
	shrq	$34, %rax
	shll	$3, %eax
	leal	(%rax,%rax,8), %eax
	movl	%ebx, %ecx
	subl	%eax, %ecx
	leaq	(%rsp,%rcx), %rsi
	addq	$32, %rsi
	movl	$12, %edx
	movq	%r12, %rdi
	callq	strncpy@PLT
	movb	$0, 31(%rsp)
	movq	%r12, %rdi
	xorl	%esi, %esi
	callq	strtod@PLT
	movq	8(%rsp), %rax                   # 8-byte Reload
	movsd	%xmm0, (%rax,%rbp,8)
	cmpl	%ebp, %r13d
	jne	.LBB15_16
# %bb.15:                               # %if.then64
                                        #   in Loop: Header=BB15_14 Depth=1
	leaq	32(%rsp), %rdi
	movl	$82, %esi
	movq	(%rsp), %rdx                    # 8-byte Reload
	callq	ggets@PLT
	jmp	.LBB15_16
.LBB15_17:                              # %for.cond72.preheader
	testl	%ecx, %ecx
	jle	.LBB15_19
# %bb.18:                               # %for.body75.preheader
	leal	(%rcx,%rcx,2), %eax
	cmpl	$2, %eax
	movl	$1, %edx
	cmovgel	%eax, %edx
	shlq	$3, %rdx
	movq	8(%rsp), %rdi                   # 8-byte Reload
	xorl	%esi, %esi
	callq	memset@PLT
.LBB15_19:                              # %for.end80
	movq	nabout@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movl	$.L.str.11, %edi
	movl	$25, %esi
	movl	$1, %edx
	callq	fwrite@PLT
.LBB15_20:                              # %if.end82
	movq	stdin@GOTPCREL(%rip), %rax
	movq	(%rsp), %rdi                    # 8-byte Reload
	cmpq	(%rax), %rdi
	je	.LBB15_22
# %bb.21:                               # %if.then84
	callq	fclose@PLT
.LBB15_22:                              # %if.end90
	xorl	%eax, %eax
	addq	$120, %rsp
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
.Lfunc_end15:
	.size	getxv, .Lfunc_end15-getxv
	.cfi_endproc
                                        # -- End function
	.globl	putxv                           # -- Begin function putxv
	.p2align	4, 0x90
	.type	putxv,@function
putxv:                                  # @putxv
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
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r9, %rbx
	movq	%r8, %r12
	movq	%rcx, (%rsp)                    # 8-byte Spill
	movq	%rdx, %r14
	movq	%rsi, %rbp
	movq	%rdi, %r13
	movq	(%rdi), %r15
	movl	$.L.str, %esi
	movq	%r15, %rdi
	callq	strcmp@PLT
	testl	%eax, %eax
	je	.LBB16_1
# %bb.2:                                # %if.else
	movl	$.L.str.4, %esi
	movq	%r15, %rdi
	callq	fopen@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.LBB16_3
# %bb.18:                               # %if.then.i.i
	movq	(%r13), %rdx
	movl	$.L.str.5, %esi
	movl	$1, %edi
	callq	rt_errormsg_s@PLT
	movl	$1, %edi
	callq	exit@PLT
.LBB16_1:                               # %if.then2
	movq	stdout@GOTPCREL(%rip), %rax
	movq	(%rax), %r15
.LBB16_3:                               # %if.then9
	movq	(%rbp), %rdx
	movl	$.L.str.12, %esi
	movq	%r15, %rdi
	xorl	%eax, %eax
	callq	fprintf@PLT
	movl	(%r14), %edx
	movq	(%rsp), %rax                    # 8-byte Reload
	movsd	(%rax), %xmm0                   # xmm0 = mem[0],zero
	movl	$.L.str.13, %esi
	movq	%r15, %rdi
	movb	$1, %al
	callq	fprintf@PLT
	movl	(%r14), %eax
	testl	%eax, %eax
	jle	.LBB16_15
# %bb.4:                                # %for.body.preheader
	leal	(%rax,%rax,2), %eax
	movl	$3, %r13d
	jmp	.LBB16_5
	.p2align	4, 0x90
.LBB16_11:                              # %if.else32
                                        #   in Loop: Header=BB16_5 Depth=1
	movl	$.L.str.15, %esi
	movq	%r15, %rdi
	movb	$3, %al
	callq	fprintf@PLT
.LBB16_12:                              # %for.inc
                                        #   in Loop: Header=BB16_5 Depth=1
	movl	(%r14), %ecx
	leal	(%rcx,%rcx,2), %eax
	addq	$6, %r13
	leal	-3(%r13), %edx
	cmpl	%edx, %eax
	jle	.LBB16_7
.LBB16_5:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	cltq
	movsd	-24(%r12,%r13,8), %xmm0         # xmm0 = mem[0],zero
	movsd	-16(%r12,%r13,8), %xmm1         # xmm1 = mem[0],zero
	movsd	-8(%r12,%r13,8), %xmm2          # xmm2 = mem[0],zero
	cmpq	%rax, %r13
	jge	.LBB16_11
# %bb.6:                                # %if.then15
                                        #   in Loop: Header=BB16_5 Depth=1
	movsd	(%r12,%r13,8), %xmm3            # xmm3 = mem[0],zero
	movsd	8(%r12,%r13,8), %xmm4           # xmm4 = mem[0],zero
	movsd	16(%r12,%r13,8), %xmm5          # xmm5 = mem[0],zero
	movl	$.L.str.14, %esi
	movq	%r15, %rdi
	movb	$6, %al
	callq	fprintf@PLT
	jmp	.LBB16_12
.LBB16_7:                               # %for.cond44.preheader
	testl	%ecx, %ecx
	jle	.LBB16_15
# %bb.8:                                # %for.body47.preheader
	leal	(%rcx,%rcx,2), %eax
	movl	$3, %r12d
	jmp	.LBB16_9
	.p2align	4, 0x90
.LBB16_13:                              # %if.else70
                                        #   in Loop: Header=BB16_9 Depth=1
	movl	$.L.str.15, %esi
	movq	%r15, %rdi
	movb	$3, %al
	callq	fprintf@PLT
.LBB16_14:                              # %for.inc81
                                        #   in Loop: Header=BB16_9 Depth=1
	movl	(%r14), %eax
	leal	(%rax,%rax,2), %eax
	addq	$6, %r12
	leal	-3(%r12), %ecx
	cmpl	%ecx, %eax
	jle	.LBB16_15
.LBB16_9:                               # %for.body47
                                        # =>This Inner Loop Header: Depth=1
	cltq
	movsd	-24(%rbx,%r12,8), %xmm0         # xmm0 = mem[0],zero
	movsd	-16(%rbx,%r12,8), %xmm1         # xmm1 = mem[0],zero
	movsd	-8(%rbx,%r12,8), %xmm2          # xmm2 = mem[0],zero
	cmpq	%rax, %r12
	jge	.LBB16_13
# %bb.10:                               # %if.then51
                                        #   in Loop: Header=BB16_9 Depth=1
	movsd	(%rbx,%r12,8), %xmm3            # xmm3 = mem[0],zero
	movsd	8(%rbx,%r12,8), %xmm4           # xmm4 = mem[0],zero
	movsd	16(%rbx,%r12,8), %xmm5          # xmm5 = mem[0],zero
	movl	$.L.str.14, %esi
	movq	%r15, %rdi
	movb	$6, %al
	callq	fprintf@PLT
	jmp	.LBB16_14
.LBB16_15:                              # %for.end83
	movq	stdout@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	je	.LBB16_17
# %bb.16:                               # %if.then85
	movq	%r15, %rdi
	callq	fclose@PLT
.LBB16_17:                              # %reducerror.exit
	xorl	%eax, %eax
	addq	$8, %rsp
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
.Lfunc_end16:
	.size	putxv, .Lfunc_end16-putxv
	.cfi_endproc
                                        # -- End function
	.globl	checkpoint                      # -- Begin function checkpoint
	.p2align	4, 0x90
	.type	checkpoint,@function
checkpoint:                             # @checkpoint
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%esi, 20(%rsp)
	testl	%ecx, %ecx
	js	.LBB17_12
# %bb.1:                                # %do.body.preheader
	movl	%ecx, %ebx
	movq	%rdi, %r12
	movq	%rdx, 24(%rsp)                  # 8-byte Spill
	xorl	%r15d, %r15d
	movl	$3435973837, %eax               # imm = 0xCCCCCCCD
	.p2align	4, 0x90
.LBB17_2:                               # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movl	%ecx, %edx
	imulq	%rax, %rdx
	shrq	$35, %rdx
	incq	%r15
	cmpl	$9, %ecx
	movl	%edx, %ecx
	ja	.LBB17_2
# %bb.3:                                # %do.end
	leaq	1(%r15), %rdi
	callq	malloc@PLT
	movl	$.L.str.3, %esi
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	movq	%rax, %rdi
	movl	%ebx, %edx
	xorl	%eax, %eax
	callq	sprintf@PLT
	movq	%r12, %rdi
	callq	strlen@PLT
	cmpb	$0, (%r12)
	je	.LBB17_10
# %bb.4:                                # %for.cond2.preheader.i.preheader
	movq	%rax, %rcx
	shlq	$32, %rcx
	movabsq	$-8589934592, %rbp              # imm = 0xFFFFFFFE00000000
	addq	%rcx, %rbp
	xorl	%ebx, %ebx
	movabsq	$-4294967296, %rdx              # imm = 0xFFFFFFFF00000000
	movl	%r15d, %r13d
	jmp	.LBB17_5
	.p2align	4, 0x90
.LBB17_9:                               # %for.inc25.i
                                        #   in Loop: Header=BB17_5 Depth=1
	addq	%rdx, %rbp
	incl	%r13d
	incq	%rbx
	testb	%cl, %cl
	je	.LBB17_10
.LBB17_5:                               # %for.cond2.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	movzbl	1(%r12,%rbx), %ecx
	cmpb	$37, (%r12,%rbx)
	jne	.LBB17_9
# %bb.6:                                # %for.cond2.preheader.i
                                        #   in Loop: Header=BB17_5 Depth=1
	cmpb	$100, %cl
	jne	.LBB17_9
# %bb.7:                                # %for.inc.i.1
	testl	%ebx, %ebx
	js	.LBB17_10
# %bb.8:                                # %if.else
	leal	(%rax,%r15), %ecx
	decl	%ecx
	movslq	%ecx, %rdi
	movq	%rax, 48(%rsp)                  # 8-byte Spill
	callq	malloc@PLT
	movq	%rax, %r14
	movq	%rax, 32(%rsp)
	movl	%ebx, %edx
	movq	%rdx, 40(%rsp)                  # 8-byte Spill
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	strncpy@PLT
	movq	40(%rsp), %rdi                  # 8-byte Reload
	addq	%r14, %rdi
	movq	8(%rsp), %rsi                   # 8-byte Reload
	movq	%r15, %rdx
	callq	strncpy@PLT
	movslq	%r13d, %rdi
	addq	%r14, %rdi
	addl	$2, %ebx
	addq	%r12, %rbx
	sarq	$32, %rbp
	movq	%rbx, %rsi
	movq	8(%rsp), %rbx                   # 8-byte Reload
	movq	%rbp, %rdx
	callq	strncpy@PLT
	movq	48(%rsp), %rax                  # 8-byte Reload
	leal	(%rax,%r15), %ebp
	addl	$-2, %ebp
	jmp	.LBB17_11
.LBB17_10:                              # %if.then8
	leal	(%rax,%r15), %ebp
	leal	(%rax,%r15), %ecx
	incl	%ecx
	movslq	%ecx, %rdi
	movq	%rax, %rbx
	callq	malloc@PLT
	movq	%rax, %r14
	movq	%rax, 32(%rsp)
	movslq	%ebx, %rbx
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	strncpy@PLT
	movq	%r14, %rdi
	addq	%rbx, %rdi
	movq	8(%rsp), %rbx                   # 8-byte Reload
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	strncpy@PLT
.LBB17_11:                              # %if.end43
	movq	24(%rsp), %rdx                  # 8-byte Reload
	movslq	%ebp, %rax
	movb	$0, (%r14,%rax)
	movzbl	dim(%rip), %ecx
	addl	$3, %ecx
	leaq	32(%rsp), %rdi
	leaq	20(%rsp), %rsi
	callq	putxyzw
	movq	%r14, %rdi
	callq	free@PLT
	movq	%rbx, %rdi
	addq	$56, %rsp
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
	jmp	free@PLT                        # TAILCALL
.LBB17_12:                              # %cleanup
	.cfi_def_cfa_offset 112
	addq	$56, %rsp
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
.Lfunc_end17:
	.size	checkpoint, .Lfunc_end17-checkpoint
	.cfi_endproc
                                        # -- End function
	.globl	mme_timer                       # -- Begin function mme_timer
	.p2align	4, 0x90
	.type	mme_timer,@function
mme_timer:                              # @mme_timer
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	nabout@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rcx
	movl	$.L.str.16, %edi
	movl	$34, %esi
	movl	$1, %edx
	callq	fwrite@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.17, %esi
	xorps	%xmm0, %xmm0
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.18, %esi
	xorps	%xmm0, %xmm0
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.19, %esi
	xorps	%xmm0, %xmm0
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.20, %esi
	xorps	%xmm0, %xmm0
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.21, %esi
	xorps	%xmm0, %xmm0
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.22, %esi
	xorps	%xmm0, %xmm0
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.23, %esi
	xorps	%xmm0, %xmm0
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.24, %esi
	xorps	%xmm0, %xmm0
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.25, %esi
	xorps	%xmm0, %xmm0
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.26, %esi
	xorps	%xmm0, %xmm0
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.27, %esi
	xorps	%xmm0, %xmm0
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	callq	fflush@PLT
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end18:
	.size	mme_timer, .Lfunc_end18-mme_timer
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function mme_init
.LCPI19_0:
	.quad	0x400745e353f7ced9              # double 2.909125
.LCPI19_1:
	.quad	0x3fe999999999999a              # double 0.80000000000000004
.LCPI19_2:
	.quad	0x4013666666666666              # double 4.8499999999999996
.LCPI19_3:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	mme_init
	.p2align	4, 0x90
	.type	mme_init,@function
mme_init:                               # @mme_init
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %r12
	movq	%rsi, %r14
	movq	%rdi, %r15
	movb	$0, dim(%rip)
	movq	128(%rdi), %rax
	movq	%rax, prm(%rip)
	movq	%rcx, 16(%rsp)                  # 8-byte Spill
	movq	%rcx, x0(%rip)
	movq	%r8, binposfp(%rip)
	movq	frozen(%rip), %rdi
	movl	96(%rax), %edx
	xorl	%esi, %esi
	callq	free_ivector@PLT
	movq	constrained(%rip), %rdi
	movq	prm(%rip), %rax
	movl	96(%rax), %edx
	xorl	%esi, %esi
	callq	free_ivector@PLT
	movq	prm(%rip), %rax
	movl	96(%rax), %esi
	xorl	%edi, %edi
	callq	ivector@PLT
	movq	%rax, frozen(%rip)
	movq	prm(%rip), %rax
	movl	96(%rax), %esi
	xorl	%edi, %edi
	callq	ivector@PLT
	movq	%rax, constrained(%rip)
	movq	binposfp(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB19_2
# %bb.1:                                # %if.then631
	callq	writebinposhdr@PLT
	movq	constrained(%rip), %rax
.LBB19_2:                               # %if.end633
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	callq	set_cons_mask@PLT
	movl	%eax, nconstrained(%rip)
	testl	%eax, %eax
	je	.LBB19_6
# %bb.3:                                # %if.then635
	movq	nabout@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rdi
	testq	%r12, %r12
	je	.LBB19_4
# %bb.5:                                # %if.then647
	movl	$.L.str.53, %esi
	movl	%eax, %edx
	movq	%r12, %rcx
	xorl	%eax, %eax
	callq	fprintf@PLT
	jmp	.LBB19_6
.LBB19_4:                               # %if.then641
	movl	$.L.str.52, %esi
	movl	%eax, %edx
	xorl	%eax, %eax
	callq	fprintf@PLT
.LBB19_6:                               # %if.end651
	movl	gb(%rip), %eax
	cmpl	$2, %eax
	je	.LBB19_7
# %bb.8:                                # %if.end651
	cmpl	$5, %eax
	jne	.LBB19_11
# %bb.9:                                # %if.then658
	movsd	.LCPI19_2(%rip), %xmm0          # xmm0 = mem[0],zero
	movsd	.LCPI19_1(%rip), %xmm1          # xmm1 = mem[0],zero
	movsd	.LCPI19_3(%rip), %xmm2          # xmm2 = mem[0],zero
	jmp	.LBB19_10
.LBB19_7:
	movsd	.LCPI19_0(%rip), %xmm0          # xmm0 = mem[0],zero
	xorps	%xmm1, %xmm1
	movsd	.LCPI19_1(%rip), %xmm2          # xmm2 = mem[0],zero
.LBB19_10:                              # %if.end660.sink.split
	movsd	%xmm2, gbalpha(%rip)
	movsd	%xmm1, gbbeta(%rip)
	movsd	%xmm0, gbgamma(%rip)
.LBB19_11:                              # %if.end660
	movq	pairlistnp(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB19_17
# %bb.12:                               # %for.cond664.preheader
	cmpl	$0, mme_init.nold(%rip)
	jle	.LBB19_16
# %bb.13:                               # %for.body667.preheader
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB19_14:                              # %for.body667
                                        # =>This Inner Loop Header: Depth=1
	movq	pairlistnp(%rip), %rax
	movq	(%rax,%r12,8), %rdi
	xorl	%esi, %esi
	movl	$1, %edx
	callq	free_ivector@PLT
	incq	%r12
	movslq	mme_init.nold(%rip), %rax
	cmpq	%rax, %r12
	jl	.LBB19_14
# %bb.15:                               # %for.end672.loopexit
	movq	pairlistnp(%rip), %rdi
.LBB19_16:                              # %for.end672
	callq	free@PLT
.LBB19_17:                              # %if.end673
	movq	upairsnp(%rip), %rdi
	movq	prm(%rip), %rax
	movl	96(%rax), %edx
	xorl	%r13d, %r13d
	xorl	%esi, %esi
	callq	free_ivector@PLT
	movq	lpairsnp(%rip), %rdi
	movq	prm(%rip), %rax
	movl	96(%rax), %edx
	xorl	%esi, %esi
	callq	free_ivector@PLT
	movq	prm(%rip), %rax
	movl	96(%rax), %esi
	xorl	%edi, %edi
	callq	ivector@PLT
	movq	%rax, upairsnp(%rip)
	movq	prm(%rip), %rax
	movl	96(%rax), %esi
	xorl	%edi, %edi
	callq	ivector@PLT
	movq	%rax, %r12
	movq	%rax, lpairsnp(%rip)
	movq	prm(%rip), %rbp
	movslq	96(%rbp), %rbx
	leaq	(,%rbx,8), %rdi
	callq	malloc@PLT
	movq	%rax, pairlistnp(%rip)
	testq	%rax, %rax
	je	.LBB19_81
# %bb.18:                               # %for.cond691.preheader
	testl	%ebx, %ebx
	jle	.LBB19_21
# %bb.19:                               # %for.body695.lr.ph
	movq	upairsnp(%rip), %rcx
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB19_20:                              # %for.body695
                                        # =>This Inner Loop Header: Depth=1
	movq	$0, (%rax,%r13,8)
	movl	$0, (%rcx,%r13,4)
	movl	$0, (%r12,%r13,4)
	incq	%r13
	movslq	96(%rbp), %rdx
	cmpq	%rdx, %r13
	jl	.LBB19_20
.LBB19_21:                              # %for.end704
	movl	%r13d, 12(%rsp)
	movq	pairlist2np(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB19_28
# %bb.22:                               # %for.cond708.preheader
	cmpl	$0, mme_init.nold(%rip)
	jle	.LBB19_23
# %bb.24:                               # %for.body711.preheader
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB19_25:                              # %for.body711
                                        # =>This Inner Loop Header: Depth=1
	movq	pairlist2np(%rip), %rax
	movq	(%rax,%r12,8), %rdi
	xorl	%esi, %esi
	movl	$1, %edx
	callq	free_ivector@PLT
	incq	%r12
	movslq	mme_init.nold(%rip), %rax
	cmpq	%rax, %r12
	jl	.LBB19_25
# %bb.26:                               # %for.end716.loopexit
	movq	pairlist2np(%rip), %rdi
	jmp	.LBB19_27
.LBB19_23:
	xorl	%r12d, %r12d
.LBB19_27:                              # %for.end716
	movl	%r12d, 12(%rsp)
	callq	free@PLT
.LBB19_28:                              # %if.end717
	movq	upairs2np(%rip), %rdi
	movq	prm(%rip), %rax
	movl	96(%rax), %edx
	xorl	%esi, %esi
	callq	free_ivector@PLT
	movq	lpairs2np(%rip), %rdi
	movq	prm(%rip), %rax
	movl	96(%rax), %edx
	xorl	%esi, %esi
	callq	free_ivector@PLT
	movq	prm(%rip), %rax
	movl	96(%rax), %esi
	xorl	%edi, %edi
	callq	ivector@PLT
	movq	%rax, upairs2np(%rip)
	movq	prm(%rip), %rax
	movl	96(%rax), %esi
	xorl	%edi, %edi
	callq	ivector@PLT
	movq	%rax, %r12
	movq	%rax, lpairs2np(%rip)
	movq	prm(%rip), %r13
	movslq	96(%r13), %rbx
	leaq	(,%rbx,8), %rdi
	callq	malloc@PLT
	movq	%rax, pairlist2np(%rip)
	testq	%rax, %rax
	je	.LBB19_35
# %bb.29:                               # %for.cond735.preheader
	testl	%ebx, %ebx
	jle	.LBB19_32
# %bb.30:                               # %for.body739.lr.ph
	movq	upairs2np(%rip), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB19_31:                              # %for.body739
                                        # =>This Inner Loop Header: Depth=1
	movq	$0, (%rax,%rdx,8)
	movl	$0, (%rcx,%rdx,4)
	movl	$0, (%r12,%rdx,4)
	incq	%rdx
	movslq	96(%r13), %rsi
	cmpq	%rsi, %rdx
	jl	.LBB19_31
.LBB19_32:                              # %for.end748
	movq	pairlist(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB19_42
# %bb.33:                               # %for.cond752.preheader
	cmpl	$0, mme_init.nold(%rip)
	jle	.LBB19_34
# %bb.38:                               # %for.body755.preheader
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB19_39:                              # %for.body755
                                        # =>This Inner Loop Header: Depth=1
	movq	pairlist(%rip), %rax
	movq	(%rax,%r12,8), %rdi
	xorl	%esi, %esi
	movl	$1, %edx
	callq	free_ivector@PLT
	incq	%r12
	movslq	mme_init.nold(%rip), %rax
	cmpq	%rax, %r12
	jl	.LBB19_39
# %bb.40:                               # %for.end760.loopexit
	movq	pairlist(%rip), %rdi
	jmp	.LBB19_41
.LBB19_34:
	xorl	%r12d, %r12d
.LBB19_41:                              # %for.end760
	movl	%r12d, 12(%rsp)
	callq	free@PLT
.LBB19_42:                              # %if.end761
	movl	$-1, nb_pairs(%rip)
	movq	upairs(%rip), %rdi
	movq	prm(%rip), %rax
	movl	96(%rax), %edx
	xorl	%esi, %esi
	callq	free_ivector@PLT
	movq	lpairs(%rip), %rdi
	movq	prm(%rip), %rax
	movl	96(%rax), %edx
	xorl	%esi, %esi
	callq	free_ivector@PLT
	movq	prm(%rip), %rax
	movl	96(%rax), %esi
	xorl	%edi, %edi
	callq	ivector@PLT
	movq	%rax, upairs(%rip)
	movq	prm(%rip), %rax
	movl	96(%rax), %esi
	xorl	%edi, %edi
	callq	ivector@PLT
	movq	%rax, %r12
	movq	%rax, lpairs(%rip)
	movq	prm(%rip), %r13
	movslq	96(%r13), %rbx
	leaq	(,%rbx,8), %rdi
	callq	malloc@PLT
	movq	%rax, pairlist(%rip)
	testq	%rax, %rax
	je	.LBB19_82
# %bb.43:                               # %for.cond779.preheader
	testl	%ebx, %ebx
	jle	.LBB19_46
# %bb.44:                               # %for.body783.lr.ph
	movq	upairs(%rip), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB19_45:                              # %for.body783
                                        # =>This Inner Loop Header: Depth=1
	movq	$0, (%rax,%rdx,8)
	movl	$0, (%rcx,%rdx,4)
	movl	$0, (%r12,%rdx,4)
	incq	%rdx
	movslq	96(%r13), %rsi
	cmpq	%rsi, %rdx
	jl	.LBB19_45
.LBB19_46:                              # %for.end792
	movq	frozen(%rip), %rdx
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	set_belly_mask@PLT
	movl	%eax, nfrozen(%rip)
	testl	%eax, %eax
	je	.LBB19_48
# %bb.47:                               # %if.then798
	movq	nabout@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rdi
	movl	$.L.str.57, %esi
	movl	%eax, %edx
	movq	%r14, %rcx
	xorl	%eax, %eax
	callq	fprintf@PLT
.LBB19_48:                              # %if.end801
	movq	N14pearlist(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB19_55
# %bb.49:                               # %for.cond805.preheader
	cmpl	$0, mme_init.nold(%rip)
	jle	.LBB19_50
# %bb.51:                               # %for.body808.preheader
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB19_52:                              # %for.body808
                                        # =>This Inner Loop Header: Depth=1
	movq	N14pearlist(%rip), %rax
	movq	(%rax,%r14,8), %rdi
	xorl	%esi, %esi
	movl	$1, %edx
	callq	free_ivector@PLT
	incq	%r14
	movslq	mme_init.nold(%rip), %rax
	cmpq	%rax, %r14
	jl	.LBB19_52
# %bb.53:                               # %for.end813.loopexit
	movq	N14pearlist(%rip), %rdi
	jmp	.LBB19_54
.LBB19_50:
	xorl	%r14d, %r14d
.LBB19_54:                              # %for.end813
	movl	%r14d, 12(%rsp)
	callq	free@PLT
.LBB19_55:                              # %if.end814
	movq	prm(%rip), %rax
	movslq	96(%rax), %rdi
	shlq	$3, %rdi
	callq	malloc@PLT
	movq	%rax, N14pearlist(%rip)
	testq	%rax, %rax
	je	.LBB19_83
# %bb.56:                               # %for.cond826.preheader
	movq	prm(%rip), %rcx
	cmpl	$0, 96(%rcx)
	jle	.LBB19_64
# %bb.57:                               # %for.body830.preheader
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.LBB19_58
	.p2align	4, 0x90
.LBB19_62:                              # %for.end860
                                        #   in Loop: Header=BB19_58 Depth=1
	addl	%edi, %ebp
.LBB19_63:                              # %for.inc866
                                        #   in Loop: Header=BB19_58 Depth=1
	incq	%r14
	movq	prm(%rip), %rcx
	movslq	96(%rcx), %rdx
	cmpq	%rdx, %r14
	jge	.LBB19_64
.LBB19_58:                              # %for.body830
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB19_61 Depth 2
	movq	$0, (%rax,%r14,8)
	movq	696(%rcx), %rcx
	movl	(%rcx,%r14,4), %esi
	testl	%esi, %esi
	jle	.LBB19_63
# %bb.59:                               # %if.then837
                                        #   in Loop: Header=BB19_58 Depth=1
	xorl	%edi, %edi
	callq	ivector@PLT
	movq	%rax, %rcx
	movq	N14pearlist(%rip), %rax
	movq	%rcx, (%rax,%r14,8)
	movq	prm(%rip), %r8
	movq	696(%r8), %rdx
	movl	(%rdx,%r14,4), %edi
	testl	%edi, %edi
	jle	.LBB19_62
# %bb.60:                               # %for.body850.lr.ph
                                        #   in Loop: Header=BB19_58 Depth=1
	movslq	%ebp, %rsi
	shlq	$2, %rsi
	addq	704(%r8), %rsi
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB19_61:                              # %for.body850
                                        #   Parent Loop BB19_58 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rsi,%r8,4), %edi
	movl	%edi, (%rcx,%r8,4)
	incq	%r8
	movslq	(%rdx,%r14,4), %rdi
	cmpq	%rdi, %r8
	jl	.LBB19_61
	jmp	.LBB19_62
.LBB19_64:                              # %for.end868
	movq	IexclAt(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB19_70
# %bb.65:                               # %for.cond872.preheader
	cmpl	$0, mme_init.nold(%rip)
	jle	.LBB19_69
# %bb.66:                               # %for.body875.preheader
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB19_67:                              # %for.body875
                                        # =>This Inner Loop Header: Depth=1
	movq	IexclAt(%rip), %rax
	movq	(%rax,%r14,8), %rdi
	xorl	%esi, %esi
	movl	$1, %edx
	callq	free_ivector@PLT
	incq	%r14
	movslq	mme_init.nold(%rip), %rax
	cmpq	%rax, %r14
	jl	.LBB19_67
# %bb.68:                               # %for.end880.loopexit
	movq	IexclAt(%rip), %rdi
.LBB19_69:                              # %for.end880
	callq	free@PLT
.LBB19_70:                              # %if.end881
	movq	prm(%rip), %rax
	movslq	96(%rax), %rdi
	shlq	$3, %rdi
	callq	malloc@PLT
	movq	%rax, IexclAt(%rip)
	testq	%rax, %rax
	je	.LBB19_84
# %bb.71:                               # %for.cond893.preheader
	movq	prm(%rip), %rcx
	movl	96(%rcx), %edx
	testl	%edx, %edx
	jle	.LBB19_78
# %bb.72:                               # %for.body897.preheader
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.LBB19_73
	.p2align	4, 0x90
.LBB19_77:                              # %if.end928
                                        #   in Loop: Header=BB19_73 Depth=1
	movq	prm(%rip), %rcx
	movq	448(%rcx), %rdx
	addl	(%rdx,%r14,4), %ebp
	incq	%r14
	movslq	96(%rcx), %rdx
	cmpq	%rdx, %r14
	jge	.LBB19_78
.LBB19_73:                              # %for.body897
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB19_76 Depth 2
	movq	$0, (%rax,%r14,8)
	movq	448(%rcx), %rcx
	movl	(%rcx,%r14,4), %esi
	testl	%esi, %esi
	jle	.LBB19_77
# %bb.74:                               # %if.then904
                                        #   in Loop: Header=BB19_73 Depth=1
	xorl	%edi, %edi
	callq	ivector@PLT
	movq	%rax, %rcx
	movq	IexclAt(%rip), %rax
	movq	%rcx, (%rax,%r14,8)
	movq	prm(%rip), %rdi
	movq	448(%rdi), %rdx
	cmpl	$0, (%rdx,%r14,4)
	jle	.LBB19_77
# %bb.75:                               # %for.body917.lr.ph
                                        #   in Loop: Header=BB19_73 Depth=1
	movslq	%ebp, %rsi
	shlq	$2, %rsi
	addq	472(%rdi), %rsi
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB19_76:                              # %for.body917
                                        #   Parent Loop BB19_73 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rsi,%rdi,4), %r8d
	movl	%r8d, (%rcx,%rdi,4)
	incq	%rdi
	movslq	(%rdx,%r14,4), %r8
	cmpq	%r8, %rdi
	jl	.LBB19_76
	jmp	.LBB19_77
.LBB19_78:                              # %for.end935
	movq	$0, tdiagd(%rip)
	movq	$0, tdiag(%rip)
	movq	$0, tlevel(%rip)
	movq	$0, tnewton(%rip)
	movq	$0, tcholesky(%rip)
	movq	$0, tconjgrad(%rip)
	movq	$0, tdgeev(%rip)
	movq	$0, tmmetwo(%rip)
	movq	$0, tmmeone(%rip)
	movl	$-3, 12(%rsp)
	cmpl	mme_init.nold(%rip), %edx
	jle	.LBB19_80
# %bb.79:                               # %if.then939
	leaq	12(%rsp), %rdx
	movq	16(%rsp), %rdi                  # 8-byte Reload
	movq	%rdi, %rsi
	callq	mme34
.LBB19_80:                              # %if.end941
	movq	prm(%rip), %rax
	movl	96(%rax), %eax
	movl	%eax, mme_init.nold(%rip)
	xorl	%eax, %eax
	addq	$24, %rsp
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
.LBB19_81:                              # %if.then686
	.cfi_def_cfa_offset 80
	movq	nabout@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rcx
	movl	$.L.str.54, %edi
	movl	$47, %esi
	jmp	.LBB19_37
.LBB19_35:                              # %if.then730
	movq	nabout@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rcx
	movl	$.L.str.55, %edi
	jmp	.LBB19_36
.LBB19_82:                              # %if.then774
	movq	nabout@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rcx
	movl	$.L.str.56, %edi
	movl	$45, %esi
	jmp	.LBB19_37
.LBB19_83:                              # %if.then821
	movq	nabout@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rcx
	movl	$.L.str.58, %edi
.LBB19_36:                              # %if.then730
	movl	$48, %esi
	jmp	.LBB19_37
.LBB19_84:                              # %if.then888
	movq	nabout@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rcx
	movl	$.L.str.59, %edi
	movl	$44, %esi
.LBB19_37:                              # %if.then730
	movl	$1, %edx
	callq	fwrite@PLT
	movq	(%rbx), %rdi
	callq	fflush@PLT
	movl	$1, %edi
	callq	exit@PLT
.Lfunc_end19:
	.size	mme_init, .Lfunc_end19-mme_init
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function mme34
.LCPI20_0:
	.quad	0x4034000000000000              # double 20
.LCPI20_1:
	.quad	0x4000000000000000              # double 2
.LCPI20_2:
	.quad	0x3ff3333333333333              # double 1.2
.LCPI20_3:
	.quad	0xbfb70a3d70a3d70a              # double -0.089999999999999996
.LCPI20_4:
	.quad	0x3ff0000000000000              # double 1
.LCPI20_5:
	.quad	0x3fe0000000000000              # double 0.5
.LCPI20_6:
	.quad	0x4010000000000000              # double 4
.LCPI20_8:
	.quad	0xbfe0000000000000              # double -0.5
.LCPI20_9:
	.quad	0xbfd0000000000000              # double -0.25
.LCPI20_10:
	.quad	0x3fdd1745d1745d17              # double 0.45454545454545453
.LCPI20_11:
	.quad	0x3fdc71c71c71c71c              # double 0.44444444444444442
.LCPI20_12:
	.quad	0x3fdb6db6db6db6db              # double 0.42857142857142855
.LCPI20_13:
	.quad	0x3fd999999999999a              # double 0.40000000000000002
.LCPI20_14:
	.quad	0x3fd5555555555555              # double 0.33333333333333331
.LCPI20_15:
	.quad	0xc054000000000000              # double -80
.LCPI20_16:
	.quad	0x3f647ae147ae147c              # double 0.0025000000000000005
.LCPI20_17:
	.quad	0x3fa999999999999a              # double 0.050000000000000003
.LCPI20_18:
	.quad	0xbfc0000000000000              # double -0.125
.LCPI20_20:
	.quad	0x8000000000000000              # double -0
.LCPI20_21:
	.quad	0x4053a00000000000              # double 78.5
.LCPI20_22:
	.quad	0xc010000000000000              # double -4
.LCPI20_23:
	.quad	0x3fd0000000000000              # double 0.25
.LCPI20_24:
	.quad	0xc018000000000000              # double -6
.LCPI20_25:
	.quad	0x4028000000000000              # double 12
.LCPI20_26:
	.quad	0xc000000000000000              # double -2
.LCPI20_27:
	.quad	0x4008000000000000              # double 3
.LCPI20_28:
	.quad	0x4015d1745d1745d1              # double 5.4545454545454541
.LCPI20_29:
	.quad	0x4011c71c71c71c72              # double 4.4444444444444446
.LCPI20_30:
	.quad	0x400b6db6db6db6db              # double 3.4285714285714284
.LCPI20_31:
	.quad	0x4003333333333333              # double 2.3999999999999999
.LCPI20_32:
	.quad	0x3ff5555555555555              # double 1.3333333333333333
.LCPI20_33:
	.quad	0x3fc0000000000000              # double 0.125
.LCPI20_34:
	.quad	0xbf647ae147ae147c              # double -0.0025000000000000005
.LCPI20_35:
	.quad	0x0000000000000000              # double 0
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI20_7:
	.quad	0x7fffffffffffffff              # double NaN
	.quad	0x7fffffffffffffff              # double NaN
.LCPI20_19:
	.quad	0x8000000000000000              # double -0
	.quad	0x8000000000000000              # double -0
	.text
	.p2align	4, 0x90
	.type	mme34,@function
mme34:                                  # @mme34
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
	subq	$536, %rsp                      # imm = 0x218
	.cfi_def_cfa_offset 592
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %r14
	movq	%rsi, 448(%rsp)                 # 8-byte Spill
	movq	%rdi, %r15
	movq	prm(%rip), %rax
	movslq	96(%rax), %rbx
	movl	(%rdx), %ecx
	testl	%ecx, %ecx
	je	.LBB20_14
# %bb.1:                                # %entry
	cmpl	$-3, %ecx
	jne	.LBB20_16
# %bb.2:                                # %if.then
	movq	egb.reff(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB20_4
# %bb.3:                                # %if.then4.i
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	free_vector@PLT
	movq	$0, egb.reff(%rip)
.LBB20_4:                               # %if.end.i
	movq	egb.iexw(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB20_6
# %bb.5:                                # %if.then7.i
	leal	1(%rbx), %edx
	movl	$-1, %esi
	callq	free_ivector@PLT
	movq	$0, egb.iexw(%rip)
.LBB20_6:                               # %if.end10.i
	movq	egb.sumdeijda(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB20_8
# %bb.7:                                # %if.then13.i
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	free_vector@PLT
	movq	$0, egb.sumdeijda(%rip)
.LBB20_8:                               # %if.end16.i
	movq	egb.psi(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB20_10
# %bb.9:                                # %if.then19.i
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	free_vector@PLT
	movq	$0, egb.psi(%rip)
.LBB20_10:                              # %if.end20.i
	movq	egb.reqack(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB20_12
# %bb.11:                               # %if.then23.i
	xorl	%esi, %esi
	movl	$1, %edx
	callq	free_ivector@PLT
	movq	$0, egb.reqack(%rip)
.LBB20_12:                              # %egb.exit
	movq	mme34.grad(%rip), %rdi
	xorpd	%xmm3, %xmm3
	testq	%rdi, %rdi
	je	.LBB20_205
# %bb.13:                               # %if.then5
	movzbl	dim(%rip), %edx
	addq	$3, %rdx
	imulq	%rbx, %rdx
	xorl	%esi, %esi
	callq	free_vector@PLT
	xorpd	%xmm3, %xmm3
	movq	$0, mme34.grad(%rip)
	jmp	.LBB20_205
.LBB20_14:                              # %if.end20
	movq	%r14, %r12
	movq	nabout@GOTPCREL(%rip), %r14
	movq	(%r14), %rcx
	movl	$.L.str.65, %edi
	movl	$20, %esi
	movl	$1, %edx
	callq	fwrite@PLT
	movq	(%r14), %rdi
	movq	%r12, %r14
	callq	fflush@PLT
	movl	(%r12), %ecx
	testl	%ecx, %ecx
	jne	.LBB20_16
# %bb.15:                               # %if.then23
	movq	$0, tconjgrad(%rip)
	xorl	%ecx, %ecx
.LBB20_16:                              # %if.end24
	movq	chknm(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB20_20
# %bb.17:                               # %land.lhs.true27
	testl	%ecx, %ecx
	jle	.LBB20_20
# %bb.18:                               # %land.lhs.true27
	movl	%ecx, %eax
	movl	$3518437209, %edx               # imm = 0xD1B71759
	imulq	%rax, %rdx
	shrq	$45, %rdx
	imull	$10000, %edx, %eax              # imm = 0x2710
	movl	%ecx, %edx
	subl	%eax, %edx
	jne	.LBB20_20
# %bb.19:                               # %if.then33
	movq	prm(%rip), %rax
	movl	96(%rax), %esi
	movq	%r15, %rdx
	callq	checkpoint
.LBB20_20:                              # %if.end35
	cmpl	$0, nb_pairs(%rip)
	js	.LBB20_23
# %bb.21:                               # %lor.lhs.false
	movl	(%r14), %eax
	testl	%eax, %eax
	jle	.LBB20_24
# %bb.22:                               # %lor.lhs.false
	movl	$3435973837, %ecx               # imm = 0xCCCCCCCD
	movq	%rax, %rdx
	imulq	%rcx, %rdx
	shrq	$35, %rdx
	addl	%edx, %edx
	leal	(%rdx,%rdx,4), %ecx
	subl	%ecx, %eax
	jne	.LBB20_24
.LBB20_23:                              # %if.then44
	movq	lpairs(%rip), %rdi
	movq	upairs(%rip), %rsi
	movq	pairlist(%rip), %rdx
	movq	prm(%rip), %rax
	movl	96(%rax), %eax
	movzbl	dim(%rip), %r10d
	addl	$3, %r10d
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movsd	.LCPI20_0(%rip), %xmm0          # xmm0 = mem[0],zero
	movq	%r15, %rcx
	xorl	%r8d, %r8d
	movl	$1, %r9d
	pushq	frozen(%rip)
	.cfi_adjust_cfa_offset 8
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	callq	nblist@PLT
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movl	%eax, nb_pairs(%rip)
.LBB20_24:                              # %if.end48
	movq	mme34.grad(%rip), %rax
	testq	%rax, %rax
	jne	.LBB20_26
# %bb.25:                               # %if.then51
	movzbl	dim(%rip), %esi
	addq	$3, %rsi
	imulq	%rbx, %rsi
	xorl	%edi, %edi
	callq	vector@PLT
	movq	%rax, mme34.grad(%rip)
.LBB20_26:                              # %if.end56
	movzbl	dim(%rip), %edx
	addl	$3, %edx
	movq	prm(%rip), %r9
	movl	96(%r9), %ecx
	imull	%edx, %ecx
	testl	%ecx, %ecx
	jle	.LBB20_29
# %bb.27:                               # %for.body.preheader
	xorl	%ecx, %ecx
	movl	%edx, %edx
	.p2align	4, 0x90
.LBB20_28:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	$0, (%rax,%rcx,8)
	incq	%rcx
	movq	prm(%rip), %r9
	movslq	96(%r9), %rsi
	imulq	%rdx, %rsi
	cmpq	%rsi, %rcx
	jl	.LBB20_28
.LBB20_29:                              # %for.end
	movl	104(%r9), %edi
	movq	496(%r9), %rsi
	movq	504(%r9), %rdx
	movq	512(%r9), %rcx
	movq	264(%r9), %r8
	movq	272(%r9), %r9
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	ebond
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	movsd	%xmm0, 192(%rsp)                # 8-byte Spill
	movq	prm(%rip), %rax
	movl	108(%rax), %edi
	movq	520(%rax), %rsi
	movq	528(%rax), %rdx
	movq	536(%rax), %rcx
	movq	264(%rax), %r8
	movq	272(%rax), %r9
	pushq	mme34.grad(%rip)
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	ebond
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	movsd	%xmm0, 440(%rsp)                # 8-byte Spill
	movq	prm(%rip), %rax
	movl	112(%rax), %edi
	movq	544(%rax), %rsi
	movq	552(%rax), %rdx
	movq	560(%rax), %rcx
	movq	568(%rax), %r8
	movq	280(%rax), %r9
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	pushq	mme34.grad(%rip)
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	288(%rax)
	.cfi_adjust_cfa_offset 8
	callq	eangl
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movsd	%xmm0, 120(%rsp)                # 8-byte Spill
	movq	prm(%rip), %rax
	movl	148(%rax), %edi
	movq	576(%rax), %rsi
	movq	584(%rax), %rdx
	movq	592(%rax), %rcx
	movq	600(%rax), %r8
	movq	280(%rax), %r9
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	pushq	mme34.grad(%rip)
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	288(%rax)
	.cfi_adjust_cfa_offset 8
	callq	eangl
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movsd	%xmm0, 432(%rsp)                # 8-byte Spill
	movq	prm(%rip), %rax
	movl	120(%rax), %edi
	movq	608(%rax), %rsi
	movq	616(%rax), %rdx
	movq	624(%rax), %rcx
	movq	632(%rax), %r8
	movq	640(%rax), %r9
	movups	296(%rax), %xmm0
	movq	312(%rax), %rax
	movq	mme34.grad(%rip), %r10
	subq	$48, %rsp
	.cfi_adjust_cfa_offset 48
	movq	%r10, 32(%rsp)
	movq	%r15, 24(%rsp)
	movq	%rax, 16(%rsp)
	movups	%xmm0, (%rsp)
	callq	ephi
	addq	$48, %rsp
	.cfi_adjust_cfa_offset -48
	movsd	%xmm0, 16(%rsp)                 # 8-byte Spill
	movq	prm(%rip), %rax
	movl	124(%rax), %edi
	movq	648(%rax), %rsi
	movq	656(%rax), %rdx
	movq	664(%rax), %rcx
	movq	672(%rax), %r8
	movq	680(%rax), %r9
	movups	296(%rax), %xmm0
	movq	312(%rax), %rax
	movq	mme34.grad(%rip), %r10
	subq	$48, %rsp
	.cfi_adjust_cfa_offset 48
	movq	%r10, 32(%rsp)
	movq	%r15, 24(%rsp)
	movq	%rax, 16(%rsp)
	movups	%xmm0, (%rsp)
	callq	ephi
	addq	$48, %rsp
	.cfi_adjust_cfa_offset -48
	movsd	%xmm0, 424(%rsp)                # 8-byte Spill
	movq	lpairs(%rip), %rdi
	movq	prm(%rip), %rax
	movq	696(%rax), %rsi
	movq	N14pearlist(%rip), %rdx
	movq	mme34.grad(%rip), %r9
	leaq	480(%rsp), %rax
	leaq	488(%rsp), %r10
	movsd	.LCPI20_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movsd	.LCPI20_2(%rip), %xmm1          # xmm1 = mem[0],zero
	movl	$1, %ecx
	movq	%r15, %r8
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	callq	nbond
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	xorpd	%xmm4, %xmm4
	cmpl	$0, nconstrained(%rip)
	je	.LBB20_36
# %bb.30:                               # %if.then102
	movq	prm(%rip), %rax
	cmpl	$0, 96(%rax)
	jle	.LBB20_36
# %bb.31:                               # %for.body.i.preheader
	movq	mme34.grad(%rip), %rax
	movq	constrained(%rip), %rcx
	movzbl	dim(%rip), %edx
	leal	3(%rdx), %esi
	movq	x0(%rip), %rdi
	movq	%rdx, %r8
	addq	$3, %r8
	xorpd	%xmm0, %xmm0
	xorl	%r9d, %r9d
	jmp	.LBB20_33
	.p2align	4, 0x90
.LBB20_32:                              # %for.inc.i
                                        #   in Loop: Header=BB20_33 Depth=1
	incq	%r9
	movq	prm(%rip), %r10
	movslq	96(%r10), %r10
	cmpq	%r10, %r9
	jge	.LBB20_36
.LBB20_33:                              # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%rcx,%r9,4)
	je	.LBB20_32
# %bb.34:                               # %if.then.i
                                        #   in Loop: Header=BB20_33 Depth=1
	movl	%esi, %r10d
	imull	%r9d, %r10d
	movsd	(%r15,%r10,8), %xmm3            # xmm3 = mem[0],zero
	movsd	8(%r15,%r10,8), %xmm2           # xmm2 = mem[0],zero
	subsd	(%rdi,%r10,8), %xmm3
	subsd	8(%rdi,%r10,8), %xmm2
	movsd	16(%r15,%r10,8), %xmm1          # xmm1 = mem[0],zero
	subsd	16(%rdi,%r10,8), %xmm1
	movapd	%xmm4, %xmm6
	movapd	%xmm2, %xmm4
	mulsd	%xmm2, %xmm4
	movapd	%xmm3, %xmm5
	mulsd	%xmm3, %xmm5
	addsd	%xmm4, %xmm5
	movapd	%xmm1, %xmm4
	mulsd	%xmm1, %xmm4
	addsd	%xmm5, %xmm4
	mulsd	%xmm0, %xmm3
	addsd	(%rax,%r10,8), %xmm3
	mulsd	%xmm0, %xmm4
	movsd	%xmm3, (%rax,%r10,8)
	movl	%r8d, %r10d
	imull	%r9d, %r10d
	leal	1(%r10), %r11d
	mulsd	%xmm0, %xmm2
	addsd	(%rax,%r11,8), %xmm2
	addsd	%xmm4, %xmm6
	movapd	%xmm6, %xmm4
	movsd	%xmm2, (%rax,%r11,8)
	addl	$2, %r10d
	mulsd	%xmm0, %xmm1
	addsd	(%rax,%r10,8), %xmm1
	movsd	%xmm1, (%rax,%r10,8)
	testb	%dl, %dl
	je	.LBB20_32
# %bb.35:                               # %if.then48.i
                                        #   in Loop: Header=BB20_33 Depth=1
	leal	(,%r9,4), %r10d
	movsd	24(%r15,%r10,8), %xmm1          # xmm1 = mem[0],zero
	subsd	24(%rdi,%r10,8), %xmm1
	movapd	%xmm1, %xmm2
	mulsd	%xmm0, %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm4
	addsd	24(%rax,%r10,8), %xmm2
	movsd	%xmm2, 24(%rax,%r10,8)
	jmp	.LBB20_32
.LBB20_36:                              # %if.end107
	movsd	%xmm4, 384(%rsp)                # 8-byte Spill
	movsd	488(%rsp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, 368(%rsp)                # 8-byte Spill
	movsd	480(%rsp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, 376(%rsp)                # 8-byte Spill
	cmpl	$0, gb(%rip)
	movq	lpairs(%rip), %r12
	movq	upairs(%rip), %rsi
	movq	pairlist(%rip), %r9
	movq	mme34.grad(%rip), %rbx
	je	.LBB20_41
# %bb.37:                               # %if.then110
	movq	%rsi, 40(%rsp)                  # 8-byte Spill
	movq	prm(%rip), %rax
	movq	368(%rax), %rcx
	movq	%rcx, 392(%rsp)                 # 8-byte Spill
	movq	248(%rax), %rcx
	movq	%rcx, 400(%rsp)                 # 8-byte Spill
	movq	360(%rax), %r13
	movslq	96(%rax), %rbp
	movsd	432(%rax), %xmm0                # xmm0 = mem[0],zero
	cmpq	$0, egb.reff(%rip)
	movq	%r9, 8(%rsp)                    # 8-byte Spill
	movsd	%xmm0, 56(%rsp)                 # 8-byte Spill
	je	.LBB20_42
# %bb.38:                               # %if.end39.i
	cmpq	$0, egb.iexw(%rip)
	je	.LBB20_43
.LBB20_39:                              # %if.end48.i
	cmpq	$0, egb.sumdeijda(%rip)
	je	.LBB20_44
.LBB20_40:                              # %if.end55.i
	cmpq	$0, egb.psi(%rip)
	jne	.LBB20_48
	jmp	.LBB20_45
.LBB20_41:                              # %if.else126
	leaq	496(%rsp), %rax
	leaq	504(%rsp), %r10
	movsd	.LCPI20_4(%rip), %xmm0          # xmm0 = mem[0],zero
	movq	%r12, %rdi
	movq	%r9, %rdx
	xorl	%ecx, %ecx
	movq	%r15, %r8
	movq	%rbx, %r9
	movapd	%xmm0, %xmm1
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	callq	nbond
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	movsd	504(%rsp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, 144(%rsp)                # 8-byte Spill
	xorps	%xmm0, %xmm0
	movsd	%xmm0, 160(%rsp)                # 8-byte Spill
	movsd	496(%rsp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, 128(%rsp)                # 8-byte Spill
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	jmp	.LBB20_173
.LBB20_42:                              # %if.then37.i
	xorl	%edi, %edi
	movq	%rbp, %rsi
	callq	vector@PLT
	movsd	56(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movq	8(%rsp), %r9                    # 8-byte Reload
	movq	%rax, egb.reff(%rip)
	cmpq	$0, egb.iexw(%rip)
	jne	.LBB20_39
.LBB20_43:                              # %if.then42.i
	leal	1(%rbp), %esi
	movl	$-1, %edi
	callq	ivector@PLT
	movsd	56(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movq	8(%rsp), %r9                    # 8-byte Reload
	movq	%rax, egb.iexw(%rip)
	cmpq	$0, egb.sumdeijda(%rip)
	jne	.LBB20_40
.LBB20_44:                              # %if.then51.i
	xorl	%edi, %edi
	movq	%rbp, %rsi
	callq	vector@PLT
	movsd	56(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movq	8(%rsp), %r9                    # 8-byte Reload
	movq	%rax, egb.sumdeijda(%rip)
	cmpq	$0, egb.psi(%rip)
	jne	.LBB20_48
.LBB20_45:                              # %land.lhs.true.i
	movl	gb(%rip), %eax
	cmpl	$5, %eax
	je	.LBB20_47
# %bb.46:                               # %land.lhs.true.i
	cmpl	$2, %eax
	jne	.LBB20_48
.LBB20_47:                              # %if.then62.i
	xorl	%edi, %edi
	movq	%rbp, %rsi
	callq	vector@PLT
	movsd	56(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movq	8(%rsp), %r9                    # 8-byte Reload
	movq	%rax, egb.psi(%rip)
.LBB20_48:                              # %if.end64.i
	addsd	.LCPI20_0(%rip), %xmm0
	cmpq	$0, egb.reqack(%rip)
	jne	.LBB20_50
# %bb.49:                               # %if.then67.i
	xorl	%edi, %edi
	movl	$1, %esi
	movsd	%xmm0, 56(%rsp)                 # 8-byte Spill
	callq	ivector@PLT
	movsd	56(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movq	8(%rsp), %r9                    # 8-byte Reload
	movq	%rax, egb.reqack(%rip)
.LBB20_50:                              # %if.end72.i
	movq	%r14, 360(%rsp)                 # 8-byte Spill
	mulsd	%xmm0, %xmm0
	movsd	%xmm0, 56(%rsp)                 # 8-byte Spill
	movq	prm(%rip), %rax
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 144(%rsp)                # 8-byte Spill
	cmpl	$0, 96(%rax)
	movq	%rbx, 224(%rsp)                 # 8-byte Spill
	movq	%r13, 64(%rsp)                  # 8-byte Spill
	jle	.LBB20_89
# %bb.51:                               # %for.body.i107.preheader
	movq	nabout@GOTPCREL(%rip), %r14
	xorl	%ebp, %ebp
	movsd	%xmm0, 136(%rsp)                # 8-byte Spill
                                        # implicit-def: $xmm0
                                        # kill: killed $xmm0
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movq	40(%rsp), %rbx                  # 8-byte Reload
	jmp	.LBB20_54
	.p2align	4, 0x90
.LBB20_52:                              # %if.else263.i
                                        #   in Loop: Header=BB20_54 Depth=1
	movapd	160(%rsp), %xmm0                # 16-byte Reload
	xorpd	.LCPI20_19(%rip), %xmm0
	movsd	24(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	mulsd	%xmm0, %xmm2
	movq	egb.psi(%rip), %rax
	movsd	%xmm2, (%rax,%rbp,8)
	movsd	gbalpha(%rip), %xmm1            # xmm1 = mem[0],zero
	movsd	gbbeta(%rip), %xmm0             # xmm0 = mem[0],zero
	mulsd	%xmm2, %xmm0
	subsd	%xmm0, %xmm1
	movsd	gbgamma(%rip), %xmm0            # xmm0 = mem[0],zero
	mulsd	%xmm2, %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	mulsd	%xmm2, %xmm0
	callq	tanh@PLT
	movq	8(%rsp), %r9                    # 8-byte Reload
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movq	64(%rsp), %r13                  # 8-byte Reload
	divsd	(%r13,%rbp,8), %xmm0
	movsd	32(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	subsd	%xmm0, %xmm1
	movsd	.LCPI20_4(%rip), %xmm0          # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movq	egb.reff(%rip), %rax
	movsd	%xmm0, (%rax,%rbp,8)
.LBB20_53:                              # %for.inc298.i
                                        #   in Loop: Header=BB20_54 Depth=1
	incq	%rbp
	movq	prm(%rip), %rax
	movslq	96(%rax), %rax
	cmpq	%rax, %rbp
	jge	.LBB20_87
.LBB20_54:                              # %for.body.i107
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB20_60 Depth 2
	movzbl	dim(%rip), %ecx
	leal	3(%rcx), %edx
	movl	%ebp, %eax
	imull	%edx, %eax
	cmpl	$1, %ecx
	jne	.LBB20_56
# %bb.55:                               # %if.then87.i
                                        #   in Loop: Header=BB20_54 Depth=1
	movl	%eax, %ecx
	movsd	24(%r15,%rcx,8), %xmm0          # xmm0 = mem[0],zero
	movsd	%xmm0, 136(%rsp)                # 8-byte Spill
.LBB20_56:                              # %if.end92.i
                                        #   in Loop: Header=BB20_54 Depth=1
	movsd	(%r13,%rbp,8), %xmm1            # xmm1 = mem[0],zero
	addsd	.LCPI20_3(%rip), %xmm1
	movsd	.LCPI20_4(%rip), %xmm5          # xmm5 = mem[0],zero
	movapd	%xmm1, 160(%rsp)                # 16-byte Spill
	divsd	%xmm1, %xmm5
	movl	(%rbx,%rbp,4), %ecx
	addl	(%r12,%rbp,4), %ecx
	movsd	%xmm5, 32(%rsp)                 # 8-byte Spill
	jle	.LBB20_83
# %bb.57:                               # %for.body104.lr.ph.i
                                        #   in Loop: Header=BB20_54 Depth=1
	movsd	(%r15,%rax,8), %xmm0            # xmm0 = mem[0],zero
	movsd	%xmm0, 288(%rsp)                # 8-byte Spill
	movsd	8(%r15,%rax,8), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, 272(%rsp)                # 8-byte Spill
	movsd	16(%r15,%rax,8), %xmm0          # xmm0 = mem[0],zero
	movsd	%xmm0, 72(%rsp)                 # 8-byte Spill
	movapd	%xmm5, %xmm0
	mulsd	.LCPI20_5(%rip), %xmm0
	movsd	%xmm0, 240(%rsp)                # 8-byte Spill
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	xorl	%r13d, %r13d
	jmp	.LBB20_60
	.p2align	4, 0x90
.LBB20_58:                              #   in Loop: Header=BB20_60 Depth=2
	movq	40(%rsp), %rbx                  # 8-byte Reload
.LBB20_59:                              # %for.inc.i111
                                        #   in Loop: Header=BB20_60 Depth=2
	incq	%r13
	movslq	(%r12,%rbp,4), %rax
	movslq	(%rbx,%rbp,4), %rcx
	addq	%rax, %rcx
	cmpq	%rcx, %r13
	jge	.LBB20_84
.LBB20_60:                              # %for.body104.i
                                        #   Parent Loop BB20_54 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%r9,%rbp,8), %rax
	testq	%rax, %rax
	jne	.LBB20_62
# %bb.61:                               # %if.then109.i
                                        #   in Loop: Header=BB20_60 Depth=2
	movq	(%r14), %rdi
	movl	$.L.str.80, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	fprintf@PLT
	movq	(%r14), %rdi
	callq	fflush@PLT
	movsd	32(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	movq	8(%rsp), %r9                    # 8-byte Reload
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movq	(%r9,%rbp,8), %rax
.LBB20_62:                              # %if.end112.i
                                        #   in Loop: Header=BB20_60 Depth=2
	movslq	(%rax,%r13,4), %rbx
	movzbl	dim(%rip), %ecx
	leal	3(%rcx), %eax
	imulq	%rbx, %rax
	movsd	288(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	(%r15,%rax,8), %xmm0
	cltq
	movsd	272(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	subsd	8(%r15,%rax,8), %xmm1
	movsd	72(%rsp), %xmm7                 # 8-byte Reload
                                        # xmm7 = mem[0],zero
	subsd	16(%r15,%rax,8), %xmm7
	mulsd	%xmm1, %xmm1
	mulsd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	mulsd	%xmm7, %xmm7
	addsd	%xmm0, %xmm7
	cmpl	$1, %ecx
	jne	.LBB20_64
# %bb.63:                               # %if.then136.i
                                        #   in Loop: Header=BB20_60 Depth=2
	movsd	136(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	24(%r15,%rax,8), %xmm0
	movsd	%xmm0, 264(%rsp)                # 8-byte Spill
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm7
.LBB20_64:                              # %if.end143.i
                                        #   in Loop: Header=BB20_60 Depth=2
	ucomisd	56(%rsp), %xmm7                 # 8-byte Folded Reload
	ja	.LBB20_58
# %bb.65:                               # %if.end147.i
                                        #   in Loop: Header=BB20_60 Depth=2
	ucomisd	.LCPI20_35(%rip), %xmm7
	jb	.LBB20_67
# %bb.66:                               #   in Loop: Header=BB20_60 Depth=2
	xorps	%xmm0, %xmm0
	sqrtsd	%xmm7, %xmm0
	jmp	.LBB20_68
	.p2align	4, 0x90
.LBB20_67:                              # %call.sqrt
                                        #   in Loop: Header=BB20_60 Depth=2
	movapd	%xmm7, %xmm0
	movsd	%xmm7, 96(%rsp)                 # 8-byte Spill
	callq	sqrt@PLT
	movsd	96(%rsp), %xmm7                 # 8-byte Reload
                                        # xmm7 = mem[0],zero
	movsd	32(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	movq	8(%rsp), %r9                    # 8-byte Reload
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
.LBB20_68:                              # %if.end147.i.split
                                        #   in Loop: Header=BB20_60 Depth=2
	movsd	.LCPI20_4(%rip), %xmm6          # xmm6 = mem[0],zero
	divsd	%xmm0, %xmm6
	movapd	%xmm7, %xmm8
	mulsd	%xmm6, %xmm8
	movq	64(%rsp), %rax                  # 8-byte Reload
	movsd	(%rax,%rbx,8), %xmm1            # xmm1 = mem[0],zero
	addsd	.LCPI20_3(%rip), %xmm1
	movq	392(%rsp), %rax                 # 8-byte Reload
	mulsd	(%rax,%rbx,8), %xmm1
	movapd	%xmm1, %xmm0
	movsd	.LCPI20_0(%rip), %xmm3          # xmm3 = mem[0],zero
	addsd	%xmm3, %xmm0
	ucomisd	%xmm0, %xmm8
	ja	.LBB20_58
# %bb.70:                               # %if.end162.i
                                        #   in Loop: Header=BB20_60 Depth=2
	movapd	%xmm1, %xmm2
	mulsd	%xmm1, %xmm2
	movapd	%xmm3, %xmm0
	subsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm8
	movq	40(%rsp), %rbx                  # 8-byte Reload
	jbe	.LBB20_72
# %bb.71:                               # %if.then166.i
                                        #   in Loop: Header=BB20_60 Depth=2
	movapd	%xmm8, %xmm0
	subsd	%xmm1, %xmm0
	movsd	.LCPI20_4(%rip), %xmm4          # xmm4 = mem[0],zero
	movapd	%xmm4, %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm8, %xmm3
	addsd	%xmm8, %xmm3
	mulsd	%xmm1, %xmm3
	addsd	%xmm4, %xmm3
	mulsd	.LCPI20_15(%rip), %xmm8
	addsd	%xmm7, %xmm8
	subsd	%xmm2, %xmm8
	mulsd	.LCPI20_16(%rip), %xmm8
	addsd	%xmm3, %xmm8
	movsd	%xmm8, 80(%rsp)                 # 8-byte Spill
	mulsd	.LCPI20_17(%rip), %xmm0
	movsd	%xmm6, 96(%rsp)                 # 8-byte Spill
	callq	log@PLT
	movsd	32(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	addsd	%xmm0, %xmm0
	addsd	80(%rsp), %xmm0                 # 8-byte Folded Reload
	movsd	96(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	.LCPI20_18(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	jmp	.LBB20_80
.LBB20_72:                              # %if.else.i
                                        #   in Loop: Header=BB20_60 Depth=2
	movapd	%xmm1, %xmm0
	mulsd	.LCPI20_6(%rip), %xmm0
	ucomisd	%xmm0, %xmm8
	jbe	.LBB20_74
# %bb.73:                               # %if.then185.i
                                        #   in Loop: Header=BB20_60 Depth=2
	mulsd	%xmm6, %xmm6
	mulsd	%xmm6, %xmm2
	movapd	%xmm2, %xmm0
	mulsd	.LCPI20_10(%rip), %xmm0
	addsd	.LCPI20_11(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	.LCPI20_12(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	.LCPI20_13(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	.LCPI20_14(%rip), %xmm0
	mulsd	%xmm1, %xmm2
	mulsd	%xmm6, %xmm2
	mulsd	%xmm0, %xmm2
	movsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	%xmm2, %xmm0
	movsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	jmp	.LBB20_80
.LBB20_74:                              # %if.else196.i
                                        #   in Loop: Header=BB20_60 Depth=2
	movapd	160(%rsp), %xmm4                # 16-byte Reload
	movapd	%xmm4, %xmm0
	addsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm8
	jbe	.LBB20_77
# %bb.75:                               # %if.then200.i
                                        #   in Loop: Header=BB20_60 Depth=2
	subsd	%xmm2, %xmm7
	movapd	%xmm1, %xmm0
	divsd	%xmm7, %xmm0
	movsd	%xmm0, 80(%rsp)                 # 8-byte Spill
	mulsd	.LCPI20_5(%rip), %xmm6
	movsd	%xmm6, 96(%rsp)                 # 8-byte Spill
	movapd	%xmm8, %xmm0
	subsd	%xmm1, %xmm0
.LBB20_76:                              # %for.inc.i111
                                        #   in Loop: Header=BB20_60 Depth=2
	addsd	%xmm1, %xmm8
	divsd	%xmm8, %xmm0
	callq	log@PLT
	movsd	32(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	mulsd	96(%rsp), %xmm0                 # 8-byte Folded Reload
	addsd	80(%rsp), %xmm0                 # 8-byte Folded Reload
	mulsd	.LCPI20_8(%rip), %xmm0
	jmp	.LBB20_79
.LBB20_77:                              # %if.else210.i
                                        #   in Loop: Header=BB20_60 Depth=2
	movapd	%xmm4, %xmm0
	subsd	%xmm1, %xmm0
	andpd	.LCPI20_7(%rip), %xmm0
	ucomisd	%xmm0, %xmm8
	jbe	.LBB20_81
# %bb.78:                               # %if.then214.i
                                        #   in Loop: Header=BB20_60 Depth=2
	movsd	240(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	mulsd	%xmm6, %xmm0
	movapd	%xmm4, %xmm3
	mulsd	%xmm4, %xmm3
	addsd	%xmm7, %xmm3
	subsd	%xmm2, %xmm3
	mulsd	%xmm0, %xmm3
	addsd	%xmm1, %xmm8
	movsd	.LCPI20_4(%rip), %xmm0          # xmm0 = mem[0],zero
	divsd	%xmm8, %xmm0
	movsd	.LCPI20_1(%rip), %xmm1          # xmm1 = mem[0],zero
	subsd	%xmm3, %xmm1
	mulsd	%xmm5, %xmm1
	subsd	%xmm0, %xmm1
	movsd	%xmm1, 80(%rsp)                 # 8-byte Spill
	mulsd	%xmm4, %xmm0
	movsd	%xmm6, 96(%rsp)                 # 8-byte Spill
	callq	log@PLT
	movsd	32(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	mulsd	96(%rsp), %xmm0                 # 8-byte Folded Reload
	addsd	80(%rsp), %xmm0                 # 8-byte Folded Reload
	mulsd	.LCPI20_9(%rip), %xmm0
.LBB20_79:                              # %for.inc.i111
                                        #   in Loop: Header=BB20_60 Depth=2
	movsd	24(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 24(%rsp)                 # 8-byte Spill
.LBB20_80:                              # %for.inc.i111
                                        #   in Loop: Header=BB20_60 Depth=2
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movq	8(%rsp), %r9                    # 8-byte Reload
	jmp	.LBB20_59
.LBB20_81:                              # %if.else229.i
                                        #   in Loop: Header=BB20_60 Depth=2
	ucomisd	%xmm4, %xmm1
	jbe	.LBB20_80
# %bb.82:                               # %if.then232.i
                                        #   in Loop: Header=BB20_60 Depth=2
	subsd	%xmm2, %xmm7
	movapd	%xmm1, %xmm0
	divsd	%xmm7, %xmm0
	addsd	%xmm5, %xmm5
	addsd	%xmm0, %xmm5
	movsd	%xmm5, 80(%rsp)                 # 8-byte Spill
	mulsd	.LCPI20_5(%rip), %xmm6
	movsd	%xmm6, 96(%rsp)                 # 8-byte Spill
	movapd	%xmm1, %xmm0
	subsd	%xmm8, %xmm0
	jmp	.LBB20_76
	.p2align	4, 0x90
.LBB20_83:                              #   in Loop: Header=BB20_54 Depth=1
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 24(%rsp)                 # 8-byte Spill
.LBB20_84:                              # %for.end.i
                                        #   in Loop: Header=BB20_54 Depth=1
	cmpl	$1, gb(%rip)
	jne	.LBB20_52
# %bb.85:                               # %if.then250.i
                                        #   in Loop: Header=BB20_54 Depth=1
	addsd	24(%rsp), %xmm5                 # 8-byte Folded Reload
	movsd	.LCPI20_4(%rip), %xmm0          # xmm0 = mem[0],zero
	divsd	%xmm5, %xmm0
	movq	egb.reff(%rip), %rax
	movsd	%xmm0, (%rax,%rbp,8)
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm0, %xmm1
	movq	64(%rsp), %r13                  # 8-byte Reload
	jbe	.LBB20_53
# %bb.86:                               # %if.then259.i
                                        #   in Loop: Header=BB20_54 Depth=1
	movabsq	$4629137466983448576, %rcx      # imm = 0x403E000000000000
	movq	%rcx, (%rax,%rbp,8)
	jmp	.LBB20_53
.LBB20_87:                              # %for.end300.i
	movl	%eax, %edx
	testl	%edx, %edx
	jle	.LBB20_90
# %bb.88:                               # %for.body305.lr.ph.i
	movq	egb.sumdeijda(%rip), %rdi
	shlq	$3, %rdx
	xorl	%esi, %esi
	callq	memset@PLT
	movq	8(%rsp), %r9                    # 8-byte Reload
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	jmp	.LBB20_90
.LBB20_89:
	movsd	%xmm0, 136(%rsp)                # 8-byte Spill
                                        # implicit-def: $xmm0
                                        # kill: killed $xmm0
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movq	40(%rsp), %rbx                  # 8-byte Reload
.LBB20_90:                              # %for.cond312.preheader.i
	movq	prm(%rip), %rax
	cmpl	$0, 96(%rax)
	movq	%r12, 72(%rsp)                  # 8-byte Spill
	js	.LBB20_131
# %bb.91:                               # %for.body316.i.preheader
	movq	$-1, %rcx
	.p2align	4, 0x90
.LBB20_92:                              # %for.body316.i
                                        # =>This Inner Loop Header: Depth=1
	movq	egb.iexw(%rip), %rdx
	movl	$-1, (%rdx,%rcx,4)
	incq	%rcx
	movslq	96(%rax), %rdx
	cmpq	%rdx, %rcx
	jl	.LBB20_92
# %bb.93:                               # %for.cond323.preheader.i
	testl	%edx, %edx
	jle	.LBB20_131
# %bb.94:                               # %for.body327.i.preheader
	xorl	%r14d, %r14d
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 160(%rsp)                # 8-byte Spill
	movsd	%xmm0, 128(%rsp)                # 8-byte Spill
	movsd	%xmm0, 144(%rsp)                # 8-byte Spill
                                        # implicit-def: $xmm1
	jmp	.LBB20_97
	.p2align	4, 0x90
.LBB20_95:                              #   in Loop: Header=BB20_97 Depth=1
	movapd	%xmm1, %xmm0
.LBB20_96:                              # %for.inc590.i
                                        #   in Loop: Header=BB20_97 Depth=1
	incq	%r14
	movq	prm(%rip), %rax
	movslq	96(%rax), %rax
	movapd	%xmm0, %xmm1
	cmpq	%rax, %r14
	jge	.LBB20_132
.LBB20_97:                              # %for.body327.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB20_104 Depth 2
                                        #     Child Loop BB20_107 Depth 2
	movq	egb.reff(%rip), %rax
	movsd	(%rax,%r14,8), %xmm6            # xmm6 = mem[0],zero
	movq	400(%rsp), %rax                 # 8-byte Reload
	movsd	(%rax,%r14,8), %xmm2            # xmm2 = mem[0],zero
	movq	frozen(%rip), %rax
	cmpl	$0, (%rax,%r14,4)
	movsd	%xmm6, 152(%rsp)                # 8-byte Spill
	movsd	%xmm2, 208(%rsp)                # 8-byte Spill
	jne	.LBB20_99
# %bb.98:                               # %if.then335.i
                                        #   in Loop: Header=BB20_97 Depth=1
	movapd	%xmm6, %xmm0
	movsd	%xmm1, 216(%rsp)                # 8-byte Spill
	movsd	.LCPI20_20(%rip), %xmm1         # xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm0
	callq	exp@PLT
	movsd	152(%rsp), %xmm6                # 8-byte Reload
                                        # xmm6 = mem[0],zero
	movq	8(%rsp), %r9                    # 8-byte Reload
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	divsd	.LCPI20_21(%rip), %xmm0
	movsd	.LCPI20_4(%rip), %xmm1          # xmm1 = mem[0],zero
	subsd	%xmm0, %xmm1
	movsd	208(%rsp), %xmm3                # 8-byte Reload
                                        # xmm3 = mem[0],zero
	movapd	%xmm3, %xmm2
	mulsd	.LCPI20_5(%rip), %xmm2
	mulsd	%xmm3, %xmm2
	mulsd	%xmm2, %xmm1
	mulsd	.LCPI20_20(%rip), %xmm2
	mulsd	%xmm0, %xmm2
	mulsd	%xmm6, %xmm2
	addsd	%xmm1, %xmm2
	divsd	%xmm6, %xmm1
	movsd	160(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	%xmm1, %xmm0
	movsd	216(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movsd	%xmm0, 160(%rsp)                # 8-byte Spill
	addsd	.LCPI20_35(%rip), %xmm2
	movq	egb.sumdeijda(%rip), %rax
	addsd	(%rax,%r14,8), %xmm2
	movsd	%xmm2, (%rax,%r14,8)
.LBB20_99:                              # %if.end357.i
                                        #   in Loop: Header=BB20_97 Depth=1
	movslq	(%rbx,%r14,4), %rax
	movq	%rax, 200(%rsp)                 # 8-byte Spill
	testq	%rax, %rax
	jle	.LBB20_95
# %bb.100:                              # %if.end363.i
                                        #   in Loop: Header=BB20_97 Depth=1
	movzbl	dim(%rip), %eax
	leal	3(%rax), %r10d
	imull	%r14d, %r10d
	cmpl	$1, %eax
	jne	.LBB20_102
# %bb.101:                              # %if.then375.i
                                        #   in Loop: Header=BB20_97 Depth=1
	movsd	24(%r15,%r10,8), %xmm0          # xmm0 = mem[0],zero
	movsd	%xmm0, 136(%rsp)                # 8-byte Spill
.LBB20_102:                             # %if.end379.i
                                        #   in Loop: Header=BB20_97 Depth=1
	movups	(%r15,%r10,8), %xmm0
	movaps	%xmm0, 512(%rsp)                # 16-byte Spill
	movsd	16(%r15,%r10,8), %xmm0          # xmm0 = mem[0],zero
	movsd	%xmm0, 472(%rsp)                # 8-byte Spill
	movq	prm(%rip), %rcx
	movq	440(%rcx), %rdx
	movq	448(%rcx), %rsi
	movl	(%rdx,%r14,4), %edx
	decl	%edx
	imull	100(%rcx), %edx
	movl	%edx, 236(%rsp)                 # 4-byte Spill
	cmpl	$0, (%rsi,%r14,4)
	jle	.LBB20_105
# %bb.103:                              # %for.body389.i.preheader
                                        #   in Loop: Header=BB20_97 Depth=1
	movq	IexclAt(%rip), %rdx
	movq	(%rdx,%r14,8), %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB20_104:                             # %for.body389.i
                                        #   Parent Loop BB20_97 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	egb.iexw(%rip), %rdi
	movslq	(%rdx,%rsi,4), %r8
	movl	%r14d, -4(%rdi,%r8,4)
	incq	%rsi
	movq	448(%rcx), %rdi
	movslq	(%rdi,%r14,4), %rdi
	cmpq	%rdi, %rsi
	jl	.LBB20_104
.LBB20_105:                             # %for.body409.lr.ph.i
                                        #   in Loop: Header=BB20_97 Depth=1
	movq	%r10, 464(%rsp)                 # 8-byte Spill
	leaq	2(%r10), %rcx
	movq	%rcx, 456(%rsp)                 # 8-byte Spill
	movslq	(%r12,%r14,4), %r13
	decl	236(%rsp)                       # 4-byte Folded Spill
	xorpd	%xmm0, %xmm0
	movapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 96(%rsp)                 # 8-byte Spill
	movsd	%xmm0, 240(%rsp)                # 8-byte Spill
	jmp	.LBB20_107
	.p2align	4, 0x90
.LBB20_106:                             # %for.inc564.i
                                        #   in Loop: Header=BB20_107 Depth=2
	mulsd	%xmm7, %xmm9
	mulsd	%xmm8, %xmm9
	movsd	160(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	subsd	%xmm9, %xmm2
	movsd	%xmm2, 160(%rsp)                # 8-byte Spill
	movapd	80(%rsp), %xmm2                 # 16-byte Reload
	addpd	%xmm3, %xmm2
	movapd	%xmm2, 80(%rsp)                 # 16-byte Spill
	movsd	96(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	addsd	%xmm5, %xmm2
	movsd	%xmm2, 96(%rsp)                 # 8-byte Spill
	movsd	240(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	addsd	%xmm1, %xmm2
	movsd	%xmm2, 240(%rsp)                # 8-byte Spill
	incq	%r13
	movslq	(%r12,%r14,4), %rcx
	addq	200(%rsp), %rcx                 # 8-byte Folded Reload
	movapd	%xmm0, %xmm1
	cmpq	%rcx, %r13
	jge	.LBB20_128
.LBB20_107:                             # %for.body409.i
                                        #   Parent Loop BB20_97 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	%xmm1, 216(%rsp)                # 8-byte Spill
	movq	(%r9,%r14,8), %rcx
	testq	%rcx, %rcx
	jne	.LBB20_109
# %bb.108:                              # %if.then414.i
                                        #   in Loop: Header=BB20_107 Depth=2
	movq	nabout@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rdi
	movl	$.L.str.82, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	callq	fflush@PLT
	movsd	152(%rsp), %xmm6                # 8-byte Reload
                                        # xmm6 = mem[0],zero
	movzbl	dim(%rip), %eax
	movq	8(%rsp), %rcx                   # 8-byte Reload
	movq	(%rcx,%r14,8), %rcx
.LBB20_109:                             # %if.end417.i
                                        #   in Loop: Header=BB20_107 Depth=2
	movslq	(%rcx,%r13,4), %r12
	movzbl	%al, %eax
	movl	%eax, %ebp
	andl	$1, %ebp
	addl	$3, %ebp
	imulq	%r12, %rbp
	movupd	(%r15,%rbp,8), %xmm0
	movapd	512(%rsp), %xmm2                # 16-byte Reload
	subpd	%xmm0, %xmm2
	movslq	%ebp, %rbx
	movsd	472(%rsp), %xmm3                # 8-byte Reload
                                        # xmm3 = mem[0],zero
	subsd	16(%r15,%rbx,8), %xmm3
	movapd	%xmm2, %xmm0
	mulpd	%xmm2, %xmm0
	unpckhpd	%xmm0, %xmm0                    # xmm0 = xmm0[1,1]
	movapd	%xmm2, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	%xmm0, %xmm1
	movapd	%xmm3, %xmm4
	mulsd	%xmm3, %xmm4
	addsd	%xmm1, %xmm4
	testb	$1, %al
	movapd	%xmm2, 176(%rsp)                # 16-byte Spill
	movsd	%xmm3, 304(%rsp)                # 8-byte Spill
	je	.LBB20_111
# %bb.110:                              # %if.then439.i
                                        #   in Loop: Header=BB20_107 Depth=2
	movsd	136(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	24(%r15,%rbx,8), %xmm0
	movsd	%xmm0, 264(%rsp)                # 8-byte Spill
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm4
.LBB20_111:                             # %if.end445.i
                                        #   in Loop: Header=BB20_107 Depth=2
	movsd	208(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movsd	%xmm4, 288(%rsp)                # 8-byte Spill
	movq	400(%rsp), %rax                 # 8-byte Reload
	movsd	(%rax,%r12,8), %xmm1            # xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, 32(%rsp)                 # 8-byte Spill
	movq	egb.reff(%rip), %rax
	movsd	(%rax,%r12,8), %xmm0            # xmm0 = mem[0],zero
	movapd	%xmm6, %xmm1
	movsd	%xmm0, 48(%rsp)                 # 8-byte Spill
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, 272(%rsp)                # 8-byte Spill
	mulsd	.LCPI20_22(%rip), %xmm1
	movapd	%xmm4, %xmm0
	divsd	%xmm1, %xmm0
	callq	exp@PLT
	movsd	%xmm0, 320(%rsp)                # 8-byte Spill
	mulsd	272(%rsp), %xmm0                # 8-byte Folded Reload
	addsd	288(%rsp), %xmm0                # 8-byte Folded Reload
	ucomisd	.LCPI20_35(%rip), %xmm0
	jb	.LBB20_113
# %bb.112:                              #   in Loop: Header=BB20_107 Depth=2
	sqrtsd	%xmm0, %xmm0
	jmp	.LBB20_114
	.p2align	4, 0x90
.LBB20_113:                             # %call.sqrt36
                                        #   in Loop: Header=BB20_107 Depth=2
	callq	sqrt@PLT
.LBB20_114:                             # %if.end445.i.split
                                        #   in Loop: Header=BB20_107 Depth=2
	movsd	.LCPI20_4(%rip), %xmm1          # xmm1 = mem[0],zero
	divsd	%xmm0, %xmm1
	movsd	%xmm1, 24(%rsp)                 # 8-byte Spill
	movsd	.LCPI20_20(%rip), %xmm0         # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, 336(%rsp)                # 8-byte Spill
	callq	exp@PLT
	movsd	24(%rsp), %xmm8                 # 8-byte Reload
                                        # xmm8 = mem[0],zero
	divsd	.LCPI20_21(%rip), %xmm0
	movsd	.LCPI20_4(%rip), %xmm2          # xmm2 = mem[0],zero
	movapd	%xmm2, %xmm9
	subsd	%xmm0, %xmm9
	movapd	%xmm8, %xmm1
	mulsd	%xmm8, %xmm1
	mulsd	%xmm8, %xmm1
	movsd	32(%rsp), %xmm7                 # 8-byte Reload
                                        # xmm7 = mem[0],zero
	mulsd	%xmm7, %xmm1
	mulsd	336(%rsp), %xmm0                # 8-byte Folded Reload
	addsd	%xmm9, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	320(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movapd	%xmm1, %xmm10
	mulsd	.LCPI20_9(%rip), %xmm10
	addsd	%xmm2, %xmm10
	mulsd	%xmm0, %xmm10
	mulsd	.LCPI20_5(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	288(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movapd	%xmm0, %xmm2
	mulsd	.LCPI20_23(%rip), %xmm2
	addsd	272(%rsp), %xmm2                # 8-byte Folded Reload
	mulsd	%xmm1, %xmm2
	movq	egb.sumdeijda(%rip), %rax
	movsd	152(%rsp), %xmm6                # 8-byte Reload
                                        # xmm6 = mem[0],zero
	movapd	%xmm6, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	(%rax,%r14,8), %xmm1
	movsd	%xmm1, (%rax,%r14,8)
	movsd	48(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm2, %xmm1
	addsd	(%rax,%r12,8), %xmm1
	movsd	%xmm1, (%rax,%r12,8)
	movq	egb.iexw(%rip), %rax
	movl	(%rax,%r12,4), %eax
	cmpq	%rax, %r14
	jne	.LBB20_116
# %bb.115:                              #   in Loop: Header=BB20_107 Depth=2
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movq	72(%rsp), %r12                  # 8-byte Reload
	movq	8(%rsp), %r9                    # 8-byte Reload
	jmp	.LBB20_122
	.p2align	4, 0x90
.LBB20_116:                             # %if.then492.i
                                        #   in Loop: Header=BB20_107 Depth=2
	ucomisd	.LCPI20_35(%rip), %xmm0
	jb	.LBB20_118
# %bb.117:                              #   in Loop: Header=BB20_107 Depth=2
	sqrtsd	%xmm0, %xmm0
	jmp	.LBB20_119
	.p2align	4, 0x90
.LBB20_118:                             # %call.sqrt37
                                        #   in Loop: Header=BB20_107 Depth=2
	movsd	%xmm9, 288(%rsp)                # 8-byte Spill
	movapd	%xmm10, 272(%rsp)               # 16-byte Spill
	callq	sqrt@PLT
	movapd	272(%rsp), %xmm10               # 16-byte Reload
	movsd	288(%rsp), %xmm9                # 8-byte Reload
                                        # xmm9 = mem[0],zero
	movsd	24(%rsp), %xmm8                 # 8-byte Reload
                                        # xmm8 = mem[0],zero
	movsd	32(%rsp), %xmm7                 # 8-byte Reload
                                        # xmm7 = mem[0],zero
	movsd	152(%rsp), %xmm6                # 8-byte Reload
                                        # xmm6 = mem[0],zero
.LBB20_119:                             # %if.then492.i.split
                                        #   in Loop: Header=BB20_107 Depth=2
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movq	8(%rsp), %r9                    # 8-byte Reload
	movsd	.LCPI20_4(%rip), %xmm1          # xmm1 = mem[0],zero
	divsd	%xmm0, %xmm1
	movapd	%xmm7, %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	%xmm1, %xmm1
	movsd	128(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	addsd	%xmm0, %xmm2
	movsd	%xmm2, 128(%rsp)                # 8-byte Spill
	mulsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm10
	movq	prm(%rip), %rax
	movq	440(%rax), %rcx
	movq	456(%rax), %rdx
	movl	(%rcx,%r12,4), %ecx
	addl	236(%rsp), %ecx                 # 4-byte Folded Reload
	movslq	%ecx, %rcx
	movl	(%rdx,%rcx,4), %ecx
	testl	%ecx, %ecx
	jle	.LBB20_121
# %bb.120:                              # %if.then510.i
                                        #   in Loop: Header=BB20_107 Depth=2
	decl	%ecx
	movapd	%xmm1, %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	%xmm1, %xmm0
	movq	328(%rax), %rdx
	movq	336(%rax), %rax
	movsd	(%rax,%rcx,8), %xmm2            # xmm2 = mem[0],zero
	mulsd	%xmm0, %xmm2
	movsd	(%rdx,%rcx,8), %xmm3            # xmm3 = mem[0],zero
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm3
	movapd	%xmm3, %xmm0
	subsd	%xmm2, %xmm0
	movsd	144(%rsp), %xmm5                # 8-byte Reload
                                        # xmm5 = mem[0],zero
	addsd	%xmm0, %xmm5
	movsd	%xmm5, 144(%rsp)                # 8-byte Spill
	mulsd	.LCPI20_24(%rip), %xmm2
	mulsd	.LCPI20_25(%rip), %xmm3
	addsd	%xmm2, %xmm3
	mulsd	%xmm1, %xmm3
	subsd	%xmm3, %xmm10
.LBB20_121:                             # %if.end528.i
                                        #   in Loop: Header=BB20_107 Depth=2
	movq	72(%rsp), %r12                  # 8-byte Reload
.LBB20_122:                             # %if.end528.i
                                        #   in Loop: Header=BB20_107 Depth=2
	movapd	176(%rsp), %xmm3                # 16-byte Reload
	movsd	304(%rsp), %xmm5                # 8-byte Reload
                                        # xmm5 = mem[0],zero
	leaq	2(%rbx), %rax
	movsd	264(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm10, %xmm1
	cmpb	$0, dim(%rip)
	movapd	%xmm1, %xmm0
	jne	.LBB20_124
# %bb.123:                              # %if.end528.i
                                        #   in Loop: Header=BB20_107 Depth=2
	movsd	216(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
.LBB20_124:                             # %if.end528.i
                                        #   in Loop: Header=BB20_107 Depth=2
	jne	.LBB20_126
# %bb.125:                              # %if.end528.i
                                        #   in Loop: Header=BB20_107 Depth=2
	movsd	.LCPI20_20(%rip), %xmm1         # xmm1 = mem[0],zero
.LBB20_126:                             # %if.end528.i
                                        #   in Loop: Header=BB20_107 Depth=2
	mulsd	%xmm10, %xmm5
	unpcklpd	%xmm10, %xmm10                  # xmm10 = xmm10[0,0]
	mulpd	%xmm10, %xmm3
	movq	224(%rsp), %rcx                 # 8-byte Reload
	movupd	(%rcx,%rbp,8), %xmm2
	subpd	%xmm3, %xmm2
	movupd	%xmm2, (%rcx,%rbp,8)
	movsd	(%rcx,%rax,8), %xmm2            # xmm2 = mem[0],zero
	subsd	%xmm5, %xmm2
	movsd	%xmm2, (%rcx,%rax,8)
	movzbl	dim(%rip), %eax
	cmpb	$1, %al
	jne	.LBB20_106
# %bb.127:                              # %if.then557.i
                                        #   in Loop: Header=BB20_107 Depth=2
	movq	224(%rsp), %rcx                 # 8-byte Reload
	movsd	24(%rcx,%rbx,8), %xmm2          # xmm2 = mem[0],zero
	subsd	%xmm0, %xmm2
	movsd	%xmm2, 24(%rcx,%rbx,8)
	jmp	.LBB20_106
	.p2align	4, 0x90
.LBB20_128:                             # %for.end566.i
                                        #   in Loop: Header=BB20_97 Depth=1
	movq	224(%rsp), %rax                 # 8-byte Reload
	movq	464(%rsp), %rcx                 # 8-byte Reload
	movupd	(%rax,%rcx,8), %xmm1
	movapd	80(%rsp), %xmm2                 # 16-byte Reload
	addpd	%xmm1, %xmm2
	movupd	%xmm2, (%rax,%rcx,8)
	movq	456(%rsp), %rdx                 # 8-byte Reload
	movsd	96(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	addsd	(%rax,%rdx,8), %xmm1
	movsd	%xmm1, (%rax,%rdx,8)
	cmpb	$1, dim(%rip)
	jne	.LBB20_130
# %bb.129:                              # %if.then583.i
                                        #   in Loop: Header=BB20_97 Depth=1
	movsd	240(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	addsd	24(%rax,%rcx,8), %xmm1
	movsd	%xmm1, 24(%rax,%rcx,8)
.LBB20_130:                             # %for.inc590.i
                                        #   in Loop: Header=BB20_97 Depth=1
	movq	40(%rsp), %rbx                  # 8-byte Reload
	movq	64(%rsp), %r13                  # 8-byte Reload
	jmp	.LBB20_96
.LBB20_131:
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 128(%rsp)                # 8-byte Spill
	movsd	%xmm0, 160(%rsp)                # 8-byte Spill
.LBB20_132:                             # %for.cond593.preheader.i
	movq	prm(%rip), %rax
	cmpl	$0, 96(%rax)
	jle	.LBB20_172
# %bb.133:                              # %for.body597.i.preheader
	movsd	.LCPI20_4(%rip), %xmm1          # xmm1 = mem[0],zero
	movsd	.LCPI20_0(%rip), %xmm5          # xmm5 = mem[0],zero
	xorl	%r14d, %r14d
	jmp	.LBB20_136
	.p2align	4, 0x90
.LBB20_134:                             # %for.inc894.i
                                        #   in Loop: Header=BB20_136 Depth=1
	movq	64(%rsp), %r13                  # 8-byte Reload
	movsd	.LCPI20_4(%rip), %xmm1          # xmm1 = mem[0],zero
.LBB20_135:                             # %for.inc894.i
                                        #   in Loop: Header=BB20_136 Depth=1
	incq	%r14
	movq	prm(%rip), %rax
	movslq	96(%rax), %rax
	cmpq	%rax, %r14
	jge	.LBB20_172
.LBB20_136:                             # %for.body597.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB20_145 Depth 2
	movq	frozen(%rip), %rax
	cmpl	$0, (%rax,%r14,4)
	jne	.LBB20_135
# %bb.137:                              # %for.body597.i
                                        #   in Loop: Header=BB20_136 Depth=1
	movl	(%rbx,%r14,4), %ebx
	addl	(%r12,%r14,4), %ebx
	testl	%ebx, %ebx
	jle	.LBB20_170
# %bb.138:                              # %if.end610.i
                                        #   in Loop: Header=BB20_136 Depth=1
	movzbl	dim(%rip), %eax
	leal	3(%rax), %ecx
	movl	%r14d, %r12d
	imull	%ecx, %r12d
	cmpl	$1, %eax
	jne	.LBB20_140
# %bb.139:                              # %if.then622.i
                                        #   in Loop: Header=BB20_136 Depth=1
	movsd	24(%r15,%r12,8), %xmm0          # xmm0 = mem[0],zero
	movsd	%xmm0, 136(%rsp)                # 8-byte Spill
.LBB20_140:                             # %if.end626.i
                                        #   in Loop: Header=BB20_136 Depth=1
	movups	(%r15,%r12,8), %xmm0
	movaps	%xmm0, 288(%rsp)                # 16-byte Spill
	movsd	16(%r15,%r12,8), %xmm0          # xmm0 = mem[0],zero
	movsd	%xmm0, 272(%rsp)                # 8-byte Spill
	movsd	(%r13,%r14,8), %xmm2            # xmm2 = mem[0],zero
	addsd	.LCPI20_3(%rip), %xmm2
	movq	egb.sumdeijda(%rip), %rax
	movsd	(%rax,%r14,8), %xmm0            # xmm0 = mem[0],zero
	cmpl	$2, gb(%rip)
	movapd	%xmm2, 304(%rsp)                # 16-byte Spill
	jl	.LBB20_142
# %bb.141:                              # %if.then635.i
                                        #   in Loop: Header=BB20_136 Depth=1
	movsd	gbalpha(%rip), %xmm1            # xmm1 = mem[0],zero
	movq	egb.psi(%rip), %rax
	movsd	(%rax,%r14,8), %xmm2            # xmm2 = mem[0],zero
	movapd	%xmm0, 320(%rsp)                # 16-byte Spill
	movsd	gbbeta(%rip), %xmm0             # xmm0 = mem[0],zero
	mulsd	%xmm2, %xmm0
	subsd	%xmm0, %xmm1
	movsd	gbgamma(%rip), %xmm0            # xmm0 = mem[0],zero
	mulsd	%xmm2, %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	mulsd	%xmm2, %xmm0
	callq	tanh@PLT
	movsd	.LCPI20_0(%rip), %xmm5          # xmm5 = mem[0],zero
	movq	8(%rsp), %r9                    # 8-byte Reload
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movq	egb.psi(%rip), %rax
	movsd	(%rax,%r14,8), %xmm1            # xmm1 = mem[0],zero
	movsd	gbbeta(%rip), %xmm2             # xmm2 = mem[0],zero
	mulsd	.LCPI20_26(%rip), %xmm2
	mulsd	%xmm1, %xmm2
	addsd	gbalpha(%rip), %xmm2
	movsd	gbgamma(%rip), %xmm3            # xmm3 = mem[0],zero
	mulsd	.LCPI20_27(%rip), %xmm3
	mulsd	%xmm1, %xmm3
	mulsd	%xmm1, %xmm3
	addsd	%xmm2, %xmm3
	movapd	304(%rsp), %xmm2                # 16-byte Reload
	mulsd	%xmm0, %xmm0
	movsd	.LCPI20_4(%rip), %xmm1          # xmm1 = mem[0],zero
	subsd	%xmm0, %xmm1
	movapd	320(%rsp), %xmm0                # 16-byte Reload
	mulsd	%xmm3, %xmm1
	mulsd	%xmm2, %xmm1
	divsd	(%r13,%r14,8), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	.LCPI20_4(%rip), %xmm1          # xmm1 = mem[0],zero
.LBB20_142:                             # %for.body677.lr.ph.i
                                        #   in Loop: Header=BB20_136 Depth=1
	movapd	%xmm0, 320(%rsp)                # 16-byte Spill
	movq	%r12, 152(%rsp)                 # 8-byte Spill
	leaq	2(%r12), %rax
	movq	%rax, 216(%rsp)                 # 8-byte Spill
	divsd	%xmm2, %xmm1
	movsd	%xmm1, 208(%rsp)                # 8-byte Spill
	movapd	%xmm2, %xmm0
	xorpd	.LCPI20_19(%rip), %xmm0
	movapd	%xmm0, 400(%rsp)                # 16-byte Spill
	movl	%ebx, %eax
	movq	%rax, 32(%rsp)                  # 8-byte Spill
	xorpd	%xmm0, %xmm0
	movapd	%xmm0, 240(%rsp)                # 16-byte Spill
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 80(%rsp)                 # 8-byte Spill
	xorl	%r13d, %r13d
	movapd	%xmm0, 336(%rsp)                # 16-byte Spill
	jmp	.LBB20_145
	.p2align	4, 0x90
.LBB20_143:                             #   in Loop: Header=BB20_145 Depth=2
	movq	72(%rsp), %r12                  # 8-byte Reload
.LBB20_144:                             # %for.inc864.i
                                        #   in Loop: Header=BB20_145 Depth=2
	incq	%r13
	cmpq	%r13, 32(%rsp)                  # 8-byte Folded Reload
	je	.LBB20_168
.LBB20_145:                             # %for.body677.i
                                        #   Parent Loop BB20_136 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%r9,%r14,8), %rax
	testq	%rax, %rax
	jne	.LBB20_147
# %bb.146:                              # %if.then682.i
                                        #   in Loop: Header=BB20_145 Depth=2
	movq	nabout@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rdi
	movl	$.L.str.83, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	callq	fflush@PLT
	movsd	.LCPI20_0(%rip), %xmm5          # xmm5 = mem[0],zero
	movq	8(%rsp), %r9                    # 8-byte Reload
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movq	(%r9,%r14,8), %rax
.LBB20_147:                             # %if.end685.i
                                        #   in Loop: Header=BB20_145 Depth=2
	movslq	(%rax,%r13,4), %r12
	movzbl	dim(%rip), %eax
	leal	3(%rax), %ebp
	imulq	%r12, %rbp
	movslq	%ebp, %rbx
	movupd	(%r15,%rbp,8), %xmm0
	movapd	288(%rsp), %xmm3                # 16-byte Reload
	subpd	%xmm0, %xmm3
	movsd	272(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	subsd	16(%r15,%rbx,8), %xmm2
	movapd	%xmm3, %xmm0
	mulpd	%xmm3, %xmm0
	unpckhpd	%xmm0, %xmm0                    # xmm0 = xmm0[1,1]
	movapd	%xmm3, %xmm1
	mulsd	%xmm3, %xmm1
	addsd	%xmm0, %xmm1
	movapd	%xmm2, %xmm8
	mulsd	%xmm2, %xmm8
	addsd	%xmm1, %xmm8
	cmpl	$1, %eax
	jne	.LBB20_149
# %bb.148:                              # %if.then707.i
                                        #   in Loop: Header=BB20_145 Depth=2
	movsd	136(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	24(%r15,%rbx,8), %xmm0
	movsd	%xmm0, 264(%rsp)                # 8-byte Spill
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm8
.LBB20_149:                             # %if.end713.i
                                        #   in Loop: Header=BB20_145 Depth=2
	ucomisd	56(%rsp), %xmm8                 # 8-byte Folded Reload
	ja	.LBB20_143
# %bb.150:                              # %if.end717.i
                                        #   in Loop: Header=BB20_145 Depth=2
	ucomisd	.LCPI20_35(%rip), %xmm8
	movsd	%xmm2, 24(%rsp)                 # 8-byte Spill
	movapd	%xmm3, 96(%rsp)                 # 16-byte Spill
	jb	.LBB20_152
# %bb.151:                              #   in Loop: Header=BB20_145 Depth=2
	xorps	%xmm0, %xmm0
	sqrtsd	%xmm8, %xmm0
	jmp	.LBB20_153
	.p2align	4, 0x90
.LBB20_152:                             # %call.sqrt38
                                        #   in Loop: Header=BB20_145 Depth=2
	movapd	%xmm8, %xmm0
	movsd	%xmm8, 48(%rsp)                 # 8-byte Spill
	callq	sqrt@PLT
	movsd	48(%rsp), %xmm8                 # 8-byte Reload
                                        # xmm8 = mem[0],zero
	movsd	.LCPI20_0(%rip), %xmm5          # xmm5 = mem[0],zero
	movq	8(%rsp), %r9                    # 8-byte Reload
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
.LBB20_153:                             # %if.end717.i.split
                                        #   in Loop: Header=BB20_145 Depth=2
	movsd	.LCPI20_4(%rip), %xmm6          # xmm6 = mem[0],zero
	divsd	%xmm0, %xmm6
	movapd	%xmm8, %xmm2
	mulsd	%xmm6, %xmm2
	movq	64(%rsp), %rax                  # 8-byte Reload
	movsd	(%rax,%r12,8), %xmm1            # xmm1 = mem[0],zero
	addsd	.LCPI20_3(%rip), %xmm1
	movq	392(%rsp), %rax                 # 8-byte Reload
	mulsd	(%rax,%r12,8), %xmm1
	movapd	%xmm1, %xmm0
	addsd	%xmm5, %xmm0
	ucomisd	%xmm0, %xmm2
	ja	.LBB20_143
# %bb.155:                              # %if.end733.i
                                        #   in Loop: Header=BB20_145 Depth=2
	movapd	%xmm6, %xmm7
	mulsd	%xmm6, %xmm7
	movapd	%xmm1, %xmm3
	mulsd	%xmm1, %xmm3
	movapd	%xmm5, %xmm0
	subsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm2
	movq	72(%rsp), %r12                  # 8-byte Reload
	jbe	.LBB20_157
# %bb.156:                              # %if.then737.i
                                        #   in Loop: Header=BB20_145 Depth=2
	subsd	%xmm1, %xmm2
	movsd	.LCPI20_4(%rip), %xmm0          # xmm0 = mem[0],zero
	divsd	%xmm2, %xmm0
	mulsd	%xmm7, %xmm6
	mulsd	.LCPI20_33(%rip), %xmm6
	movsd	%xmm6, 48(%rsp)                 # 8-byte Spill
	addsd	%xmm3, %xmm8
	movapd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm1
	addsd	.LCPI20_34(%rip), %xmm1
	mulsd	%xmm8, %xmm1
	movapd	%xmm1, 176(%rsp)                # 16-byte Spill
	mulsd	%xmm5, %xmm0
	callq	log@PLT
	movapd	176(%rsp), %xmm9                # 16-byte Reload
	movq	8(%rsp), %r9                    # 8-byte Reload
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	addsd	%xmm0, %xmm0
	subsd	%xmm0, %xmm9
	mulsd	48(%rsp), %xmm9                 # 8-byte Folded Reload
	jmp	.LBB20_165
.LBB20_157:                             # %if.else751.i
                                        #   in Loop: Header=BB20_145 Depth=2
	movapd	%xmm1, %xmm0
	mulsd	.LCPI20_6(%rip), %xmm0
	ucomisd	%xmm0, %xmm2
	jbe	.LBB20_159
# %bb.158:                              # %if.then755.i
                                        #   in Loop: Header=BB20_145 Depth=2
	mulsd	%xmm7, %xmm3
	movapd	%xmm3, %xmm0
	mulsd	.LCPI20_28(%rip), %xmm0
	addsd	.LCPI20_29(%rip), %xmm0
	mulsd	%xmm3, %xmm0
	addsd	.LCPI20_30(%rip), %xmm0
	mulsd	%xmm3, %xmm0
	addsd	.LCPI20_31(%rip), %xmm0
	mulsd	%xmm3, %xmm0
	addsd	.LCPI20_32(%rip), %xmm0
	mulsd	%xmm3, %xmm1
	mulsd	%xmm7, %xmm1
	mulsd	%xmm7, %xmm1
	mulsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm9
	jmp	.LBB20_165
.LBB20_159:                             # %if.else765.i
                                        #   in Loop: Header=BB20_145 Depth=2
	movapd	304(%rsp), %xmm5                # 16-byte Reload
	movapd	%xmm5, %xmm0
	addsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm2
	jbe	.LBB20_161
# %bb.160:                              # %if.then769.i
                                        #   in Loop: Header=BB20_145 Depth=2
	subsd	%xmm3, %xmm8
	movsd	.LCPI20_4(%rip), %xmm0          # xmm0 = mem[0],zero
	divsd	%xmm8, %xmm0
	movapd	%xmm1, %xmm3
	mulsd	%xmm0, %xmm3
	movapd	%xmm7, %xmm4
	mulsd	.LCPI20_8(%rip), %xmm4
	addsd	%xmm0, %xmm4
	mulsd	%xmm3, %xmm4
	movsd	%xmm4, 176(%rsp)                # 8-byte Spill
	mulsd	.LCPI20_23(%rip), %xmm6
	mulsd	%xmm7, %xmm6
	movsd	%xmm6, 48(%rsp)                 # 8-byte Spill
	movapd	%xmm2, %xmm0
	subsd	%xmm1, %xmm0
	addsd	%xmm1, %xmm2
	divsd	%xmm2, %xmm0
	callq	log@PLT
	movq	8(%rsp), %r9                    # 8-byte Reload
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movapd	%xmm0, %xmm9
	mulsd	48(%rsp), %xmm9                 # 8-byte Folded Reload
	addsd	176(%rsp), %xmm9                # 8-byte Folded Reload
	jmp	.LBB20_165
.LBB20_161:                             # %if.else782.i
                                        #   in Loop: Header=BB20_145 Depth=2
	movapd	%xmm5, %xmm0
	subsd	%xmm1, %xmm0
	andpd	.LCPI20_7(%rip), %xmm0
	ucomisd	%xmm0, %xmm2
	jbe	.LBB20_163
# %bb.162:                              # %if.then786.i
                                        #   in Loop: Header=BB20_145 Depth=2
	addsd	%xmm1, %xmm2
	movsd	.LCPI20_4(%rip), %xmm0          # xmm0 = mem[0],zero
	divsd	%xmm2, %xmm0
	mulsd	%xmm6, %xmm7
	movsd	%xmm7, 200(%rsp)                # 8-byte Spill
	movapd	400(%rsp), %xmm4                # 16-byte Reload
	mulsd	%xmm5, %xmm4
	addsd	%xmm8, %xmm4
	addsd	%xmm3, %xmm4
	mulsd	.LCPI20_8(%rip), %xmm4
	mulsd	%xmm7, %xmm4
	movsd	208(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	mulsd	%xmm2, %xmm4
	movapd	%xmm0, %xmm1
	subsd	%xmm6, %xmm1
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm6
	mulsd	%xmm2, %xmm4
	addsd	%xmm6, %xmm4
	movapd	%xmm4, 176(%rsp)                # 16-byte Spill
	mulsd	%xmm5, %xmm0
	callq	log@PLT
	movapd	176(%rsp), %xmm9                # 16-byte Reload
	movq	8(%rsp), %r9                    # 8-byte Reload
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	mulsd	200(%rsp), %xmm0                # 8-byte Folded Reload
	subsd	%xmm0, %xmm9
	mulsd	.LCPI20_9(%rip), %xmm9
	jmp	.LBB20_165
.LBB20_163:                             # %if.else805.i
                                        #   in Loop: Header=BB20_145 Depth=2
	xorpd	%xmm9, %xmm9
	ucomisd	%xmm5, %xmm1
	jbe	.LBB20_165
# %bb.164:                              # %if.then808.i
                                        #   in Loop: Header=BB20_145 Depth=2
	subsd	%xmm3, %xmm8
	movsd	.LCPI20_4(%rip), %xmm0          # xmm0 = mem[0],zero
	divsd	%xmm8, %xmm0
	movapd	%xmm7, %xmm4
	mulsd	%xmm1, %xmm4
	movapd	%xmm1, %xmm3
	mulsd	.LCPI20_26(%rip), %xmm3
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm4
	addsd	%xmm3, %xmm4
	movsd	%xmm4, 176(%rsp)                # 8-byte Spill
	movapd	%xmm1, %xmm0
	subsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm2
	divsd	%xmm2, %xmm0
	movsd	%xmm6, 48(%rsp)                 # 8-byte Spill
	movsd	%xmm7, 200(%rsp)                # 8-byte Spill
	callq	log@PLT
	movq	8(%rsp), %r9                    # 8-byte Reload
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movsd	.LCPI20_8(%rip), %xmm1          # xmm1 = mem[0],zero
	movsd	200(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	mulsd	%xmm1, %xmm2
	movsd	48(%rsp), %xmm9                 # 8-byte Reload
                                        # xmm9 = mem[0],zero
	mulsd	%xmm2, %xmm9
	mulsd	%xmm0, %xmm9
	addsd	176(%rsp), %xmm9                # 8-byte Folded Reload
	mulsd	%xmm1, %xmm9
	.p2align	4, 0x90
.LBB20_165:                             # %if.end831.i
                                        #   in Loop: Header=BB20_145 Depth=2
	leaq	2(%rbx), %rax
	movapd	%xmm9, %xmm0
	unpcklpd	%xmm9, %xmm0                    # xmm0 = xmm0[0],xmm9[0]
	movapd	96(%rsp), %xmm5                 # 16-byte Reload
	mulpd	%xmm5, %xmm0
	movapd	240(%rsp), %xmm1                # 16-byte Reload
	addpd	%xmm0, %xmm1
	movapd	%xmm1, 240(%rsp)                # 16-byte Spill
	movsd	24(%rsp), %xmm3                 # 8-byte Reload
                                        # xmm3 = mem[0],zero
	movapd	%xmm3, %xmm0
	mulsd	%xmm9, %xmm0
	movsd	80(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 80(%rsp)                 # 8-byte Spill
	movzbl	dim(%rip), %ecx
	movapd	320(%rsp), %xmm0                # 16-byte Reload
	mulsd	%xmm9, %xmm0
	movq	224(%rsp), %rdx                 # 8-byte Reload
	movupd	(%rdx,%rbp,8), %xmm1
	movapd	%xmm0, %xmm2
	unpcklpd	%xmm0, %xmm2                    # xmm2 = xmm2[0],xmm0[0]
	mulpd	%xmm5, %xmm2
	addpd	%xmm1, %xmm2
	movupd	%xmm2, (%rdx,%rbp,8)
	mulsd	%xmm0, %xmm3
	addsd	(%rdx,%rax,8), %xmm3
	movsd	%xmm3, (%rdx,%rax,8)
	cmpb	$1, %cl
	jne	.LBB20_167
# %bb.166:                              # %if.then857.i
                                        #   in Loop: Header=BB20_145 Depth=2
	movsd	264(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm9
	movapd	336(%rsp), %xmm2                # 16-byte Reload
	addsd	%xmm9, %xmm2
	movapd	%xmm2, 336(%rsp)                # 16-byte Spill
	mulsd	%xmm1, %xmm0
	addsd	24(%rdx,%rbx,8), %xmm0
	movsd	%xmm0, 24(%rdx,%rbx,8)
.LBB20_167:                             # %for.inc864.i
                                        #   in Loop: Header=BB20_145 Depth=2
	movsd	.LCPI20_0(%rip), %xmm5          # xmm5 = mem[0],zero
	jmp	.LBB20_144
	.p2align	4, 0x90
.LBB20_168:                             # %for.end866.i
                                        #   in Loop: Header=BB20_136 Depth=1
	movq	224(%rsp), %rax                 # 8-byte Reload
	movq	152(%rsp), %rcx                 # 8-byte Reload
	movupd	(%rax,%rcx,8), %xmm0
	movapd	320(%rsp), %xmm2                # 16-byte Reload
	movapd	%xmm2, %xmm1
	unpcklpd	%xmm2, %xmm1                    # xmm1 = xmm1[0],xmm2[0]
	mulpd	240(%rsp), %xmm1                # 16-byte Folded Reload
	subpd	%xmm1, %xmm0
	movupd	%xmm0, (%rax,%rcx,8)
	movq	216(%rsp), %rdx                 # 8-byte Reload
	movsd	(%rax,%rdx,8), %xmm0            # xmm0 = mem[0],zero
	movsd	80(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax,%rdx,8)
	cmpb	$1, dim(%rip)
	movq	40(%rsp), %rbx                  # 8-byte Reload
	jne	.LBB20_134
# %bb.169:                              # %if.then886.i
                                        #   in Loop: Header=BB20_136 Depth=1
	xorpd	.LCPI20_19(%rip), %xmm2
	mulsd	336(%rsp), %xmm2                # 16-byte Folded Reload
	addsd	24(%rax,%rcx,8), %xmm2
	movsd	%xmm2, 24(%rax,%rcx,8)
	jmp	.LBB20_134
	.p2align	4, 0x90
.LBB20_170:                             #   in Loop: Header=BB20_136 Depth=1
	movq	40(%rsp), %rbx                  # 8-byte Reload
	jmp	.LBB20_135
.LBB20_172:
	movq	360(%rsp), %r14                 # 8-byte Reload
.LBB20_173:                             # %if.end139
	movzbl	dim(%rip), %ecx
	leal	3(%rcx), %eax
	movq	prm(%rip), %rdx
	movl	96(%rdx), %esi
	imull	%eax, %esi
	testl	%esi, %esi
	movq	448(%rsp), %r9                  # 8-byte Reload
	jle	.LBB20_181
# %bb.174:                              # %for.body145.preheader
	movl	%esi, %edi
	movl	%edi, %edx
	andl	$3, %edx
	cmpl	$4, %esi
	jae	.LBB20_176
# %bb.175:
	xorl	%esi, %esi
	jmp	.LBB20_178
.LBB20_176:                             # %for.body145.preheader.new
	andl	$-4, %edi
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB20_177:                             # %for.body145
                                        # =>This Inner Loop Header: Depth=1
	movq	mme34.grad(%rip), %r8
	movsd	(%r8,%rsi,8), %xmm0             # xmm0 = mem[0],zero
	movsd	%xmm0, (%r9,%rsi,8)
	movq	mme34.grad(%rip), %r8
	movsd	8(%r8,%rsi,8), %xmm0            # xmm0 = mem[0],zero
	movsd	%xmm0, 8(%r9,%rsi,8)
	movsd	16(%r8,%rsi,8), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, 16(%r9,%rsi,8)
	movq	mme34.grad(%rip), %r8
	movsd	24(%r8,%rsi,8), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, 24(%r9,%rsi,8)
	addq	$4, %rsi
	cmpq	%rsi, %rdi
	jne	.LBB20_177
.LBB20_178:                             # %for.cond153.preheader.loopexit.unr-lcssa
	testq	%rdx, %rdx
	je	.LBB20_181
# %bb.179:                              # %for.body145.epil.preheader
	leaq	(%r9,%rsi,8), %rdi
	shlq	$3, %rsi
	addq	mme34.grad(%rip), %rsi
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB20_180:                             # %for.body145.epil
                                        # =>This Inner Loop Header: Depth=1
	movsd	(%rsi,%r8,8), %xmm0             # xmm0 = mem[0],zero
	movsd	%xmm0, (%rdi,%r8,8)
	incq	%r8
	cmpq	%r8, %rdx
	jne	.LBB20_180
.LBB20_181:                             # %for.cond153.preheader
	movq	prm(%rip), %rdx
	movl	96(%rdx), %edi
	testl	%edi, %edi
	jle	.LBB20_189
# %bb.182:                              # %for.body157.lr.ph
	movq	frozen(%rip), %rax
	xorl	%edx, %edx
	xorpd	%xmm0, %xmm0
	movl	%ecx, %esi
	jmp	.LBB20_185
	.p2align	4, 0x90
.LBB20_183:                             # %if.then176
                                        #   in Loop: Header=BB20_185 Depth=1
	leal	(,%rdx,4), %ecx
	movq	$0, 24(%r9,%rcx,8)
	movb	$1, %cl
	movb	$1, %sil
.LBB20_184:                             # %for.inc183
                                        #   in Loop: Header=BB20_185 Depth=1
	incq	%rdx
	movq	prm(%rip), %rdi
	movslq	96(%rdi), %rdi
	cmpq	%rdi, %rdx
	jge	.LBB20_188
.LBB20_185:                             # %for.body157
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%rax,%rdx,4)
	je	.LBB20_184
# %bb.186:                              # %if.then161
                                        #   in Loop: Header=BB20_185 Depth=1
	movzbl	%sil, %ecx
	andl	$1, %ecx
	addl	$3, %ecx
	imull	%edx, %ecx
	addl	$2, %ecx
	movq	$0, (%r9,%rcx,8)
	movzbl	dim(%rip), %ecx
	leal	3(%rcx), %esi
	imull	%edx, %esi
	movupd	%xmm0, (%r9,%rsi,8)
	cmpl	$1, %ecx
	je	.LBB20_183
# %bb.187:                              #   in Loop: Header=BB20_185 Depth=1
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	jmp	.LBB20_184
.LBB20_188:                             # %for.cond186.preheader.loopexit
	movzbl	%cl, %eax
	andl	$1, %eax
	addl	$3, %eax
.LBB20_189:                             # %for.cond186.preheader
	imull	%edi, %eax
	xorpd	%xmm1, %xmm1
	xorpd	%xmm0, %xmm0
	testl	%eax, %eax
	jle	.LBB20_197
# %bb.190:                              # %for.body191.preheader
	movl	%eax, %esi
	movl	%esi, %ecx
	andl	$3, %ecx
	cmpl	$4, %eax
	jae	.LBB20_192
# %bb.191:
	xorl	%edx, %edx
	jmp	.LBB20_194
.LBB20_192:                             # %for.body191.preheader.new
	andl	$-4, %esi
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB20_193:                             # %for.body191
                                        # =>This Inner Loop Header: Depth=1
	movsd	(%r9,%rdx,8), %xmm2             # xmm2 = mem[0],zero
	movsd	8(%r9,%rdx,8), %xmm3            # xmm3 = mem[0],zero
	mulsd	%xmm2, %xmm2
	addsd	%xmm0, %xmm2
	mulsd	%xmm3, %xmm3
	addsd	%xmm2, %xmm3
	movsd	16(%r9,%rdx,8), %xmm2           # xmm2 = mem[0],zero
	mulsd	%xmm2, %xmm2
	addsd	%xmm3, %xmm2
	movsd	24(%r9,%rdx,8), %xmm0           # xmm0 = mem[0],zero
	mulsd	%xmm0, %xmm0
	addsd	%xmm2, %xmm0
	addq	$4, %rdx
	cmpq	%rdx, %rsi
	jne	.LBB20_193
.LBB20_194:                             # %for.end199.loopexit.unr-lcssa
	testq	%rcx, %rcx
	je	.LBB20_197
# %bb.195:                              # %for.body191.epil.preheader
	leaq	(%r9,%rdx,8), %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB20_196:                             # %for.body191.epil
                                        # =>This Inner Loop Header: Depth=1
	movsd	(%rdx,%rsi,8), %xmm2            # xmm2 = mem[0],zero
	mulsd	%xmm2, %xmm2
	addsd	%xmm2, %xmm0
	incq	%rsi
	cmpq	%rsi, %rcx
	jne	.LBB20_196
.LBB20_197:                             # %for.end199
	movsd	192(%rsp), %xmm5                # 8-byte Reload
                                        # xmm5 = mem[0],zero
	addsd	440(%rsp), %xmm5                # 8-byte Folded Reload
	movsd	120(%rsp), %xmm6                # 8-byte Reload
                                        # xmm6 = mem[0],zero
	addsd	432(%rsp), %xmm6                # 8-byte Folded Reload
	xorps	%xmm2, %xmm2
	cvtsi2sd	%eax, %xmm2
	addsd	424(%rsp), %xmm4                # 8-byte Folded Reload
	divsd	%xmm2, %xmm0
	ucomisd	%xmm0, %xmm1
	ja	.LBB20_206
.LBB20_198:                             # %cdce.end
	xorpd	%xmm0, %xmm0
	movsd	144(%rsp), %xmm3                # 8-byte Reload
                                        # xmm3 = mem[0],zero
	addsd	%xmm0, %xmm3
	addsd	128(%rsp), %xmm3                # 8-byte Folded Reload
	addsd	%xmm5, %xmm3
	addsd	%xmm6, %xmm3
	addsd	%xmm4, %xmm3
	addsd	368(%rsp), %xmm3                # 8-byte Folded Reload
	addsd	376(%rsp), %xmm3                # 8-byte Folded Reload
	addsd	384(%rsp), %xmm3                # 8-byte Folded Reload
	addsd	160(%rsp), %xmm3                # 8-byte Folded Reload
	addsd	%xmm0, %xmm3
	movl	(%r14), %edx
	testl	%edx, %edx
	movapd	%xmm5, %xmm1
	movapd	%xmm6, %xmm2
	js	.LBB20_203
# %bb.199:                              # %land.lhs.true221
	je	.LBB20_201
# %bb.200:                              # %land.lhs.true221
	cmpl	max_step(%rip), %edx
	jne	.LBB20_202
.LBB20_201:                             # %if.then227
	movq	nabout@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rdi
	movl	$.L.str.66, %esi
	movapd	%xmm3, %xmm0
	movb	$1, %al
	movsd	%xmm1, 192(%rsp)                # 8-byte Spill
	movsd	%xmm2, 120(%rsp)                # 8-byte Spill
	movsd	%xmm4, 16(%rsp)                 # 8-byte Spill
	movsd	%xmm3, 8(%rsp)                  # 8-byte Spill
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	callq	fflush@PLT
	movsd	8(%rsp), %xmm3                  # 8-byte Reload
                                        # xmm3 = mem[0],zero
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movsd	120(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	movsd	192(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
.LBB20_202:                             # %if.end232thread-pre-split
	movl	(%r14), %edx
.LBB20_203:                             # %if.end232
	cmpl	$-1, %edx
	jne	.LBB20_205
# %bb.204:                              # %if.then235
	movq	nabout@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rdi
	movl	$.L.str.67, %esi
	movapd	%xmm1, %xmm0
	movb	$1, %al
	movsd	%xmm2, 120(%rsp)                # 8-byte Spill
	movsd	%xmm4, 16(%rsp)                 # 8-byte Spill
	movsd	%xmm3, 8(%rsp)                  # 8-byte Spill
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.68, %esi
	movsd	120(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.69, %esi
	movsd	16(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.70, %esi
	movsd	368(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.71, %esi
	movsd	376(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.72, %esi
	movsd	144(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.73, %esi
	movsd	128(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.74, %esi
	movsd	160(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.75, %esi
	movsd	384(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.76, %esi
	xorps	%xmm0, %xmm0
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.77, %esi
	movsd	8(%rsp), %xmm0                  # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	fprintf@PLT
	movsd	8(%rsp), %xmm3                  # 8-byte Reload
                                        # xmm3 = mem[0],zero
.LBB20_205:                             # %cleanup
	movapd	%xmm3, %xmm0
	addq	$536, %rsp                      # imm = 0x218
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
.LBB20_206:                             # %cdce.call
	.cfi_def_cfa_offset 592
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jae	.LBB20_198
# %bb.207:                              # %call.sqrt39
	movsd	%xmm4, 16(%rsp)                 # 8-byte Spill
	movsd	%xmm5, 192(%rsp)                # 8-byte Spill
	movsd	%xmm6, 120(%rsp)                # 8-byte Spill
	callq	sqrt@PLT
	movsd	120(%rsp), %xmm6                # 8-byte Reload
                                        # xmm6 = mem[0],zero
	movsd	192(%rsp), %xmm5                # 8-byte Reload
                                        # xmm5 = mem[0],zero
	movsd	16(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	jmp	.LBB20_198
.Lfunc_end20:
	.size	mme34, .Lfunc_end20-mme34
	.cfi_endproc
                                        # -- End function
	.globl	mme                             # -- Begin function mme
	.p2align	4, 0x90
	.type	mme,@function
mme:                                    # @mme
	.cfi_startproc
# %bb.0:                                # %entry
	movb	$0, dim(%rip)
	jmp	mme34                           # TAILCALL
.Lfunc_end21:
	.size	mme, .Lfunc_end21-mme
	.cfi_endproc
                                        # -- End function
	.globl	mme4                            # -- Begin function mme4
	.p2align	4, 0x90
	.type	mme4,@function
mme4:                                   # @mme4
	.cfi_startproc
# %bb.0:                                # %entry
	movb	$1, dim(%rip)
	jmp	mme34                           # TAILCALL
.Lfunc_end22:
	.size	mme4, .Lfunc_end22-mme4
	.cfi_endproc
                                        # -- End function
	.globl	mm_set_checkpoint               # -- Begin function mm_set_checkpoint
	.p2align	4, 0x90
	.type	mm_set_checkpoint,@function
mm_set_checkpoint:                      # @mm_set_checkpoint
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	(%rdi), %rbx
	movq	%rbx, %rdi
	callq	strlen@PLT
	leaq	1(%rax), %rdi
	callq	malloc@PLT
	movq	%rax, %r14
	testq	%rax, %rax
	je	.LBB23_2
# %bb.1:                                # %if.then.i
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	strcpy@PLT
.LBB23_2:                               # %spec_strdup.exit
	movq	%r14, chknm(%rip)
	movq	nabout@GOTPCREL(%rip), %r14
	movq	(%r14), %rdi
	movl	$.L.str.60, %esi
	movq	%rbx, %rdx
	xorl	%eax, %eax
	callq	fprintf@PLT
	movq	(%r14), %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	fflush@PLT                      # TAILCALL
.Lfunc_end23:
	.size	mm_set_checkpoint, .Lfunc_end23-mm_set_checkpoint
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function md
.LCPI24_0:
	.quad	0x3f50477081f334c0              # double 9.9359499999999989E-4
.LCPI24_1:
	.quad	0x4059000000000000              # double 100
.LCPI24_3:
	.quad	0x3ff0000000000000              # double 1
.LCPI24_5:
	.quad	0x3fb96f9fcb0c026c              # double 0.099359499999999989
.LCPI24_8:
	.quad	0xbf84f227d028a1df              # double -0.010227499999999999
.LCPI24_9:
	.quad	0x3f84f227d028a1df              # double 0.010227499999999999
.LCPI24_10:
	.quad	0x3fe0000000000000              # double 0.5
.LCPI24_11:
	.quad	0x3f847ae147ae147b              # double 0.01
.LCPI24_12:
	.quad	0xbff0000000000000              # double -1
.LCPI24_13:
	.quad	0x3f647ae147ae147b              # double 0.0025000000000000001
.LCPI24_17:
	.quad	0x4024000000000000              # double 10
.LCPI24_18:
	.quad	0xc024000000000000              # double -10
.LCPI24_19:
	.quad	0x3f94f227d028a1df              # double 0.020454999999999997
.LCPI24_20:
	.quad	0x3f50624dd2f1a9fc              # double 0.001
.LCPI24_21:
	.quad	0x0000000000000000              # double 0
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI24_2:
	.quad	0x3ff0000000000000              # double 1
	.quad	0x3ff0000000000000              # double 1
.LCPI24_4:
	.quad	0x3fb999999999999a              # double 0.10000000000000001
	.quad	0x3fb999999999999a              # double 0.10000000000000001
.LCPI24_6:
	.quad	0x8000000000000000              # double -0
	.quad	0x8000000000000000              # double -0
.LCPI24_7:
	.quad	0x3f84f227d028a1df              # double 0.010227499999999999
	.quad	0x3f84f227d028a1df              # double 0.010227499999999999
.LCPI24_14:
	.quad	0x4024000000000000              # double 10
	.quad	0x4024000000000000              # double 10
.LCPI24_15:
	.quad	0xc024000000000000              # double -10
	.quad	0xc024000000000000              # double -10
.LCPI24_16:
	.quad	0x3f94f227d028a1df              # double 0.020454999999999997
	.quad	0x3f94f227d028a1df              # double 0.020454999999999997
	.text
	.globl	md
	.p2align	4, 0x90
	.type	md,@function
md:                                     # @md
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
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r9, 32(%rsp)                   # 8-byte Spill
	movq	%r8, %r12
	movq	%rcx, %r14
	movq	%rdx, %r15
	movl	%esi, 44(%rsp)                  # 4-byte Spill
	movl	%edi, %r13d
	movq	md.minv(%rip), %rbx
	movl	md.nold(%rip), %ebp
	testq	%rbx, %rbx
	je	.LBB24_2
# %bb.1:                                # %entry
	cmpl	%r13d, %ebp
	jge	.LBB24_3
.LBB24_2:                               # %if.then
	movq	%rbx, %rdi
	callq	free@PLT
	movslq	%r13d, %rdi
	movl	$8, %esi
	callq	calloc@PLT
	movq	%rax, %rbx
	movq	%rax, md.minv(%rip)
	testq	%rax, %rax
	je	.LBB24_109
.LBB24_3:                               # %if.end9
	movq	md.xold(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB24_5
# %bb.4:                                # %if.end9
	cmpl	%r13d, %ebp
	jge	.LBB24_6
.LBB24_5:                               # %if.then15
	callq	free@PLT
	movslq	%r13d, %rdi
	movl	$8, %esi
	callq	calloc@PLT
	movq	%rax, md.xold(%rip)
	testq	%rax, %rax
	je	.LBB24_110
.LBB24_6:                               # %if.end43
	movq	md.accel(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB24_8
# %bb.7:                                # %if.end43
	cmpl	%r13d, %ebp
	jge	.LBB24_9
.LBB24_8:                               # %if.then49
	callq	free@PLT
	movslq	%r13d, %rdi
	movl	$8, %esi
	callq	calloc@PLT
	movq	%rax, md.accel(%rip)
	testq	%rax, %rax
	je	.LBB24_112
.LBB24_9:                               # %if.end59
	movl	%r13d, %eax
	movl	%r13d, %r13d
	movl	%eax, md.nold(%rip)
	movl	nfrozen(%rip), %ebp
	movq	$0, 96(%rsp)
	movq	prm(%rip), %rcx
	testq	%rcx, %rcx
	movl	%eax, 8(%rsp)                   # 4-byte Spill
	je	.LBB24_18
# %bb.10:                               # %if.then78
	movl	96(%rcx), %eax
	testl	%eax, %eax
	jle	.LBB24_35
# %bb.11:                               # %for.body.lr.ph.i
	movq	256(%rcx), %rcx
	cmpb	$0, dim(%rip)
	je	.LBB24_21
# %bb.12:                               # %for.body.us.i.preheader
	cmpl	$1, %eax
	je	.LBB24_15
# %bb.13:                               # %vector.memcheck274
	leaq	(%rcx,%rax,8), %rdx
	cmpq	%rdx, %rbx
	jae	.LBB24_54
# %bb.14:                               # %vector.memcheck274
	movq	%rax, %rdx
	shlq	$5, %rdx
	addq	%rbx, %rdx
	cmpq	%rdx, %rcx
	jae	.LBB24_54
.LBB24_15:
	xorl	%esi, %esi
	xorl	%edx, %edx
.LBB24_16:                              # %for.body.us.i.preheader372
	leaq	(%rbx,%rsi,8), %rsi
	addq	$24, %rsi
	movsd	.LCPI24_3(%rip), %xmm0          # xmm0 = mem[0],zero
	.p2align	4, 0x90
.LBB24_17:                              # %for.body.us.i
                                        # =>This Inner Loop Header: Depth=1
	movapd	%xmm0, %xmm1
	divsd	(%rcx,%rdx,8), %xmm1
	movsd	%xmm1, -24(%rsi)
	movsd	%xmm1, -16(%rsi)
	movsd	%xmm1, -8(%rsi)
	movsd	%xmm1, (%rsi)
	incq	%rdx
	addq	$32, %rsi
	cmpq	%rdx, %rax
	jne	.LBB24_17
	jmp	.LBB24_35
.LBB24_18:                              # %for.cond.preheader
	testl	%eax, %eax
	jle	.LBB24_47
# %bb.19:                               # %for.body.lr.ph
	cmpl	$4, 8(%rsp)                     # 4-byte Folded Reload
	jae	.LBB24_30
# %bb.20:
	xorl	%eax, %eax
	jmp	.LBB24_33
.LBB24_21:                              # %for.body.i.preheader
	cmpl	$1, %eax
	je	.LBB24_24
# %bb.22:                               # %vector.memcheck
	leaq	(%rcx,%rax,8), %rdx
	cmpq	%rdx, %rbx
	jae	.LBB24_57
# %bb.23:                               # %vector.memcheck
	leaq	(%rax,%rax,2), %rdx
	leaq	(%rbx,%rdx,8), %rdx
	cmpq	%rdx, %rcx
	jae	.LBB24_57
.LBB24_24:
	xorl	%esi, %esi
	xorl	%edx, %edx
.LBB24_25:                              # %for.body.i.preheader374
	movq	%rdx, %rdi
	notq	%rdi
	testb	$1, %al
	je	.LBB24_27
# %bb.26:                               # %for.body.i.prol
	movsd	.LCPI24_3(%rip), %xmm0          # xmm0 = mem[0],zero
	divsd	(%rcx,%rdx,8), %xmm0
	movsd	%xmm0, (%rbx,%rsi,8)
	movsd	%xmm0, 8(%rbx,%rsi,8)
	movsd	%xmm0, 16(%rbx,%rsi,8)
	addq	$3, %rsi
	orq	$1, %rdx
.LBB24_27:                              # %for.body.i.prol.loopexit
	addq	%rax, %rdi
	je	.LBB24_35
# %bb.28:                               # %for.body.i.preheader4
	leaq	(%rbx,%rsi,8), %rsi
	addq	$40, %rsi
	movsd	.LCPI24_3(%rip), %xmm0          # xmm0 = mem[0],zero
	.p2align	4, 0x90
.LBB24_29:                              # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	movapd	%xmm0, %xmm1
	divsd	(%rcx,%rdx,8), %xmm1
	movsd	%xmm1, -40(%rsi)
	movsd	%xmm1, -32(%rsi)
	movsd	%xmm1, -24(%rsi)
	movapd	%xmm0, %xmm1
	divsd	8(%rcx,%rdx,8), %xmm1
	movsd	%xmm1, -16(%rsi)
	movsd	%xmm1, -8(%rsi)
	movsd	%xmm1, (%rsi)
	addq	$2, %rdx
	addq	$48, %rsi
	cmpq	%rdx, %rax
	jne	.LBB24_29
	jmp	.LBB24_35
.LBB24_30:                              # %vector.ph299
	movl	%r13d, %eax
	andl	$-4, %eax
	movl	%r13d, %ecx
	shrl	$2, %ecx
	shlq	$5, %rcx
	xorl	%edx, %edx
	movapd	.LCPI24_4(%rip), %xmm0          # xmm0 = [1.0000000000000001E-1,1.0000000000000001E-1]
	.p2align	4, 0x90
.LBB24_31:                              # %vector.body304
                                        # =>This Inner Loop Header: Depth=1
	movupd	%xmm0, (%rbx,%rdx)
	movupd	%xmm0, 16(%rbx,%rdx)
	addq	$32, %rdx
	cmpq	%rdx, %rcx
	jne	.LBB24_31
# %bb.32:                               # %middle.block296
	cmpq	%r13, %rax
	je	.LBB24_35
.LBB24_33:                              # %for.body.preheader
	movabsq	$4591870180066957722, %rcx      # imm = 0x3FB999999999999A
	.p2align	4, 0x90
.LBB24_34:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%rcx, (%rbx,%rax,8)
	incq	%rax
	cmpq	%rax, %r13
	jne	.LBB24_34
.LBB24_35:                              # %if.then97
	cmpl	$0, 8(%rsp)                     # 4-byte Folded Reload
	setg	%al
	movl	%eax, 12(%rsp)                  # 4-byte Spill
	jle	.LBB24_47
# %bb.36:                               # %for.body101.preheader
	movq	%rbp, 24(%rsp)                  # 8-byte Spill
	movq	frozen(%rip), %rcx
	movzbl	dim(%rip), %esi
	xorl	%ebp, %ebp
	xorpd	%xmm1, %xmm1
	jmp	.LBB24_39
	.p2align	4, 0x90
.LBB24_37:                              # %if.then106
                                        #   in Loop: Header=BB24_39 Depth=1
	movq	$0, (%r12,%rbp,8)
.LBB24_38:                              # %for.inc128
                                        #   in Loop: Header=BB24_39 Depth=1
	incq	%rbp
	cmpq	%rbp, %r13
	je	.LBB24_44
.LBB24_39:                              # %for.body101
                                        # =>This Inner Loop Header: Depth=1
	movzbl	%sil, %edi
	andl	$1, %edi
	addl	$3, %edi
	movl	%ebp, %eax
	xorl	%edx, %edx
	divl	%edi
                                        # kill: def $eax killed $eax def $rax
	cmpl	$0, (%rcx,%rax,4)
	jne	.LBB24_37
# %bb.40:                               # %if.else109
                                        #   in Loop: Header=BB24_39 Depth=1
	movsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	movsd	(%rbx,%rbp,8), %xmm0            # xmm0 = mem[0],zero
	mulsd	.LCPI24_5(%rip), %xmm0
	ucomisd	.LCPI24_21(%rip), %xmm0
	jb	.LBB24_42
# %bb.41:                               #   in Loop: Header=BB24_39 Depth=1
	sqrtsd	%xmm0, %xmm0
	jmp	.LBB24_43
.LBB24_42:                              # %call.sqrt
                                        #   in Loop: Header=BB24_39 Depth=1
	callq	sqrt@PLT
.LBB24_43:                              # %if.else109.split
                                        #   in Loop: Header=BB24_39 Depth=1
	movsd	%xmm0, 104(%rsp)
	leaq	96(%rsp), %rdi
	leaq	104(%rsp), %rsi
	callq	gauss@PLT
	movsd	%xmm0, (%r12,%rbp,8)
	mulsd	%xmm0, %xmm0
	movq	md.minv(%rip), %rbx
	divsd	(%rbx,%rbp,8), %xmm0
	movsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	addsd	%xmm0, %xmm1
	movq	frozen(%rip), %rcx
	movzbl	dim(%rip), %esi
	jmp	.LBB24_38
.LBB24_44:                              # %if.end152
	movsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	movl	$0, (%rsp)
	movq	%rsp, %rdx
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	*32(%rsp)                       # 8-byte Folded Reload
	cmpl	$0, 8(%rsp)                     # 4-byte Folded Reload
	jle	.LBB24_48
# %bb.45:                               # %for.body164.lr.ph
	movq	md.minv(%rip), %rax
	movq	md.accel(%rip), %rcx
	cmpl	$6, %r13d
	movsd	16(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	jae	.LBB24_49
# %bb.46:
	xorl	%edx, %edx
	jmp	.LBB24_60
.LBB24_47:                              # %if.end152.thread
	movl	$0, (%rsp)
	movq	%rsp, %rdx
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	*32(%rsp)                       # 8-byte Folded Reload
	xorpd	%xmm5, %xmm5
	movl	$0, 12(%rsp)                    # 4-byte Folded Spill
	jmp	.LBB24_66
.LBB24_48:
	movl	$0, 12(%rsp)                    # 4-byte Folded Spill
	movq	24(%rsp), %rbp                  # 8-byte Reload
	movsd	16(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	jmp	.LBB24_66
.LBB24_49:                              # %vector.memcheck307
	movq	%rcx, %rsi
	subq	%r14, %rsi
	xorl	%edx, %edx
	cmpq	$32, %rsi
	jb	.LBB24_60
# %bb.50:                               # %vector.memcheck307
	movq	%rcx, %rsi
	subq	%rax, %rsi
	cmpq	$32, %rsi
	movq	24(%rsp), %rbp                  # 8-byte Reload
	jb	.LBB24_61
# %bb.51:                               # %vector.ph313
	movl	%r13d, %edx
	andl	$-4, %edx
	movl	%r13d, %esi
	shrl	$2, %esi
	shlq	$5, %rsi
	xorl	%edi, %edi
	movapd	.LCPI24_6(%rip), %xmm0          # xmm0 = [-0.0E+0,-0.0E+0]
	movapd	.LCPI24_7(%rip), %xmm1          # xmm1 = [1.0227499999999999E-2,1.0227499999999999E-2]
	.p2align	4, 0x90
.LBB24_52:                              # %vector.body318
                                        # =>This Inner Loop Header: Depth=1
	movupd	(%r14,%rdi), %xmm2
	movupd	16(%r14,%rdi), %xmm3
	xorpd	%xmm0, %xmm2
	xorpd	%xmm0, %xmm3
	movupd	(%rax,%rdi), %xmm4
	mulpd	%xmm2, %xmm4
	movupd	16(%rax,%rdi), %xmm2
	mulpd	%xmm3, %xmm2
	mulpd	%xmm1, %xmm4
	mulpd	%xmm1, %xmm2
	movupd	%xmm4, (%rcx,%rdi)
	movupd	%xmm2, 16(%rcx,%rdi)
	addq	$32, %rdi
	cmpq	%rdi, %rsi
	jne	.LBB24_52
# %bb.53:                               # %middle.block310
	cmpq	%r13, %rdx
	je	.LBB24_66
	jmp	.LBB24_61
.LBB24_60:
	movq	24(%rsp), %rbp                  # 8-byte Reload
.LBB24_61:                              # %for.body164.preheader
	movq	%rdx, %rsi
	notq	%rsi
	testb	$1, %r13b
	je	.LBB24_63
# %bb.62:                               # %for.body164.prol
	movsd	(%rax,%rdx,8), %xmm0            # xmm0 = mem[0],zero
	mulsd	(%r14,%rdx,8), %xmm0
	mulsd	.LCPI24_8(%rip), %xmm0
	movsd	%xmm0, (%rcx,%rdx,8)
	orq	$1, %rdx
.LBB24_63:                              # %for.body164.prol.loopexit
	addq	%r13, %rsi
	je	.LBB24_66
# %bb.64:                               # %for.body164.preheader2
	movapd	.LCPI24_6(%rip), %xmm0          # xmm0 = [-0.0E+0,-0.0E+0]
	movsd	.LCPI24_9(%rip), %xmm1          # xmm1 = mem[0],zero
	.p2align	4, 0x90
.LBB24_65:                              # %for.body164
                                        # =>This Inner Loop Header: Depth=1
	movsd	(%r14,%rdx,8), %xmm2            # xmm2 = mem[0],zero
	xorpd	%xmm0, %xmm2
	mulsd	(%rax,%rdx,8), %xmm2
	mulsd	%xmm1, %xmm2
	movsd	%xmm2, (%rcx,%rdx,8)
	movsd	8(%r14,%rdx,8), %xmm2           # xmm2 = mem[0],zero
	xorpd	%xmm0, %xmm2
	mulsd	8(%rax,%rdx,8), %xmm2
	mulsd	%xmm1, %xmm2
	movsd	%xmm2, 8(%rcx,%rdx,8)
	addq	$2, %rdx
	cmpq	%rdx, %r13
	jne	.LBB24_65
.LBB24_66:                              # %if.end213
	movl	44(%rsp), %eax                  # 4-byte Reload
	movl	%eax, max_step(%rip)
	movl	$1, (%rsp)
	testl	%eax, %eax
	jle	.LBB24_108
# %bb.67:                               # %for.body217.lr.ph
	leal	(%rbp,%rbp,2), %eax
	movl	8(%rsp), %edx                   # 4-byte Reload
	movl	%edx, %ecx
	subl	%eax, %ecx
	xorps	%xmm0, %xmm0
	cvtsi2sd	%ecx, %xmm0
	mulsd	.LCPI24_0(%rip), %xmm0
	mulsd	.LCPI24_1(%rip), %xmm0
	movsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	(,%r13,8), %rax
	movq	%rax, 88(%rsp)                  # 8-byte Spill
	leaq	(%r12,%r13,8), %rcx
	leaq	(%r15,%r13,8), %rax
	movl	%r13d, %esi
	andl	$-4, %esi
	movq	%rsi, 48(%rsp)                  # 8-byte Spill
	movl	%r13d, %esi
	andl	$3, %esi
	movq	%rsi, 16(%rsp)                  # 8-byte Spill
	movq	%rax, 72(%rsp)                  # 8-byte Spill
	cmpq	%r12, %rax
	seta	%al
	leaq	-1(%r13), %rsi
	movq	%rsi, 56(%rsp)                  # 8-byte Spill
	movq	%rcx, 80(%rsp)                  # 8-byte Spill
	cmpq	%r15, %rcx
	seta	%cl
	andb	%al, %cl
	movb	%cl, 7(%rsp)                    # 1-byte Spill
	movl	%r13d, %eax
	andl	$-2, %eax
	movq	%rax, 64(%rsp)                  # 8-byte Spill
	movl	%edx, %ebp
	shrl	$2, %ebp
	shlq	$5, %rbp
	movl	%edx, %ebx
	shrl	%ebx
	shlq	$4, %rbx
	movapd	.LCPI24_14(%rip), %xmm6         # xmm6 = [1.0E+1,1.0E+1]
	movapd	.LCPI24_15(%rip), %xmm7         # xmm7 = [-1.0E+1,-1.0E+1]
	movapd	.LCPI24_16(%rip), %xmm8         # xmm8 = [2.0454999999999997E-2,2.0454999999999997E-2]
	jmp	.LBB24_70
	.p2align	4, 0x90
.LBB24_68:                              # %if.end329.thread
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rsp, %rdx
	callq	*32(%rsp)                       # 8-byte Folded Reload
	movapd	.LCPI24_16(%rip), %xmm8         # xmm8 = [2.0454999999999997E-2,2.0454999999999997E-2]
	movapd	.LCPI24_15(%rip), %xmm7         # xmm7 = [-1.0E+1,-1.0E+1]
	movapd	.LCPI24_14(%rip), %xmm6         # xmm6 = [1.0E+1,1.0E+1]
	xorpd	%xmm5, %xmm5
.LBB24_69:                              # %if.end420
                                        #   in Loop: Header=BB24_70 Depth=1
	movsd	t(%rip), %xmm0                  # xmm0 = mem[0],zero
	addsd	.LCPI24_20(%rip), %xmm0
	movsd	%xmm0, t(%rip)
	movl	(%rsp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, (%rsp)
	cmpl	44(%rsp), %eax                  # 4-byte Folded Reload
	jge	.LBB24_108
.LBB24_70:                              # %for.body217
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB24_78 Depth 2
                                        #     Child Loop BB24_83 Depth 2
                                        #     Child Loop BB24_85 Depth 2
                                        #     Child Loop BB24_92 Depth 2
                                        #     Child Loop BB24_95 Depth 2
                                        #     Child Loop BB24_98 Depth 2
                                        #     Child Loop BB24_104 Depth 2
                                        #     Child Loop BB24_107 Depth 2
	mulsd	.LCPI24_10(%rip), %xmm5
	ucomisd	.LCPI24_11(%rip), %xmm5
	movsd	.LCPI24_3(%rip), %xmm0          # xmm0 = mem[0],zero
	jbe	.LBB24_73
# %bb.71:                               # %if.then220
                                        #   in Loop: Header=BB24_70 Depth=1
	movsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	divsd	%xmm5, %xmm0
	addsd	.LCPI24_12(%rip), %xmm0
	mulsd	.LCPI24_13(%rip), %xmm0
	addsd	.LCPI24_3(%rip), %xmm0
	ucomisd	.LCPI24_21(%rip), %xmm0
	jb	.LBB24_74
# %bb.72:                               #   in Loop: Header=BB24_70 Depth=1
	sqrtsd	%xmm0, %xmm0
.LBB24_73:                              # %if.end226
                                        #   in Loop: Header=BB24_70 Depth=1
	cmpb	$0, 12(%rsp)                    # 1-byte Folded Reload
	je	.LBB24_68
	jmp	.LBB24_75
	.p2align	4, 0x90
.LBB24_74:                              # %call.sqrt130
                                        #   in Loop: Header=BB24_70 Depth=1
	callq	sqrt@PLT
	movapd	.LCPI24_16(%rip), %xmm8         # xmm8 = [2.0454999999999997E-2,2.0454999999999997E-2]
	movapd	.LCPI24_15(%rip), %xmm7         # xmm7 = [-1.0E+1,-1.0E+1]
	movapd	.LCPI24_14(%rip), %xmm6         # xmm6 = [1.0E+1,1.0E+1]
	cmpb	$0, 12(%rsp)                    # 1-byte Folded Reload
	je	.LBB24_68
.LBB24_75:                              # %for.body230.lr.ph
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	md.xold(%rip), %rax
	cmpl	$6, 8(%rsp)                     # 4-byte Folded Reload
	jb	.LBB24_80
# %bb.76:                               # %for.body230.lr.ph
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	%rax, %rcx
	subq	%r15, %rcx
	movl	$0, %edx
	cmpq	$32, %rcx
	jb	.LBB24_81
# %bb.77:                               # %vector.body365.preheader
                                        #   in Loop: Header=BB24_70 Depth=1
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB24_78:                              # %vector.body365
                                        #   Parent Loop BB24_70 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movupd	(%r15,%rcx), %xmm2
	movupd	16(%r15,%rcx), %xmm1
	movupd	%xmm2, (%rax,%rcx)
	movupd	%xmm1, 16(%rax,%rcx)
	addq	$32, %rcx
	cmpq	%rcx, %rbp
	jne	.LBB24_78
# %bb.79:                               # %middle.block357
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	48(%rsp), %rcx                  # 8-byte Reload
	movq	%rcx, %rdx
	cmpq	%r13, %rcx
	jne	.LBB24_81
	jmp	.LBB24_86
.LBB24_80:                              #   in Loop: Header=BB24_70 Depth=1
	xorl	%edx, %edx
.LBB24_81:                              # %for.body230.preheader
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	%rdx, %rcx
	cmpq	$0, 16(%rsp)                    # 8-byte Folded Reload
	je	.LBB24_84
# %bb.82:                               # %for.body230.prol.preheader
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	16(%rsp), %rsi                  # 8-byte Reload
	movq	%rdx, %rcx
	.p2align	4, 0x90
.LBB24_83:                              # %for.body230.prol
                                        #   Parent Loop BB24_70 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	(%r15,%rcx,8), %xmm1            # xmm1 = mem[0],zero
	movsd	%xmm1, (%rax,%rcx,8)
	incq	%rcx
	decq	%rsi
	jne	.LBB24_83
.LBB24_84:                              # %for.body230.prol.loopexit
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	56(%rsp), %rsi                  # 8-byte Reload
	subq	%rdx, %rsi
	cmpq	$3, %rsi
	jb	.LBB24_86
	.p2align	4, 0x90
.LBB24_85:                              # %for.body230
                                        #   Parent Loop BB24_70 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	(%r15,%rcx,8), %xmm1            # xmm1 = mem[0],zero
	movsd	%xmm1, (%rax,%rcx,8)
	movsd	8(%r15,%rcx,8), %xmm1           # xmm1 = mem[0],zero
	movsd	%xmm1, 8(%rax,%rcx,8)
	movsd	16(%r15,%rcx,8), %xmm1          # xmm1 = mem[0],zero
	movsd	%xmm1, 16(%rax,%rcx,8)
	movsd	24(%r15,%rcx,8), %xmm1          # xmm1 = mem[0],zero
	movsd	%xmm1, 24(%rax,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %r13
	jne	.LBB24_85
.LBB24_86:                              # %for.cond241.preheader
                                        #   in Loop: Header=BB24_70 Depth=1
	cmpb	$0, 12(%rsp)                    # 1-byte Folded Reload
	je	.LBB24_68
# %bb.87:                               # %for.body244.lr.ph
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	md.accel(%rip), %rax
	cmpl	$6, 8(%rsp)                     # 4-byte Folded Reload
	jae	.LBB24_89
# %bb.88:                               #   in Loop: Header=BB24_70 Depth=1
	xorl	%ecx, %ecx
	movsd	.LCPI24_17(%rip), %xmm3         # xmm3 = mem[0],zero
	movsd	.LCPI24_18(%rip), %xmm4         # xmm4 = mem[0],zero
	movsd	.LCPI24_19(%rip), %xmm5         # xmm5 = mem[0],zero
	jmp	.LBB24_95
.LBB24_89:                              # %vector.memcheck325
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	88(%rsp), %rcx                  # 8-byte Reload
	addq	%rax, %rcx
	cmpq	%r12, %rcx
	seta	%dl
	cmpq	80(%rsp), %rax                  # 8-byte Folded Reload
	setb	%dil
	andb	%dl, %dil
	orb	7(%rsp), %dil                   # 1-byte Folded Reload
	cmpq	%r15, %rcx
	seta	%dl
	cmpq	72(%rsp), %rax                  # 8-byte Folded Reload
	setb	%sil
	testb	%dil, %dil
	movsd	.LCPI24_17(%rip), %xmm3         # xmm3 = mem[0],zero
	movsd	.LCPI24_18(%rip), %xmm4         # xmm4 = mem[0],zero
	movsd	.LCPI24_19(%rip), %xmm5         # xmm5 = mem[0],zero
	jne	.LBB24_94
# %bb.90:                               # %vector.memcheck325
                                        #   in Loop: Header=BB24_70 Depth=1
	movl	$0, %ecx
	andb	%sil, %dl
	jne	.LBB24_95
# %bb.91:                               # %vector.ph343
                                        #   in Loop: Header=BB24_70 Depth=1
	movapd	%xmm0, %xmm9
	unpcklpd	%xmm0, %xmm9                    # xmm9 = xmm9[0],xmm0[0]
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB24_92:                              # %vector.body348
                                        #   Parent Loop BB24_70 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movupd	(%r12,%rcx), %xmm1
	movupd	(%rax,%rcx), %xmm2
	addpd	%xmm1, %xmm2
	mulpd	%xmm9, %xmm2
	movapd	%xmm6, %xmm1
	minpd	%xmm2, %xmm1
	movapd	%xmm7, %xmm2
	maxpd	%xmm1, %xmm2
	movupd	%xmm2, (%r12,%rcx)
	movupd	(%r15,%rcx), %xmm1
	mulpd	%xmm8, %xmm2
	addpd	%xmm1, %xmm2
	movupd	%xmm2, (%r15,%rcx)
	addq	$16, %rcx
	cmpq	%rcx, %rbx
	jne	.LBB24_92
# %bb.93:                               # %middle.block340
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	64(%rsp), %rdx                  # 8-byte Reload
	movq	%rdx, %rcx
	cmpq	%r13, %rdx
	jne	.LBB24_95
	jmp	.LBB24_96
.LBB24_94:                              #   in Loop: Header=BB24_70 Depth=1
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB24_95:                              # %for.body244
                                        #   Parent Loop BB24_70 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	(%r12,%rcx,8), %xmm2            # xmm2 = mem[0],zero
	addsd	(%rax,%rcx,8), %xmm2
	mulsd	%xmm0, %xmm2
	movapd	%xmm3, %xmm1
	minsd	%xmm2, %xmm1
	movapd	%xmm4, %xmm2
	maxsd	%xmm1, %xmm2
	movsd	%xmm2, (%r12,%rcx,8)
	mulsd	%xmm5, %xmm2
	addsd	(%r15,%rcx,8), %xmm2
	movsd	%xmm2, (%r15,%rcx,8)
	incq	%rcx
	cmpq	%rcx, %r13
	jne	.LBB24_95
.LBB24_96:                              # %if.end329
                                        #   in Loop: Header=BB24_70 Depth=1
	movapd	%xmm0, 112(%rsp)                # 16-byte Spill
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rsp, %rdx
	callq	*32(%rsp)                       # 8-byte Folded Reload
	xorpd	%xmm5, %xmm5
	cmpb	$0, 12(%rsp)                    # 1-byte Folded Reload
	je	.LBB24_102
# %bb.97:                               # %for.body341.lr.ph
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	md.minv(%rip), %rax
	movq	md.accel(%rip), %rcx
	xorl	%edx, %edx
	movsd	.LCPI24_8(%rip), %xmm1          # xmm1 = mem[0],zero
	movapd	112(%rsp), %xmm2                # 16-byte Reload
	.p2align	4, 0x90
.LBB24_98:                              # %for.body341
                                        #   Parent Loop BB24_70 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	(%rax,%rdx,8), %xmm0            # xmm0 = mem[0],zero
	mulsd	(%r14,%rdx,8), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rcx,%rdx,8)
	movsd	(%r12,%rdx,8), %xmm0            # xmm0 = mem[0],zero
	movq	md.accel(%rip), %rcx
	addsd	(%rcx,%rdx,8), %xmm0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, (%r12,%rdx,8)
	incq	%rdx
	cmpq	%rdx, %r13
	jne	.LBB24_98
# %bb.99:                               # %for.cond399.preheader
                                        #   in Loop: Header=BB24_70 Depth=1
	cmpb	$0, 12(%rsp)                    # 1-byte Folded Reload
	movapd	.LCPI24_14(%rip), %xmm6         # xmm6 = [1.0E+1,1.0E+1]
	movapd	.LCPI24_15(%rip), %xmm7         # xmm7 = [-1.0E+1,-1.0E+1]
	movapd	.LCPI24_16(%rip), %xmm8         # xmm8 = [2.0454999999999997E-2,2.0454999999999997E-2]
	je	.LBB24_69
# %bb.100:                              # %for.body402.lr.ph
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	md.minv(%rip), %rax
	cmpq	$3, 56(%rsp)                    # 8-byte Folded Reload
	jae	.LBB24_103
# %bb.101:                              #   in Loop: Header=BB24_70 Depth=1
	xorpd	%xmm5, %xmm5
	xorl	%ecx, %ecx
	jmp	.LBB24_105
.LBB24_102:                             #   in Loop: Header=BB24_70 Depth=1
	movapd	.LCPI24_14(%rip), %xmm6         # xmm6 = [1.0E+1,1.0E+1]
	movapd	.LCPI24_15(%rip), %xmm7         # xmm7 = [-1.0E+1,-1.0E+1]
	movapd	.LCPI24_16(%rip), %xmm8         # xmm8 = [2.0454999999999997E-2,2.0454999999999997E-2]
	jmp	.LBB24_69
.LBB24_103:                             # %for.body402.preheader
                                        #   in Loop: Header=BB24_70 Depth=1
	xorpd	%xmm5, %xmm5
	xorl	%ecx, %ecx
	movq	48(%rsp), %rdx                  # 8-byte Reload
	.p2align	4, 0x90
.LBB24_104:                             # %for.body402
                                        #   Parent Loop BB24_70 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	(%r12,%rcx,8), %xmm0            # xmm0 = mem[0],zero
	movsd	8(%r12,%rcx,8), %xmm1           # xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm0
	divsd	(%rax,%rcx,8), %xmm0
	addsd	%xmm5, %xmm0
	mulsd	%xmm1, %xmm1
	divsd	8(%rax,%rcx,8), %xmm1
	addsd	%xmm0, %xmm1
	movsd	16(%r12,%rcx,8), %xmm0          # xmm0 = mem[0],zero
	mulsd	%xmm0, %xmm0
	divsd	16(%rax,%rcx,8), %xmm0
	movsd	24(%r12,%rcx,8), %xmm5          # xmm5 = mem[0],zero
	mulsd	%xmm5, %xmm5
	divsd	24(%rax,%rcx,8), %xmm5
	addsd	%xmm1, %xmm0
	addsd	%xmm0, %xmm5
	addq	$4, %rcx
	cmpq	%rcx, %rdx
	jne	.LBB24_104
.LBB24_105:                             # %if.end420.loopexit.unr-lcssa
                                        #   in Loop: Header=BB24_70 Depth=1
	testb	$3, %r13b
	je	.LBB24_69
# %bb.106:                              # %for.body402.epil.preheader
                                        #   in Loop: Header=BB24_70 Depth=1
	leaq	(%rax,%rcx,8), %rax
	leaq	(%r12,%rcx,8), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB24_107:                             # %for.body402.epil
                                        #   Parent Loop BB24_70 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	(%rcx,%rdx,8), %xmm0            # xmm0 = mem[0],zero
	mulsd	%xmm0, %xmm0
	divsd	(%rax,%rdx,8), %xmm0
	addsd	%xmm0, %xmm5
	incq	%rdx
	cmpq	%rdx, 16(%rsp)                  # 8-byte Folded Reload
	jne	.LBB24_107
	jmp	.LBB24_69
.LBB24_108:                             # %for.end439
	movl	$-3, (%rsp)
	movq	%rsp, %rdx
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	*32(%rsp)                       # 8-byte Folded Reload
	xorl	%eax, %eax
	addq	$136, %rsp
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
.LBB24_54:                              # %vector.ph283
	.cfi_def_cfa_offset 192
	movl	%eax, %edx
	andl	$-2, %edx
	leaq	(,%rdx,4), %rsi
	xorl	%edi, %edi
	movapd	.LCPI24_2(%rip), %xmm0          # xmm0 = [1.0E+0,1.0E+0]
	movq	%rbx, %r8
	.p2align	4, 0x90
.LBB24_55:                              # %vector.body290
                                        # =>This Inner Loop Header: Depth=1
	movupd	(%rcx,%rdi,8), %xmm1
	movapd	%xmm0, %xmm2
	divpd	%xmm1, %xmm2
	movapd	%xmm2, %xmm1
	unpcklpd	%xmm2, %xmm1                    # xmm1 = xmm1[0],xmm2[0]
	unpckhpd	%xmm2, %xmm2                    # xmm2 = xmm2[1,1]
	movupd	%xmm2, 48(%r8)
	movupd	%xmm2, 32(%r8)
	movupd	%xmm1, 16(%r8)
	movupd	%xmm1, (%r8)
	addq	$2, %rdi
	addq	$64, %r8
	cmpq	%rdi, %rdx
	jne	.LBB24_55
# %bb.56:                               # %middle.block280
	cmpq	%rax, %rdx
	jne	.LBB24_16
	jmp	.LBB24_35
.LBB24_57:                              # %vector.ph
	movl	%eax, %edx
	andl	$-2, %edx
	leaq	(%rdx,%rdx,2), %rsi
	xorl	%edi, %edi
	movapd	.LCPI24_2(%rip), %xmm0          # xmm0 = [1.0E+0,1.0E+0]
	movq	%rbx, %r8
	.p2align	4, 0x90
.LBB24_58:                              # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movupd	(%rcx,%rdi,8), %xmm1
	movapd	%xmm0, %xmm2
	divpd	%xmm1, %xmm2
	movapd	%xmm2, %xmm1
	unpcklpd	%xmm2, %xmm1                    # xmm1 = xmm1[0],xmm2[0]
	movupd	%xmm2, 16(%r8)
	unpckhpd	%xmm2, %xmm2                    # xmm2 = xmm2[1,1]
	movupd	%xmm2, 32(%r8)
	movupd	%xmm1, (%r8)
	addq	$2, %rdi
	addq	$48, %r8
	cmpq	%rdi, %rdx
	jne	.LBB24_58
# %bb.59:                               # %middle.block
	cmpq	%rax, %rdx
	jne	.LBB24_25
	jmp	.LBB24_35
.LBB24_109:                             # %if.then5
	movq	stderr@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rcx
	movl	$.L.str.61, %edi
	jmp	.LBB24_111
.LBB24_110:                             # %if.then20
	movq	stderr@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rcx
	movl	$.L.str.62, %edi
.LBB24_111:                             # %if.then5
	movl	$34, %esi
	jmp	.LBB24_113
.LBB24_112:                             # %if.then54
	movq	stderr@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rcx
	movl	$.L.str.64, %edi
	movl	$35, %esi
.LBB24_113:                             # %if.then5
	movl	$1, %edx
	callq	fwrite@PLT
	movq	(%rbx), %rdi
	callq	fflush@PLT
	movl	$1, %edi
	callq	exit@PLT
.Lfunc_end24:
	.size	md, .Lfunc_end24-md
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function ebond
.LCPI25_0:
	.quad	0x4000000000000000              # double 2
	.text
	.p2align	4, 0x90
	.type	ebond,@function
ebond:                                  # @ebond
	.cfi_startproc
# %bb.0:                                # %entry
	testl	%edi, %edi
	jle	.LBB25_1
# %bb.3:                                # %for.body.preheader
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
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	152(%rsp), %rbx
	movq	144(%rsp), %rbp
	movl	%edi, %eax
	movq	%rax, 56(%rsp)                  # 8-byte Spill
	xorpd	%xmm5, %xmm5
	movzbl	dim(%rip), %eax
	xorl	%r15d, %r15d
	movsd	.LCPI25_0(%rip), %xmm7          # xmm7 = mem[0],zero
	xorpd	%xmm6, %xmm6
                                        # implicit-def: $xmm0
                                        # kill: killed $xmm0
	movq	%rcx, 24(%rsp)                  # 8-byte Spill
	movq	%r9, 16(%rsp)                   # 8-byte Spill
	movq	%rsi, 8(%rsp)                   # 8-byte Spill
	jmp	.LBB25_4
	.p2align	4, 0x90
.LBB25_11:                              # %if.then80
                                        #   in Loop: Header=BB25_4 Depth=1
	mulsd	40(%rsp), %xmm2                 # 8-byte Folded Reload
	movsd	24(%rbx,%r13,8), %xmm3          # xmm3 = mem[0],zero
	addsd	%xmm2, %xmm3
	movsd	%xmm3, 24(%rbx,%r13,8)
	movsd	24(%rbx,%r12,8), %xmm3          # xmm3 = mem[0],zero
	subsd	%xmm2, %xmm3
	movsd	%xmm3, 24(%rbx,%r12,8)
	movzbl	dim(%rip), %eax
.LBB25_12:                              # %for.inc
                                        #   in Loop: Header=BB25_4 Depth=1
	mulsd	%xmm1, %xmm0
	addsd	%xmm0, %xmm6
	incq	%r15
	cmpq	%r15, 56(%rsp)                  # 8-byte Folded Reload
	je	.LBB25_13
.LBB25_4:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movzbl	%al, %eax
	movl	%eax, %edi
	andl	$1, %edi
	addl	$3, %edi
	movl	(%rsi,%r15,4), %r10d
	imull	%edi, %r10d
	movslq	%r10d, %r10
	imulq	$1431655766, %r10, %r10         # imm = 0x55555556
	movq	%r10, %r11
	shrq	$63, %r11
	shrq	$32, %r10
	addl	%r11d, %r10d
	imull	(%rdx,%r15,4), %edi
	movslq	%edi, %rdi
	imulq	$1431655766, %rdi, %rdi         # imm = 0x55555556
	movq	%rdi, %r11
	shrq	$63, %r11
	shrq	$32, %rdi
	addl	%r11d, %edi
	movslq	%r10d, %r13
	movslq	%edi, %r12
	movupd	(%rbp,%r13,8), %xmm8
	movupd	(%rbp,%r12,8), %xmm0
	subpd	%xmm0, %xmm8
	movsd	16(%rbp,%r13,8), %xmm9          # xmm9 = mem[0],zero
	subsd	16(%rbp,%r12,8), %xmm9
	movapd	%xmm8, %xmm0
	mulpd	%xmm8, %xmm0
	unpckhpd	%xmm0, %xmm0                    # xmm0 = xmm0[1,1]
	movapd	%xmm8, %xmm1
	mulsd	%xmm8, %xmm1
	addsd	%xmm0, %xmm1
	movapd	%xmm9, %xmm0
	mulsd	%xmm9, %xmm0
	addsd	%xmm1, %xmm0
	testb	$1, %al
	je	.LBB25_6
# %bb.5:                                # %if.then
                                        #   in Loop: Header=BB25_4 Depth=1
	movsd	24(%rbp,%r13,8), %xmm1          # xmm1 = mem[0],zero
	subsd	24(%rbp,%r12,8), %xmm1
	movsd	%xmm1, 40(%rsp)                 # 8-byte Spill
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
.LBB25_6:                               # %if.end
                                        #   in Loop: Header=BB25_4 Depth=1
	movslq	(%rcx,%r15,4), %r14
	ucomisd	%xmm5, %xmm0
	jb	.LBB25_8
# %bb.7:                                #   in Loop: Header=BB25_4 Depth=1
	sqrtsd	%xmm0, %xmm0
	jmp	.LBB25_9
	.p2align	4, 0x90
.LBB25_8:                               # %call.sqrt
                                        #   in Loop: Header=BB25_4 Depth=1
	movq	%r8, %rbp
	movq	%rdx, %rbx
	movsd	%xmm6, 48(%rsp)                 # 8-byte Spill
	movapd	%xmm8, 64(%rsp)                 # 16-byte Spill
	movsd	%xmm9, 32(%rsp)                 # 8-byte Spill
	callq	sqrt@PLT
	movsd	32(%rsp), %xmm9                 # 8-byte Reload
                                        # xmm9 = mem[0],zero
	movapd	64(%rsp), %xmm8                 # 16-byte Reload
	movsd	.LCPI25_0(%rip), %xmm7          # xmm7 = mem[0],zero
	movsd	48(%rsp), %xmm6                 # 8-byte Reload
                                        # xmm6 = mem[0],zero
	xorpd	%xmm5, %xmm5
	movq	8(%rsp), %rsi                   # 8-byte Reload
	movq	%rbx, %rdx
	movq	152(%rsp), %rbx
	movq	24(%rsp), %rcx                  # 8-byte Reload
	movq	%rbp, %r8
	movq	144(%rsp), %rbp
	movq	16(%rsp), %r9                   # 8-byte Reload
.LBB25_9:                               # %if.end.split
                                        #   in Loop: Header=BB25_4 Depth=1
	leaq	2(%r13), %rdi
	leaq	2(%r12), %rax
	movapd	%xmm7, %xmm2
	divsd	%xmm0, %xmm2
	subsd	-8(%r9,%r14,8), %xmm0
	movsd	-8(%r8,%r14,8), %xmm1           # xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm1
	mulsd	%xmm1, %xmm2
	movupd	(%rbx,%r13,8), %xmm3
	movapd	%xmm2, %xmm4
	unpcklpd	%xmm2, %xmm4                    # xmm4 = xmm4[0],xmm2[0]
	mulpd	%xmm4, %xmm8
	addpd	%xmm8, %xmm3
	movupd	%xmm3, (%rbx,%r13,8)
	mulsd	%xmm2, %xmm9
	movsd	(%rbx,%rdi,8), %xmm3            # xmm3 = mem[0],zero
	addsd	%xmm9, %xmm3
	movsd	%xmm3, (%rbx,%rdi,8)
	movupd	(%rbx,%r12,8), %xmm3
	subpd	%xmm8, %xmm3
	movupd	%xmm3, (%rbx,%r12,8)
	movsd	(%rbx,%rax,8), %xmm3            # xmm3 = mem[0],zero
	subsd	%xmm9, %xmm3
	movsd	%xmm3, (%rbx,%rax,8)
	cmpb	$1, dim(%rip)
	je	.LBB25_11
# %bb.10:                               #   in Loop: Header=BB25_4 Depth=1
	xorl	%eax, %eax
	jmp	.LBB25_12
.LBB25_13:
	addq	$88, %rsp
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
	.cfi_restore %rbx
	.cfi_restore %r12
	.cfi_restore %r13
	.cfi_restore %r14
	.cfi_restore %r15
	.cfi_restore %rbp
	movapd	%xmm6, %xmm0
	retq
.LBB25_1:
	xorps	%xmm0, %xmm0
	retq
.Lfunc_end25:
	.size	ebond, .Lfunc_end25-ebond
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          # -- Begin function eangl
.LCPI26_0:
	.quad	0x3ff0000000000000              # double 1
	.quad	0x3ff0000000000000              # double 1
.LCPI26_5:
	.quad	0x8000000000000000              # double -0
	.quad	0x8000000000000000              # double -0
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI26_1:
	.quad	0x3ff0000000000000              # double 1
.LCPI26_2:
	.quad	0xbff0000000000000              # double -1
.LCPI26_3:
	.quad	0x3f50624dd2f1a9fc              # double 0.001
.LCPI26_4:
	.quad	0xbf50624dd2f1a9fc              # double -0.001
	.text
	.p2align	4, 0x90
	.type	eangl,@function
eangl:                                  # @eangl
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
	subq	$280, %rsp                      # imm = 0x118
	.cfi_def_cfa_offset 336
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r9, 104(%rsp)                  # 8-byte Spill
	movq	%r8, 96(%rsp)                   # 8-byte Spill
	movq	%rcx, 88(%rsp)                  # 8-byte Spill
	movq	%rdx, 80(%rsp)                  # 8-byte Spill
	movq	%rsi, 72(%rsp)                  # 8-byte Spill
	testl	%edi, %edi
	jle	.LBB26_1
# %bb.2:                                # %for.body.preheader
	movq	344(%rsp), %r8
	movl	%edi, %eax
	movq	%rax, 64(%rsp)                  # 8-byte Spill
	xorpd	%xmm3, %xmm3
	movzbl	dim(%rip), %eax
	xorl	%r14d, %r14d
	xorpd	%xmm0, %xmm0
                                        # implicit-def: $xmm5
                                        # implicit-def: $xmm1
                                        # kill: killed $xmm1
	jmp	.LBB26_3
	.p2align	4, 0x90
.LBB26_18:                              # %if.then188
                                        #   in Loop: Header=BB26_3 Depth=1
	xorpd	%xmm4, %xmm11
	movdqa	%xmm5, %xmm1
	punpckhqdq	%xmm5, %xmm1            # xmm1 = xmm1[1],xmm5[1]
	movapd	%xmm11, %xmm2
	mulsd	%xmm1, %xmm2
	addsd	%xmm5, %xmm2
	mulsd	%xmm13, %xmm2
	mulsd	%xmm5, %xmm11
	addsd	%xmm1, %xmm11
	mulsd	%xmm0, %xmm11
	movsd	24(%r9,%r13,8), %xmm0           # xmm0 = mem[0],zero
	addsd	%xmm2, %xmm0
	movsd	%xmm0, 24(%r9,%r13,8)
	addsd	%xmm11, %xmm2
	addsd	24(%r9,%r12,8), %xmm11
	movsd	%xmm11, 24(%r9,%r12,8)
	movsd	24(%r9,%r15,8), %xmm0           # xmm0 = mem[0],zero
	subsd	%xmm2, %xmm0
	movsd	%xmm0, 24(%r9,%r15,8)
	movzbl	dim(%rip), %eax
.LBB26_19:                              # %for.inc
                                        #   in Loop: Header=BB26_3 Depth=1
	movq	344(%rsp), %r8
	movsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm9, %xmm1
	movsd	120(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	incq	%r14
	cmpq	%r14, 64(%rsp)                  # 8-byte Folded Reload
	je	.LBB26_20
.LBB26_3:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movsd	%xmm0, 120(%rsp)                # 8-byte Spill
	movzbl	%al, %eax
	movl	%eax, %edx
	andl	$1, %edx
	addl	$3, %edx
	movq	72(%rsp), %rcx                  # 8-byte Reload
	movl	(%rcx,%r14,4), %ecx
	imull	%edx, %ecx
	movslq	%ecx, %rcx
	imulq	$1431655766, %rcx, %rcx         # imm = 0x55555556
	movq	%rcx, %rsi
	shrq	$63, %rsi
	shrq	$32, %rcx
	addl	%esi, %ecx
	movq	80(%rsp), %rsi                  # 8-byte Reload
	movl	(%rsi,%r14,4), %esi
	imull	%edx, %esi
	movslq	%esi, %rsi
	imulq	$1431655766, %rsi, %rsi         # imm = 0x55555556
	movq	%rsi, %rdi
	shrq	$63, %rdi
	shrq	$32, %rsi
	addl	%edi, %esi
	movq	88(%rsp), %rdi                  # 8-byte Reload
	imull	(%rdi,%r14,4), %edx
	movslq	%edx, %rdx
	imulq	$1431655766, %rdx, %rdx         # imm = 0x55555556
	movq	%rdx, %rdi
	shrq	$63, %rdi
	shrq	$32, %rdx
	addl	%edi, %edx
	movslq	%ecx, %r13
	movslq	%esi, %r15
	movslq	%edx, %r12
	movsd	(%r8,%r12,8), %xmm7             # xmm7 = mem[0],zero
	movsd	8(%r8,%r12,8), %xmm6            # xmm6 = mem[0],zero
	movsd	16(%r8,%r12,8), %xmm4           # xmm4 = mem[0],zero
	movhpd	(%r8,%r13,8), %xmm7             # xmm7 = xmm7[0],mem[0]
	movsd	(%r8,%r15,8), %xmm0             # xmm0 = mem[0],zero
	movsd	8(%r8,%r15,8), %xmm1            # xmm1 = mem[0],zero
	movsd	16(%r8,%r15,8), %xmm2           # xmm2 = mem[0],zero
	unpcklpd	%xmm0, %xmm0                    # xmm0 = xmm0[0,0]
	movhpd	8(%r8,%r13,8), %xmm6            # xmm6 = xmm6[0],mem[0]
	subpd	%xmm0, %xmm7
	unpcklpd	%xmm1, %xmm1                    # xmm1 = xmm1[0,0]
	movhpd	16(%r8,%r13,8), %xmm4           # xmm4 = xmm4[0],mem[0]
	subpd	%xmm1, %xmm6
	unpcklpd	%xmm2, %xmm2                    # xmm2 = xmm2[0,0]
	subpd	%xmm2, %xmm4
	movapd	%xmm6, 32(%rsp)                 # 16-byte Spill
	movapd	%xmm6, %xmm0
	mulpd	%xmm6, %xmm0
	movapd	%xmm7, 16(%rsp)                 # 16-byte Spill
	movapd	%xmm7, %xmm1
	mulpd	%xmm7, %xmm1
	addpd	%xmm0, %xmm1
	movapd	%xmm4, 48(%rsp)                 # 16-byte Spill
	mulpd	%xmm4, %xmm4
	addpd	%xmm1, %xmm4
	testb	$1, %al
	je	.LBB26_5
# %bb.4:                                # %if.then
                                        #   in Loop: Header=BB26_3 Depth=1
	movsd	24(%r8,%r12,8), %xmm1           # xmm1 = mem[0],zero
	movhpd	24(%r8,%r13,8), %xmm1           # xmm1 = xmm1[0],mem[0]
	movsd	24(%r8,%r15,8), %xmm0           # xmm0 = mem[0],zero
	unpcklpd	%xmm0, %xmm0                    # xmm0 = xmm0[0,0]
	subpd	%xmm0, %xmm1
	movapd	%xmm1, 128(%rsp)                # 16-byte Spill
	movapd	%xmm1, %xmm0
	mulpd	%xmm1, %xmm0
	addpd	%xmm0, %xmm4
.LBB26_5:                               # %if.end
                                        #   in Loop: Header=BB26_3 Depth=1
	movq	96(%rsp), %rax                  # 8-byte Reload
	movslq	(%rax,%r14,4), %rbx
	movapd	%xmm4, %xmm0
	unpckhpd	%xmm4, %xmm0                    # xmm0 = xmm0[1],xmm4[1]
	ucomisd	%xmm3, %xmm0
	movaps	%xmm5, 256(%rsp)                # 16-byte Spill
	jb	.LBB26_7
# %bb.6:                                #   in Loop: Header=BB26_3 Depth=1
	xorps	%xmm1, %xmm1
	sqrtsd	%xmm0, %xmm1
	ucomisd	%xmm3, %xmm4
	jae	.LBB26_9
.LBB26_10:                              # %call.sqrt4
                                        #   in Loop: Header=BB26_3 Depth=1
	movapd	%xmm4, %xmm0
	movapd	%xmm1, (%rsp)                   # 16-byte Spill
	callq	sqrt@PLT
	movapd	(%rsp), %xmm1                   # 16-byte Reload
	jmp	.LBB26_11
	.p2align	4, 0x90
.LBB26_7:                               # %call.sqrt
                                        #   in Loop: Header=BB26_3 Depth=1
	movapd	%xmm4, (%rsp)                   # 16-byte Spill
	callq	sqrt@PLT
	movapd	(%rsp), %xmm4                   # 16-byte Reload
	xorpd	%xmm3, %xmm3
	movapd	%xmm0, %xmm1
	ucomisd	%xmm3, %xmm4
	jb	.LBB26_10
.LBB26_9:                               #   in Loop: Header=BB26_3 Depth=1
	xorps	%xmm0, %xmm0
	sqrtsd	%xmm4, %xmm0
.LBB26_11:                              # %if.end.split.split
                                        #   in Loop: Header=BB26_3 Depth=1
	unpcklpd	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0]
	movapd	.LCPI26_0(%rip), %xmm6          # xmm6 = [1.0E+0,1.0E+0]
	divpd	%xmm0, %xmm6
	movapd	16(%rsp), %xmm3                 # 16-byte Reload
	mulpd	%xmm6, %xmm3
	movapd	%xmm3, %xmm5
	unpckhpd	%xmm3, %xmm5                    # xmm5 = xmm5[1],xmm3[1]
	movapd	48(%rsp), %xmm2                 # 16-byte Reload
	mulpd	%xmm6, %xmm2
	movapd	%xmm2, %xmm4
	unpckhpd	%xmm2, %xmm4                    # xmm4 = xmm4[1],xmm2[1]
	movapd	32(%rsp), %xmm1                 # 16-byte Reload
	mulpd	%xmm6, %xmm1
	movapd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm0                    # xmm0 = xmm0[1],xmm1[1]
	movapd	%xmm0, 208(%rsp)                # 16-byte Spill
	movapd	%xmm1, 32(%rsp)                 # 16-byte Spill
	mulsd	%xmm1, %xmm0
	movapd	%xmm5, 176(%rsp)                # 16-byte Spill
	movapd	%xmm5, %xmm1
	movapd	%xmm3, 16(%rsp)                 # 16-byte Spill
	mulsd	%xmm3, %xmm1
	addsd	%xmm0, %xmm1
	movapd	%xmm4, 240(%rsp)                # 16-byte Spill
	movapd	%xmm4, %xmm0
	movapd	%xmm2, 48(%rsp)                 # 16-byte Spill
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movzbl	dim(%rip), %ebp
	movapd	128(%rsp), %xmm2                # 16-byte Reload
	mulpd	%xmm6, %xmm2
	testb	%bpl, %bpl
	movapd	%xmm2, 144(%rsp)                # 16-byte Spill
	je	.LBB26_13
# %bb.12:                               #   in Loop: Header=BB26_3 Depth=1
	movapd	%xmm2, %xmm1
	unpckhpd	%xmm2, %xmm1                    # xmm1 = xmm1[1],xmm2[1]
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
.LBB26_13:                              # %if.end.split.split
                                        #   in Loop: Header=BB26_3 Depth=1
	movsd	.LCPI26_1(%rip), %xmm1          # xmm1 = mem[0],zero
	minsd	%xmm0, %xmm1
	movapd	%xmm6, 160(%rsp)                # 16-byte Spill
	movapd	%xmm6, %xmm0
	unpckhpd	%xmm6, %xmm0                    # xmm0 = xmm0[1],xmm6[1]
	movapd	%xmm0, 192(%rsp)                # 16-byte Spill
	movsd	.LCPI26_2(%rip), %xmm0          # xmm0 = mem[0],zero
	maxsd	%xmm1, %xmm0
	movapd	%xmm0, 224(%rsp)                # 16-byte Spill
	callq	acos@PLT
	movapd	%xmm0, %xmm1
	movq	336(%rsp), %rax
	subsd	-8(%rax,%rbx,8), %xmm1
	movq	104(%rsp), %rax                 # 8-byte Reload
	movsd	-8(%rax,%rbx,8), %xmm2          # xmm2 = mem[0],zero
	movsd	%xmm1, (%rsp)                   # 8-byte Spill
	mulsd	%xmm1, %xmm2
	movsd	%xmm2, 112(%rsp)                # 8-byte Spill
	callq	sin@PLT
	xorpd	%xmm3, %xmm3
	ucomisd	%xmm3, %xmm0
	jbe	.LBB26_15
# %bb.14:                               # %if.end.split.split
                                        #   in Loop: Header=BB26_3 Depth=1
	movsd	.LCPI26_3(%rip), %xmm1          # xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	ja	.LBB26_16
.LBB26_15:                              # %if.else
                                        #   in Loop: Header=BB26_3 Depth=1
	movsd	.LCPI26_4(%rip), %xmm2          # xmm2 = mem[0],zero
	minsd	%xmm0, %xmm2
	movapd	%xmm0, %xmm1
	cmpltsd	%xmm3, %xmm1
	andpd	%xmm1, %xmm2
	andnpd	%xmm0, %xmm1
	orpd	%xmm2, %xmm1
.LBB26_16:                              # %if.end114
                                        #   in Loop: Header=BB26_3 Depth=1
	leaq	1(%r13), %r8
	leaq	1(%r15), %rsi
	leaq	2(%r13), %rdx
	leaq	2(%r15), %rax
	leaq	1(%r12), %rdi
	leaq	2(%r12), %rcx
	movzbl	%bpl, %r9d
	movd	%r9d, %xmm0
	pshufd	$0, %xmm0, %xmm0                # xmm0 = xmm0[0,0,0,0]
	pslld	$31, %xmm0
	psrad	$31, %xmm0
	movdqa	144(%rsp), %xmm2                # 16-byte Reload
	pand	%xmm0, %xmm2
	pandn	256(%rsp), %xmm0                # 16-byte Folded Reload
	movdqa	%xmm0, %xmm5
	por	%xmm2, %xmm5
	movsd	112(%rsp), %xmm9                # 8-byte Reload
                                        # xmm9 = mem[0],zero
	movapd	%xmm9, %xmm0
	addsd	%xmm9, %xmm0
	movapd	.LCPI26_5(%rip), %xmm4          # xmm4 = [-0.0E+0,-0.0E+0]
	xorpd	%xmm4, %xmm0
	divsd	%xmm1, %xmm0
	movapd	192(%rsp), %xmm13               # 16-byte Reload
	mulsd	%xmm0, %xmm13
	movapd	224(%rsp), %xmm11               # 16-byte Reload
	movapd	%xmm11, %xmm1
	movapd	176(%rsp), %xmm14               # 16-byte Reload
	mulsd	%xmm14, %xmm1
	movapd	%xmm11, %xmm2
	movapd	16(%rsp), %xmm8                 # 16-byte Reload
	mulsd	%xmm8, %xmm2
	subsd	%xmm1, %xmm8
	mulsd	%xmm13, %xmm8
	mulsd	160(%rsp), %xmm0                # 16-byte Folded Reload
	subsd	%xmm2, %xmm14
	mulsd	%xmm0, %xmm14
	movapd	%xmm11, %xmm1
	movapd	208(%rsp), %xmm12               # 16-byte Reload
	mulsd	%xmm12, %xmm1
	movapd	%xmm11, %xmm2
	movapd	32(%rsp), %xmm7                 # 16-byte Reload
	mulsd	%xmm7, %xmm2
	subsd	%xmm1, %xmm7
	mulsd	%xmm13, %xmm7
	subsd	%xmm2, %xmm12
	mulsd	%xmm0, %xmm12
	movapd	%xmm11, %xmm1
	movapd	240(%rsp), %xmm10               # 16-byte Reload
	mulsd	%xmm10, %xmm1
	movapd	%xmm11, %xmm2
	movapd	48(%rsp), %xmm6                 # 16-byte Reload
	mulsd	%xmm6, %xmm2
	subsd	%xmm1, %xmm6
	mulsd	%xmm13, %xmm6
	subsd	%xmm2, %xmm10
	mulsd	%xmm0, %xmm10
	movq	352(%rsp), %r9
	movsd	(%r9,%r13,8), %xmm1             # xmm1 = mem[0],zero
	addsd	%xmm8, %xmm1
	movsd	%xmm1, (%r9,%r13,8)
	addsd	%xmm14, %xmm8
	addsd	(%r9,%r12,8), %xmm14
	movsd	%xmm14, (%r9,%r12,8)
	movsd	(%r9,%r15,8), %xmm1             # xmm1 = mem[0],zero
	subsd	%xmm8, %xmm1
	movsd	%xmm1, (%r9,%r15,8)
	movsd	(%r9,%r8,8), %xmm1              # xmm1 = mem[0],zero
	addsd	%xmm7, %xmm1
	movsd	%xmm1, (%r9,%r8,8)
	addsd	%xmm12, %xmm7
	addsd	(%r9,%rdi,8), %xmm12
	movsd	%xmm12, (%r9,%rdi,8)
	movsd	(%r9,%rsi,8), %xmm1             # xmm1 = mem[0],zero
	subsd	%xmm7, %xmm1
	movsd	%xmm1, (%r9,%rsi,8)
	movsd	(%r9,%rdx,8), %xmm1             # xmm1 = mem[0],zero
	addsd	%xmm6, %xmm1
	movsd	%xmm1, (%r9,%rdx,8)
	addsd	%xmm10, %xmm6
	addsd	(%r9,%rcx,8), %xmm10
	movsd	%xmm10, (%r9,%rcx,8)
	movsd	(%r9,%rax,8), %xmm1             # xmm1 = mem[0],zero
	subsd	%xmm6, %xmm1
	movsd	%xmm1, (%r9,%rax,8)
	cmpb	$1, dim(%rip)
	je	.LBB26_18
# %bb.17:                               #   in Loop: Header=BB26_3 Depth=1
	xorl	%eax, %eax
	jmp	.LBB26_19
.LBB26_1:
	xorpd	%xmm0, %xmm0
.LBB26_20:                              # %for.end
	addq	$280, %rsp                      # imm = 0x118
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
.Lfunc_end26:
	.size	eangl, .Lfunc_end26-eangl
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          # -- Begin function ephi
.LCPI27_0:
	.quad	0x8000000000000000              # double -0
	.quad	0x8000000000000000              # double -0
.LCPI27_4:
	.quad	0x4000000000000000              # double 2
	.quad	0xc000000000000000              # double -2
.LCPI27_8:
	.quad	0x7fffffffffffffff              # double NaN
	.quad	0x7fffffffffffffff              # double NaN
.LCPI27_18:
	.quad	0x3ff0000000000000              # double 1
	.quad	0xbff0000000000000              # double -1
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI27_1:
	.quad	0xc000000000000000              # double -2
.LCPI27_2:
	.quad	0x3ff0000000000000              # double 1
.LCPI27_3:
	.quad	0x3fe0000000000000              # double 0.5
.LCPI27_5:
	.quad	0xbff0000000000000              # double -1
.LCPI27_6:
	.quad	0x400921fb5a7ed197              # double 3.1415926999999999
.LCPI27_7:
	.quad	0xc00921fb5a7ed197              # double -3.1415926999999999
.LCPI27_9:
	.quad	0x3f50624dd2f1a9fc              # double 0.001
.LCPI27_10:
	.quad	0x3fb999999999999a              # double 0.10000000000000001
.LCPI27_11:
	.quad	0x3ff921fb5a7ed197              # double 1.57079635
.LCPI27_12:
	.quad	0xbff921fb5a7ed197              # double -1.57079635
.LCPI27_13:
	.quad	0xc08f400000000000              # double -1000
.LCPI27_14:
	.quad	0x408f400000000000              # double 1000
.LCPI27_15:
	.quad	0x4018000000000000              # double 6
.LCPI27_16:
	.quad	0xc00922d0e5604189              # double -3.1419999999999999
.LCPI27_17:
	.quad	0x3f847ae147ae147b              # double 0.01
.LCPI27_19:
	.quad	0x4040000000000000              # double 32
.LCPI27_20:
	.quad	0xc048000000000000              # double -48
.LCPI27_21:
	.quad	0x4032000000000000              # double 18
.LCPI27_22:
	.quad	0x4068000000000000              # double 192
.LCPI27_23:
	.quad	0x4042000000000000              # double 36
.LCPI27_24:
	.quad	0x4020000000000000              # double 8
.LCPI27_25:
	.quad	0xc030000000000000              # double -16
.LCPI27_26:
	.quad	0x4010000000000000              # double 4
.LCPI27_27:
	.quad	0xc008000000000000              # double -3
.LCPI27_28:
	.quad	0x4028000000000000              # double 12
.LCPI27_29:
	.quad	0x0000000000000000              # double 0
	.text
	.p2align	4, 0x90
	.type	ephi,@function
ephi:                                   # @ephi
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
	subq	$648, %rsp                      # imm = 0x288
	.cfi_def_cfa_offset 704
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r9, 424(%rsp)                  # 8-byte Spill
	movq	%r8, 416(%rsp)                  # 8-byte Spill
	movq	%rdx, 408(%rsp)                 # 8-byte Spill
	movq	%rsi, 400(%rsp)                 # 8-byte Spill
	testl	%edi, %edi
	jle	.LBB27_1
# %bb.2:                                # %for.body.preheader
	movq	736(%rsp), %r13
	movq	728(%rsp), %r8
	movq	712(%rsp), %r9
	movl	%edi, %eax
	movq	%rax, 392(%rsp)                 # 8-byte Spill
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 448(%rsp)                # 16-byte Spill
	movzbl	dim(%rip), %eax
	xorl	%r11d, %r11d
                                        # implicit-def: $xmm0
                                        # kill: killed $xmm0
	xorpd	%xmm5, %xmm5
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 432(%rsp)                # 16-byte Spill
                                        # implicit-def: $xmm0
                                        # kill: killed $xmm0
	movq	%rcx, 104(%rsp)                 # 8-byte Spill
	jmp	.LBB27_3
	.p2align	4, 0x90
.LBB27_42:                              # %for.inc
                                        #   in Loop: Header=BB27_3 Depth=1
	incq	%r11
	cmpq	%r11, 392(%rsp)                 # 8-byte Folded Reload
	je	.LBB27_43
.LBB27_3:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movapd	%xmm5, %xmm6
	movzbl	%al, %eax
	movl	%eax, %esi
	andl	$1, %esi
	addl	$3, %esi
	movq	400(%rsp), %rdx                 # 8-byte Reload
	movl	(%rdx,%r11,4), %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	imulq	$1431655766, %rdx, %rbp         # imm = 0x55555556
	movq	%rbp, %rdx
	shrq	$63, %rdx
	shrq	$32, %rbp
	movq	%rdx, 48(%rsp)                  # 8-byte Spill
	leal	(%rdx,%rbp), %ebx
	movq	408(%rsp), %rdx                 # 8-byte Reload
	movl	(%rdx,%r11,4), %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	imulq	$1431655766, %rdx, %r15         # imm = 0x55555556
	movq	%r15, %rdx
	shrq	$63, %rdx
	shrq	$32, %r15
	addl	%edx, %r15d
	movl	(%rcx,%r11,4), %edx
	movl	%edx, %r14d
	negl	%r14d
	cmovsl	%edx, %r14d
	imull	%esi, %r14d
	movl	$2863311531, %edi               # imm = 0xAAAAAAAB
	imulq	%rdi, %r14
	shrq	$33, %r14
	movq	416(%rsp), %rdx                 # 8-byte Reload
	movl	(%rdx,%r11,4), %edx
	movl	%edx, %r12d
	negl	%r12d
	cmovsl	%edx, %r12d
	imull	%esi, %r12d
	imulq	%rdi, %r12
	shrq	$33, %r12
	movq	%r15, 384(%rsp)                 # 8-byte Spill
	movslq	%r15d, %rdx
	movslq	%ebx, %rsi
	movsd	(%r8,%r14,8), %xmm0             # xmm0 = mem[0],zero
	movsd	(%r8,%rdx,8), %xmm15            # xmm15 = mem[0],zero
	movsd	(%r8,%rsi,8), %xmm1             # xmm1 = mem[0],zero
	unpcklpd	%xmm15, %xmm1                   # xmm1 = xmm1[0],xmm15[0]
	unpcklpd	%xmm0, %xmm15                   # xmm15 = xmm15[0],xmm0[0]
	subpd	%xmm1, %xmm15
	movsd	(%r8,%r12,8), %xmm1             # xmm1 = mem[0],zero
	subsd	%xmm0, %xmm1
	movapd	%xmm1, 128(%rsp)                # 16-byte Spill
	movupd	8(%r8,%rdx,8), %xmm8
	movupd	8(%r8,%rsi,8), %xmm0
	movupd	8(%r8,%r14,8), %xmm1
	movupd	8(%r8,%r12,8), %xmm9
	subpd	%xmm1, %xmm9
	movapd	%xmm1, %xmm3
	subpd	%xmm8, %xmm3
	subpd	%xmm0, %xmm8
	movapd	%xmm9, %xmm13
	unpckhpd	%xmm9, %xmm13                   # xmm13 = xmm13[1],xmm9[1]
	testb	$1, %al
	je	.LBB27_5
# %bb.4:                                # %if.then
                                        #   in Loop: Header=BB27_3 Depth=1
	movsd	24(%r8,%r14,8), %xmm1           # xmm1 = mem[0],zero
	movsd	24(%r8,%r12,8), %xmm7           # xmm7 = mem[0],zero
	subsd	%xmm1, %xmm7
	movsd	24(%r8,%rdx,8), %xmm0           # xmm0 = mem[0],zero
	movsd	24(%r8,%rsi,8), %xmm2           # xmm2 = mem[0],zero
	unpcklpd	%xmm0, %xmm2                    # xmm2 = xmm2[0],xmm0[0]
	unpcklpd	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0]
	subpd	%xmm2, %xmm0
	movapd	%xmm3, %xmm2
	unpcklpd	%xmm3, %xmm2                    # xmm2 = xmm2[0],xmm3[0]
	movapd	%xmm8, %xmm1
	unpcklpd	%xmm9, %xmm1                    # xmm1 = xmm1[0],xmm9[0]
	mulpd	%xmm1, %xmm2
	movapd	128(%rsp), %xmm10               # 16-byte Reload
	movapd	%xmm3, %xmm5
	movapd	%xmm15, %xmm3
	shufpd	$1, %xmm10, %xmm3               # xmm3 = xmm3[1],xmm10[0]
	mulpd	%xmm15, %xmm3
	addpd	%xmm2, %xmm3
	movapd	%xmm8, %xmm2
	unpckhpd	%xmm5, %xmm2                    # xmm2 = xmm2[1],xmm5[1]
	movapd	%xmm5, %xmm4
	unpckhpd	%xmm9, %xmm4                    # xmm4 = xmm4[1],xmm9[1]
	mulpd	%xmm2, %xmm4
	addpd	%xmm3, %xmm4
	movapd	%xmm0, %xmm11
	shufpd	$1, %xmm7, %xmm11               # xmm11 = xmm11[1],xmm7[0]
	mulpd	%xmm0, %xmm11
	addpd	%xmm4, %xmm11
	movapd	%xmm8, %xmm3
	movapd	%xmm5, %xmm12
	unpcklpd	%xmm5, %xmm3                    # xmm3 = xmm3[0],xmm5[0]
	mulpd	%xmm3, %xmm3
	movapd	%xmm15, %xmm4
	mulpd	%xmm15, %xmm4
	addpd	%xmm3, %xmm4
	mulpd	%xmm2, %xmm2
	addpd	%xmm4, %xmm2
	movapd	%xmm0, %xmm4
	mulpd	%xmm0, %xmm4
	addpd	%xmm2, %xmm4
	movapd	%xmm9, %xmm2
	unpcklpd	%xmm9, %xmm2                    # xmm2 = xmm2[0],xmm9[0]
	mulpd	%xmm1, %xmm2
	movapd	%xmm15, %xmm1
	unpcklpd	%xmm10, %xmm1                   # xmm1 = xmm1[0],xmm10[0]
	movapd	%xmm10, %xmm3
	unpcklpd	%xmm10, %xmm3                   # xmm3 = xmm3[0],xmm10[0]
	mulpd	%xmm1, %xmm3
	movapd	%xmm0, %xmm1
	unpcklpd	%xmm7, %xmm1                    # xmm1 = xmm1[0],xmm7[0]
	movapd	%xmm7, %xmm10
	unpcklpd	%xmm0, %xmm7                    # xmm7 = xmm7[0],xmm0[0]
	movapd	%xmm7, 560(%rsp)                # 16-byte Spill
	unpckhpd	%xmm0, %xmm0                    # xmm0 = xmm0[1,1]
	movapd	%xmm0, 544(%rsp)                # 16-byte Spill
	addpd	%xmm2, %xmm3
	movapd	%xmm8, %xmm0
	unpckhpd	%xmm9, %xmm0                    # xmm0 = xmm0[1],xmm9[1]
	mulpd	%xmm13, %xmm0
	addpd	%xmm3, %xmm0
	unpcklpd	%xmm10, %xmm10                  # xmm10 = xmm10[0,0]
	mulpd	%xmm1, %xmm10
	addpd	%xmm0, %xmm10
	jmp	.LBB27_6
	.p2align	4, 0x90
.LBB27_5:                               # %if.else
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm3, %xmm1
	unpcklpd	%xmm3, %xmm1                    # xmm1 = xmm1[0],xmm3[0]
	movapd	%xmm8, %xmm0
	unpcklpd	%xmm9, %xmm0                    # xmm0 = xmm0[0],xmm9[0]
	mulpd	%xmm0, %xmm1
	movapd	%xmm15, %xmm2
	movapd	%xmm3, %xmm5
	movapd	128(%rsp), %xmm3                # 16-byte Reload
	shufpd	$1, %xmm3, %xmm2                # xmm2 = xmm2[1],xmm3[0]
	mulpd	%xmm15, %xmm2
	addpd	%xmm1, %xmm2
	movapd	%xmm8, %xmm4
	unpckhpd	%xmm5, %xmm4                    # xmm4 = xmm4[1],xmm5[1]
	movapd	%xmm5, %xmm11
	unpckhpd	%xmm9, %xmm11                   # xmm11 = xmm11[1],xmm9[1]
	mulpd	%xmm4, %xmm11
	addpd	%xmm2, %xmm11
	movapd	%xmm8, %xmm1
	movapd	%xmm5, %xmm12
	unpcklpd	%xmm5, %xmm1                    # xmm1 = xmm1[0],xmm5[0]
	mulpd	%xmm1, %xmm1
	movapd	%xmm15, %xmm2
	mulpd	%xmm15, %xmm2
	addpd	%xmm1, %xmm2
	mulpd	%xmm4, %xmm4
	addpd	%xmm2, %xmm4
	movapd	%xmm9, %xmm1
	unpcklpd	%xmm9, %xmm1                    # xmm1 = xmm1[0],xmm9[0]
	mulpd	%xmm0, %xmm1
	movapd	%xmm15, %xmm0
	unpcklpd	%xmm3, %xmm0                    # xmm0 = xmm0[0],xmm3[0]
	movapd	%xmm3, %xmm2
	unpcklpd	%xmm3, %xmm2                    # xmm2 = xmm2[0],xmm3[0]
	mulpd	%xmm0, %xmm2
	addpd	%xmm1, %xmm2
	movapd	%xmm8, %xmm10
	unpckhpd	%xmm9, %xmm10                   # xmm10 = xmm10[1],xmm9[1]
	mulpd	%xmm13, %xmm10
	addpd	%xmm2, %xmm10
.LBB27_6:                               # %if.end
                                        #   in Loop: Header=BB27_3 Depth=1
	movq	424(%rsp), %rax                 # 8-byte Reload
	movslq	(%rax,%r11,4), %r15
	movapd	%xmm10, %xmm7
	mulsd	.LCPI27_1(%rip), %xmm7
	movapd	%xmm11, %xmm0
	mulpd	%xmm11, %xmm0
	movapd	%xmm4, %xmm1
	unpckhpd	%xmm10, %xmm1                   # xmm1 = xmm1[1],xmm10[1]
	mulpd	%xmm4, %xmm1
	subpd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm0                    # xmm0 = xmm0[1],xmm1[1]
	movapd	%xmm0, 288(%rsp)                # 16-byte Spill
	movapd	%xmm1, 32(%rsp)                 # 16-byte Spill
	mulsd	%xmm1, %xmm0
	ucomisd	.LCPI27_29(%rip), %xmm0
	movq	%rdx, 16(%rsp)                  # 8-byte Spill
	movq	%rsi, 8(%rsp)                   # 8-byte Spill
	movapd	%xmm8, 368(%rsp)                # 16-byte Spill
	movsd	%xmm6, 24(%rsp)                 # 8-byte Spill
	movl	%ebx, 236(%rsp)                 # 4-byte Spill
	movapd	%xmm7, 80(%rsp)                 # 16-byte Spill
	movapd	%xmm15, 352(%rsp)               # 16-byte Spill
	movapd	%xmm12, 336(%rsp)               # 16-byte Spill
	movapd	%xmm13, 480(%rsp)               # 16-byte Spill
	movapd	%xmm9, 272(%rsp)                # 16-byte Spill
	movapd	%xmm4, 176(%rsp)                # 16-byte Spill
	jb	.LBB27_8
# %bb.7:                                #   in Loop: Header=BB27_3 Depth=1
	sqrtsd	%xmm0, %xmm0
	jmp	.LBB27_9
	.p2align	4, 0x90
.LBB27_8:                               # %call.sqrt
                                        #   in Loop: Header=BB27_3 Depth=1
	movq	%r11, %rbx
	movapd	%xmm11, 208(%rsp)               # 16-byte Spill
	movapd	%xmm10, 64(%rsp)                # 16-byte Spill
	callq	sqrt@PLT
	movapd	64(%rsp), %xmm10                # 16-byte Reload
	movapd	208(%rsp), %xmm11               # 16-byte Reload
	movapd	176(%rsp), %xmm4                # 16-byte Reload
	movapd	480(%rsp), %xmm13               # 16-byte Reload
	movapd	368(%rsp), %xmm8                # 16-byte Reload
	movapd	352(%rsp), %xmm15               # 16-byte Reload
	movapd	80(%rsp), %xmm7                 # 16-byte Reload
	movq	8(%rsp), %rsi                   # 8-byte Reload
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movq	%rbx, %r11
	movq	712(%rsp), %r9
	movq	728(%rsp), %r8
	movq	104(%rsp), %rcx                 # 8-byte Reload
.LBB27_9:                               # %if.end.split
                                        #   in Loop: Header=BB27_3 Depth=1
	movq	48(%rsp), %rax                  # 8-byte Reload
	movapd	%xmm11, %xmm9
	movapd	.LCPI27_0(%rip), %xmm5          # xmm5 = [-0.0E+0,-0.0E+0]
	xorpd	%xmm5, %xmm9
	movapd	%xmm4, %xmm12
	unpckhpd	%xmm4, %xmm12                   # xmm12 = xmm12[1],xmm4[1]
	movapd	%xmm12, %xmm2
	mulsd	%xmm10, %xmm2
	movapd	%xmm10, %xmm3
	movapd	%xmm11, %xmm10
	unpckhpd	%xmm11, %xmm10                  # xmm10 = xmm10[1],xmm11[1]
	movapd	%xmm11, %xmm6
	mulsd	%xmm10, %xmm6
	subsd	%xmm2, %xmm6
	movapd	128(%rsp), %xmm2                # 16-byte Reload
	mulsd	%xmm12, %xmm2
	movapd	%xmm15, %xmm1
	unpckhpd	%xmm15, %xmm1                   # xmm1 = xmm1[1],xmm15[1]
	movapd	%xmm9, 64(%rsp)                 # 16-byte Spill
	pshufd	$238, %xmm9, %xmm9              # xmm9 = xmm9[2,3,2,3]
	movdqa	%xmm9, %xmm14
	mulsd	%xmm1, %xmm14
	addsd	%xmm2, %xmm14
	movapd	%xmm8, %xmm2
	unpckhpd	%xmm8, %xmm2                    # xmm2 = xmm2[1],xmm8[1]
	movapd	%xmm2, 496(%rsp)                # 16-byte Spill
	mulsd	%xmm10, %xmm2
	movapd	%xmm11, %xmm4
	mulsd	%xmm13, %xmm4
	addsd	%xmm2, %xmm4
	movapd	336(%rsp), %xmm8                # 16-byte Reload
	unpckhpd	%xmm8, %xmm8                    # xmm8 = xmm8[1,1]
	movapd	%xmm7, %xmm2
	mulsd	%xmm8, %xmm2
	addsd	%xmm4, %xmm2
	movapd	%xmm2, 320(%rsp)                # 16-byte Spill
	movapd	%xmm12, %xmm2
	xorpd	%xmm5, %xmm2
	movapd	%xmm2, 512(%rsp)                # 16-byte Spill
	movapd	%xmm15, %xmm2
	mulsd	%xmm12, %xmm2
	movapd	%xmm1, %xmm4
	mulsd	%xmm11, %xmm4
	subsd	%xmm2, %xmm4
	movapd	%xmm4, 240(%rsp)                # 16-byte Spill
	unpckhpd	%xmm3, %xmm3                    # xmm3 = xmm3[1,1]
	movapd	%xmm3, %xmm4
	xorpd	%xmm5, %xmm4
	movapd	%xmm10, 192(%rsp)               # 16-byte Spill
	mulsd	%xmm10, %xmm13
	mulsd	%xmm8, %xmm3
	subsd	%xmm3, %xmm13
	movapd	%xmm13, 208(%rsp)               # 16-byte Spill
	movsd	.LCPI27_2(%rip), %xmm2          # xmm2 = mem[0],zero
	divsd	%xmm0, %xmm2
	mulsd	%xmm2, %xmm6
	movapd	%xmm6, 160(%rsp)                # 16-byte Spill
	mulsd	.LCPI27_3(%rip), %xmm6
	mulsd	%xmm2, %xmm6
	movapd	32(%rsp), %xmm10                # 16-byte Reload
	mulpd	.LCPI27_4(%rip), %xmm10
	movapd	288(%rsp), %xmm0                # 16-byte Reload
	addsd	%xmm0, %xmm0
	movapd	%xmm0, 288(%rsp)                # 16-byte Spill
	movapd	%xmm11, %xmm0
	unpcklpd	%xmm11, %xmm0                   # xmm0 = xmm0[0],xmm11[0]
	movapd	%xmm0, 112(%rsp)                # 16-byte Spill
	movapd	%xmm6, 256(%rsp)                # 16-byte Spill
	unpcklpd	%xmm6, %xmm6                    # xmm6 = xmm6[0,0]
	movapd	%xmm6, 528(%rsp)                # 16-byte Spill
	movapd	%xmm2, 624(%rsp)                # 16-byte Spill
	unpcklpd	%xmm2, %xmm2                    # xmm2 = xmm2[0,0]
	movapd	%xmm2, 32(%rsp)                 # 16-byte Spill
	cmpb	$1, dim(%rip)
	movapd	%xmm8, 464(%rsp)                # 16-byte Spill
	jne	.LBB27_11
# %bb.10:                               # %if.then309
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	64(%rsp), %xmm2                 # 16-byte Reload
	movapd	%xmm2, %xmm5
	shufpd	$1, %xmm2, %xmm5                # xmm5 = xmm5[1],xmm2[0]
	movapd	%xmm12, %xmm13
	movapd	560(%rsp), %xmm8                # 16-byte Reload
	mulsd	%xmm8, %xmm13
	movapd	544(%rsp), %xmm6                # 16-byte Reload
	mulsd	%xmm6, %xmm9
	addsd	%xmm13, %xmm9
	movapd	%xmm8, %xmm7
	unpckhpd	%xmm8, %xmm7                    # xmm7 = xmm7[1],xmm8[1]
	movapd	%xmm9, %xmm3
	movapd	192(%rsp), %xmm9                # 16-byte Reload
	movapd	%xmm9, %xmm13
	mulsd	%xmm7, %xmm13
	mulsd	%xmm8, %xmm11
	addsd	%xmm13, %xmm11
	movapd	512(%rsp), %xmm13               # 16-byte Reload
	mulsd	%xmm7, %xmm13
	unpcklpd	%xmm13, %xmm11                  # xmm11 = xmm11[0],xmm13[0]
	movapd	%xmm14, 144(%rsp)               # 16-byte Spill
	movapd	112(%rsp), %xmm14               # 16-byte Reload
	movlpd	80(%rsp), %xmm14                # 16-byte Folded Reload
                                        # xmm14 = mem[0],xmm14[1]
	movapd	%xmm6, %xmm13
	unpcklpd	%xmm6, %xmm13                   # xmm13 = xmm13[0],xmm6[0]
	mulpd	%xmm13, %xmm14
	addpd	%xmm11, %xmm14
	mulsd	%xmm8, %xmm9
	movapd	%xmm4, %xmm15
	mulsd	%xmm6, %xmm15
	addsd	%xmm9, %xmm15
	mulsd	%xmm10, %xmm15
	mulpd	%xmm5, %xmm13
	mulsd	%xmm2, %xmm7
	movapd	176(%rsp), %xmm5                # 16-byte Reload
	mulsd	%xmm6, %xmm5
	addsd	%xmm7, %xmm5
	mulsd	288(%rsp), %xmm5                # 16-byte Folded Reload
	movapd	%xmm14, %xmm9
	unpckhpd	%xmm14, %xmm9                   # xmm9 = xmm9[1],xmm14[1]
	movapd	%xmm14, %xmm6
	subsd	%xmm9, %xmm6
	movapd	%xmm12, %xmm9
	mulpd	%xmm8, %xmm9
	movapd	464(%rsp), %xmm8                # 16-byte Reload
	addpd	%xmm13, %xmm9
	movapd	%xmm15, %xmm13
	movapd	.LCPI27_0(%rip), %xmm7          # xmm7 = [-0.0E+0,-0.0E+0]
	xorpd	%xmm7, %xmm13
	mulpd	%xmm10, %xmm9
	unpcklpd	%xmm15, %xmm13                  # xmm13 = xmm13[0],xmm15[0]
	subpd	%xmm9, %xmm13
	movapd	%xmm13, %xmm15
	addpd	%xmm5, %xmm15
	unpcklpd	%xmm5, %xmm5                    # xmm5 = xmm5[0,0]
	subpd	%xmm5, %xmm13
	unpckhpd	%xmm9, %xmm13                   # xmm13 = xmm13[1],xmm9[1]
	unpcklpd	%xmm15, %xmm9                   # xmm9 = xmm9[0],xmm15[0]
	movapd	352(%rsp), %xmm15               # 16-byte Reload
	movapd	%xmm3, %xmm5
	xorpd	%xmm7, %xmm5
	subsd	%xmm14, %xmm5
	shufpd	$1, %xmm6, %xmm14               # xmm14 = xmm14[1],xmm6[0]
	unpcklpd	%xmm3, %xmm5                    # xmm5 = xmm5[0],xmm3[0]
	movapd	528(%rsp), %xmm2                # 16-byte Reload
	mulpd	%xmm2, %xmm9
	subpd	%xmm9, %xmm14
	mulpd	%xmm2, %xmm13
	subpd	%xmm13, %xmm5
	movapd	32(%rsp), %xmm2                 # 16-byte Reload
	mulpd	%xmm2, %xmm5
	movapd	%xmm5, 432(%rsp)                # 16-byte Spill
	mulpd	%xmm2, %xmm14
	movapd	%xmm14, 448(%rsp)               # 16-byte Spill
	movapd	144(%rsp), %xmm14               # 16-byte Reload
.LBB27_11:                              # %if.end361
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm1, 576(%rsp)                # 16-byte Spill
	movapd	%xmm1, %xmm5
	movapd	64(%rsp), %xmm0                 # 16-byte Reload
	mulsd	%xmm0, %xmm5
	movapd	%xmm12, %xmm13
	mulsd	%xmm15, %xmm13
	addsd	%xmm5, %xmm13
	movapd	496(%rsp), %xmm5                # 16-byte Reload
	mulsd	%xmm0, %xmm5
	movapd	%xmm4, %xmm0
	movapd	176(%rsp), %xmm6                # 16-byte Reload
	movapd	%xmm6, %xmm1
	mulsd	%xmm8, %xmm1
	addsd	%xmm5, %xmm1
	movapd	%xmm1, 144(%rsp)                # 16-byte Spill
	movapd	128(%rsp), %xmm5                # 16-byte Reload
	unpcklpd	272(%rsp), %xmm5                # 16-byte Folded Reload
                                        # xmm5 = xmm5[0],mem[0]
	movapd	336(%rsp), %xmm11               # 16-byte Reload
	movapd	112(%rsp), %xmm3                # 16-byte Reload
	movapd	%xmm3, 48(%rsp)                 # 16-byte Spill
	mulpd	%xmm5, %xmm3
	movapd	%xmm15, %xmm7
	shufpd	$1, %xmm11, %xmm15              # xmm15 = xmm15[1],xmm11[0]
	mulpd	192(%rsp), %xmm5                # 16-byte Folded Reload
	unpcklpd	%xmm4, %xmm0                    # xmm0 = xmm0[0],xmm4[0]
	mulpd	%xmm15, %xmm0
	addpd	%xmm5, %xmm0
	movapd	208(%rsp), %xmm1                # 16-byte Reload
	mulsd	%xmm10, %xmm1
	movapd	%xmm1, 208(%rsp)                # 16-byte Spill
	movapd	%xmm14, %xmm8
	movapd	%xmm14, %xmm1
	mulsd	%xmm10, %xmm1
	movapd	%xmm1, %xmm2
	movapd	%xmm1, 608(%rsp)                # 16-byte Spill
	movapd	%xmm10, %xmm1
	unpckhpd	%xmm10, %xmm1                   # xmm1 = xmm1[1],xmm10[1]
	movapd	%xmm1, 592(%rsp)                # 16-byte Spill
	mulsd	%xmm1, %xmm13
	unpcklpd	%xmm10, %xmm10                  # xmm10 = xmm10[0,0]
	mulpd	%xmm10, %xmm0
	movapd	%xmm0, %xmm9
	subsd	%xmm13, %xmm9
	movapd	256(%rsp), %xmm1                # 16-byte Reload
	mulsd	%xmm1, %xmm13
	movapd	%xmm14, %xmm4
	subsd	%xmm13, %xmm4
	movapd	%xmm4, 112(%rsp)                # 16-byte Spill
	movapd	%xmm2, %xmm13
	mulsd	%xmm1, %xmm13
	movapd	%xmm1, %xmm14
	movapd	240(%rsp), %xmm1                # 16-byte Reload
	subsd	%xmm13, %xmm1
	movapd	%xmm1, 304(%rsp)                # 16-byte Spill
	movapd	512(%rsp), %xmm1                # 16-byte Reload
	unpcklpd	%xmm1, %xmm1                    # xmm1 = xmm1[0,0]
	movapd	%xmm10, %xmm13
	movapd	368(%rsp), %xmm2                # 16-byte Reload
	mulpd	%xmm2, %xmm1
	movapd	48(%rsp), %xmm4                 # 16-byte Reload
	mulpd	%xmm11, %xmm4
	addpd	%xmm1, %xmm4
	movapd	%xmm4, 48(%rsp)                 # 16-byte Spill
	movapd	64(%rsp), %xmm4                 # 16-byte Reload
	movapd	%xmm4, %xmm10
	unpckhpd	%xmm4, %xmm10                   # xmm10 = xmm10[1],xmm4[1]
	mulpd	%xmm11, %xmm10
	movapd	%xmm12, %xmm5
	mulpd	272(%rsp), %xmm5                # 16-byte Folded Reload
	addpd	%xmm10, %xmm5
	movapd	%xmm5, %xmm10
	mulpd	%xmm13, %xmm10
	unpcklpd	%xmm2, %xmm7                    # xmm7 = xmm7[0],xmm2[0]
	movapd	%xmm7, %xmm13
	mulpd	192(%rsp), %xmm13               # 16-byte Folded Reload
	addpd	%xmm13, %xmm3
	movapd	80(%rsp), %xmm13                # 16-byte Reload
	unpcklpd	%xmm13, %xmm13                  # xmm13 = xmm13[0,0]
	mulpd	%xmm15, %xmm13
	addpd	%xmm3, %xmm13
	unpcklpd	%xmm6, %xmm6                    # xmm6 = xmm6[0,0]
	mulpd	%xmm15, %xmm6
	unpcklpd	%xmm4, %xmm4                    # xmm4 = xmm4[0,0]
	mulpd	%xmm4, %xmm7
	addpd	%xmm7, %xmm6
	movapd	288(%rsp), %xmm7                # 16-byte Reload
	movapd	144(%rsp), %xmm15               # 16-byte Reload
	mulsd	%xmm7, %xmm15
	unpcklpd	%xmm7, %xmm7                    # xmm7 = xmm7[0,0]
	mulpd	%xmm6, %xmm7
	movapd	.LCPI27_0(%rip), %xmm6          # xmm6 = [-0.0E+0,-0.0E+0]
	xorpd	%xmm6, %xmm8
	subsd	%xmm13, %xmm8
	subsd	%xmm7, %xmm9
	mulsd	%xmm14, %xmm9
	subsd	%xmm9, %xmm8
	mulpd	%xmm11, %xmm4
	mulpd	%xmm2, %xmm12
	addpd	%xmm4, %xmm12
	mulpd	592(%rsp), %xmm12               # 16-byte Folded Reload
	movapd	%xmm12, %xmm3
	movapd	%xmm14, %xmm2
	mulsd	%xmm14, %xmm3
	movapd	%xmm5, %xmm14
	subsd	%xmm3, %xmm14
	movapd	%xmm12, %xmm3
	unpckhpd	%xmm12, %xmm3                   # xmm3 = xmm3[1],xmm12[1]
	movapd	%xmm5, %xmm4
	unpckhpd	%xmm5, %xmm4                    # xmm4 = xmm4[1],xmm5[1]
	mulsd	%xmm2, %xmm3
	subsd	%xmm3, %xmm4
	movapd	%xmm6, %xmm11
	xorpd	%xmm6, %xmm5
	movapd	%xmm13, %xmm3
	movapd	320(%rsp), %xmm9                # 16-byte Reload
	shufpd	$1, %xmm9, %xmm3                # xmm3 = xmm3[1],xmm9[0]
	subpd	%xmm3, %xmm5
	movapd	%xmm0, %xmm3
	movapd	208(%rsp), %xmm6                # 16-byte Reload
	shufpd	$1, %xmm6, %xmm3                # xmm3 = xmm3[1],xmm6[0]
	subpd	%xmm12, %xmm3
	movapd	%xmm7, %xmm1
	shufpd	$1, %xmm15, %xmm1               # xmm1 = xmm1[1],xmm15[0]
	subpd	%xmm1, %xmm3
	movapd	528(%rsp), %xmm12               # 16-byte Reload
	mulpd	%xmm12, %xmm3
	subpd	%xmm3, %xmm5
	movapd	48(%rsp), %xmm2                 # 16-byte Reload
	movapd	240(%rsp), %xmm1                # 16-byte Reload
	unpcklpd	%xmm2, %xmm1                    # xmm1 = xmm1[0],xmm2[0]
	subpd	%xmm1, %xmm13
	xorpd	%xmm11, %xmm0
	movapd	608(%rsp), %xmm1                # 16-byte Reload
	unpcklpd	%xmm10, %xmm1                   # xmm1 = xmm1[0],xmm10[0]
	subpd	%xmm1, %xmm0
	movapd	112(%rsp), %xmm11               # 16-byte Reload
	movapd	%xmm8, %xmm3
	addpd	%xmm7, %xmm0
	movapd	%xmm9, %xmm7
	xorpd	.LCPI27_0(%rip), %xmm6
	mulpd	%xmm12, %xmm0
	subpd	%xmm0, %xmm13
	movapd	%xmm2, %xmm1
	unpckhpd	%xmm2, %xmm1                    # xmm1 = xmm1[1],xmm2[1]
	subsd	%xmm1, %xmm7
	movapd	%xmm10, %xmm1
	unpckhpd	%xmm10, %xmm1                   # xmm1 = xmm1[1],xmm10[1]
	subsd	%xmm1, %xmm6
	addsd	%xmm15, %xmm6
	movapd	%xmm5, %xmm15
	mulsd	256(%rsp), %xmm6                # 16-byte Folded Reload
	subsd	%xmm6, %xmm7
	movapd	624(%rsp), %xmm0                # 16-byte Reload
	mulsd	%xmm0, %xmm11
	movapd	304(%rsp), %xmm1                # 16-byte Reload
	mulsd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm14
	mulsd	%xmm0, %xmm4
	mulsd	%xmm0, %xmm7
	mulpd	%xmm12, %xmm10
	subpd	%xmm10, %xmm2
	movapd	%xmm2, %xmm10
	movapd	32(%rsp), %xmm0                 # 16-byte Reload
	mulpd	%xmm0, %xmm15
	mulpd	%xmm0, %xmm13
	mulpd	%xmm0, %xmm10
	movq	%r15, %rdi
	movq	%r15, 64(%rsp)                  # 8-byte Spill
	leal	-1(%r15), %edi
	incq	%rdx
	movq	%rdx, 288(%rsp)                 # 8-byte Spill
	leaq	1(%rsi), %rdx
	movq	%rdx, 208(%rsp)                 # 8-byte Spill
	leal	2(%rbp,%rax), %eax
	movslq	%eax, %rbp
	leal	2(%r14), %r15d
	leaq	1(%r12), %rbx
	movq	prm(%rip), %rax
	cmpl	$0, 128(%rax)
	je	.LBB27_12
# %bb.13:                               # %land.lhs.true
                                        #   in Loop: Header=BB27_3 Depth=1
	cmpl	$0, (%rcx,%r11,4)
	movsd	24(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	jns	.LBB27_14
# %bb.17:                               # %if.then365
                                        #   in Loop: Header=BB27_3 Depth=1
	movl	%edi, 32(%rsp)                  # 4-byte Spill
	movapd	%xmm4, 240(%rsp)                # 16-byte Spill
	movapd	%xmm14, 256(%rsp)               # 16-byte Spill
	movapd	%xmm15, 176(%rsp)               # 16-byte Spill
	movapd	%xmm1, 304(%rsp)                # 16-byte Spill
	movapd	%xmm11, 112(%rsp)               # 16-byte Spill
	movapd	%xmm10, 48(%rsp)                # 16-byte Spill
	movapd	%xmm7, 320(%rsp)                # 16-byte Spill
	movapd	%xmm3, 144(%rsp)                # 16-byte Spill
	movapd	%xmm13, 80(%rsp)                # 16-byte Spill
	movq	%r11, 192(%rsp)                 # 8-byte Spill
	movsd	.LCPI27_2(%rip), %xmm0          # xmm0 = mem[0],zero
	minsd	160(%rsp), %xmm0                # 16-byte Folded Reload
	movsd	.LCPI27_5(%rip), %xmm1          # xmm1 = mem[0],zero
	maxsd	%xmm0, %xmm1
	movapd	%xmm1, 160(%rsp)                # 16-byte Spill
	movapd	%xmm1, %xmm0
	callq	acos@PLT
	movapd	336(%rsp), %xmm7                # 16-byte Reload
	movapd	%xmm7, %xmm1
	movapd	496(%rsp), %xmm10               # 16-byte Reload
	mulsd	%xmm10, %xmm1
	movapd	576(%rsp), %xmm8                # 16-byte Reload
	movapd	%xmm8, %xmm2
	movapd	368(%rsp), %xmm6                # 16-byte Reload
	mulsd	%xmm6, %xmm2
	movapd	464(%rsp), %xmm9                # 16-byte Reload
	mulsd	%xmm9, %xmm6
	subsd	%xmm1, %xmm6
	movapd	%xmm9, %xmm1
	movapd	352(%rsp), %xmm5                # 16-byte Reload
	mulsd	%xmm5, %xmm1
	mulsd	%xmm8, %xmm10
	subsd	%xmm1, %xmm10
	mulsd	%xmm7, %xmm5
	subsd	%xmm2, %xmm5
	movapd	%xmm8, %xmm1
	movapd	272(%rsp), %xmm3                # 16-byte Reload
	mulsd	%xmm3, %xmm1
	mulsd	%xmm9, %xmm3
	movapd	%xmm7, %xmm2
	movapd	480(%rsp), %xmm4                # 16-byte Reload
	mulsd	%xmm4, %xmm2
	subsd	%xmm3, %xmm2
	mulsd	%xmm8, %xmm4
	movapd	%xmm9, %xmm11
	movapd	128(%rsp), %xmm3                # 16-byte Reload
	mulsd	%xmm3, %xmm11
	subsd	%xmm4, %xmm11
	mulsd	%xmm7, %xmm3
	subsd	%xmm3, %xmm1
	movapd	%xmm11, %xmm3
	mulsd	%xmm5, %xmm3
	movapd	%xmm10, %xmm4
	mulsd	%xmm1, %xmm4
	subsd	%xmm3, %xmm4
	mulsd	%xmm6, %xmm1
	mulsd	%xmm2, %xmm5
	subsd	%xmm1, %xmm5
	mulsd	%xmm10, %xmm2
	mulsd	%xmm6, %xmm11
	subsd	%xmm2, %xmm11
	mulsd	%xmm7, %xmm5
	mulsd	%xmm8, %xmm4
	addsd	%xmm5, %xmm4
	mulsd	%xmm9, %xmm11
	addsd	%xmm4, %xmm11
	movapd	%xmm0, %xmm1
	xorpd	.LCPI27_0(%rip), %xmm1
	cmpltsd	.LCPI27_29(%rip), %xmm11
	andpd	%xmm11, %xmm1
	andnpd	%xmm0, %xmm11
	orpd	%xmm1, %xmm11
	movapd	%xmm11, %xmm0
	movq	720(%rsp), %rax
	movq	64(%rsp), %rcx                  # 8-byte Reload
	subsd	-8(%rax,%rcx,8), %xmm0
	movsd	.LCPI27_6(%rip), %xmm1          # xmm1 = mem[0],zero
	minsd	%xmm0, %xmm1
	movsd	.LCPI27_7(%rip), %xmm0          # xmm0 = mem[0],zero
	maxsd	%xmm1, %xmm0
	movq	704(%rsp), %rax
	movsd	-8(%rax,%rcx,8), %xmm1          # xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm1
	movapd	%xmm0, 336(%rsp)                # 16-byte Spill
	movapd	%xmm1, 128(%rsp)                # 16-byte Spill
	mulsd	%xmm1, %xmm0
	movsd	24(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 24(%rsp)                 # 8-byte Spill
	movapd	%xmm11, 272(%rsp)               # 16-byte Spill
	movapd	%xmm11, %xmm0
	callq	sin@PLT
	movapd	%xmm0, %xmm1
	movapd	.LCPI27_8(%rip), %xmm2          # xmm2 = [NaN,NaN]
	andpd	%xmm2, %xmm1
	ucomisd	.LCPI27_9(%rip), %xmm1
	jbe	.LBB27_19
# %bb.18:                               # %if.then429
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	128(%rsp), %xmm3                # 16-byte Reload
	mulsd	.LCPI27_1(%rip), %xmm3
	divsd	%xmm0, %xmm3
	movq	104(%rsp), %rcx                 # 8-byte Reload
	movq	728(%rsp), %r8
	movq	712(%rsp), %r9
	movq	192(%rsp), %r11                 # 8-byte Reload
	movsd	24(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movq	8(%rsp), %rsi                   # 8-byte Reload
	movapd	80(%rsp), %xmm13                # 16-byte Reload
	movapd	160(%rsp), %xmm6                # 16-byte Reload
	movapd	144(%rsp), %xmm14               # 16-byte Reload
	movapd	320(%rsp), %xmm7                # 16-byte Reload
	movapd	48(%rsp), %xmm10                # 16-byte Reload
	movapd	112(%rsp), %xmm11               # 16-byte Reload
	movapd	304(%rsp), %xmm12               # 16-byte Reload
	movapd	176(%rsp), %xmm15               # 16-byte Reload
	movapd	256(%rsp), %xmm9                # 16-byte Reload
	movapd	240(%rsp), %xmm4                # 16-byte Reload
	movl	32(%rsp), %edi                  # 4-byte Reload
	jmp	.LBB27_31
	.p2align	4, 0x90
.LBB27_12:                              #   in Loop: Header=BB27_3 Depth=1
	movsd	24(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
.LBB27_14:                              #   in Loop: Header=BB27_3 Depth=1
	movapd	160(%rsp), %xmm6                # 16-byte Reload
	movapd	%xmm1, %xmm12
	movapd	%xmm14, %xmm9
	movapd	%xmm3, %xmm14
	jmp	.LBB27_15
.LBB27_19:                              # %if.else432
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	128(%rsp), %xmm3                # 16-byte Reload
	movapd	336(%rsp), %xmm4                # 16-byte Reload
	movapd	%xmm4, %xmm0
	andpd	%xmm2, %xmm0
	movsd	.LCPI27_10(%rip), %xmm1         # xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	jbe	.LBB27_25
# %bb.20:                               # %if.then434
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm4, %xmm2
	movq	720(%rsp), %rax
	movq	64(%rsp), %rdi                  # 8-byte Reload
	movsd	-8(%rax,%rdi,8), %xmm0          # xmm0 = mem[0],zero
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	movq	104(%rsp), %rcx                 # 8-byte Reload
	movq	728(%rsp), %r8
	movq	712(%rsp), %r9
	movq	704(%rsp), %r10
	movq	192(%rsp), %r11                 # 8-byte Reload
	movsd	24(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movq	8(%rsp), %rsi                   # 8-byte Reload
	movapd	80(%rsp), %xmm13                # 16-byte Reload
	movapd	160(%rsp), %xmm6                # 16-byte Reload
	movapd	144(%rsp), %xmm14               # 16-byte Reload
	movapd	320(%rsp), %xmm7                # 16-byte Reload
	movapd	48(%rsp), %xmm10                # 16-byte Reload
	movapd	112(%rsp), %xmm11               # 16-byte Reload
	movapd	304(%rsp), %xmm12               # 16-byte Reload
	movapd	176(%rsp), %xmm15               # 16-byte Reload
	movapd	256(%rsp), %xmm9                # 16-byte Reload
	movapd	240(%rsp), %xmm4                # 16-byte Reload
	jne	.LBB27_22
	jp	.LBB27_22
# %bb.21:                               # %if.then438
                                        #   in Loop: Header=BB27_3 Depth=1
	movsd	-8(%r10,%rdi,8), %xmm0          # xmm0 = mem[0],zero
	mulsd	.LCPI27_1(%rip), %xmm0
	movapd	272(%rsp), %xmm3                # 16-byte Reload
	mulsd	%xmm3, %xmm3
	divsd	.LCPI27_15(%rip), %xmm3
	addsd	.LCPI27_2(%rip), %xmm3
	mulsd	%xmm0, %xmm3
	movl	32(%rsp), %edi                  # 4-byte Reload
	jmp	.LBB27_31
.LBB27_25:                              # %if.else460
                                        #   in Loop: Header=BB27_3 Depth=1
	xorpd	%xmm0, %xmm0
	movapd	272(%rsp), %xmm1                # 16-byte Reload
	ucomisd	%xmm0, %xmm1
	movq	104(%rsp), %rcx                 # 8-byte Reload
	movq	728(%rsp), %r8
	movq	712(%rsp), %r9
	movq	192(%rsp), %r11                 # 8-byte Reload
	movsd	24(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movq	8(%rsp), %rsi                   # 8-byte Reload
	movapd	80(%rsp), %xmm13                # 16-byte Reload
	movapd	160(%rsp), %xmm6                # 16-byte Reload
	movapd	144(%rsp), %xmm14               # 16-byte Reload
	movapd	320(%rsp), %xmm7                # 16-byte Reload
	movapd	48(%rsp), %xmm10                # 16-byte Reload
	movapd	112(%rsp), %xmm11               # 16-byte Reload
	movapd	304(%rsp), %xmm12               # 16-byte Reload
	movapd	176(%rsp), %xmm15               # 16-byte Reload
	movapd	256(%rsp), %xmm9                # 16-byte Reload
	movapd	240(%rsp), %xmm4                # 16-byte Reload
	movl	32(%rsp), %edi                  # 4-byte Reload
	jbe	.LBB27_27
# %bb.26:                               # %if.else460
                                        #   in Loop: Header=BB27_3 Depth=1
	movsd	.LCPI27_11(%rip), %xmm0         # xmm0 = mem[0],zero
	ucomisd	%xmm1, %xmm0
	ja	.LBB27_29
.LBB27_27:                              # %lor.lhs.false
                                        #   in Loop: Header=BB27_3 Depth=1
	xorpd	%xmm0, %xmm0
	ucomisd	%xmm1, %xmm0
	jbe	.LBB27_30
# %bb.28:                               # %lor.lhs.false
                                        #   in Loop: Header=BB27_3 Depth=1
	ucomisd	.LCPI27_12(%rip), %xmm1
	jbe	.LBB27_30
.LBB27_29:                              # %if.then470
                                        #   in Loop: Header=BB27_3 Depth=1
	mulsd	.LCPI27_14(%rip), %xmm3
	jmp	.LBB27_31
.LBB27_22:                              # %if.else446
                                        #   in Loop: Header=BB27_3 Depth=1
	andpd	.LCPI27_8(%rip), %xmm0
	ucomisd	.LCPI27_6(%rip), %xmm0
	jne	.LBB27_23
	jp	.LBB27_23
# %bb.24:                               # %if.then450
                                        #   in Loop: Header=BB27_3 Depth=1
	movq	64(%rsp), %rax                  # 8-byte Reload
	movq	704(%rsp), %rdi
	movsd	-8(%rdi,%rax,8), %xmm0          # xmm0 = mem[0],zero
	addsd	%xmm0, %xmm0
	mulsd	%xmm2, %xmm2
	divsd	.LCPI27_15(%rip), %xmm2
	addsd	.LCPI27_2(%rip), %xmm2
	mulsd	%xmm0, %xmm2
	movapd	%xmm2, %xmm3
	movl	32(%rsp), %edi                  # 4-byte Reload
	jmp	.LBB27_31
.LBB27_30:                              # %if.else472
                                        #   in Loop: Header=BB27_3 Depth=1
	mulsd	.LCPI27_13(%rip), %xmm3
	jmp	.LBB27_31
.LBB27_23:                              #   in Loop: Header=BB27_3 Depth=1
	movl	32(%rsp), %edi                  # 4-byte Reload
	jmp	.LBB27_31
	.p2align	4, 0x90
.LBB27_15:                              # %multi_term
                                        #   in Loop: Header=BB27_3 Depth=1
	movl	%edi, %r10d
	movslq	%edi, %rax
	movq	720(%rsp), %rdx
	movsd	(%rdx,%rax,8), %xmm0            # xmm0 = mem[0],zero
	addsd	.LCPI27_16(%rip), %xmm0
	movapd	.LCPI27_8(%rip), %xmm2          # xmm2 = [NaN,NaN]
	andpd	%xmm2, %xmm0
	xorl	%edi, %edi
	movsd	.LCPI27_17(%rip), %xmm1         # xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	seta	%sil
	movsd	(%r9,%rax,8), %xmm0             # xmm0 = mem[0],zero
	movapd	%xmm0, %xmm1
	andpd	%xmm2, %xmm1
	cvttsd2si	%xmm1, %edx
	decl	%edx
	cmpl	$5, %edx
	ja	.LBB27_41
# %bb.16:                               # %multi_term
                                        #   in Loop: Header=BB27_3 Depth=1
	movb	%sil, %dil
	movsd	.LCPI27_18(,%rdi,8), %xmm2      # xmm2 = mem[0],zero
	movq	704(%rsp), %rsi
	movsd	(%rsi,%rax,8), %xmm1            # xmm1 = mem[0],zero
	jmpq	*.LJTI27_0(,%rdx,8)
.LBB27_35:                              # %sw.bb
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm1, %xmm3
	mulsd	%xmm2, %xmm3
	mulsd	%xmm6, %xmm2
	addsd	.LCPI27_2(%rip), %xmm2
	jmp	.LBB27_36
	.p2align	4, 0x90
.LBB27_37:                              # %sw.bb493
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm6, %xmm0
	addsd	%xmm6, %xmm0
	mulsd	%xmm6, %xmm0
	addsd	.LCPI27_5(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	.LCPI27_2(%rip), %xmm0
	mulsd	%xmm1, %xmm2
	mulsd	.LCPI27_26(%rip), %xmm2
	mulsd	%xmm6, %xmm2
	movapd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	jmp	.LBB27_36
	.p2align	4, 0x90
.LBB27_38:                              # %sw.bb501
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm13, 80(%rsp)                # 16-byte Spill
	movapd	%xmm12, %xmm13
	movapd	%xmm14, %xmm12
	movapd	%xmm5, %xmm14
	movapd	%xmm6, %xmm8
	mulsd	%xmm6, %xmm8
	movapd	%xmm6, %xmm0
	mulsd	%xmm2, %xmm0
	movapd	%xmm8, %xmm3
	mulsd	.LCPI27_26(%rip), %xmm3
	movapd	%xmm4, %xmm5
	movsd	.LCPI27_27(%rip), %xmm4         # xmm4 = mem[0],zero
	addsd	%xmm4, %xmm3
	mulsd	%xmm0, %xmm3
	addsd	.LCPI27_2(%rip), %xmm3
	mulsd	%xmm1, %xmm2
	mulsd	.LCPI27_28(%rip), %xmm8
	addsd	%xmm4, %xmm8
	movapd	%xmm5, %xmm4
	mulsd	%xmm2, %xmm8
	movapd	%xmm3, %xmm2
	movapd	%xmm8, %xmm3
	movapd	%xmm14, %xmm5
	movapd	%xmm12, %xmm14
	movapd	%xmm13, %xmm12
	movapd	80(%rsp), %xmm13                # 16-byte Reload
	jmp	.LBB27_36
	.p2align	4, 0x90
.LBB27_39:                              # %sw.bb510
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm6, %xmm8
	mulsd	%xmm6, %xmm8
	movapd	%xmm8, %xmm0
	mulsd	.LCPI27_24(%rip), %xmm0
	movapd	%xmm8, %xmm3
	addsd	.LCPI27_5(%rip), %xmm3
	mulsd	%xmm0, %xmm3
	movsd	.LCPI27_2(%rip), %xmm0          # xmm0 = mem[0],zero
	addsd	%xmm0, %xmm3
	mulsd	%xmm2, %xmm3
	addsd	%xmm0, %xmm3
	mulsd	%xmm1, %xmm2
	mulsd	%xmm6, %xmm2
	mulsd	.LCPI27_19(%rip), %xmm8
	addsd	.LCPI27_25(%rip), %xmm8
	mulsd	%xmm2, %xmm8
	movapd	%xmm3, %xmm2
	movapd	%xmm8, %xmm3
	jmp	.LBB27_36
	.p2align	4, 0x90
.LBB27_40:                              # %sw.bb521
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm6, %xmm0
	mulsd	%xmm6, %xmm0
	movapd	%xmm0, %xmm8
	mulsd	.LCPI27_19(%rip), %xmm8
	mulsd	%xmm0, %xmm8
	movapd	%xmm0, %xmm3
	mulsd	.LCPI27_20(%rip), %xmm3
	mulsd	%xmm0, %xmm3
	mulsd	%xmm0, %xmm8
	addsd	%xmm3, %xmm8
	movapd	%xmm0, %xmm3
	mulsd	.LCPI27_21(%rip), %xmm3
	addsd	%xmm8, %xmm3
	addsd	.LCPI27_5(%rip), %xmm3
	mulsd	%xmm2, %xmm3
	addsd	.LCPI27_2(%rip), %xmm3
	mulsd	%xmm1, %xmm2
	mulsd	%xmm6, %xmm2
	movapd	%xmm0, %xmm8
	mulsd	.LCPI27_22(%rip), %xmm8
	mulsd	%xmm8, %xmm0
	subsd	%xmm8, %xmm0
	addsd	.LCPI27_23(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	movapd	%xmm3, %xmm2
	movapd	%xmm0, %xmm3
	.p2align	4, 0x90
.LBB27_36:                              # %sw.epilog
                                        #   in Loop: Header=BB27_3 Depth=1
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movq	8(%rsp), %rsi                   # 8-byte Reload
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm5
	movl	%r10d, %edi
.LBB27_31:                              # %if.end545
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm3, %xmm0
	mulsd	%xmm11, %xmm0
	addsd	(%r13,%rsi,8), %xmm0
	movsd	%xmm0, (%r13,%rsi,8)
	movapd	%xmm3, %xmm0
	mulsd	%xmm9, %xmm0
	movq	208(%rsp), %rax                 # 8-byte Reload
	addsd	(%r13,%rax,8), %xmm0
	movsd	%xmm0, (%r13,%rax,8)
	movapd	%xmm3, %xmm0
	mulsd	%xmm4, %xmm0
	addsd	(%r13,%rbp,8), %xmm0
	movsd	%xmm0, (%r13,%rbp,8)
	movapd	%xmm3, %xmm0
	mulsd	%xmm14, %xmm0
	addsd	(%r13,%rdx,8), %xmm0
	movsd	%xmm0, (%r13,%rdx,8)
	movq	288(%rsp), %rax                 # 8-byte Reload
	movupd	(%r13,%rax,8), %xmm0
	movapd	%xmm3, %xmm1
	unpcklpd	%xmm3, %xmm1                    # xmm1 = xmm1[0],xmm3[0]
	movapd	%xmm1, %xmm2
	mulpd	%xmm15, %xmm2
	addpd	%xmm0, %xmm2
	movupd	%xmm2, (%r13,%rax,8)
	movupd	(%r13,%r14,8), %xmm0
	movapd	%xmm1, %xmm2
	mulpd	%xmm13, %xmm2
	addpd	%xmm0, %xmm2
	movupd	%xmm2, (%r13,%r14,8)
	movapd	%xmm3, %xmm0
	mulsd	%xmm7, %xmm0
	addsd	(%r13,%r15,8), %xmm0
	movsd	%xmm0, (%r13,%r15,8)
	movapd	%xmm3, %xmm0
	mulsd	%xmm12, %xmm0
	addsd	(%r13,%r12,8), %xmm0
	movsd	%xmm0, (%r13,%r12,8)
	movupd	(%r13,%rbx,8), %xmm0
	mulpd	%xmm10, %xmm1
	addpd	%xmm0, %xmm1
	movupd	%xmm1, (%r13,%rbx,8)
	xorl	%eax, %eax
	cmpb	$1, dim(%rip)
	jne	.LBB27_33
# %bb.32:                               # %if.then608
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	432(%rsp), %xmm1                # 16-byte Reload
	movapd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm0                    # xmm0 = xmm0[1],xmm1[1]
	mulsd	%xmm3, %xmm0
	addsd	24(%r13,%rsi,8), %xmm0
	movsd	%xmm0, 24(%r13,%rsi,8)
	movapd	%xmm3, %xmm0
	mulsd	%xmm1, %xmm0
	addsd	24(%r13,%rdx,8), %xmm0
	movsd	%xmm0, 24(%r13,%rdx,8)
	movapd	448(%rsp), %xmm1                # 16-byte Reload
	movapd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm0                    # xmm0 = xmm0[1],xmm1[1]
	mulsd	%xmm3, %xmm0
	addsd	24(%r13,%r14,8), %xmm0
	movsd	%xmm0, 24(%r13,%r14,8)
	mulsd	%xmm1, %xmm3
	addsd	24(%r13,%r12,8), %xmm3
	movsd	%xmm3, 24(%r13,%r12,8)
	movzbl	dim(%rip), %eax
.LBB27_33:                              # %if.end629
                                        #   in Loop: Header=BB27_3 Depth=1
	movslq	%edi, %rdx
	xorpd	%xmm0, %xmm0
	ucomisd	(%r9,%rdx,8), %xmm0
	jbe	.LBB27_42
# %bb.34:                               # %if.then634
                                        #   in Loop: Header=BB27_3 Depth=1
	incl	%edi
	jmp	.LBB27_15
.LBB27_1:
	xorpd	%xmm5, %xmm5
.LBB27_43:                              # %for.end
	movapd	%xmm5, %xmm0
	addq	$648, %rsp                      # imm = 0x288
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
.LBB27_41:                              # %sw.default
	.cfi_def_cfa_offset 704
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movl	$.L.str.84, %esi
	movl	236(%rsp), %edx                 # 4-byte Reload
	movq	384(%rsp), %rcx                 # 8-byte Reload
                                        # kill: def $ecx killed $ecx killed $rcx
	movl	%r14d, %r8d
	movl	%r12d, %r9d
	movb	$1, %al
	callq	fprintf@PLT
	movl	$1, %edi
	callq	exit@PLT
.Lfunc_end27:
	.size	ephi, .Lfunc_end27-ephi
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3, 0x0
.LJTI27_0:
	.quad	.LBB27_35
	.quad	.LBB27_37
	.quad	.LBB27_38
	.quad	.LBB27_39
	.quad	.LBB27_41
	.quad	.LBB27_40
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function nbond
.LCPI28_0:
	.quad	0x3ff0000000000000              # double 1
.LCPI28_4:
	.quad	0xc028000000000000              # double -12
.LCPI28_5:
	.quad	0x0000000000000000              # double 0
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI28_1:
	.quad	0x4018000000000000              # double 6
	.zero	8
.LCPI28_2:
	.quad	0x4024000000000000              # double 10
	.zero	8
.LCPI28_3:
	.quad	0x8000000000000000              # double -0
	.quad	0x8000000000000000              # double -0
	.text
	.p2align	4, 0x90
	.type	nbond,@function
nbond:                                  # @nbond
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
	subq	$296, %rsp                      # imm = 0x128
	.cfi_def_cfa_offset 352
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movsd	%xmm1, 8(%rsp)                  # 8-byte Spill
	movsd	%xmm0, 104(%rsp)                # 8-byte Spill
	movq	%r9, 56(%rsp)                   # 8-byte Spill
	movq	%r8, 48(%rsp)                   # 8-byte Spill
	movl	%ecx, 20(%rsp)                  # 4-byte Spill
	movq	%rdx, 40(%rsp)                  # 8-byte Spill
	movq	%rsi, 144(%rsp)                 # 8-byte Spill
	movq	%rdi, 128(%rsp)                 # 8-byte Spill
	movq	prm(%rip), %rax
	movl	96(%rax), %esi
	movl	$-1, %edi
	callq	ivector@PLT
	movq	%rax, %rdi
	movq	prm(%rip), %rax
	cmpl	$0, 96(%rax)
	js	.LBB28_3
# %bb.1:                                # %for.body.preheader
	movq	$-1, %rcx
	.p2align	4, 0x90
.LBB28_2:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	$-1, (%rdi,%rcx,4)
	incq	%rcx
	movslq	96(%rax), %rdx
	cmpq	%rdx, %rcx
	jl	.LBB28_2
.LBB28_3:                               # %for.cond3.preheader
	movq	360(%rsp), %rbx
	movq	352(%rsp), %r14
	movq	prm(%rip), %rax
	movl	96(%rax), %edx
	xorpd	%xmm6, %xmm6
	xorpd	%xmm7, %xmm7
	cmpl	$2, %edx
	jl	.LBB28_39
# %bb.4:                                # %for.body6.lr.ph
	movsd	.LCPI28_0(%rip), %xmm0          # xmm0 = mem[0],zero
	movapd	%xmm0, %xmm1
	divsd	104(%rsp), %xmm1                # 8-byte Folded Reload
	divsd	8(%rsp), %xmm0                  # 8-byte Folded Reload
	movsd	%xmm0, 136(%rsp)                # 8-byte Spill
	movapd	.LCPI28_1(%rip), %xmm0          # xmm0 = <6.0E+0,u>
	unpcklpd	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0]
	movapd	%xmm0, 208(%rsp)                # 16-byte Spill
	movapd	.LCPI28_2(%rip), %xmm0          # xmm0 = <1.0E+1,u>
	movapd	%xmm1, 256(%rsp)                # 16-byte Spill
	unpcklpd	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0]
	movapd	%xmm0, 192(%rsp)                # 16-byte Spill
	xorl	%r13d, %r13d
                                        # implicit-def: $xmm0
                                        # kill: killed $xmm0
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	movsd	%xmm0, 96(%rsp)                 # 8-byte Spill
	movq	56(%rsp), %r8                   # 8-byte Reload
	movq	48(%rsp), %r9                   # 8-byte Reload
	movq	%rdi, 32(%rsp)                  # 8-byte Spill
	movq	40(%rsp), %r10                  # 8-byte Reload
	jmp	.LBB28_5
	.p2align	4, 0x90
.LBB28_36:                              # %for.inc451
                                        #   in Loop: Header=BB28_5 Depth=1
	movq	32(%rsp), %rdi                  # 8-byte Reload
.LBB28_37:                              # %for.inc451
                                        #   in Loop: Header=BB28_5 Depth=1
	incq	%r13
	movq	prm(%rip), %rax
	movslq	96(%rax), %rdx
	leaq	-1(%rdx), %rcx
	cmpq	%rcx, %r13
	jge	.LBB28_38
.LBB28_5:                               # %for.body6
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB28_10 Depth 2
                                        #     Child Loop BB28_16 Depth 2
	movq	144(%rsp), %rcx                 # 8-byte Reload
	movl	(%rcx,%r13,4), %ebp
	testl	%ebp, %ebp
	jle	.LBB28_37
# %bb.6:                                # %if.end
                                        #   in Loop: Header=BB28_5 Depth=1
	movzbl	dim(%rip), %ecx
	leal	3(%rcx), %esi
	imull	%r13d, %esi
	cmpl	$1, %ecx
	jne	.LBB28_8
# %bb.7:                                # %if.then26
                                        #   in Loop: Header=BB28_5 Depth=1
	movsd	24(%r9,%rsi,8), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, 96(%rsp)                 # 8-byte Spill
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 24(%rsp)                 # 8-byte Spill
.LBB28_8:                               # %if.end30
                                        #   in Loop: Header=BB28_5 Depth=1
	movq	248(%rax), %rcx
	movq	440(%rax), %rdx
	movl	(%rdx,%r13,4), %edx
	decl	%edx
	imull	100(%rax), %edx
	movq	%rdx, 64(%rsp)                  # 8-byte Spill
	movsd	(%rcx,%r13,8), %xmm0            # xmm0 = mem[0],zero
	mulsd	136(%rsp), %xmm0                # 8-byte Folded Reload
	movsd	%xmm0, 184(%rsp)                # 8-byte Spill
	movsd	(%r9,%rsi,8), %xmm0             # xmm0 = mem[0],zero
	movsd	%xmm0, 176(%rsp)                # 8-byte Spill
	movupd	8(%r9,%rsi,8), %xmm0
	movapd	%xmm0, 272(%rsp)                # 16-byte Spill
	movq	prm(%rip), %rax
	movq	448(%rax), %rax
	cmpl	$0, (%rax,%r13,4)
	jle	.LBB28_11
# %bb.9:                                # %for.body35.lr.ph
                                        #   in Loop: Header=BB28_5 Depth=1
	movq	IexclAt(%rip), %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB28_10:                              # %for.body35
                                        #   Parent Loop BB28_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rax,%r13,8), %rdx
	movslq	(%rdx,%rcx,4), %rdx
	movl	%r13d, -4(%rdi,%rdx,4)
	incq	%rcx
	movq	prm(%rip), %rdx
	movq	448(%rdx), %rdx
	movslq	(%rdx,%r13,4), %rdx
	cmpq	%rdx, %rcx
	jl	.LBB28_10
.LBB28_11:                              # %for.end45
                                        #   in Loop: Header=BB28_5 Depth=1
	xorl	%eax, %eax
	cmpl	$0, 20(%rsp)                    # 4-byte Folded Reload
	jne	.LBB28_13
# %bb.12:                               # %if.then47
                                        #   in Loop: Header=BB28_5 Depth=1
	movq	128(%rsp), %rax                 # 8-byte Reload
	movl	(%rax,%r13,4), %eax
.LBB28_13:                              # %if.end50
                                        #   in Loop: Header=BB28_5 Depth=1
	testl	%ebp, %ebp
	movq	%rsi, 152(%rsp)                 # 8-byte Spill
	jle	.LBB28_14
# %bb.15:                               # %for.body53.lr.ph
                                        #   in Loop: Header=BB28_5 Depth=1
	movq	64(%rsp), %rcx                  # 8-byte Reload
	decl	%ecx
	movq	%rcx, 64(%rsp)                  # 8-byte Spill
	movslq	%eax, %r15
	xorpd	%xmm8, %xmm8
	xorpd	%xmm9, %xmm9
	jmp	.LBB28_16
	.p2align	4, 0x90
.LBB28_33:                              # %for.inc425
                                        #   in Loop: Header=BB28_16 Depth=2
	incq	%r15
	decq	%rbp
	je	.LBB28_34
.LBB28_16:                              # %for.body53
                                        #   Parent Loop BB28_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	$0, (%r10,%r13,8)
	jne	.LBB28_18
# %bb.17:                               # %if.then57
                                        #   in Loop: Header=BB28_16 Depth=2
	movq	nabout@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rdi
	movl	$.L.str.85, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	movsd	%xmm6, 8(%rsp)                  # 8-byte Spill
	movapd	%xmm7, 80(%rsp)                 # 16-byte Spill
	movapd	%xmm8, 112(%rsp)                # 16-byte Spill
	movsd	%xmm9, 72(%rsp)                 # 8-byte Spill
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	callq	fflush@PLT
	movsd	72(%rsp), %xmm9                 # 8-byte Reload
                                        # xmm9 = mem[0],zero
	movapd	112(%rsp), %xmm8                # 16-byte Reload
	movapd	80(%rsp), %xmm7                 # 16-byte Reload
	movsd	8(%rsp), %xmm6                  # 8-byte Reload
                                        # xmm6 = mem[0],zero
	movq	40(%rsp), %r10                  # 8-byte Reload
	movq	48(%rsp), %r9                   # 8-byte Reload
	movq	56(%rsp), %r8                   # 8-byte Reload
.LBB28_18:                              # %if.end60
                                        #   in Loop: Header=BB28_16 Depth=2
	movq	(%r10,%r13,8), %rax
	movslq	(%rax,%r15,4), %rbx
	movzbl	dim(%rip), %eax
	cmpl	$0, 20(%rsp)                    # 4-byte Folded Reload
	jne	.LBB28_20
# %bb.19:                               # %lor.lhs.false
                                        #   in Loop: Header=BB28_16 Depth=2
	movq	32(%rsp), %rcx                  # 8-byte Reload
	movl	(%rcx,%rbx,4), %ecx
	cmpq	%rcx, %r13
	je	.LBB28_33
.LBB28_20:                              # %if.then71
                                        #   in Loop: Header=BB28_16 Depth=2
	leal	3(%rax), %r14d
	imulq	%rbx, %r14
	movsd	176(%rsp), %xmm11               # 8-byte Reload
                                        # xmm11 = mem[0],zero
	subsd	(%r9,%r14,8), %xmm11
	movslq	%r14d, %r12
	movsd	8(%r9,%r12,8), %xmm0            # xmm0 = mem[0],zero
	movhpd	16(%r9,%r12,8), %xmm0           # xmm0 = xmm0[0],mem[0]
	movapd	272(%rsp), %xmm10               # 16-byte Reload
	subpd	%xmm0, %xmm10
	movapd	%xmm10, %xmm0
	mulsd	%xmm10, %xmm0
	movapd	%xmm11, %xmm1
	mulsd	%xmm11, %xmm1
	addsd	%xmm0, %xmm1
	movapd	%xmm10, %xmm4
	unpckhpd	%xmm10, %xmm4                   # xmm4 = xmm4[1],xmm10[1]
	mulsd	%xmm4, %xmm4
	addsd	%xmm1, %xmm4
	testb	%al, %al
	je	.LBB28_22
# %bb.21:                               # %if.then88
                                        #   in Loop: Header=BB28_16 Depth=2
	movsd	96(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	24(%r9,%r12,8), %xmm0
	movsd	%xmm0, 168(%rsp)                # 8-byte Spill
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm4
.LBB28_22:                              # %if.end94
                                        #   in Loop: Header=BB28_16 Depth=2
	ucomisd	.LCPI28_5(%rip), %xmm4
	jb	.LBB28_24
# %bb.23:                               #   in Loop: Header=BB28_16 Depth=2
	xorps	%xmm0, %xmm0
	sqrtsd	%xmm4, %xmm0
	jmp	.LBB28_25
	.p2align	4, 0x90
.LBB28_24:                              # %call.sqrt
                                        #   in Loop: Header=BB28_16 Depth=2
	movapd	%xmm4, %xmm0
	movsd	%xmm6, 8(%rsp)                  # 8-byte Spill
	movapd	%xmm7, 80(%rsp)                 # 16-byte Spill
	movapd	%xmm8, 112(%rsp)                # 16-byte Spill
	movsd	%xmm9, 72(%rsp)                 # 8-byte Spill
	movapd	%xmm10, 240(%rsp)               # 16-byte Spill
	movsd	%xmm11, 160(%rsp)               # 8-byte Spill
	movapd	%xmm4, 224(%rsp)                # 16-byte Spill
	callq	sqrt@PLT
	movapd	224(%rsp), %xmm4                # 16-byte Reload
	movsd	160(%rsp), %xmm11               # 8-byte Reload
                                        # xmm11 = mem[0],zero
	movapd	240(%rsp), %xmm10               # 16-byte Reload
	movsd	72(%rsp), %xmm9                 # 8-byte Reload
                                        # xmm9 = mem[0],zero
	movapd	112(%rsp), %xmm8                # 16-byte Reload
	movapd	80(%rsp), %xmm7                 # 16-byte Reload
	movsd	8(%rsp), %xmm6                  # 8-byte Reload
                                        # xmm6 = mem[0],zero
	movq	40(%rsp), %r10                  # 8-byte Reload
	movq	48(%rsp), %r9                   # 8-byte Reload
	movq	56(%rsp), %r8                   # 8-byte Reload
.LBB28_25:                              # %if.end94.split
                                        #   in Loop: Header=BB28_16 Depth=2
	movsd	.LCPI28_0(%rip), %xmm3          # xmm3 = mem[0],zero
	movapd	%xmm3, %xmm2
	divsd	%xmm4, %xmm2
	movq	prm(%rip), %rax
	movq	248(%rax), %rcx
	movq	440(%rax), %rsi
	movl	(%rsi,%rbx,4), %edx
	movq	64(%rsp), %rdi                  # 8-byte Reload
	addl	%edx, %edi
	movsd	104(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	ucomisd	%xmm3, %xmm1
	movsd	(%rcx,%rbx,8), %xmm1            # xmm1 = mem[0],zero
	mulsd	184(%rsp), %xmm1                # 8-byte Folded Reload
	movq	456(%rax), %rcx
	movslq	%edi, %rdi
	movl	(%rcx,%rdi,4), %ecx
	jne	.LBB28_27
	jp	.LBB28_27
# %bb.26:                               # %if.end94.split
                                        #   in Loop: Header=BB28_16 Depth=2
	testl	%ecx, %ecx
	jg	.LBB28_27
# %bb.30:                               # %if.else339
                                        #   in Loop: Header=BB28_16 Depth=2
	notl	%ecx
	movapd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm3
	movq	344(%rax), %rdx
	movq	352(%rax), %rax
	movslq	%ecx, %rcx
	movsd	(%rdx,%rcx,8), %xmm4            # xmm4 = mem[0],zero
	mulsd	%xmm3, %xmm4
	mulsd	%xmm2, %xmm4
	mulsd	(%rax,%rcx,8), %xmm3
	movapd	%xmm4, %xmm5
	subsd	%xmm3, %xmm5
	mulsd	.LCPI28_4(%rip), %xmm4
	unpcklpd	%xmm5, %xmm3                    # xmm3 = xmm3[0],xmm5[0]
	mulpd	192(%rsp), %xmm3                # 16-byte Folded Reload
	jmp	.LBB28_31
	.p2align	4, 0x90
.LBB28_27:                              # %if.then281
                                        #   in Loop: Header=BB28_16 Depth=2
	testl	%ecx, %ecx
	jg	.LBB28_29
# %bb.28:                               # %if.else284
                                        #   in Loop: Header=BB28_16 Depth=2
	movl	(%rsi,%r13,4), %ecx
	cmpl	%edx, %ecx
	movl	%edx, %esi
	cmovgl	%ecx, %esi
	cmovll	%ecx, %edx
	leal	-1(%rsi), %edi
	imull	%esi, %edi
	movl	%edi, %ecx
	shrl	$31, %ecx
	addl	%edi, %ecx
	sarl	%ecx
	addl	%edx, %ecx
.LBB28_29:                              # %if.end320
                                        #   in Loop: Header=BB28_16 Depth=2
	movapd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm3
	movq	328(%rax), %rdx
	movq	336(%rax), %rax
	movslq	%ecx, %rcx
	movsd	-8(%rdx,%rcx,8), %xmm4          # xmm4 = mem[0],zero
	mulsd	%xmm3, %xmm4
	mulsd	%xmm3, %xmm4
	mulsd	-8(%rax,%rcx,8), %xmm3
	movapd	%xmm4, %xmm5
	subsd	%xmm3, %xmm5
	mulsd	.LCPI28_4(%rip), %xmm4
	unpcklpd	%xmm5, %xmm3                    # xmm3 = xmm3[0],xmm5[0]
	mulpd	208(%rsp), %xmm3                # 16-byte Folded Reload
.LBB28_31:                              # %if.end363
                                        #   in Loop: Header=BB28_16 Depth=2
	unpcklpd	%xmm7, %xmm4                    # xmm4 = xmm4[0],xmm7[0]
	addpd	%xmm3, %xmm4
	movapd	%xmm4, %xmm7
	leaq	1(%r12), %rcx
	leaq	2(%r12), %rax
	mulsd	%xmm2, %xmm0
	mulsd	%xmm0, %xmm1
	addsd	%xmm1, %xmm6
	xorpd	.LCPI28_3(%rip), %xmm1
	movapd	%xmm4, %xmm2
	mulsd	256(%rsp), %xmm2                # 16-byte Folded Reload
	addsd	%xmm1, %xmm2
	mulsd	%xmm0, %xmm2
	mulsd	%xmm0, %xmm2
	mulsd	%xmm2, %xmm11
	movapd	%xmm2, %xmm0
	unpcklpd	%xmm2, %xmm0                    # xmm0 = xmm0[0],xmm2[0]
	mulpd	%xmm0, %xmm10
	addsd	%xmm11, %xmm9
	addpd	%xmm10, %xmm8
	movsd	(%r8,%r14,8), %xmm0             # xmm0 = mem[0],zero
	subsd	%xmm11, %xmm0
	movsd	%xmm0, (%r8,%r14,8)
	movsd	(%r8,%rcx,8), %xmm0             # xmm0 = mem[0],zero
	subsd	%xmm10, %xmm0
	movsd	%xmm0, (%r8,%rcx,8)
	movsd	(%r8,%rax,8), %xmm0             # xmm0 = mem[0],zero
	unpckhpd	%xmm10, %xmm10                  # xmm10 = xmm10[1,1]
	subsd	%xmm10, %xmm0
	movsd	%xmm0, (%r8,%rax,8)
	unpckhpd	%xmm4, %xmm7                    # xmm7 = xmm7[1],xmm4[1]
	cmpb	$1, dim(%rip)
	jne	.LBB28_33
# %bb.32:                               # %for.inc425.sink.split
                                        #   in Loop: Header=BB28_16 Depth=2
	mulsd	168(%rsp), %xmm2                # 8-byte Folded Reload
	movsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addsd	%xmm2, %xmm0
	movsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	movsd	24(%r8,%r12,8), %xmm0           # xmm0 = mem[0],zero
	subsd	%xmm2, %xmm0
	movsd	%xmm0, 24(%r8,%r12,8)
	jmp	.LBB28_33
	.p2align	4, 0x90
.LBB28_14:                              #   in Loop: Header=BB28_5 Depth=1
	xorpd	%xmm8, %xmm8
	xorpd	%xmm9, %xmm9
.LBB28_34:                              # %for.end427
                                        #   in Loop: Header=BB28_5 Depth=1
	movq	152(%rsp), %rcx                 # 8-byte Reload
	leaq	1(%rcx), %rax
	addsd	(%r8,%rcx,8), %xmm9
	movsd	%xmm9, (%r8,%rcx,8)
	movupd	(%r8,%rax,8), %xmm0
	addpd	%xmm8, %xmm0
	movupd	%xmm0, (%r8,%rax,8)
	cmpb	$1, dim(%rip)
	jne	.LBB28_36
# %bb.35:                               # %if.then444
                                        #   in Loop: Header=BB28_5 Depth=1
	movsd	24(%r8,%rcx,8), %xmm0           # xmm0 = mem[0],zero
	addsd	24(%rsp), %xmm0                 # 8-byte Folded Reload
	movsd	%xmm0, 24(%r8,%rcx,8)
	jmp	.LBB28_36
.LBB28_38:
	movq	360(%rsp), %rbx
	movq	352(%rsp), %r14
.LBB28_39:                              # %for.end453
	movapd	%xmm7, 80(%rsp)                 # 16-byte Spill
	movsd	%xmm6, 8(%rsp)                  # 8-byte Spill
	movl	$-1, %esi
                                        # kill: def $edx killed $edx killed $rdx
	callq	free_ivector@PLT
	movaps	80(%rsp), %xmm0                 # 16-byte Reload
	movsd	%xmm0, (%r14)
	movsd	8(%rsp), %xmm0                  # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movsd	%xmm0, (%rbx)
	addq	$296, %rsp                      # imm = 0x128
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
.Lfunc_end28:
	.size	nbond, .Lfunc_end28-nbond
	.cfi_endproc
                                        # -- End function
	.type	ntpr,@object                    # @ntpr
	.data
	.globl	ntpr
	.p2align	2, 0x0
ntpr:
	.long	100                             # 0x64
	.size	ntpr, 4

	.type	gb,@object                      # @gb
	.bss
	.globl	gb
	.p2align	2, 0x0
gb:
	.long	0                               # 0x0
	.size	gb, 4

	.type	blocksize,@object               # @blocksize
	.data
	.globl	blocksize
	.p2align	2, 0x0
blocksize:
	.long	8                               # 0x8
	.size	blocksize, 4

	.type	ntpr_md,@object                 # @ntpr_md
	.globl	ntpr_md
	.p2align	2, 0x0
ntpr_md:
	.long	100                             # 0x64
	.size	ntpr_md, 4

	.type	dim,@object                     # @dim
	.local	dim
	.comm	dim,1,4
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"-"
	.size	.L.str, 2

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"r"
	.size	.L.str.1, 2

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"getx: can't open file %s\n"
	.size	.L.str.2, 26

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"%d"
	.size	.L.str.3, 3

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"w"
	.size	.L.str.4, 2

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Can't open file %s.\n"
	.size	.L.str.5, 21

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"%6d\n"
	.size	.L.str.6, 5

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"%20.15f%20.15f%20.15f\n"
	.size	.L.str.7, 23

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"%20.15f%20.15f%20.15f%20.15f\n"
	.size	.L.str.8, 30

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"getxv: can't open file %s\n"
	.size	.L.str.9, 27

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"%d %lf"
	.size	.L.str.10, 7

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"no velocities were found\n"
	.size	.L.str.11, 26

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"%s\n"
	.size	.L.str.12, 4

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	"%6d%15.5f\n"
	.size	.L.str.13, 11

	.type	.L.str.14,@object               # @.str.14
.L.str.14:
	.asciz	"%12.7f%12.7f%12.7f%12.7f%12.7f%12.7f\n"
	.size	.L.str.14, 38

	.type	.L.str.15,@object               # @.str.15
.L.str.15:
	.asciz	"%12.7f%12.7f%12.7f\n"
	.size	.L.str.15, 20

	.type	.L.str.16,@object               # @.str.16
.L.str.16:
	.asciz	"\nFirst derivative timing summary:\n"
	.size	.L.str.16, 35

	.type	.L.str.17,@object               # @.str.17
.L.str.17:
	.asciz	"   constraints %10.2f\n"
	.size	.L.str.17, 23

	.type	.L.str.18,@object               # @.str.18
.L.str.18:
	.asciz	"   bonds       %10.2f\n"
	.size	.L.str.18, 23

	.type	.L.str.19,@object               # @.str.19
.L.str.19:
	.asciz	"   angles      %10.2f\n"
	.size	.L.str.19, 23

	.type	.L.str.20,@object               # @.str.20
.L.str.20:
	.asciz	"   torsions    %10.2f\n"
	.size	.L.str.20, 23

	.type	.L.str.21,@object               # @.str.21
.L.str.21:
	.asciz	"   pairlist    %10.2f\n"
	.size	.L.str.21, 23

	.type	.L.str.22,@object               # @.str.22
.L.str.22:
	.asciz	"   nonbonds    %10.2f\n"
	.size	.L.str.22, 23

	.type	.L.str.23,@object               # @.str.23
.L.str.23:
	.asciz	"   gen. Born   %10.2f\n"
	.size	.L.str.23, 23

	.type	.L.str.24,@object               # @.str.24
.L.str.24:
	.asciz	"   mme         %10.2f\n"
	.size	.L.str.24, 23

	.type	.L.str.25,@object               # @.str.25
.L.str.25:
	.asciz	"   Total       %10.2f\n\n"
	.size	.L.str.25, 24

	.type	.L.str.26,@object               # @.str.26
.L.str.26:
	.asciz	"   reduction   %10.2f\n"
	.size	.L.str.26, 23

	.type	.L.str.27,@object               # @.str.27
.L.str.27:
	.asciz	"   molec. dyn. %10.2f\n\n"
	.size	.L.str.27, 24

	.type	mme_init.nold,@object           # @mme_init.nold
	.local	mme_init.nold
	.comm	mme_init.nold,4,4
	.type	prm,@object                     # @prm
	.local	prm
	.comm	prm,8,8
	.type	x0,@object                      # @x0
	.local	x0
	.comm	x0,8,8
	.type	binposfp,@object                # @binposfp
	.local	binposfp
	.comm	binposfp,8,8
	.type	frozen,@object                  # @frozen
	.local	frozen
	.comm	frozen,8,8
	.type	constrained,@object             # @constrained
	.local	constrained
	.comm	constrained,8,8
	.type	nconstrained,@object            # @nconstrained
	.local	nconstrained
	.comm	nconstrained,4,4
	.type	.L.str.52,@object               # @.str.52
.L.str.52:
	.asciz	"constrained all %d atoms\n"
	.size	.L.str.52, 26

	.type	.L.str.53,@object               # @.str.53
.L.str.53:
	.asciz	"constrained %d atoms using expression %s\n"
	.size	.L.str.53, 42

	.type	gbalpha,@object                 # @gbalpha
	.local	gbalpha
	.comm	gbalpha,8,8
	.type	gbbeta,@object                  # @gbbeta
	.local	gbbeta
	.comm	gbbeta,8,8
	.type	gbgamma,@object                 # @gbgamma
	.local	gbgamma
	.comm	gbgamma,8,8
	.type	pairlistnp,@object              # @pairlistnp
	.local	pairlistnp
	.comm	pairlistnp,8,8
	.type	upairsnp,@object                # @upairsnp
	.local	upairsnp
	.comm	upairsnp,8,8
	.type	lpairsnp,@object                # @lpairsnp
	.local	lpairsnp
	.comm	lpairsnp,8,8
	.type	.L.str.54,@object               # @.str.54
.L.str.54:
	.asciz	"Error allocating pairlistnp array in mme_init!\n"
	.size	.L.str.54, 48

	.type	pairlist2np,@object             # @pairlist2np
	.local	pairlist2np
	.comm	pairlist2np,8,8
	.type	upairs2np,@object               # @upairs2np
	.local	upairs2np
	.comm	upairs2np,8,8
	.type	lpairs2np,@object               # @lpairs2np
	.local	lpairs2np
	.comm	lpairs2np,8,8
	.type	.L.str.55,@object               # @.str.55
.L.str.55:
	.asciz	"Error allocating pairlist2np array in mme_init!\n"
	.size	.L.str.55, 49

	.type	pairlist,@object                # @pairlist
	.local	pairlist
	.comm	pairlist,8,8
	.type	nb_pairs,@object                # @nb_pairs
	.data
	.p2align	2, 0x0
nb_pairs:
	.long	4294967295                      # 0xffffffff
	.size	nb_pairs, 4

	.type	upairs,@object                  # @upairs
	.local	upairs
	.comm	upairs,8,8
	.type	lpairs,@object                  # @lpairs
	.local	lpairs
	.comm	lpairs,8,8
	.type	.L.str.56,@object               # @.str.56
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.56:
	.asciz	"Error allocating pairlist array in mme_init!\n"
	.size	.L.str.56, 46

	.type	nfrozen,@object                 # @nfrozen
	.local	nfrozen
	.comm	nfrozen,4,4
	.type	.L.str.57,@object               # @.str.57
.L.str.57:
	.asciz	"freezing %d atoms using expression %s for moving atoms\n"
	.size	.L.str.57, 56

	.type	N14pearlist,@object             # @N14pearlist
	.local	N14pearlist
	.comm	N14pearlist,8,8
	.type	.L.str.58,@object               # @.str.58
.L.str.58:
	.asciz	"Error allocating N14pearlist array in mme_init!\n"
	.size	.L.str.58, 49

	.type	IexclAt,@object                 # @IexclAt
	.local	IexclAt
	.comm	IexclAt,8,8
	.type	.L.str.59,@object               # @.str.59
.L.str.59:
	.asciz	"Error allocating IexclAt array in mme_init!\n"
	.size	.L.str.59, 45

	.type	tdiagd,@object                  # @tdiagd
	.bss
	.globl	tdiagd
	.p2align	3, 0x0
tdiagd:
	.quad	0x0000000000000000              # double 0
	.size	tdiagd, 8

	.type	tdiag,@object                   # @tdiag
	.globl	tdiag
	.p2align	3, 0x0
tdiag:
	.quad	0x0000000000000000              # double 0
	.size	tdiag, 8

	.type	tlevel,@object                  # @tlevel
	.globl	tlevel
	.p2align	3, 0x0
tlevel:
	.quad	0x0000000000000000              # double 0
	.size	tlevel, 8

	.type	tnewton,@object                 # @tnewton
	.globl	tnewton
	.p2align	3, 0x0
tnewton:
	.quad	0x0000000000000000              # double 0
	.size	tnewton, 8

	.type	tcholesky,@object               # @tcholesky
	.globl	tcholesky
	.p2align	3, 0x0
tcholesky:
	.quad	0x0000000000000000              # double 0
	.size	tcholesky, 8

	.type	tconjgrad,@object               # @tconjgrad
	.globl	tconjgrad
	.p2align	3, 0x0
tconjgrad:
	.quad	0x0000000000000000              # double 0
	.size	tconjgrad, 8

	.type	tdgeev,@object                  # @tdgeev
	.globl	tdgeev
	.p2align	3, 0x0
tdgeev:
	.quad	0x0000000000000000              # double 0
	.size	tdgeev, 8

	.type	tmmetwo,@object                 # @tmmetwo
	.globl	tmmetwo
	.p2align	3, 0x0
tmmetwo:
	.quad	0x0000000000000000              # double 0
	.size	tmmetwo, 8

	.type	tmmeone,@object                 # @tmmeone
	.globl	tmmeone
	.p2align	3, 0x0
tmmeone:
	.quad	0x0000000000000000              # double 0
	.size	tmmeone, 8

	.type	chknm,@object                   # @chknm
	.local	chknm
	.comm	chknm,8,8
	.type	.L.str.60,@object               # @.str.60
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.60:
	.asciz	"\tcheckpoint:  %s\n"
	.size	.L.str.60, 18

	.type	md.xold,@object                 # @md.xold
	.local	md.xold
	.comm	md.xold,8,8
	.type	md.accel,@object                # @md.accel
	.local	md.accel
	.comm	md.accel,8,8
	.type	md.minv,@object                 # @md.minv
	.local	md.minv
	.comm	md.minv,8,8
	.type	md.nold,@object                 # @md.nold
	.local	md.nold
	.comm	md.nold,4,4
	.type	.L.str.61,@object               # @.str.61
.L.str.61:
	.asciz	"unable to allocate space for minv\n"
	.size	.L.str.61, 35

	.type	.L.str.62,@object               # @.str.62
.L.str.62:
	.asciz	"unable to allocate space for xold\n"
	.size	.L.str.62, 35

	.type	.L.str.64,@object               # @.str.64
.L.str.64:
	.asciz	"unable to allocate space for accel\n"
	.size	.L.str.64, 36

	.type	max_step,@object                # @max_step
	.data
	.p2align	2, 0x0
max_step:
	.long	4294967295                      # 0xffffffff
	.size	max_step, 4

	.type	t,@object                       # @t
	.local	t
	.comm	t,8,8
	.type	tnmode,@object                  # @tnmode
	.bss
	.globl	tnmode
	.p2align	3, 0x0
tnmode:
	.quad	0x0000000000000000              # double 0
	.size	tnmode, 8

	.type	mme34.grad,@object              # @mme34.grad
	.local	mme34.grad
	.comm	mme34.grad,8,8
	.type	.L.str.65,@object               # @.str.65
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.65:
	.asciz	"      iter    Total\n"
	.size	.L.str.65, 21

	.type	.L.str.66,@object               # @.str.66
.L.str.66:
	.asciz	"ff:%6d %9.2f\n"
	.size	.L.str.66, 14

	.type	.L.str.67,@object               # @.str.67
.L.str.67:
	.asciz	"     bond:  %15.9f\n"
	.size	.L.str.67, 20

	.type	.L.str.68,@object               # @.str.68
.L.str.68:
	.asciz	"    angle:  %15.9f\n"
	.size	.L.str.68, 20

	.type	.L.str.69,@object               # @.str.69
.L.str.69:
	.asciz	" dihedral:  %15.9f\n"
	.size	.L.str.69, 20

	.type	.L.str.70,@object               # @.str.70
.L.str.70:
	.asciz	"    enb14:  %15.9f\n"
	.size	.L.str.70, 20

	.type	.L.str.71,@object               # @.str.71
.L.str.71:
	.asciz	"    eel14:  %15.9f\n"
	.size	.L.str.71, 20

	.type	.L.str.72,@object               # @.str.72
.L.str.72:
	.asciz	"      enb:  %15.9f\n"
	.size	.L.str.72, 20

	.type	.L.str.73,@object               # @.str.73
.L.str.73:
	.asciz	"      eel:  %15.9f\n"
	.size	.L.str.73, 20

	.type	.L.str.74,@object               # @.str.74
.L.str.74:
	.asciz	"      egb:  %15.9f\n"
	.size	.L.str.74, 20

	.type	.L.str.75,@object               # @.str.75
.L.str.75:
	.asciz	"    econs:  %15.9f\n"
	.size	.L.str.75, 20

	.type	.L.str.76,@object               # @.str.76
.L.str.76:
	.asciz	"    esurf:  %15.9f\n"
	.size	.L.str.76, 20

	.type	.L.str.77,@object               # @.str.77
.L.str.77:
	.asciz	"    Total:  %15.9f\n"
	.size	.L.str.77, 20

	.type	egb.reff,@object                # @egb.reff
	.local	egb.reff
	.comm	egb.reff,8,8
	.type	egb.sumdeijda,@object           # @egb.sumdeijda
	.local	egb.sumdeijda
	.comm	egb.sumdeijda,8,8
	.type	egb.psi,@object                 # @egb.psi
	.local	egb.psi
	.comm	egb.psi,8,8
	.type	egb.reqack,@object              # @egb.reqack
	.local	egb.reqack
	.comm	egb.reqack,8,8
	.type	egb.iexw,@object                # @egb.iexw
	.local	egb.iexw
	.comm	egb.iexw,8,8
	.type	.L.str.80,@object               # @.str.80
.L.str.80:
	.asciz	"NULL pair list entry in egb loop 1, taskid = %d\n"
	.size	.L.str.80, 49

	.type	.L.str.82,@object               # @.str.82
.L.str.82:
	.asciz	"NULL pair list entry in egb loop 3, taskid = %d\n"
	.size	.L.str.82, 49

	.type	.L.str.83,@object               # @.str.83
.L.str.83:
	.asciz	"NULL pair list entry in egb loop 5, taskid = %d\n"
	.size	.L.str.83, 49

	.type	.L.str.84,@object               # @.str.84
.L.str.84:
	.asciz	"bad value for Pn: %d %d %d %d %8.3f\n"
	.size	.L.str.84, 37

	.type	.L.str.85,@object               # @.str.85
.L.str.85:
	.asciz	"NULL pair list entry in nbond loop 1, taskid = %d\n"
	.size	.L.str.85, 51

	.ident	"clang version 17.0.6 (git@github.com:webmiche/llvm-project.git 05dfeb4f83cb840f44d291a65e70580461bddbf7)"
	.section	".note.GNU-stack","",@progbits
