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
	movq	%rax, %r14
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
	movq	(%rax), %r14
.LBB15_5:                               # %if.end18
	leaq	32(%rsp), %rbp
	movq	%rbp, %rdi
	movl	$82, %esi
	movq	%r14, %rdx
	callq	ggets@PLT
	movq	%rbp, %rdi
	movl	$82, %esi
	movq	%r14, %rdx
	callq	ggets@PLT
	movq	$0, (%r13)
	xorl	%ebx, %ebx
	movl	$.L.str.10, %esi
	movq	%rbp, %rdi
	movq	%r15, %rdx
	movq	%r13, %rcx
	xorl	%eax, %eax
	callq	__isoc99_sscanf@PLT
	movq	%rbp, %rdi
	movl	$82, %esi
	movq	%r14, (%rsp)                    # 8-byte Spill
	movq	%r14, %rdx
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
	leal	(%rax,%rax,2), %eax
	cltq
	addl	$12, %ebx
	cmpq	%rax, %rbp
	jge	.LBB15_11
.LBB15_7:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	%ebp, %eax
	movl	$2863311531, %ecx               # imm = 0xAAAAAAAB
	imulq	%rcx, %rax
	shrq	$34, %rax
	shll	$3, %eax
	leal	(%rax,%rax,8), %eax
	movl	%ebx, %ecx
	subl	%eax, %ecx
	movq	%rbp, %rax
	movabsq	$-6148914691236517205, %rdx     # imm = 0xAAAAAAAAAAAAAAAB
	mulq	%rdx
	shrq	$2, %rdx
	leal	(%rdx,%rdx,2), %eax
	leal	5(,%rax,2), %r14d
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
	movl	(%r15), %eax
	cmpl	%ebp, %r14d
	jne	.LBB15_10
# %bb.8:                                # %land.lhs.true
                                        #   in Loop: Header=BB15_7 Depth=1
	movslq	%eax, %rcx
	leaq	(%rcx,%rcx,2), %rcx
	decq	%rcx
	cmpq	%rcx, %rbp
	jge	.LBB15_10
# %bb.9:                                # %if.then38
                                        #   in Loop: Header=BB15_7 Depth=1
	leaq	32(%rsp), %rdi
	movl	$82, %esi
	movq	(%rsp), %rdx                    # 8-byte Reload
	callq	ggets@PLT
	movl	(%r15), %eax
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
	movl	$5, %ebp
	leaq	19(%rsp), %r12
	xorl	%r13d, %r13d
	jmp	.LBB15_14
	.p2align	4, 0x90
.LBB15_16:                              # %for.inc68
                                        #   in Loop: Header=BB15_14 Depth=1
	incq	%r13
	movslq	(%r15), %rax
	leaq	(%rax,%rax,2), %rax
	addl	$12, %ebx
	decl	%ebp
	cmpq	%rax, %r13
	jge	.LBB15_20
.LBB15_14:                              # %for.body49
                                        # =>This Inner Loop Header: Depth=1
	movl	%r13d, %eax
	movl	$2863311531, %ecx               # imm = 0xAAAAAAAB
	imulq	%rcx, %rax
	shrq	$34, %rax
	leal	(,%rax,8), %ecx
	leal	(%rcx,%rcx,8), %ecx
	movl	%ebx, %edx
	subl	%ecx, %edx
	leal	(%rax,%rax,2), %r14d
	addl	%r14d, %r14d
	leaq	(%rsp,%rdx), %rsi
	addq	$32, %rsi
	movl	$12, %edx
	movq	%r12, %rdi
	callq	strncpy@PLT
	movb	$0, 31(%rsp)
	movq	%r12, %rdi
	xorl	%esi, %esi
	callq	strtod@PLT
	movq	8(%rsp), %rax                   # 8-byte Reload
	movsd	%xmm0, (%rax,%r13,8)
	addl	%ebp, %r14d
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
	movzbl	(%r12), %edx
	testb	%dl, %dl
	je	.LBB17_10
# %bb.4:                                # %for.cond2.preheader.i.preheader
	movq	%rax, %rcx
	shlq	$32, %rcx
	movabsq	$-8589934592, %rbp              # imm = 0xFFFFFFFE00000000
	addq	%rcx, %rbp
	xorl	%ebx, %ebx
	movabsq	$-4294967296, %rcx              # imm = 0xFFFFFFFF00000000
	movl	%r15d, %r13d
	jmp	.LBB17_5
	.p2align	4, 0x90
.LBB17_9:                               # %for.inc25.i
                                        #   in Loop: Header=BB17_5 Depth=1
	addq	%rcx, %rbp
	incl	%r13d
	incq	%rbx
	testb	%dl, %dl
	je	.LBB17_10
.LBB17_5:                               # %for.cond2.preheader.i
                                        # =>This Inner Loop Header: Depth=1
	cmpb	$37, %dl
	movzbl	1(%r12,%rbx), %edx
	jne	.LBB17_9
# %bb.6:                                # %for.cond2.preheader.i
                                        #   in Loop: Header=BB17_5 Depth=1
	cmpb	$100, %dl
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
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB19_14:                              # %for.body667
                                        # =>This Inner Loop Header: Depth=1
	movq	pairlistnp(%rip), %rax
	movq	(%rax,%rbx,8), %rdi
	xorl	%esi, %esi
	movl	$1, %edx
	callq	free_ivector@PLT
	incq	%rbx
	movslq	mme_init.nold(%rip), %rax
	cmpq	%rax, %rbx
	jl	.LBB19_14
# %bb.15:                               # %for.end672.loopexit
	movq	pairlistnp(%rip), %rdi
.LBB19_16:                              # %for.end672
	callq	free@PLT
.LBB19_17:                              # %if.end673
	movq	upairsnp(%rip), %rdi
	movq	prm(%rip), %rax
	movl	96(%rax), %edx
	xorl	%ebp, %ebp
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
	movq	%rax, %r13
	movq	%rax, lpairsnp(%rip)
	movq	prm(%rip), %rbx
	movslq	96(%rbx), %r12
	leaq	(,%r12,8), %rdi
	callq	malloc@PLT
	movq	%rax, pairlistnp(%rip)
	testq	%rax, %rax
	je	.LBB19_81
# %bb.18:                               # %for.cond691.preheader
	testl	%r12d, %r12d
	jle	.LBB19_21
# %bb.19:                               # %for.body695.lr.ph
	movq	upairsnp(%rip), %rcx
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB19_20:                              # %for.body695
                                        # =>This Inner Loop Header: Depth=1
	movq	$0, (%rax,%rbp,8)
	movl	$0, (%rcx,%rbp,4)
	movl	$0, (%r13,%rbp,4)
	incq	%rbp
	movslq	96(%rbx), %r12
	cmpq	%r12, %rbp
	jl	.LBB19_20
.LBB19_21:                              # %for.end704
	movl	%ebp, 12(%rsp)
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
	movq	prm(%rip), %rbx
	jmp	.LBB19_27
.LBB19_23:
	xorl	%r12d, %r12d
.LBB19_27:                              # %for.end716
	movl	%r12d, 12(%rsp)
	callq	free@PLT
	movl	96(%rbx), %r12d
.LBB19_28:                              # %if.end717
	movq	upairs2np(%rip), %rdi
	xorl	%esi, %esi
	movl	%r12d, %edx
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
	movq	%rax, %r13
	movq	%rax, lpairs2np(%rip)
	movq	prm(%rip), %rbx
	movslq	96(%rbx), %r12
	leaq	(,%r12,8), %rdi
	callq	malloc@PLT
	movq	%rax, pairlist2np(%rip)
	testq	%rax, %rax
	je	.LBB19_35
# %bb.29:                               # %for.cond735.preheader
	testl	%r12d, %r12d
	jle	.LBB19_32
# %bb.30:                               # %for.body739.lr.ph
	movq	upairs2np(%rip), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB19_31:                              # %for.body739
                                        # =>This Inner Loop Header: Depth=1
	movq	$0, (%rax,%rdx,8)
	movl	$0, (%rcx,%rdx,4)
	movl	$0, (%r13,%rdx,4)
	incq	%rdx
	movslq	96(%rbx), %r12
	cmpq	%r12, %rdx
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
	movq	prm(%rip), %rbx
	jmp	.LBB19_41
.LBB19_34:
	xorl	%r12d, %r12d
.LBB19_41:                              # %for.end760
	movl	%r12d, 12(%rsp)
	callq	free@PLT
	movl	96(%rbx), %r12d
.LBB19_42:                              # %if.end761
	movl	$-1, nb_pairs(%rip)
	movq	upairs(%rip), %rdi
	xorl	%esi, %esi
	movl	%r12d, %edx
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
	movq	prm(%rip), %rbx
	movslq	96(%rbx), %r13
	leaq	(,%r13,8), %rdi
	callq	malloc@PLT
	movq	%rax, pairlist(%rip)
	testq	%rax, %rax
	je	.LBB19_82
# %bb.43:                               # %for.cond779.preheader
	testl	%r13d, %r13d
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
	movslq	96(%rbx), %rsi
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
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB19_52:                              # %for.body808
                                        # =>This Inner Loop Header: Depth=1
	movq	N14pearlist(%rip), %rax
	movq	(%rax,%rbx,8), %rdi
	xorl	%esi, %esi
	movl	$1, %edx
	callq	free_ivector@PLT
	incq	%rbx
	movslq	mme_init.nold(%rip), %rax
	cmpq	%rax, %rbx
	jl	.LBB19_52
# %bb.53:                               # %for.end813.loopexit
	movq	N14pearlist(%rip), %rdi
	jmp	.LBB19_54
.LBB19_50:
	xorl	%ebx, %ebx
.LBB19_54:                              # %for.end813
	movl	%ebx, 12(%rsp)
	callq	free@PLT
.LBB19_55:                              # %if.end814
	movq	prm(%rip), %r14
	movslq	96(%r14), %rbx
	leaq	(,%rbx,8), %rdi
	callq	malloc@PLT
	movq	%rax, N14pearlist(%rip)
	testq	%rax, %rax
	je	.LBB19_83
# %bb.56:                               # %for.cond826.preheader
	testl	%ebx, %ebx
	jle	.LBB19_64
# %bb.57:                               # %for.body830.preheader
	xorl	%r15d, %r15d
	xorl	%ebp, %ebp
	jmp	.LBB19_58
	.p2align	4, 0x90
.LBB19_62:                              # %for.end860
                                        #   in Loop: Header=BB19_58 Depth=1
	addl	%edi, %ebp
.LBB19_63:                              # %for.inc866
                                        #   in Loop: Header=BB19_58 Depth=1
	incq	%r15
	movslq	96(%r14), %rcx
	cmpq	%rcx, %r15
	jge	.LBB19_64
.LBB19_58:                              # %for.body830
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB19_61 Depth 2
	movq	$0, (%rax,%r15,8)
	movq	696(%r14), %rcx
	movl	(%rcx,%r15,4), %esi
	testl	%esi, %esi
	jle	.LBB19_63
# %bb.59:                               # %if.then837
                                        #   in Loop: Header=BB19_58 Depth=1
	xorl	%edi, %edi
	callq	ivector@PLT
	movq	%rax, %rcx
	movq	N14pearlist(%rip), %rax
	movq	%rcx, (%rax,%r15,8)
	movq	prm(%rip), %r14
	movq	696(%r14), %rdx
	movl	(%rdx,%r15,4), %edi
	testl	%edi, %edi
	jle	.LBB19_62
# %bb.60:                               # %for.body850.lr.ph
                                        #   in Loop: Header=BB19_58 Depth=1
	movslq	%ebp, %rsi
	shlq	$2, %rsi
	addq	704(%r14), %rsi
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB19_61:                              # %for.body850
                                        #   Parent Loop BB19_58 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rsi,%r8,4), %edi
	movl	%edi, (%rcx,%r8,4)
	incq	%r8
	movslq	(%rdx,%r15,4), %rdi
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
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB19_67:                              # %for.body875
                                        # =>This Inner Loop Header: Depth=1
	movq	IexclAt(%rip), %rax
	movq	(%rax,%rbx,8), %rdi
	xorl	%esi, %esi
	movl	$1, %edx
	callq	free_ivector@PLT
	incq	%rbx
	movslq	mme_init.nold(%rip), %rax
	cmpq	%rax, %rbx
	jl	.LBB19_67
# %bb.68:                               # %for.end880.loopexit
	movq	IexclAt(%rip), %rdi
	movq	prm(%rip), %r14
.LBB19_69:                              # %for.end880
	callq	free@PLT
.LBB19_70:                              # %if.end881
	movslq	96(%r14), %r12
	leaq	(,%r12,8), %rdi
	callq	malloc@PLT
	movq	%rax, IexclAt(%rip)
	testq	%rax, %rax
	je	.LBB19_84
# %bb.71:                               # %for.cond893.preheader
	testl	%r12d, %r12d
	jle	.LBB19_78
# %bb.72:                               # %for.body897.preheader
	xorl	%r15d, %r15d
	xorl	%ebx, %ebx
	jmp	.LBB19_73
	.p2align	4, 0x90
.LBB19_77:                              # %if.end928
                                        #   in Loop: Header=BB19_73 Depth=1
	addl	%esi, %ebx
	incq	%r15
	movslq	96(%r14), %r12
	cmpq	%r12, %r15
	jge	.LBB19_78
.LBB19_73:                              # %for.body897
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB19_76 Depth 2
	movq	$0, (%rax,%r15,8)
	movq	448(%r14), %rcx
	movl	(%rcx,%r15,4), %esi
	testl	%esi, %esi
	jle	.LBB19_77
# %bb.74:                               # %if.then904
                                        #   in Loop: Header=BB19_73 Depth=1
	xorl	%edi, %edi
                                        # kill: def $esi killed $esi killed $rsi
	callq	ivector@PLT
	movq	%rax, %rcx
	movq	IexclAt(%rip), %rax
	movq	%rcx, (%rax,%r15,8)
	movq	prm(%rip), %r14
	movq	448(%r14), %rdx
	movl	(%rdx,%r15,4), %esi
	testl	%esi, %esi
	jle	.LBB19_77
# %bb.75:                               # %for.body917.lr.ph
                                        #   in Loop: Header=BB19_73 Depth=1
	movslq	%ebx, %rdi
	shlq	$2, %rdi
	addq	472(%r14), %rdi
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB19_76:                              # %for.body917
                                        #   Parent Loop BB19_73 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rdi,%r8,4), %esi
	movl	%esi, (%rcx,%r8,4)
	incq	%r8
	movslq	(%rdx,%r15,4), %rsi
	cmpq	%rsi, %r8
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
	cmpl	mme_init.nold(%rip), %r12d
	jle	.LBB19_80
# %bb.79:                               # %if.then939
	leaq	12(%rsp), %rdx
	movq	16(%rsp), %rdi                  # 8-byte Reload
	movq	%rdi, %rsi
	callq	mme34
	movq	prm(%rip), %r14
.LBB19_80:                              # %if.end941
	movl	96(%r14), %eax
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
	subq	$504, %rsp                      # imm = 0x1F8
	.cfi_def_cfa_offset 560
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, 448(%rsp)                 # 8-byte Spill
	movq	%rdi, %r15
	movq	prm(%rip), %rax
	movslq	96(%rax), %rbx
	movq	%rdx, 248(%rsp)                 # 8-byte Spill
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
	je	.LBB20_200
# %bb.13:                               # %if.then5
	movzbl	dim(%rip), %edx
	addq	$3, %rdx
	imulq	%rbx, %rdx
	xorl	%esi, %esi
	callq	free_vector@PLT
	xorpd	%xmm3, %xmm3
	movq	$0, mme34.grad(%rip)
	jmp	.LBB20_200
.LBB20_14:                              # %if.end20
	movq	nabout@GOTPCREL(%rip), %r14
	movq	(%r14), %rcx
	movl	$.L.str.65, %edi
	movl	$20, %esi
	movl	$1, %edx
	callq	fwrite@PLT
	movq	(%r14), %rdi
	callq	fflush@PLT
	movq	248(%rsp), %rax                 # 8-byte Reload
	movl	(%rax), %ecx
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
	movq	248(%rsp), %rax                 # 8-byte Reload
	movl	(%rax), %eax
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
	movq	mme34.grad(%rip), %r12
	testq	%r12, %r12
	jne	.LBB20_26
# %bb.25:                               # %if.then51
	movzbl	dim(%rip), %esi
	addq	$3, %rsi
	imulq	%rbx, %rsi
	xorl	%edi, %edi
	callq	vector@PLT
	movq	%rax, %r12
	movq	%rax, mme34.grad(%rip)
.LBB20_26:                              # %if.end56
	movzbl	dim(%rip), %eax
	addl	$3, %eax
	movq	prm(%rip), %rbx
	imull	96(%rbx), %eax
	testl	%eax, %eax
	jle	.LBB20_28
# %bb.27:                               # %for.body.lr.ph
	movl	%eax, %edx
	shlq	$3, %rdx
	movq	%r12, %rdi
	xorl	%esi, %esi
	callq	memset@PLT
.LBB20_28:                              # %for.end
	movl	104(%rbx), %edi
	movq	496(%rbx), %rsi
	movq	504(%rbx), %rdx
	movq	512(%rbx), %rcx
	movq	264(%rbx), %r8
	movq	272(%rbx), %r9
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	ebond
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	movsd	%xmm0, 216(%rsp)                # 8-byte Spill
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
	movsd	%xmm0, 112(%rsp)                # 8-byte Spill
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
	movsd	%xmm0, 8(%rsp)                  # 8-byte Spill
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
	leaq	472(%rsp), %rax
	leaq	480(%rsp), %r10
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
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 80(%rsp)                 # 8-byte Spill
	cmpl	$0, nconstrained(%rip)
	je	.LBB20_39
# %bb.29:                               # %if.then102
	movq	prm(%rip), %rax
	movl	96(%rax), %eax
	testl	%eax, %eax
	jle	.LBB20_39
# %bb.30:                               # %for.body.lr.ph.i
	movq	mme34.grad(%rip), %rcx
	movq	constrained(%rip), %rdx
	movzbl	dim(%rip), %esi
	movzbl	%sil, %r8d
	movl	%r8d, %esi
	andl	$1, %esi
	addl	$3, %esi
	movq	x0(%rip), %rdi
	testb	$1, %r8b
	je	.LBB20_35
# %bb.31:                               # %for.body.us.i.preheader
	shlq	$2, %rax
	movl	$2, %r8d
	xorl	%r9d, %r9d
	xorpd	%xmm1, %xmm1
	movsd	%xmm1, 80(%rsp)                 # 8-byte Spill
	jmp	.LBB20_33
	.p2align	4, 0x90
.LBB20_32:                              # %for.inc.us.i
                                        #   in Loop: Header=BB20_33 Depth=1
	addq	$4, %r9
	addl	%esi, %r8d
	cmpq	%r9, %rax
	je	.LBB20_39
.LBB20_33:                              # %for.body.us.i
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%rdx,%r9)
	je	.LBB20_32
# %bb.34:                               # %if.then.us.i
                                        #   in Loop: Header=BB20_33 Depth=1
	leal	-2(%r8), %r10d
	movsd	(%r15,%r10,8), %xmm2            # xmm2 = mem[0],zero
	subsd	(%rdi,%r10,8), %xmm2
	leal	-1(%r8), %r11d
	movsd	(%r15,%r11,8), %xmm3            # xmm3 = mem[0],zero
	subsd	(%rdi,%r11,8), %xmm3
	movl	%r8d, %ebx
	movsd	(%r15,%rbx,8), %xmm4            # xmm4 = mem[0],zero
	subsd	(%rdi,%rbx,8), %xmm4
	movapd	%xmm3, %xmm1
	mulsd	%xmm3, %xmm1
	movapd	%xmm2, %xmm5
	mulsd	%xmm2, %xmm5
	addsd	%xmm1, %xmm5
	movapd	%xmm4, %xmm1
	mulsd	%xmm4, %xmm1
	addsd	%xmm5, %xmm1
	mulsd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm2
	addsd	(%rcx,%r10,8), %xmm2
	movsd	%xmm2, (%rcx,%r10,8)
	mulsd	%xmm0, %xmm3
	addsd	(%rcx,%r11,8), %xmm3
	movsd	%xmm3, (%rcx,%r11,8)
	mulsd	%xmm0, %xmm4
	addsd	(%rcx,%rbx,8), %xmm4
	addsd	80(%rsp), %xmm1                 # 8-byte Folded Reload
	movsd	%xmm4, (%rcx,%rbx,8)
	movl	%r9d, %r10d
	shlq	$3, %r10
	orq	$24, %r10
	movsd	(%r15,%r10), %xmm3              # xmm3 = mem[0],zero
	subsd	(%rdi,%r10), %xmm3
	movapd	%xmm3, %xmm2
	mulsd	%xmm0, %xmm2
	mulsd	%xmm2, %xmm3
	addsd	%xmm1, %xmm3
	movsd	%xmm3, 80(%rsp)                 # 8-byte Spill
	addsd	(%rcx,%r10), %xmm2
	movsd	%xmm2, (%rcx,%r10)
	jmp	.LBB20_32
.LBB20_35:                              # %for.body.i.preheader
	movl	$2, %r8d
	xorl	%r9d, %r9d
	xorpd	%xmm1, %xmm1
	movsd	%xmm1, 80(%rsp)                 # 8-byte Spill
	jmp	.LBB20_37
	.p2align	4, 0x90
.LBB20_36:                              # %for.inc.i
                                        #   in Loop: Header=BB20_37 Depth=1
	incq	%r9
	addl	%esi, %r8d
	cmpq	%r9, %rax
	je	.LBB20_39
.LBB20_37:                              # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%rdx,%r9,4)
	je	.LBB20_36
# %bb.38:                               # %if.then.i
                                        #   in Loop: Header=BB20_37 Depth=1
	leal	-2(%r8), %r10d
	movsd	(%r15,%r10,8), %xmm1            # xmm1 = mem[0],zero
	subsd	(%rdi,%r10,8), %xmm1
	leal	-1(%r8), %r11d
	movsd	(%r15,%r11,8), %xmm2            # xmm2 = mem[0],zero
	subsd	(%rdi,%r11,8), %xmm2
	movl	%r8d, %ebx
	movsd	(%r15,%rbx,8), %xmm3            # xmm3 = mem[0],zero
	subsd	(%rdi,%rbx,8), %xmm3
	movapd	%xmm2, %xmm4
	mulsd	%xmm2, %xmm4
	movapd	%xmm1, %xmm5
	mulsd	%xmm1, %xmm5
	addsd	%xmm4, %xmm5
	movapd	%xmm3, %xmm4
	mulsd	%xmm3, %xmm4
	addsd	%xmm5, %xmm4
	mulsd	%xmm0, %xmm4
	movsd	80(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	addsd	%xmm4, %xmm5
	movsd	%xmm5, 80(%rsp)                 # 8-byte Spill
	mulsd	%xmm0, %xmm1
	addsd	(%rcx,%r10,8), %xmm1
	movsd	%xmm1, (%rcx,%r10,8)
	mulsd	%xmm0, %xmm2
	addsd	(%rcx,%r11,8), %xmm2
	movsd	%xmm2, (%rcx,%r11,8)
	mulsd	%xmm0, %xmm3
	addsd	(%rcx,%rbx,8), %xmm3
	movsd	%xmm3, (%rcx,%rbx,8)
	jmp	.LBB20_36
.LBB20_39:                              # %if.end107
	movsd	480(%rsp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, 376(%rsp)                # 8-byte Spill
	movsd	472(%rsp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, 384(%rsp)                # 8-byte Spill
	cmpl	$0, gb(%rip)
	movq	lpairs(%rip), %r14
	movq	upairs(%rip), %r13
	movq	pairlist(%rip), %rbx
	movq	mme34.grad(%rip), %r12
	je	.LBB20_44
# %bb.40:                               # %if.then110
	movq	prm(%rip), %rax
	movq	368(%rax), %rcx
	movq	%rcx, 392(%rsp)                 # 8-byte Spill
	movq	248(%rax), %rcx
	movq	%rcx, 256(%rsp)                 # 8-byte Spill
	movq	360(%rax), %rcx
	movq	%rcx, 136(%rsp)                 # 8-byte Spill
	movslq	96(%rax), %rbp
	movsd	432(%rax), %xmm0                # xmm0 = mem[0],zero
	cmpq	$0, egb.reff(%rip)
	movsd	%xmm0, 72(%rsp)                 # 8-byte Spill
	je	.LBB20_45
# %bb.41:                               # %if.end39.i
	cmpq	$0, egb.iexw(%rip)
	je	.LBB20_46
.LBB20_42:                              # %if.end48.i
	cmpq	$0, egb.sumdeijda(%rip)
	je	.LBB20_47
.LBB20_43:                              # %if.end55.i
	cmpq	$0, egb.psi(%rip)
	jne	.LBB20_51
	jmp	.LBB20_48
.LBB20_44:                              # %if.else126
	leaq	488(%rsp), %rax
	leaq	496(%rsp), %r10
	movsd	.LCPI20_4(%rip), %xmm0          # xmm0 = mem[0],zero
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	xorl	%ecx, %ecx
	movq	%r15, %r8
	movq	%r12, %r9
	movapd	%xmm0, %xmm1
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	callq	nbond
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	movsd	496(%rsp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, 120(%rsp)                # 8-byte Spill
	movsd	488(%rsp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, 128(%rsp)                # 8-byte Spill
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 88(%rsp)                 # 8-byte Spill
	movq	prm(%rip), %rbx
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	jmp	.LBB20_169
.LBB20_45:                              # %if.then37.i
	xorl	%edi, %edi
	movq	%rbp, %rsi
	callq	vector@PLT
	movsd	72(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movq	%rax, egb.reff(%rip)
	cmpq	$0, egb.iexw(%rip)
	jne	.LBB20_42
.LBB20_46:                              # %if.then42.i
	leal	1(%rbp), %esi
	movl	$-1, %edi
	callq	ivector@PLT
	movsd	72(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movq	%rax, egb.iexw(%rip)
	cmpq	$0, egb.sumdeijda(%rip)
	jne	.LBB20_43
.LBB20_47:                              # %if.then51.i
	xorl	%edi, %edi
	movq	%rbp, %rsi
	callq	vector@PLT
	movsd	72(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movq	%rax, egb.sumdeijda(%rip)
	cmpq	$0, egb.psi(%rip)
	jne	.LBB20_51
.LBB20_48:                              # %land.lhs.true.i
	movl	gb(%rip), %eax
	cmpl	$5, %eax
	je	.LBB20_50
# %bb.49:                               # %land.lhs.true.i
	cmpl	$2, %eax
	jne	.LBB20_51
.LBB20_50:                              # %if.then62.i
	xorl	%edi, %edi
	movq	%rbp, %rsi
	callq	vector@PLT
	movsd	72(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movq	%rax, egb.psi(%rip)
.LBB20_51:                              # %if.end64.i
	movq	%rbx, 40(%rsp)                  # 8-byte Spill
	addsd	.LCPI20_0(%rip), %xmm0
	cmpq	$0, egb.reqack(%rip)
	jne	.LBB20_53
# %bb.52:                               # %if.then67.i
	xorl	%edi, %edi
	movl	$1, %esi
	movsd	%xmm0, 72(%rsp)                 # 8-byte Spill
	callq	ivector@PLT
	movsd	72(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movq	%rax, egb.reqack(%rip)
.LBB20_53:                              # %if.end72.i
	mulsd	%xmm0, %xmm0
	movsd	%xmm0, 72(%rsp)                 # 8-byte Spill
	movq	prm(%rip), %rbx
	movl	96(%rbx), %eax
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 88(%rsp)                 # 8-byte Spill
	testl	%eax, %eax
	movq	%r14, 152(%rsp)                 # 8-byte Spill
	movq	%r13, 176(%rsp)                 # 8-byte Spill
	jle	.LBB20_92
# %bb.54:                               # %for.body.i108.preheader
	movq	nabout@GOTPCREL(%rip), %rbp
	xorl	%r14d, %r14d
	movsd	%xmm0, 144(%rsp)                # 8-byte Spill
                                        # implicit-def: $xmm0
                                        # kill: killed $xmm0
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	jmp	.LBB20_57
	.p2align	4, 0x90
.LBB20_55:                              # %if.else263.i
                                        #   in Loop: Header=BB20_57 Depth=1
	movapd	272(%rsp), %xmm0                # 16-byte Reload
	xorpd	.LCPI20_19(%rip), %xmm0
	movsd	48(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	mulsd	%xmm0, %xmm2
	movq	egb.psi(%rip), %rax
	movsd	%xmm2, (%rax,%r14,8)
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
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movq	136(%rsp), %rax                 # 8-byte Reload
	divsd	(%rax,%r14,8), %xmm0
	movsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	subsd	%xmm0, %xmm1
	movsd	.LCPI20_4(%rip), %xmm0          # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movq	egb.reff(%rip), %rax
	movsd	%xmm0, (%rax,%r14,8)
.LBB20_56:                              # %for.inc298.i
                                        #   in Loop: Header=BB20_57 Depth=1
	incq	%r14
	movq	prm(%rip), %rbx
	movslq	96(%rbx), %rax
	cmpq	%rax, %r14
	jge	.LBB20_90
.LBB20_57:                              # %for.body.i108
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB20_63 Depth 2
	movzbl	dim(%rip), %ecx
	leal	3(%rcx), %edx
	movl	%r14d, %eax
	imull	%edx, %eax
	cmpl	$1, %ecx
	movq	40(%rsp), %rbx                  # 8-byte Reload
	jne	.LBB20_59
# %bb.58:                               # %if.then87.i
                                        #   in Loop: Header=BB20_57 Depth=1
	movl	%eax, %ecx
	movsd	24(%r15,%rcx,8), %xmm0          # xmm0 = mem[0],zero
	movsd	%xmm0, 144(%rsp)                # 8-byte Spill
.LBB20_59:                              # %if.end92.i
                                        #   in Loop: Header=BB20_57 Depth=1
	movq	136(%rsp), %rcx                 # 8-byte Reload
	movsd	(%rcx,%r14,8), %xmm1            # xmm1 = mem[0],zero
	addsd	.LCPI20_3(%rip), %xmm1
	movsd	.LCPI20_4(%rip), %xmm5          # xmm5 = mem[0],zero
	movapd	%xmm1, 272(%rsp)                # 16-byte Spill
	divsd	%xmm1, %xmm5
	movq	176(%rsp), %rcx                 # 8-byte Reload
	movl	(%rcx,%r14,4), %ecx
	movq	152(%rsp), %rdx                 # 8-byte Reload
	addl	(%rdx,%r14,4), %ecx
	movsd	%xmm5, 16(%rsp)                 # 8-byte Spill
	jle	.LBB20_86
# %bb.60:                               # %for.body104.lr.ph.i
                                        #   in Loop: Header=BB20_57 Depth=1
	movsd	(%r15,%rax,8), %xmm0            # xmm0 = mem[0],zero
	movsd	%xmm0, 160(%rsp)                # 8-byte Spill
	movsd	8(%r15,%rax,8), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, 288(%rsp)                # 8-byte Spill
	movsd	16(%r15,%rax,8), %xmm0          # xmm0 = mem[0],zero
	movsd	%xmm0, 184(%rsp)                # 8-byte Spill
	movapd	%xmm5, %xmm0
	mulsd	.LCPI20_5(%rip), %xmm0
	movsd	%xmm0, 32(%rsp)                 # 8-byte Spill
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 48(%rsp)                 # 8-byte Spill
	xorl	%r13d, %r13d
	jmp	.LBB20_63
	.p2align	4, 0x90
.LBB20_61:                              #   in Loop: Header=BB20_63 Depth=2
	movq	40(%rsp), %rbx                  # 8-byte Reload
.LBB20_62:                              # %for.inc.i112
                                        #   in Loop: Header=BB20_63 Depth=2
	incq	%r13
	movq	152(%rsp), %rax                 # 8-byte Reload
	movslq	(%rax,%r14,4), %rax
	movq	176(%rsp), %rcx                 # 8-byte Reload
	movslq	(%rcx,%r14,4), %rcx
	addq	%rax, %rcx
	cmpq	%rcx, %r13
	jge	.LBB20_87
.LBB20_63:                              # %for.body104.i
                                        #   Parent Loop BB20_57 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rbx,%r14,8), %rax
	testq	%rax, %rax
	jne	.LBB20_65
# %bb.64:                               # %if.then109.i
                                        #   in Loop: Header=BB20_63 Depth=2
	movq	(%rbp), %rdi
	movl	$.L.str.80, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	fprintf@PLT
	movq	(%rbp), %rdi
	callq	fflush@PLT
	movsd	16(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movq	(%rbx,%r14,8), %rax
.LBB20_65:                              # %if.end112.i
                                        #   in Loop: Header=BB20_63 Depth=2
	movslq	(%rax,%r13,4), %rbx
	movzbl	dim(%rip), %ecx
	leal	3(%rcx), %eax
	imulq	%rbx, %rax
	movsd	160(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	(%r15,%rax,8), %xmm0
	cltq
	movsd	288(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	subsd	8(%r15,%rax,8), %xmm1
	movsd	184(%rsp), %xmm7                # 8-byte Reload
                                        # xmm7 = mem[0],zero
	subsd	16(%r15,%rax,8), %xmm7
	mulsd	%xmm1, %xmm1
	mulsd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	mulsd	%xmm7, %xmm7
	addsd	%xmm0, %xmm7
	cmpl	$1, %ecx
	jne	.LBB20_67
# %bb.66:                               # %if.then136.i
                                        #   in Loop: Header=BB20_63 Depth=2
	movsd	144(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	24(%r15,%rax,8), %xmm0
	movsd	%xmm0, 264(%rsp)                # 8-byte Spill
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm7
.LBB20_67:                              # %if.end143.i
                                        #   in Loop: Header=BB20_63 Depth=2
	ucomisd	72(%rsp), %xmm7                 # 8-byte Folded Reload
	ja	.LBB20_61
# %bb.68:                               # %if.end147.i
                                        #   in Loop: Header=BB20_63 Depth=2
	ucomisd	.LCPI20_35(%rip), %xmm7
	jb	.LBB20_70
# %bb.69:                               #   in Loop: Header=BB20_63 Depth=2
	xorps	%xmm0, %xmm0
	sqrtsd	%xmm7, %xmm0
	jmp	.LBB20_71
	.p2align	4, 0x90
.LBB20_70:                              # %call.sqrt
                                        #   in Loop: Header=BB20_63 Depth=2
	movapd	%xmm7, %xmm0
	movsd	%xmm7, 96(%rsp)                 # 8-byte Spill
	callq	sqrt@PLT
	movsd	96(%rsp), %xmm7                 # 8-byte Reload
                                        # xmm7 = mem[0],zero
	movsd	16(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
.LBB20_71:                              # %if.end147.i.split
                                        #   in Loop: Header=BB20_63 Depth=2
	movsd	.LCPI20_4(%rip), %xmm6          # xmm6 = mem[0],zero
	divsd	%xmm0, %xmm6
	movapd	%xmm7, %xmm8
	mulsd	%xmm6, %xmm8
	movq	136(%rsp), %rax                 # 8-byte Reload
	movsd	(%rax,%rbx,8), %xmm1            # xmm1 = mem[0],zero
	addsd	.LCPI20_3(%rip), %xmm1
	movq	392(%rsp), %rax                 # 8-byte Reload
	mulsd	(%rax,%rbx,8), %xmm1
	movapd	%xmm1, %xmm0
	movsd	.LCPI20_0(%rip), %xmm3          # xmm3 = mem[0],zero
	addsd	%xmm3, %xmm0
	ucomisd	%xmm0, %xmm8
	ja	.LBB20_61
# %bb.73:                               # %if.end162.i
                                        #   in Loop: Header=BB20_63 Depth=2
	movapd	%xmm1, %xmm2
	mulsd	%xmm1, %xmm2
	movapd	%xmm3, %xmm0
	subsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm8
	movq	40(%rsp), %rbx                  # 8-byte Reload
	jbe	.LBB20_75
# %bb.74:                               # %if.then166.i
                                        #   in Loop: Header=BB20_63 Depth=2
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
	movsd	%xmm8, 24(%rsp)                 # 8-byte Spill
	mulsd	.LCPI20_17(%rip), %xmm0
	movsd	%xmm6, 96(%rsp)                 # 8-byte Spill
	callq	log@PLT
	movsd	16(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	addsd	%xmm0, %xmm0
	addsd	24(%rsp), %xmm0                 # 8-byte Folded Reload
	movsd	96(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	.LCPI20_18(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	48(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 48(%rsp)                 # 8-byte Spill
	jmp	.LBB20_83
.LBB20_75:                              # %if.else.i
                                        #   in Loop: Header=BB20_63 Depth=2
	movapd	%xmm1, %xmm0
	mulsd	.LCPI20_6(%rip), %xmm0
	ucomisd	%xmm0, %xmm8
	jbe	.LBB20_77
# %bb.76:                               # %if.then185.i
                                        #   in Loop: Header=BB20_63 Depth=2
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
	movsd	48(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	%xmm2, %xmm0
	movsd	%xmm0, 48(%rsp)                 # 8-byte Spill
	jmp	.LBB20_83
.LBB20_77:                              # %if.else196.i
                                        #   in Loop: Header=BB20_63 Depth=2
	movapd	272(%rsp), %xmm4                # 16-byte Reload
	movapd	%xmm4, %xmm0
	addsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm8
	jbe	.LBB20_80
# %bb.78:                               # %if.then200.i
                                        #   in Loop: Header=BB20_63 Depth=2
	subsd	%xmm2, %xmm7
	movapd	%xmm1, %xmm0
	divsd	%xmm7, %xmm0
	movsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	mulsd	.LCPI20_5(%rip), %xmm6
	movsd	%xmm6, 96(%rsp)                 # 8-byte Spill
	movapd	%xmm8, %xmm0
	subsd	%xmm1, %xmm0
.LBB20_79:                              # %for.inc.i112
                                        #   in Loop: Header=BB20_63 Depth=2
	addsd	%xmm1, %xmm8
	divsd	%xmm8, %xmm0
	callq	log@PLT
	movsd	16(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	mulsd	96(%rsp), %xmm0                 # 8-byte Folded Reload
	addsd	24(%rsp), %xmm0                 # 8-byte Folded Reload
	mulsd	.LCPI20_8(%rip), %xmm0
	jmp	.LBB20_82
.LBB20_80:                              # %if.else210.i
                                        #   in Loop: Header=BB20_63 Depth=2
	movapd	%xmm4, %xmm0
	subsd	%xmm1, %xmm0
	andpd	.LCPI20_7(%rip), %xmm0
	ucomisd	%xmm0, %xmm8
	jbe	.LBB20_84
# %bb.81:                               # %if.then214.i
                                        #   in Loop: Header=BB20_63 Depth=2
	movsd	32(%rsp), %xmm0                 # 8-byte Reload
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
	movsd	%xmm1, 24(%rsp)                 # 8-byte Spill
	mulsd	%xmm4, %xmm0
	movsd	%xmm6, 96(%rsp)                 # 8-byte Spill
	callq	log@PLT
	movsd	16(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	mulsd	96(%rsp), %xmm0                 # 8-byte Folded Reload
	addsd	24(%rsp), %xmm0                 # 8-byte Folded Reload
	mulsd	.LCPI20_9(%rip), %xmm0
.LBB20_82:                              # %for.inc.i112
                                        #   in Loop: Header=BB20_63 Depth=2
	movsd	48(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 48(%rsp)                 # 8-byte Spill
.LBB20_83:                              # %for.inc.i112
                                        #   in Loop: Header=BB20_63 Depth=2
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	jmp	.LBB20_62
.LBB20_84:                              # %if.else229.i
                                        #   in Loop: Header=BB20_63 Depth=2
	ucomisd	%xmm4, %xmm1
	jbe	.LBB20_83
# %bb.85:                               # %if.then232.i
                                        #   in Loop: Header=BB20_63 Depth=2
	subsd	%xmm2, %xmm7
	movapd	%xmm1, %xmm0
	divsd	%xmm7, %xmm0
	addsd	%xmm5, %xmm5
	addsd	%xmm0, %xmm5
	movsd	%xmm5, 24(%rsp)                 # 8-byte Spill
	mulsd	.LCPI20_5(%rip), %xmm6
	movsd	%xmm6, 96(%rsp)                 # 8-byte Spill
	movapd	%xmm1, %xmm0
	subsd	%xmm8, %xmm0
	jmp	.LBB20_79
	.p2align	4, 0x90
.LBB20_86:                              #   in Loop: Header=BB20_57 Depth=1
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 48(%rsp)                 # 8-byte Spill
.LBB20_87:                              # %for.end.i
                                        #   in Loop: Header=BB20_57 Depth=1
	cmpl	$1, gb(%rip)
	jne	.LBB20_55
# %bb.88:                               # %if.then250.i
                                        #   in Loop: Header=BB20_57 Depth=1
	addsd	48(%rsp), %xmm5                 # 8-byte Folded Reload
	movsd	.LCPI20_4(%rip), %xmm0          # xmm0 = mem[0],zero
	divsd	%xmm5, %xmm0
	movq	egb.reff(%rip), %rax
	movsd	%xmm0, (%rax,%r14,8)
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	.LBB20_56
# %bb.89:                               # %if.then259.i
                                        #   in Loop: Header=BB20_57 Depth=1
	movabsq	$4629137466983448576, %rcx      # imm = 0x403E000000000000
	movq	%rcx, (%rax,%r14,8)
	jmp	.LBB20_56
.LBB20_90:                              # %for.end300.i
	leaq	96(%rbx), %r14
	testl	%eax, %eax
	jle	.LBB20_93
# %bb.91:                               # %for.cond312.preheader.thread.i
	movl	%eax, %edx
	movq	egb.sumdeijda(%rip), %rdi
	shlq	$3, %rdx
	xorl	%esi, %esi
	callq	memset@PLT
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	jmp	.LBB20_94
.LBB20_92:
	leaq	96(%rbx), %r14
	movsd	%xmm0, 144(%rsp)                # 8-byte Spill
                                        # implicit-def: $xmm0
                                        # kill: killed $xmm0
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
.LBB20_93:                              # %for.cond312.preheader.i
	testl	%eax, %eax
	js	.LBB20_168
.LBB20_94:                              # %for.body316.lr.ph.i
	movq	$-1, %rax
	movq	egb.iexw(%rip), %rcx
	.p2align	4, 0x90
.LBB20_95:                              # %for.body316.i
                                        # =>This Inner Loop Header: Depth=1
	movl	$-1, (%rcx,%rax,4)
	incq	%rax
	movslq	(%r14), %rdx
	cmpq	%rdx, %rax
	jl	.LBB20_95
# %bb.96:                               # %for.cond323.preheader.i
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 128(%rsp)                # 8-byte Spill
	movsd	%xmm0, 120(%rsp)                # 8-byte Spill
	testl	%edx, %edx
	jle	.LBB20_169
# %bb.97:                               # %for.body327.i.preheader
	movsd	.LCPI20_4(%rip), %xmm1          # xmm1 = mem[0],zero
	xorl	%ebp, %ebp
	movsd	%xmm0, 88(%rsp)                 # 8-byte Spill
	movsd	%xmm0, 128(%rsp)                # 8-byte Spill
	movsd	%xmm0, 120(%rsp)                # 8-byte Spill
	movq	%r15, 336(%rsp)                 # 8-byte Spill
	jmp	.LBB20_100
	.p2align	4, 0x90
.LBB20_98:                              # %for.inc590.i
                                        #   in Loop: Header=BB20_100 Depth=1
	movq	336(%rsp), %r15                 # 8-byte Reload
	movsd	.LCPI20_4(%rip), %xmm1          # xmm1 = mem[0],zero
.LBB20_99:                              # %for.inc590.i
                                        #   in Loop: Header=BB20_100 Depth=1
	incq	%rbp
	movq	prm(%rip), %rbx
	movslq	96(%rbx), %rax
	cmpq	%rax, %rbp
	jge	.LBB20_130
.LBB20_100:                             # %for.body327.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB20_107 Depth 2
                                        #     Child Loop BB20_110 Depth 2
	movq	egb.reff(%rip), %rax
	movsd	(%rax,%rbp,8), %xmm6            # xmm6 = mem[0],zero
	movq	256(%rsp), %rax                 # 8-byte Reload
	movsd	(%rax,%rbp,8), %xmm2            # xmm2 = mem[0],zero
	movq	frozen(%rip), %rax
	cmpl	$0, (%rax,%rbp,4)
	movsd	%xmm6, 304(%rsp)                # 8-byte Spill
	movsd	%xmm2, 232(%rsp)                # 8-byte Spill
	jne	.LBB20_102
# %bb.101:                              # %if.then335.i
                                        #   in Loop: Header=BB20_100 Depth=1
	movapd	%xmm6, %xmm0
	movsd	.LCPI20_20(%rip), %xmm1         # xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm0
	callq	exp@PLT
	movsd	304(%rsp), %xmm6                # 8-byte Reload
                                        # xmm6 = mem[0],zero
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	divsd	.LCPI20_21(%rip), %xmm0
	movsd	.LCPI20_4(%rip), %xmm1          # xmm1 = mem[0],zero
	subsd	%xmm0, %xmm1
	movsd	232(%rsp), %xmm3                # 8-byte Reload
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
	movsd	88(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	%xmm1, %xmm0
	movsd	.LCPI20_4(%rip), %xmm1          # xmm1 = mem[0],zero
	movsd	%xmm0, 88(%rsp)                 # 8-byte Spill
	addsd	.LCPI20_35(%rip), %xmm2
	movq	egb.sumdeijda(%rip), %rax
	addsd	(%rax,%rbp,8), %xmm2
	movsd	%xmm2, (%rax,%rbp,8)
.LBB20_102:                             # %if.end357.i
                                        #   in Loop: Header=BB20_100 Depth=1
	movq	40(%rsp), %rbx                  # 8-byte Reload
	movq	176(%rsp), %rax                 # 8-byte Reload
	movslq	(%rax,%rbp,4), %rax
	movq	%rax, 344(%rsp)                 # 8-byte Spill
	testq	%rax, %rax
	jle	.LBB20_99
# %bb.103:                              # %if.end363.i
                                        #   in Loop: Header=BB20_100 Depth=1
	movzbl	dim(%rip), %eax
	leal	3(%rax), %r9d
	imull	%ebp, %r9d
	cmpl	$1, %eax
	jne	.LBB20_105
# %bb.104:                              # %if.then375.i
                                        #   in Loop: Header=BB20_100 Depth=1
	movsd	24(%r15,%r9,8), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, 144(%rsp)                # 8-byte Spill
.LBB20_105:                             # %if.end379.i
                                        #   in Loop: Header=BB20_100 Depth=1
	movups	(%r15,%r9,8), %xmm0
	movaps	%xmm0, 400(%rsp)                # 16-byte Spill
	movsd	16(%r15,%r9,8), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, 224(%rsp)                # 8-byte Spill
	movq	prm(%rip), %rdx
	movq	440(%rdx), %rsi
	movq	448(%rdx), %rcx
	movl	(%rsi,%rbp,4), %esi
	decl	%esi
	imull	100(%rdx), %esi
	movl	%esi, 244(%rsp)                 # 4-byte Spill
	cmpl	$0, (%rcx,%rbp,4)
	jle	.LBB20_108
# %bb.106:                              # %for.body389.lr.ph.i
                                        #   in Loop: Header=BB20_100 Depth=1
	movq	egb.iexw(%rip), %rdx
	movq	IexclAt(%rip), %rsi
	movq	(%rsi,%rbp,8), %rsi
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB20_107:                             # %for.body389.i
                                        #   Parent Loop BB20_100 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	(%rsi,%rdi,4), %r8
	movl	%ebp, -4(%rdx,%r8,4)
	incq	%rdi
	movslq	(%rcx,%rbp,4), %r8
	cmpq	%r8, %rdi
	jl	.LBB20_107
.LBB20_108:                             # %for.body409.lr.ph.i
                                        #   in Loop: Header=BB20_100 Depth=1
	movq	%r9, 464(%rsp)                  # 8-byte Spill
	leaq	2(%r9), %rcx
	movq	%rcx, 456(%rsp)                 # 8-byte Spill
	movq	152(%rsp), %rcx                 # 8-byte Reload
	movslq	(%rcx,%rbp,4), %r13
	decl	244(%rsp)                       # 4-byte Folded Spill
	xorpd	%xmm0, %xmm0
	movapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	xorpd	%xmm1, %xmm1
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 96(%rsp)                 # 8-byte Spill
	jmp	.LBB20_110
	.p2align	4, 0x90
.LBB20_109:                             # %for.inc564.i
                                        #   in Loop: Header=BB20_110 Depth=2
	mulsd	%xmm7, %xmm9
	mulsd	%xmm8, %xmm9
	movsd	88(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	subsd	%xmm9, %xmm1
	movsd	%xmm1, 88(%rsp)                 # 8-byte Spill
	movapd	48(%rsp), %xmm1                 # 16-byte Reload
	addpd	%xmm3, %xmm1
	movapd	%xmm1, 48(%rsp)                 # 16-byte Spill
	movsd	24(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	addsd	%xmm5, %xmm1
	movsd	96(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	addsd	%xmm0, %xmm2
	movsd	%xmm2, 96(%rsp)                 # 8-byte Spill
	incq	%r13
	movq	152(%rsp), %rcx                 # 8-byte Reload
	movslq	(%rcx,%rbp,4), %rcx
	addq	344(%rsp), %rcx                 # 8-byte Folded Reload
	cmpq	%rcx, %r13
	movq	40(%rsp), %rbx                  # 8-byte Reload
	jge	.LBB20_128
.LBB20_110:                             # %for.body409.i
                                        #   Parent Loop BB20_100 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	%xmm1, 24(%rsp)                 # 8-byte Spill
	movq	%r12, %r15
	movq	(%rbx,%rbp,8), %rcx
	testq	%rcx, %rcx
	jne	.LBB20_112
# %bb.111:                              # %if.then414.i
                                        #   in Loop: Header=BB20_110 Depth=2
	movq	nabout@GOTPCREL(%rip), %r14
	movq	(%r14), %rdi
	movl	$.L.str.82, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	fprintf@PLT
	movq	(%r14), %rdi
	callq	fflush@PLT
	movsd	304(%rsp), %xmm6                # 8-byte Reload
                                        # xmm6 = mem[0],zero
	movq	(%rbx,%rbp,8), %rcx
	movzbl	dim(%rip), %eax
.LBB20_112:                             # %if.end417.i
                                        #   in Loop: Header=BB20_110 Depth=2
	movslq	(%rcx,%r13,4), %r12
	movzbl	%al, %eax
	movl	%eax, %r14d
	andl	$1, %r14d
	addl	$3, %r14d
	imulq	%r12, %r14
	movq	336(%rsp), %rcx                 # 8-byte Reload
	movupd	(%rcx,%r14,8), %xmm0
	movapd	400(%rsp), %xmm2                # 16-byte Reload
	subpd	%xmm0, %xmm2
	movslq	%r14d, %rbx
	movsd	224(%rsp), %xmm3                # 8-byte Reload
                                        # xmm3 = mem[0],zero
	subsd	16(%rcx,%rbx,8), %xmm3
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
	movapd	%xmm2, 320(%rsp)                # 16-byte Spill
	movsd	%xmm3, 192(%rsp)                # 8-byte Spill
	je	.LBB20_114
# %bb.113:                              # %if.then439.i
                                        #   in Loop: Header=BB20_110 Depth=2
	movsd	144(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	24(%rcx,%rbx,8), %xmm0
	movsd	%xmm0, 264(%rsp)                # 8-byte Spill
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm4
.LBB20_114:                             # %if.end445.i
                                        #   in Loop: Header=BB20_110 Depth=2
	movsd	232(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movsd	%xmm4, 160(%rsp)                # 8-byte Spill
	movq	256(%rsp), %rax                 # 8-byte Reload
	movsd	(%rax,%r12,8), %xmm1            # xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, 184(%rsp)                # 8-byte Spill
	movq	egb.reff(%rip), %rax
	movsd	(%rax,%r12,8), %xmm0            # xmm0 = mem[0],zero
	movapd	%xmm6, %xmm1
	movsd	%xmm0, 272(%rsp)                # 8-byte Spill
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, 288(%rsp)                # 8-byte Spill
	mulsd	.LCPI20_22(%rip), %xmm1
	movapd	%xmm4, %xmm0
	divsd	%xmm1, %xmm0
	callq	exp@PLT
	movsd	%xmm0, 32(%rsp)                 # 8-byte Spill
	mulsd	288(%rsp), %xmm0                # 8-byte Folded Reload
	addsd	160(%rsp), %xmm0                # 8-byte Folded Reload
	ucomisd	.LCPI20_35(%rip), %xmm0
	jb	.LBB20_116
# %bb.115:                              #   in Loop: Header=BB20_110 Depth=2
	sqrtsd	%xmm0, %xmm0
	jmp	.LBB20_117
	.p2align	4, 0x90
.LBB20_116:                             # %call.sqrt54
                                        #   in Loop: Header=BB20_110 Depth=2
	callq	sqrt@PLT
.LBB20_117:                             # %if.end445.i.split
                                        #   in Loop: Header=BB20_110 Depth=2
	movsd	.LCPI20_4(%rip), %xmm1          # xmm1 = mem[0],zero
	divsd	%xmm0, %xmm1
	movsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	movsd	.LCPI20_20(%rip), %xmm0         # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, 352(%rsp)                # 8-byte Spill
	callq	exp@PLT
	movsd	16(%rsp), %xmm8                 # 8-byte Reload
                                        # xmm8 = mem[0],zero
	divsd	.LCPI20_21(%rip), %xmm0
	movsd	.LCPI20_4(%rip), %xmm2          # xmm2 = mem[0],zero
	movapd	%xmm2, %xmm9
	subsd	%xmm0, %xmm9
	movapd	%xmm8, %xmm1
	mulsd	%xmm8, %xmm1
	mulsd	%xmm8, %xmm1
	movsd	184(%rsp), %xmm7                # 8-byte Reload
                                        # xmm7 = mem[0],zero
	mulsd	%xmm7, %xmm1
	mulsd	352(%rsp), %xmm0                # 8-byte Folded Reload
	addsd	%xmm9, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	32(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movapd	%xmm1, %xmm10
	mulsd	.LCPI20_9(%rip), %xmm10
	addsd	%xmm2, %xmm10
	mulsd	%xmm0, %xmm10
	mulsd	.LCPI20_5(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	160(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movapd	%xmm0, %xmm2
	mulsd	.LCPI20_23(%rip), %xmm2
	addsd	288(%rsp), %xmm2                # 8-byte Folded Reload
	mulsd	%xmm1, %xmm2
	movq	egb.sumdeijda(%rip), %rax
	movsd	304(%rsp), %xmm6                # 8-byte Reload
                                        # xmm6 = mem[0],zero
	movapd	%xmm6, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	(%rax,%rbp,8), %xmm1
	movsd	%xmm1, (%rax,%rbp,8)
	movsd	272(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm2, %xmm1
	addsd	(%rax,%r12,8), %xmm1
	movsd	%xmm1, (%rax,%r12,8)
	movq	egb.iexw(%rip), %rax
	movl	(%rax,%r12,4), %eax
	cmpq	%rax, %rbp
	jne	.LBB20_119
# %bb.118:                              #   in Loop: Header=BB20_110 Depth=2
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	jmp	.LBB20_124
	.p2align	4, 0x90
.LBB20_119:                             # %if.then492.i
                                        #   in Loop: Header=BB20_110 Depth=2
	ucomisd	.LCPI20_35(%rip), %xmm0
	jb	.LBB20_121
# %bb.120:                              #   in Loop: Header=BB20_110 Depth=2
	sqrtsd	%xmm0, %xmm0
	jmp	.LBB20_122
	.p2align	4, 0x90
.LBB20_121:                             # %call.sqrt55
                                        #   in Loop: Header=BB20_110 Depth=2
	movsd	%xmm9, 160(%rsp)                # 8-byte Spill
	movapd	%xmm10, 288(%rsp)               # 16-byte Spill
	callq	sqrt@PLT
	movapd	288(%rsp), %xmm10               # 16-byte Reload
	movsd	160(%rsp), %xmm9                # 8-byte Reload
                                        # xmm9 = mem[0],zero
	movsd	16(%rsp), %xmm8                 # 8-byte Reload
                                        # xmm8 = mem[0],zero
	movsd	184(%rsp), %xmm7                # 8-byte Reload
                                        # xmm7 = mem[0],zero
	movsd	304(%rsp), %xmm6                # 8-byte Reload
                                        # xmm6 = mem[0],zero
.LBB20_122:                             # %if.then492.i.split
                                        #   in Loop: Header=BB20_110 Depth=2
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
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
	addl	244(%rsp), %ecx                 # 4-byte Folded Reload
	movslq	%ecx, %rcx
	movl	(%rdx,%rcx,4), %ecx
	testl	%ecx, %ecx
	jle	.LBB20_124
# %bb.123:                              # %if.then510.i
                                        #   in Loop: Header=BB20_110 Depth=2
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
	movsd	120(%rsp), %xmm5                # 8-byte Reload
                                        # xmm5 = mem[0],zero
	addsd	%xmm0, %xmm5
	movsd	%xmm5, 120(%rsp)                # 8-byte Spill
	mulsd	.LCPI20_24(%rip), %xmm2
	mulsd	.LCPI20_25(%rip), %xmm3
	addsd	%xmm2, %xmm3
	mulsd	%xmm1, %xmm3
	subsd	%xmm3, %xmm10
.LBB20_124:                             # %if.end528.i
                                        #   in Loop: Header=BB20_110 Depth=2
	movq	%r15, %r12
	movapd	320(%rsp), %xmm3                # 16-byte Reload
	movsd	192(%rsp), %xmm5                # 8-byte Reload
                                        # xmm5 = mem[0],zero
	movzbl	dim(%rip), %eax
	movsd	264(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm10, %xmm1
	movapd	%xmm1, %xmm0
	testb	%al, %al
	jne	.LBB20_126
# %bb.125:                              # %if.end528.i
                                        #   in Loop: Header=BB20_110 Depth=2
	movsd	.LCPI20_20(%rip), %xmm0         # xmm0 = mem[0],zero
.LBB20_126:                             # %if.end528.i
                                        #   in Loop: Header=BB20_110 Depth=2
	leaq	2(%rbx), %rcx
	mulsd	%xmm10, %xmm5
	unpcklpd	%xmm10, %xmm10                  # xmm10 = xmm10[0,0]
	mulpd	%xmm10, %xmm3
	movupd	(%r12,%r14,8), %xmm2
	subpd	%xmm3, %xmm2
	movupd	%xmm2, (%r12,%r14,8)
	movsd	(%r12,%rcx,8), %xmm2            # xmm2 = mem[0],zero
	subsd	%xmm5, %xmm2
	movsd	%xmm2, (%r12,%rcx,8)
	cmpb	$1, %al
	jne	.LBB20_109
# %bb.127:                              # %if.then557.i
                                        #   in Loop: Header=BB20_110 Depth=2
	movsd	24(%r12,%rbx,8), %xmm2          # xmm2 = mem[0],zero
	subsd	%xmm1, %xmm2
	movsd	%xmm2, 24(%r12,%rbx,8)
	jmp	.LBB20_109
	.p2align	4, 0x90
.LBB20_128:                             # %for.end566.i
                                        #   in Loop: Header=BB20_100 Depth=1
	movq	464(%rsp), %rcx                 # 8-byte Reload
	movupd	(%r12,%rcx,8), %xmm0
	movapd	48(%rsp), %xmm2                 # 16-byte Reload
	addpd	%xmm0, %xmm2
	movupd	%xmm2, (%r12,%rcx,8)
	movq	456(%rsp), %rdx                 # 8-byte Reload
	addsd	(%r12,%rdx,8), %xmm1
	movsd	%xmm1, (%r12,%rdx,8)
	testb	%al, %al
	je	.LBB20_98
# %bb.129:                              # %if.then583.i
                                        #   in Loop: Header=BB20_100 Depth=1
	movsd	96(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addsd	24(%r12,%rcx,8), %xmm0
	movsd	%xmm0, 24(%r12,%rcx,8)
	jmp	.LBB20_98
.LBB20_130:                             # %for.cond593.preheader.i
	testl	%eax, %eax
	jle	.LBB20_169
# %bb.131:                              # %for.body597.i.preheader
	movsd	.LCPI20_0(%rip), %xmm5          # xmm5 = mem[0],zero
	xorl	%esi, %esi
	movq	152(%rsp), %rcx                 # 8-byte Reload
	movq	176(%rsp), %rdx                 # 8-byte Reload
	movq	136(%rsp), %r14                 # 8-byte Reload
	jmp	.LBB20_134
	.p2align	4, 0x90
.LBB20_132:                             # %for.inc894.i
                                        #   in Loop: Header=BB20_134 Depth=1
	movq	152(%rsp), %rcx                 # 8-byte Reload
	movq	176(%rsp), %rdx                 # 8-byte Reload
	movq	136(%rsp), %r14                 # 8-byte Reload
	movsd	.LCPI20_4(%rip), %xmm1          # xmm1 = mem[0],zero
.LBB20_133:                             # %for.inc894.i
                                        #   in Loop: Header=BB20_134 Depth=1
	incq	%rsi
	movq	prm(%rip), %rbx
	movslq	96(%rbx), %rax
	cmpq	%rax, %rsi
	jge	.LBB20_169
.LBB20_134:                             # %for.body597.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB20_143 Depth 2
	movq	frozen(%rip), %rax
	cmpl	$0, (%rax,%rsi,4)
	jne	.LBB20_133
# %bb.135:                              # %for.body597.i
                                        #   in Loop: Header=BB20_134 Depth=1
	movl	(%rdx,%rsi,4), %ebx
	addl	(%rcx,%rsi,4), %ebx
	testl	%ebx, %ebx
	jle	.LBB20_133
# %bb.136:                              # %if.end610.i
                                        #   in Loop: Header=BB20_134 Depth=1
	movzbl	dim(%rip), %eax
	leal	3(%rax), %ecx
	movl	%esi, %r13d
	imull	%ecx, %r13d
	cmpl	$1, %eax
	jne	.LBB20_138
# %bb.137:                              # %if.then622.i
                                        #   in Loop: Header=BB20_134 Depth=1
	movsd	24(%r15,%r13,8), %xmm0          # xmm0 = mem[0],zero
	movsd	%xmm0, 144(%rsp)                # 8-byte Spill
.LBB20_138:                             # %if.end626.i
                                        #   in Loop: Header=BB20_134 Depth=1
	movups	(%r15,%r13,8), %xmm0
	movaps	%xmm0, 160(%rsp)                # 16-byte Spill
	movsd	16(%r15,%r13,8), %xmm0          # xmm0 = mem[0],zero
	movsd	%xmm0, 288(%rsp)                # 8-byte Spill
	movsd	(%r14,%rsi,8), %xmm2            # xmm2 = mem[0],zero
	addsd	.LCPI20_3(%rip), %xmm2
	movq	egb.sumdeijda(%rip), %rax
	movsd	(%rax,%rsi,8), %xmm0            # xmm0 = mem[0],zero
	cmpl	$2, gb(%rip)
	movq	%rsi, 16(%rsp)                  # 8-byte Spill
	movapd	%xmm2, 304(%rsp)                # 16-byte Spill
	jl	.LBB20_140
# %bb.139:                              # %if.then635.i
                                        #   in Loop: Header=BB20_134 Depth=1
	movsd	gbalpha(%rip), %xmm1            # xmm1 = mem[0],zero
	movq	egb.psi(%rip), %rax
	movsd	(%rax,%rsi,8), %xmm2            # xmm2 = mem[0],zero
	movapd	%xmm0, 352(%rsp)                # 16-byte Spill
	movsd	gbbeta(%rip), %xmm0             # xmm0 = mem[0],zero
	mulsd	%xmm2, %xmm0
	subsd	%xmm0, %xmm1
	movsd	gbgamma(%rip), %xmm0            # xmm0 = mem[0],zero
	mulsd	%xmm2, %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	mulsd	%xmm2, %xmm0
	callq	tanh@PLT
	movq	16(%rsp), %rsi                  # 8-byte Reload
	movsd	.LCPI20_0(%rip), %xmm5          # xmm5 = mem[0],zero
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movq	egb.psi(%rip), %rax
	movsd	(%rax,%rsi,8), %xmm1            # xmm1 = mem[0],zero
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
	movapd	352(%rsp), %xmm0                # 16-byte Reload
	mulsd	%xmm3, %xmm1
	mulsd	%xmm2, %xmm1
	divsd	(%r14,%rsi,8), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	.LCPI20_4(%rip), %xmm1          # xmm1 = mem[0],zero
.LBB20_140:                             # %for.body677.lr.ph.i
                                        #   in Loop: Header=BB20_134 Depth=1
	movapd	%xmm0, 352(%rsp)                # 16-byte Spill
	movq	%r13, 232(%rsp)                 # 8-byte Spill
	leaq	2(%r13), %rax
	movq	%rax, 256(%rsp)                 # 8-byte Spill
	divsd	%xmm2, %xmm1
	movsd	%xmm1, 344(%rsp)                # 8-byte Spill
	movapd	%xmm2, %xmm0
	xorpd	.LCPI20_19(%rip), %xmm0
	movapd	%xmm0, 400(%rsp)                # 16-byte Spill
	movl	%ebx, %eax
	movq	%rax, 184(%rsp)                 # 8-byte Spill
	xorpd	%xmm0, %xmm0
	movapd	%xmm0, 272(%rsp)                # 16-byte Spill
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	xorl	%ebp, %ebp
	movapd	%xmm0, 320(%rsp)                # 16-byte Spill
	movq	40(%rsp), %rbx                  # 8-byte Reload
	jmp	.LBB20_143
	.p2align	4, 0x90
.LBB20_141:                             #   in Loop: Header=BB20_143 Depth=2
	movq	40(%rsp), %rbx                  # 8-byte Reload
.LBB20_142:                             # %for.inc864.i
                                        #   in Loop: Header=BB20_143 Depth=2
	incq	%rbp
	cmpq	%rbp, 184(%rsp)                 # 8-byte Folded Reload
	je	.LBB20_166
.LBB20_143:                             # %for.body677.i
                                        #   Parent Loop BB20_134 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rbx,%rsi,8), %rax
	testq	%rax, %rax
	jne	.LBB20_145
# %bb.144:                              # %if.then682.i
                                        #   in Loop: Header=BB20_143 Depth=2
	movq	nabout@GOTPCREL(%rip), %r14
	movq	(%r14), %rdi
	movl	$.L.str.83, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	fprintf@PLT
	movq	(%r14), %rdi
	callq	fflush@PLT
	movq	16(%rsp), %rsi                  # 8-byte Reload
	movsd	.LCPI20_0(%rip), %xmm5          # xmm5 = mem[0],zero
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movq	(%rbx,%rsi,8), %rax
.LBB20_145:                             # %if.end685.i
                                        #   in Loop: Header=BB20_143 Depth=2
	movslq	(%rax,%rbp,4), %rbx
	movzbl	dim(%rip), %eax
	leal	3(%rax), %r14d
	imulq	%rbx, %r14
	movslq	%r14d, %r13
	movupd	(%r15,%r14,8), %xmm0
	movapd	160(%rsp), %xmm3                # 16-byte Reload
	subpd	%xmm0, %xmm3
	movsd	288(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	subsd	16(%r15,%r13,8), %xmm2
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
	jne	.LBB20_147
# %bb.146:                              # %if.then707.i
                                        #   in Loop: Header=BB20_143 Depth=2
	movsd	144(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	24(%r15,%r13,8), %xmm0
	movsd	%xmm0, 264(%rsp)                # 8-byte Spill
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm8
.LBB20_147:                             # %if.end713.i
                                        #   in Loop: Header=BB20_143 Depth=2
	ucomisd	72(%rsp), %xmm8                 # 8-byte Folded Reload
	ja	.LBB20_141
# %bb.148:                              # %if.end717.i
                                        #   in Loop: Header=BB20_143 Depth=2
	ucomisd	.LCPI20_35(%rip), %xmm8
	movsd	%xmm2, 48(%rsp)                 # 8-byte Spill
	movapd	%xmm3, 96(%rsp)                 # 16-byte Spill
	jb	.LBB20_150
# %bb.149:                              #   in Loop: Header=BB20_143 Depth=2
	xorps	%xmm0, %xmm0
	sqrtsd	%xmm8, %xmm0
	jmp	.LBB20_151
	.p2align	4, 0x90
.LBB20_150:                             # %call.sqrt56
                                        #   in Loop: Header=BB20_143 Depth=2
	movapd	%xmm8, %xmm0
	movsd	%xmm8, 32(%rsp)                 # 8-byte Spill
	callq	sqrt@PLT
	movsd	32(%rsp), %xmm8                 # 8-byte Reload
                                        # xmm8 = mem[0],zero
	movq	16(%rsp), %rsi                  # 8-byte Reload
	movsd	.LCPI20_0(%rip), %xmm5          # xmm5 = mem[0],zero
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
.LBB20_151:                             # %if.end717.i.split
                                        #   in Loop: Header=BB20_143 Depth=2
	movsd	.LCPI20_4(%rip), %xmm6          # xmm6 = mem[0],zero
	divsd	%xmm0, %xmm6
	movapd	%xmm8, %xmm2
	mulsd	%xmm6, %xmm2
	movq	136(%rsp), %rax                 # 8-byte Reload
	movsd	(%rax,%rbx,8), %xmm1            # xmm1 = mem[0],zero
	addsd	.LCPI20_3(%rip), %xmm1
	movq	392(%rsp), %rax                 # 8-byte Reload
	mulsd	(%rax,%rbx,8), %xmm1
	movapd	%xmm1, %xmm0
	addsd	%xmm5, %xmm0
	ucomisd	%xmm0, %xmm2
	ja	.LBB20_141
# %bb.153:                              # %if.end733.i
                                        #   in Loop: Header=BB20_143 Depth=2
	movapd	%xmm6, %xmm7
	mulsd	%xmm6, %xmm7
	movapd	%xmm1, %xmm3
	mulsd	%xmm1, %xmm3
	movapd	%xmm5, %xmm0
	subsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm2
	movq	40(%rsp), %rbx                  # 8-byte Reload
	jbe	.LBB20_155
# %bb.154:                              # %if.then737.i
                                        #   in Loop: Header=BB20_143 Depth=2
	subsd	%xmm1, %xmm2
	movsd	.LCPI20_4(%rip), %xmm0          # xmm0 = mem[0],zero
	divsd	%xmm2, %xmm0
	mulsd	%xmm7, %xmm6
	mulsd	.LCPI20_33(%rip), %xmm6
	movsd	%xmm6, 32(%rsp)                 # 8-byte Spill
	addsd	%xmm3, %xmm8
	movapd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm1
	addsd	.LCPI20_34(%rip), %xmm1
	mulsd	%xmm8, %xmm1
	movapd	%xmm1, 192(%rsp)                # 16-byte Spill
	mulsd	%xmm5, %xmm0
	callq	log@PLT
	movapd	192(%rsp), %xmm9                # 16-byte Reload
	movq	16(%rsp), %rsi                  # 8-byte Reload
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	addsd	%xmm0, %xmm0
	subsd	%xmm0, %xmm9
	mulsd	32(%rsp), %xmm9                 # 8-byte Folded Reload
	jmp	.LBB20_163
.LBB20_155:                             # %if.else751.i
                                        #   in Loop: Header=BB20_143 Depth=2
	movapd	%xmm1, %xmm0
	mulsd	.LCPI20_6(%rip), %xmm0
	ucomisd	%xmm0, %xmm2
	jbe	.LBB20_157
# %bb.156:                              # %if.then755.i
                                        #   in Loop: Header=BB20_143 Depth=2
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
	jmp	.LBB20_163
.LBB20_157:                             # %if.else765.i
                                        #   in Loop: Header=BB20_143 Depth=2
	movapd	304(%rsp), %xmm5                # 16-byte Reload
	movapd	%xmm5, %xmm0
	addsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm2
	jbe	.LBB20_159
# %bb.158:                              # %if.then769.i
                                        #   in Loop: Header=BB20_143 Depth=2
	subsd	%xmm3, %xmm8
	movsd	.LCPI20_4(%rip), %xmm0          # xmm0 = mem[0],zero
	divsd	%xmm8, %xmm0
	movapd	%xmm1, %xmm3
	mulsd	%xmm0, %xmm3
	movapd	%xmm7, %xmm4
	mulsd	.LCPI20_8(%rip), %xmm4
	addsd	%xmm0, %xmm4
	mulsd	%xmm3, %xmm4
	movsd	%xmm4, 192(%rsp)                # 8-byte Spill
	mulsd	.LCPI20_23(%rip), %xmm6
	mulsd	%xmm7, %xmm6
	movsd	%xmm6, 32(%rsp)                 # 8-byte Spill
	movapd	%xmm2, %xmm0
	subsd	%xmm1, %xmm0
	addsd	%xmm1, %xmm2
	divsd	%xmm2, %xmm0
	callq	log@PLT
	movq	16(%rsp), %rsi                  # 8-byte Reload
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movapd	%xmm0, %xmm9
	mulsd	32(%rsp), %xmm9                 # 8-byte Folded Reload
	addsd	192(%rsp), %xmm9                # 8-byte Folded Reload
	jmp	.LBB20_163
.LBB20_159:                             # %if.else782.i
                                        #   in Loop: Header=BB20_143 Depth=2
	movapd	%xmm5, %xmm0
	subsd	%xmm1, %xmm0
	andpd	.LCPI20_7(%rip), %xmm0
	ucomisd	%xmm0, %xmm2
	jbe	.LBB20_161
# %bb.160:                              # %if.then786.i
                                        #   in Loop: Header=BB20_143 Depth=2
	addsd	%xmm1, %xmm2
	movsd	.LCPI20_4(%rip), %xmm0          # xmm0 = mem[0],zero
	divsd	%xmm2, %xmm0
	mulsd	%xmm6, %xmm7
	movsd	%xmm7, 224(%rsp)                # 8-byte Spill
	movapd	400(%rsp), %xmm4                # 16-byte Reload
	mulsd	%xmm5, %xmm4
	addsd	%xmm8, %xmm4
	addsd	%xmm3, %xmm4
	mulsd	.LCPI20_8(%rip), %xmm4
	mulsd	%xmm7, %xmm4
	movsd	344(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	mulsd	%xmm2, %xmm4
	movapd	%xmm0, %xmm1
	subsd	%xmm6, %xmm1
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm6
	mulsd	%xmm2, %xmm4
	addsd	%xmm6, %xmm4
	movapd	%xmm4, 192(%rsp)                # 16-byte Spill
	mulsd	%xmm5, %xmm0
	callq	log@PLT
	movapd	192(%rsp), %xmm9                # 16-byte Reload
	movq	16(%rsp), %rsi                  # 8-byte Reload
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	mulsd	224(%rsp), %xmm0                # 8-byte Folded Reload
	subsd	%xmm0, %xmm9
	mulsd	.LCPI20_9(%rip), %xmm9
	jmp	.LBB20_163
.LBB20_161:                             # %if.else805.i
                                        #   in Loop: Header=BB20_143 Depth=2
	xorpd	%xmm9, %xmm9
	ucomisd	%xmm5, %xmm1
	jbe	.LBB20_163
# %bb.162:                              # %if.then808.i
                                        #   in Loop: Header=BB20_143 Depth=2
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
	movsd	%xmm4, 192(%rsp)                # 8-byte Spill
	movapd	%xmm1, %xmm0
	subsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm2
	divsd	%xmm2, %xmm0
	movsd	%xmm6, 32(%rsp)                 # 8-byte Spill
	movsd	%xmm7, 224(%rsp)                # 8-byte Spill
	callq	log@PLT
	movq	16(%rsp), %rsi                  # 8-byte Reload
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movsd	.LCPI20_8(%rip), %xmm1          # xmm1 = mem[0],zero
	movsd	224(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	mulsd	%xmm1, %xmm2
	movsd	32(%rsp), %xmm9                 # 8-byte Reload
                                        # xmm9 = mem[0],zero
	mulsd	%xmm2, %xmm9
	mulsd	%xmm0, %xmm9
	addsd	192(%rsp), %xmm9                # 8-byte Folded Reload
	mulsd	%xmm1, %xmm9
	.p2align	4, 0x90
.LBB20_163:                             # %if.end831.i
                                        #   in Loop: Header=BB20_143 Depth=2
	leaq	2(%r13), %rax
	movapd	%xmm9, %xmm0
	unpcklpd	%xmm9, %xmm0                    # xmm0 = xmm0[0],xmm9[0]
	movapd	96(%rsp), %xmm5                 # 16-byte Reload
	mulpd	%xmm5, %xmm0
	movapd	272(%rsp), %xmm1                # 16-byte Reload
	addpd	%xmm0, %xmm1
	movapd	%xmm1, 272(%rsp)                # 16-byte Spill
	movsd	48(%rsp), %xmm3                 # 8-byte Reload
                                        # xmm3 = mem[0],zero
	movapd	%xmm3, %xmm0
	mulsd	%xmm9, %xmm0
	movsd	24(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 24(%rsp)                 # 8-byte Spill
	movzbl	dim(%rip), %ecx
	movapd	352(%rsp), %xmm0                # 16-byte Reload
	mulsd	%xmm9, %xmm0
	movupd	(%r12,%r14,8), %xmm1
	movapd	%xmm0, %xmm2
	unpcklpd	%xmm0, %xmm2                    # xmm2 = xmm2[0],xmm0[0]
	mulpd	%xmm5, %xmm2
	addpd	%xmm1, %xmm2
	movupd	%xmm2, (%r12,%r14,8)
	mulsd	%xmm0, %xmm3
	addsd	(%r12,%rax,8), %xmm3
	movsd	%xmm3, (%r12,%rax,8)
	cmpb	$1, %cl
	jne	.LBB20_165
# %bb.164:                              # %if.then857.i
                                        #   in Loop: Header=BB20_143 Depth=2
	movsd	264(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm9
	movapd	320(%rsp), %xmm2                # 16-byte Reload
	addsd	%xmm9, %xmm2
	movapd	%xmm2, 320(%rsp)                # 16-byte Spill
	mulsd	%xmm1, %xmm0
	addsd	24(%r12,%r13,8), %xmm0
	movsd	%xmm0, 24(%r12,%r13,8)
.LBB20_165:                             # %for.inc864.i
                                        #   in Loop: Header=BB20_143 Depth=2
	movsd	.LCPI20_0(%rip), %xmm5          # xmm5 = mem[0],zero
	jmp	.LBB20_142
	.p2align	4, 0x90
.LBB20_166:                             # %for.end866.i
                                        #   in Loop: Header=BB20_134 Depth=1
	movq	232(%rsp), %rax                 # 8-byte Reload
	movupd	(%r12,%rax,8), %xmm0
	movapd	352(%rsp), %xmm2                # 16-byte Reload
	movapd	%xmm2, %xmm1
	unpcklpd	%xmm2, %xmm1                    # xmm1 = xmm1[0],xmm2[0]
	mulpd	272(%rsp), %xmm1                # 16-byte Folded Reload
	subpd	%xmm1, %xmm0
	movupd	%xmm0, (%r12,%rax,8)
	movq	256(%rsp), %rcx                 # 8-byte Reload
	movsd	(%r12,%rcx,8), %xmm0            # xmm0 = mem[0],zero
	movsd	24(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%r12,%rcx,8)
	cmpb	$1, dim(%rip)
	jne	.LBB20_132
# %bb.167:                              # %if.then886.i
                                        #   in Loop: Header=BB20_134 Depth=1
	xorpd	.LCPI20_19(%rip), %xmm2
	mulsd	320(%rsp), %xmm2                # 16-byte Folded Reload
	addsd	24(%r12,%rax,8), %xmm2
	movsd	%xmm2, 24(%r12,%rax,8)
	jmp	.LBB20_132
.LBB20_168:
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 128(%rsp)                # 8-byte Spill
	movsd	%xmm0, 120(%rsp)                # 8-byte Spill
.LBB20_169:                             # %if.end139
	movzbl	dim(%rip), %edx
	leal	3(%rdx), %esi
	movl	96(%rbx), %edi
	movl	%edi, %eax
	imull	%esi, %eax
	movl	%eax, %ecx
	testl	%eax, %eax
	movq	448(%rsp), %rbx                 # 8-byte Reload
	jle	.LBB20_179
# %bb.170:                              # %for.body145.lr.ph
	movq	mme34.grad(%rip), %r8
	xorl	%r9d, %r9d
	cmpl	$6, %eax
	jb	.LBB20_175
# %bb.171:                              # %for.body145.lr.ph
	movq	%rbx, %r10
	subq	%r8, %r10
	cmpq	$32, %r10
	jb	.LBB20_175
# %bb.172:                              # %vector.ph
	movl	%ecx, %r9d
	andl	$-4, %r9d
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB20_173:                             # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movupd	(%r8,%r10,8), %xmm0
	movupd	16(%r8,%r10,8), %xmm1
	movupd	%xmm0, (%rbx,%r10,8)
	movupd	%xmm1, 16(%rbx,%r10,8)
	addq	$4, %r10
	cmpq	%r10, %r9
	jne	.LBB20_173
# %bb.174:                              # %middle.block
	cmpq	%rcx, %r9
	je	.LBB20_179
.LBB20_175:                             # %for.body145.preheader
	movq	%r9, %r10
	notq	%r10
	addq	%rcx, %r10
	movq	%rcx, %r11
	andq	$3, %r11
	je	.LBB20_177
	.p2align	4, 0x90
.LBB20_176:                             # %for.body145.prol
                                        # =>This Inner Loop Header: Depth=1
	movsd	(%r8,%r9,8), %xmm0              # xmm0 = mem[0],zero
	movsd	%xmm0, (%rbx,%r9,8)
	incq	%r9
	decq	%r11
	jne	.LBB20_176
.LBB20_177:                             # %for.body145.prol.loopexit
	cmpq	$3, %r10
	jb	.LBB20_179
	.p2align	4, 0x90
.LBB20_178:                             # %for.body145
                                        # =>This Inner Loop Header: Depth=1
	movsd	(%r8,%r9,8), %xmm0              # xmm0 = mem[0],zero
	movsd	%xmm0, (%rbx,%r9,8)
	movsd	8(%r8,%r9,8), %xmm0             # xmm0 = mem[0],zero
	movsd	%xmm0, 8(%rbx,%r9,8)
	movsd	16(%r8,%r9,8), %xmm0            # xmm0 = mem[0],zero
	movsd	%xmm0, 16(%rbx,%r9,8)
	movsd	24(%r8,%r9,8), %xmm0            # xmm0 = mem[0],zero
	movsd	%xmm0, 24(%rbx,%r9,8)
	addq	$4, %r9
	cmpq	%r9, %rcx
	jne	.LBB20_178
.LBB20_179:                             # %for.cond153.preheader
	testl	%edi, %edi
	jle	.LBB20_185
# %bb.180:                              # %for.body157.lr.ph
	movq	frozen(%rip), %r8
	shlq	$2, %rdi
	xorl	%r9d, %r9d
	xorl	%r10d, %r10d
	jmp	.LBB20_182
	.p2align	4, 0x90
.LBB20_181:                             # %for.inc183
                                        #   in Loop: Header=BB20_182 Depth=1
	addq	$4, %r10
	addl	%esi, %r9d
	cmpq	%r10, %rdi
	je	.LBB20_185
.LBB20_182:                             # %for.body157
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%r8,%r10)
	je	.LBB20_181
# %bb.183:                              # %if.then161
                                        #   in Loop: Header=BB20_182 Depth=1
	leal	2(%r9), %r11d
	movq	$0, (%rbx,%r11,8)
	leal	1(%r9), %r11d
	movq	$0, (%rbx,%r11,8)
	movl	%r9d, %r11d
	movq	$0, (%rbx,%r11,8)
	testb	%dl, %dl
	je	.LBB20_181
# %bb.184:                              # %if.then176
                                        #   in Loop: Header=BB20_182 Depth=1
	movl	%r10d, %r11d
	shlq	$3, %r11
	orq	$24, %r11
	movq	$0, (%rbx,%r11)
	jmp	.LBB20_181
.LBB20_185:                             # %for.cond186.preheader
	xorpd	%xmm1, %xmm1
	xorpd	%xmm0, %xmm0
	testl	%eax, %eax
	jle	.LBB20_193
# %bb.186:                              # %for.body191.preheader
	movl	%ecx, %edx
	andl	$3, %edx
	cmpl	$4, %eax
	jae	.LBB20_188
# %bb.187:
	xorl	%esi, %esi
	jmp	.LBB20_190
.LBB20_188:                             # %for.body191.preheader.new
	andl	$-4, %ecx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB20_189:                             # %for.body191
                                        # =>This Inner Loop Header: Depth=1
	movsd	(%rbx,%rsi,8), %xmm2            # xmm2 = mem[0],zero
	movsd	8(%rbx,%rsi,8), %xmm3           # xmm3 = mem[0],zero
	mulsd	%xmm2, %xmm2
	addsd	%xmm0, %xmm2
	mulsd	%xmm3, %xmm3
	addsd	%xmm2, %xmm3
	movsd	16(%rbx,%rsi,8), %xmm2          # xmm2 = mem[0],zero
	mulsd	%xmm2, %xmm2
	addsd	%xmm3, %xmm2
	movsd	24(%rbx,%rsi,8), %xmm0          # xmm0 = mem[0],zero
	mulsd	%xmm0, %xmm0
	addsd	%xmm2, %xmm0
	addq	$4, %rsi
	cmpq	%rsi, %rcx
	jne	.LBB20_189
.LBB20_190:                             # %for.end199.loopexit.unr-lcssa
	testq	%rdx, %rdx
	je	.LBB20_193
# %bb.191:                              # %for.body191.epil.preheader
	leaq	(%rbx,%rsi,8), %rcx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB20_192:                             # %for.body191.epil
                                        # =>This Inner Loop Header: Depth=1
	movsd	(%rcx,%rsi,8), %xmm2            # xmm2 = mem[0],zero
	mulsd	%xmm2, %xmm2
	addsd	%xmm2, %xmm0
	incq	%rsi
	cmpq	%rsi, %rdx
	jne	.LBB20_192
.LBB20_193:                             # %for.end199
	movsd	216(%rsp), %xmm5                # 8-byte Reload
                                        # xmm5 = mem[0],zero
	addsd	440(%rsp), %xmm5                # 8-byte Folded Reload
	movsd	112(%rsp), %xmm6                # 8-byte Reload
                                        # xmm6 = mem[0],zero
	addsd	432(%rsp), %xmm6                # 8-byte Folded Reload
	xorps	%xmm2, %xmm2
	cvtsi2sd	%eax, %xmm2
	addsd	424(%rsp), %xmm4                # 8-byte Folded Reload
	divsd	%xmm2, %xmm0
	ucomisd	%xmm0, %xmm1
	ja	.LBB20_201
.LBB20_194:                             # %cdce.end
	xorpd	%xmm0, %xmm0
	movsd	120(%rsp), %xmm3                # 8-byte Reload
                                        # xmm3 = mem[0],zero
	addsd	%xmm0, %xmm3
	addsd	128(%rsp), %xmm3                # 8-byte Folded Reload
	addsd	%xmm5, %xmm3
	addsd	%xmm6, %xmm3
	addsd	%xmm4, %xmm3
	addsd	376(%rsp), %xmm3                # 8-byte Folded Reload
	addsd	384(%rsp), %xmm3                # 8-byte Folded Reload
	addsd	80(%rsp), %xmm3                 # 8-byte Folded Reload
	addsd	88(%rsp), %xmm3                 # 8-byte Folded Reload
	addsd	%xmm0, %xmm3
	movq	248(%rsp), %rax                 # 8-byte Reload
	movl	(%rax), %edx
	testl	%edx, %edx
	movapd	%xmm5, %xmm1
	movapd	%xmm6, %xmm2
	js	.LBB20_198
# %bb.195:                              # %land.lhs.true221
	je	.LBB20_197
# %bb.196:                              # %land.lhs.true221
	cmpl	max_step(%rip), %edx
	jne	.LBB20_200
.LBB20_197:                             # %if.then227
	movq	nabout@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rdi
	movl	$.L.str.66, %esi
	movapd	%xmm3, %xmm0
	movb	$1, %al
	movsd	%xmm1, 216(%rsp)                # 8-byte Spill
	movsd	%xmm2, 112(%rsp)                # 8-byte Spill
	movsd	%xmm4, 8(%rsp)                  # 8-byte Spill
	movsd	%xmm3, 160(%rsp)                # 8-byte Spill
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	callq	fflush@PLT
	movsd	160(%rsp), %xmm3                # 8-byte Reload
                                        # xmm3 = mem[0],zero
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movsd	112(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	movsd	216(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movq	248(%rsp), %rax                 # 8-byte Reload
	movl	(%rax), %edx
.LBB20_198:                             # %if.end232
	cmpl	$-1, %edx
	jne	.LBB20_200
# %bb.199:                              # %if.then235
	movq	nabout@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rdi
	movl	$.L.str.67, %esi
	movapd	%xmm1, %xmm0
	movb	$1, %al
	movsd	%xmm2, 112(%rsp)                # 8-byte Spill
	movsd	%xmm4, 8(%rsp)                  # 8-byte Spill
	movsd	%xmm3, 160(%rsp)                # 8-byte Spill
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.68, %esi
	movsd	112(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.69, %esi
	movsd	8(%rsp), %xmm0                  # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.70, %esi
	movsd	376(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.71, %esi
	movsd	384(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.72, %esi
	movsd	120(%rsp), %xmm0                # 8-byte Reload
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
	movsd	88(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	fprintf@PLT
	movq	(%rbx), %rdi
	movl	$.L.str.75, %esi
	movsd	80(%rsp), %xmm0                 # 8-byte Reload
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
	movsd	160(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	fprintf@PLT
	movsd	160(%rsp), %xmm3                # 8-byte Reload
                                        # xmm3 = mem[0],zero
.LBB20_200:                             # %cleanup
	movapd	%xmm3, %xmm0
	addq	$504, %rsp                      # imm = 0x1F8
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
.LBB20_201:                             # %cdce.call
	.cfi_def_cfa_offset 560
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jae	.LBB20_194
# %bb.202:                              # %call.sqrt57
	movsd	%xmm4, 8(%rsp)                  # 8-byte Spill
	movsd	%xmm5, 216(%rsp)                # 8-byte Spill
	movsd	%xmm6, 112(%rsp)                # 8-byte Spill
	callq	sqrt@PLT
	movsd	112(%rsp), %xmm6                # 8-byte Reload
                                        # xmm6 = mem[0],zero
	movsd	216(%rsp), %xmm5                # 8-byte Reload
                                        # xmm5 = mem[0],zero
	movsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	jmp	.LBB20_194
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
.LCPI24_21:
	.quad	0x3f50624dd2f1a9fc              # double 0.001
.LCPI24_22:
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
.LCPI24_20:
	.quad	0xbf84f227d028a1df              # double -0.010227499999999999
	.quad	0xbf84f227d028a1df              # double -0.010227499999999999
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
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
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
	je	.LBB24_119
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
	je	.LBB24_120
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
	je	.LBB24_122
.LBB24_9:                               # %if.end59
	movl	%r13d, %eax
	movl	%r13d, %r13d
	movl	%eax, md.nold(%rip)
	movl	nfrozen(%rip), %ebp
	movq	$0, 112(%rsp)
	movq	prm(%rip), %rcx
	testq	%rcx, %rcx
	movl	%eax, 4(%rsp)                   # 4-byte Spill
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
# %bb.13:                               # %vector.memcheck273
	leaq	(%rcx,%rax,8), %rdx
	cmpq	%rdx, %rbx
	jae	.LBB24_54
# %bb.14:                               # %vector.memcheck273
	movq	%rax, %rdx
	shlq	$5, %rdx
	addq	%rbx, %rdx
	cmpq	%rdx, %rcx
	jae	.LBB24_54
.LBB24_15:
	xorl	%esi, %esi
	xorl	%edx, %edx
.LBB24_16:                              # %for.body.us.i.preheader411
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
	cmpl	$4, 4(%rsp)                     # 4-byte Folded Reload
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
.LBB24_25:                              # %for.body.i.preheader413
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
# %bb.28:                               # %for.body.i.preheader5
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
.LBB24_30:                              # %vector.ph298
	movl	%r13d, %eax
	andl	$-4, %eax
	movl	%r13d, %ecx
	shrl	$2, %ecx
	shlq	$5, %rcx
	xorl	%edx, %edx
	movapd	.LCPI24_4(%rip), %xmm0          # xmm0 = [1.0000000000000001E-1,1.0000000000000001E-1]
	.p2align	4, 0x90
.LBB24_31:                              # %vector.body303
                                        # =>This Inner Loop Header: Depth=1
	movupd	%xmm0, (%rbx,%rdx)
	movupd	%xmm0, 16(%rbx,%rdx)
	addq	$32, %rdx
	cmpq	%rdx, %rcx
	jne	.LBB24_31
# %bb.32:                               # %middle.block295
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
	cmpl	$0, 4(%rsp)                     # 4-byte Folded Reload
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
	ucomisd	.LCPI24_22(%rip), %xmm0
	jb	.LBB24_42
# %bb.41:                               #   in Loop: Header=BB24_39 Depth=1
	sqrtsd	%xmm0, %xmm0
	jmp	.LBB24_43
.LBB24_42:                              # %call.sqrt
                                        #   in Loop: Header=BB24_39 Depth=1
	callq	sqrt@PLT
.LBB24_43:                              # %if.else109.split
                                        #   in Loop: Header=BB24_39 Depth=1
	movsd	%xmm0, 120(%rsp)
	leaq	112(%rsp), %rdi
	leaq	120(%rsp), %rsi
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
	cmpl	$0, 4(%rsp)                     # 4-byte Folded Reload
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
	movsd	16(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	movq	24(%rsp), %rbp                  # 8-byte Reload
	jmp	.LBB24_66
.LBB24_49:                              # %vector.memcheck306
	movq	%rcx, %rsi
	subq	%r14, %rsi
	xorl	%edx, %edx
	cmpq	$32, %rsi
	jb	.LBB24_60
# %bb.50:                               # %vector.memcheck306
	movq	%rcx, %rsi
	subq	%rax, %rsi
	cmpq	$32, %rsi
	movq	24(%rsp), %rbp                  # 8-byte Reload
	jb	.LBB24_61
# %bb.51:                               # %vector.ph312
	movl	%r13d, %edx
	andl	$-4, %edx
	movl	%r13d, %esi
	shrl	$2, %esi
	shlq	$5, %rsi
	xorl	%edi, %edi
	movapd	.LCPI24_6(%rip), %xmm0          # xmm0 = [-0.0E+0,-0.0E+0]
	movapd	.LCPI24_7(%rip), %xmm1          # xmm1 = [1.0227499999999999E-2,1.0227499999999999E-2]
	.p2align	4, 0x90
.LBB24_52:                              # %vector.body317
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
# %bb.53:                               # %middle.block309
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
# %bb.64:                               # %for.body164.preheader3
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
	jle	.LBB24_118
# %bb.67:                               # %for.body217.lr.ph
	leal	(%rbp,%rbp,2), %eax
	movl	4(%rsp), %edx                   # 4-byte Reload
	movl	%edx, %ecx
	subl	%eax, %ecx
	xorps	%xmm0, %xmm0
	cvtsi2sd	%ecx, %xmm0
	mulsd	.LCPI24_0(%rip), %xmm0
	mulsd	.LCPI24_1(%rip), %xmm0
	movsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	(%r12,%r13,8), %rcx
	leaq	(%r14,%r13,8), %rsi
	leaq	(%r15,%r13,8), %rax
	movl	%r13d, %edi
	andl	$-4, %edi
	movq	%rdi, 72(%rsp)                  # 8-byte Spill
	movl	%r13d, %edi
	andl	$3, %edi
	movq	%rdi, 16(%rsp)                  # 8-byte Spill
	movq	%rax, 104(%rsp)                 # 8-byte Spill
	cmpq	%r12, %rax
	seta	%al
	cmpq	%r15, %rcx
	seta	%dil
	andb	%al, %dil
	movb	%dil, 11(%rsp)                  # 1-byte Spill
	movl	%r13d, %eax
	andl	$-2, %eax
	movq	%rax, 48(%rsp)                  # 8-byte Spill
	movq	%rsi, 88(%rsp)                  # 8-byte Spill
	cmpq	%r12, %rsi
	seta	%al
	leaq	(,%r13,8), %rsi
	movq	%rsi, 56(%rsp)                  # 8-byte Spill
	movq	%rcx, 64(%rsp)                  # 8-byte Spill
	cmpq	%r14, %rcx
	seta	%cl
	leaq	-1(%r13), %rsi
	movq	%rsi, 80(%rsp)                  # 8-byte Spill
	andb	%al, %cl
	movb	%cl, 10(%rsp)                   # 1-byte Spill
	movq	%r13, %rax
	negq	%rax
	movq	%rax, 96(%rsp)                  # 8-byte Spill
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
	addsd	.LCPI24_21(%rip), %xmm0
	movsd	%xmm0, t(%rip)
	movl	(%rsp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, (%rsp)
	cmpl	44(%rsp), %eax                  # 4-byte Folded Reload
	jge	.LBB24_118
.LBB24_70:                              # %for.body217
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB24_78 Depth 2
                                        #     Child Loop BB24_83 Depth 2
                                        #     Child Loop BB24_85 Depth 2
                                        #     Child Loop BB24_92 Depth 2
                                        #     Child Loop BB24_95 Depth 2
                                        #     Child Loop BB24_103 Depth 2
                                        #     Child Loop BB24_109 Depth 2
                                        #     Child Loop BB24_114 Depth 2
                                        #     Child Loop BB24_117 Depth 2
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
	ucomisd	.LCPI24_22(%rip), %xmm0
	jb	.LBB24_74
# %bb.72:                               #   in Loop: Header=BB24_70 Depth=1
	sqrtsd	%xmm0, %xmm0
.LBB24_73:                              # %if.end226
                                        #   in Loop: Header=BB24_70 Depth=1
	cmpb	$0, 12(%rsp)                    # 1-byte Folded Reload
	je	.LBB24_68
	jmp	.LBB24_75
	.p2align	4, 0x90
.LBB24_74:                              # %call.sqrt142
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
	cmpl	$6, 4(%rsp)                     # 4-byte Folded Reload
	jb	.LBB24_80
# %bb.76:                               # %for.body230.lr.ph
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	%rax, %rcx
	subq	%r15, %rcx
	movl	$0, %edx
	cmpq	$32, %rcx
	jb	.LBB24_81
# %bb.77:                               # %vector.body404.preheader
                                        #   in Loop: Header=BB24_70 Depth=1
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB24_78:                              # %vector.body404
                                        #   Parent Loop BB24_70 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movupd	(%r15,%rcx), %xmm2
	movupd	16(%r15,%rcx), %xmm1
	movupd	%xmm2, (%rax,%rcx)
	movupd	%xmm1, 16(%rax,%rcx)
	addq	$32, %rcx
	cmpq	%rcx, %rbp
	jne	.LBB24_78
# %bb.79:                               # %middle.block396
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	72(%rsp), %rcx                  # 8-byte Reload
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
	movq	80(%rsp), %rsi                  # 8-byte Reload
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
	cmpl	$6, 4(%rsp)                     # 4-byte Folded Reload
	jae	.LBB24_89
# %bb.88:                               #   in Loop: Header=BB24_70 Depth=1
	xorl	%ecx, %ecx
	movsd	.LCPI24_17(%rip), %xmm3         # xmm3 = mem[0],zero
	movsd	.LCPI24_18(%rip), %xmm4         # xmm4 = mem[0],zero
	movsd	.LCPI24_19(%rip), %xmm5         # xmm5 = mem[0],zero
	jmp	.LBB24_95
.LBB24_89:                              # %vector.memcheck362
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	56(%rsp), %rcx                  # 8-byte Reload
	addq	%rax, %rcx
	cmpq	%r12, %rcx
	seta	%dl
	cmpq	64(%rsp), %rax                  # 8-byte Folded Reload
	setb	%dil
	andb	%dl, %dil
	orb	11(%rsp), %dil                  # 1-byte Folded Reload
	cmpq	%r15, %rcx
	seta	%dl
	cmpq	104(%rsp), %rax                 # 8-byte Folded Reload
	setb	%sil
	testb	%dil, %dil
	movsd	.LCPI24_17(%rip), %xmm3         # xmm3 = mem[0],zero
	movsd	.LCPI24_18(%rip), %xmm4         # xmm4 = mem[0],zero
	movsd	.LCPI24_19(%rip), %xmm5         # xmm5 = mem[0],zero
	jne	.LBB24_94
# %bb.90:                               # %vector.memcheck362
                                        #   in Loop: Header=BB24_70 Depth=1
	movl	$0, %ecx
	andb	%sil, %dl
	jne	.LBB24_95
# %bb.91:                               # %vector.ph380
                                        #   in Loop: Header=BB24_70 Depth=1
	movapd	%xmm0, %xmm9
	unpcklpd	%xmm0, %xmm9                    # xmm9 = xmm9[0],xmm0[0]
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB24_92:                              # %vector.body385
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
# %bb.93:                               # %middle.block377
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	48(%rsp), %rdx                  # 8-byte Reload
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
	movapd	%xmm0, 128(%rsp)                # 16-byte Spill
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rsp, %rdx
	callq	*32(%rsp)                       # 8-byte Folded Reload
	xorpd	%xmm5, %xmm5
	cmpb	$0, 12(%rsp)                    # 1-byte Folded Reload
	je	.LBB24_99
# %bb.97:                               # %for.body341.lr.ph
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	md.minv(%rip), %rax
	movq	md.accel(%rip), %rcx
	cmpl	$12, 4(%rsp)                    # 4-byte Folded Reload
	movapd	.LCPI24_6(%rip), %xmm3          # xmm3 = [-0.0E+0,-0.0E+0]
	movsd	.LCPI24_9(%rip), %xmm4          # xmm4 = mem[0],zero
	movapd	.LCPI24_20(%rip), %xmm6         # xmm6 = [-1.0227499999999999E-2,-1.0227499999999999E-2]
	movapd	.LCPI24_15(%rip), %xmm7         # xmm7 = [-1.0E+1,-1.0E+1]
	movapd	.LCPI24_16(%rip), %xmm8         # xmm8 = [2.0454999999999997E-2,2.0454999999999997E-2]
	jae	.LBB24_100
# %bb.98:                               #   in Loop: Header=BB24_70 Depth=1
	xorl	%esi, %esi
	movapd	128(%rsp), %xmm9                # 16-byte Reload
	jmp	.LBB24_106
.LBB24_99:                              #   in Loop: Header=BB24_70 Depth=1
	movapd	.LCPI24_14(%rip), %xmm6         # xmm6 = [1.0E+1,1.0E+1]
	movapd	.LCPI24_15(%rip), %xmm7         # xmm7 = [-1.0E+1,-1.0E+1]
	movapd	.LCPI24_16(%rip), %xmm8         # xmm8 = [2.0454999999999997E-2,2.0454999999999997E-2]
	jmp	.LBB24_69
.LBB24_100:                             # %vector.memcheck324
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	56(%rsp), %rsi                  # 8-byte Reload
	leaq	(%rcx,%rsi), %rdx
	addq	%rax, %rsi
	movq	64(%rsp), %r10                  # 8-byte Reload
	cmpq	%r10, %rcx
	setb	%dil
	cmpq	%r12, %rdx
	seta	%r8b
	andb	%dil, %r8b
	cmpq	88(%rsp), %rcx                  # 8-byte Folded Reload
	setb	%dil
	cmpq	%r14, %rdx
	seta	%r9b
	andb	%dil, %r9b
	orb	%r8b, %r9b
	cmpq	%rsi, %rcx
	setb	%dil
	cmpq	%rdx, %rax
	setb	%r8b
	andb	%dil, %r8b
	orb	10(%rsp), %r8b                  # 1-byte Folded Reload
	orb	%r9b, %r8b
	cmpq	%r12, %rsi
	seta	%dl
	cmpq	%r10, %rax
	setb	%dil
	testb	%r8b, %r8b
	movapd	128(%rsp), %xmm9                # 16-byte Reload
	jne	.LBB24_105
# %bb.101:                              # %vector.memcheck324
                                        #   in Loop: Header=BB24_70 Depth=1
	movl	$0, %esi
	andb	%dil, %dl
	jne	.LBB24_106
# %bb.102:                              # %vector.ph351
                                        #   in Loop: Header=BB24_70 Depth=1
	movapd	%xmm9, %xmm0
	unpcklpd	%xmm9, %xmm0                    # xmm0 = xmm0[0],xmm9[0]
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB24_103:                             # %vector.body356
                                        #   Parent Loop BB24_70 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movupd	(%r14,%rdx), %xmm1
	movupd	(%rax,%rdx), %xmm2
	mulpd	%xmm1, %xmm2
	mulpd	%xmm6, %xmm2
	movupd	%xmm2, (%rcx,%rdx)
	movupd	(%r12,%rdx), %xmm1
	addpd	%xmm2, %xmm1
	mulpd	%xmm0, %xmm1
	movupd	%xmm1, (%r12,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %rbx
	jne	.LBB24_103
# %bb.104:                              # %middle.block348
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	48(%rsp), %rdx                  # 8-byte Reload
	movq	%rdx, %rsi
	cmpq	%r13, %rdx
	jne	.LBB24_106
	jmp	.LBB24_110
.LBB24_105:                             #   in Loop: Header=BB24_70 Depth=1
	xorl	%esi, %esi
.LBB24_106:                             # %for.body341.preheader
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	%rsi, %rdx
	testb	$1, %r13b
	je	.LBB24_108
# %bb.107:                              # %for.body341.prol
                                        #   in Loop: Header=BB24_70 Depth=1
	movsd	(%rax,%rsi,8), %xmm0            # xmm0 = mem[0],zero
	mulsd	(%r14,%rsi,8), %xmm0
	mulsd	.LCPI24_8(%rip), %xmm0
	movsd	%xmm0, (%rcx,%rsi,8)
	addsd	(%r12,%rsi,8), %xmm0
	mulsd	%xmm9, %xmm0
	movsd	%xmm0, (%r12,%rsi,8)
	movq	%rsi, %rdx
	orq	$1, %rdx
.LBB24_108:                             # %for.body341.prol.loopexit
                                        #   in Loop: Header=BB24_70 Depth=1
	notq	%rsi
	cmpq	96(%rsp), %rsi                  # 8-byte Folded Reload
	je	.LBB24_110
	.p2align	4, 0x90
.LBB24_109:                             # %for.body341
                                        #   Parent Loop BB24_70 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	(%r14,%rdx,8), %xmm0            # xmm0 = mem[0],zero
	xorpd	%xmm3, %xmm0
	mulsd	(%rax,%rdx,8), %xmm0
	mulsd	%xmm4, %xmm0
	movsd	%xmm0, (%rcx,%rdx,8)
	addsd	(%r12,%rdx,8), %xmm0
	mulsd	%xmm9, %xmm0
	movsd	%xmm0, (%r12,%rdx,8)
	movsd	8(%r14,%rdx,8), %xmm0           # xmm0 = mem[0],zero
	xorpd	%xmm3, %xmm0
	mulsd	8(%rax,%rdx,8), %xmm0
	mulsd	%xmm4, %xmm0
	movsd	%xmm0, 8(%rcx,%rdx,8)
	addsd	8(%r12,%rdx,8), %xmm0
	mulsd	%xmm9, %xmm0
	movsd	%xmm0, 8(%r12,%rdx,8)
	addq	$2, %rdx
	cmpq	%rdx, %r13
	jne	.LBB24_109
.LBB24_110:                             # %for.cond399.preheader
                                        #   in Loop: Header=BB24_70 Depth=1
	cmpb	$0, 12(%rsp)                    # 1-byte Folded Reload
	movapd	.LCPI24_14(%rip), %xmm6         # xmm6 = [1.0E+1,1.0E+1]
	je	.LBB24_69
# %bb.111:                              # %for.body402.lr.ph
                                        #   in Loop: Header=BB24_70 Depth=1
	movq	md.minv(%rip), %rax
	cmpq	$3, 80(%rsp)                    # 8-byte Folded Reload
	jae	.LBB24_113
# %bb.112:                              #   in Loop: Header=BB24_70 Depth=1
	xorpd	%xmm5, %xmm5
	xorl	%ecx, %ecx
	jmp	.LBB24_115
.LBB24_113:                             # %for.body402.preheader
                                        #   in Loop: Header=BB24_70 Depth=1
	xorpd	%xmm5, %xmm5
	xorl	%ecx, %ecx
	movq	72(%rsp), %rdx                  # 8-byte Reload
	.p2align	4, 0x90
.LBB24_114:                             # %for.body402
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
	jne	.LBB24_114
.LBB24_115:                             # %if.end420.loopexit.unr-lcssa
                                        #   in Loop: Header=BB24_70 Depth=1
	testb	$3, %r13b
	je	.LBB24_69
# %bb.116:                              # %for.body402.epil.preheader
                                        #   in Loop: Header=BB24_70 Depth=1
	leaq	(%rax,%rcx,8), %rax
	leaq	(%r12,%rcx,8), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB24_117:                             # %for.body402.epil
                                        #   Parent Loop BB24_70 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	(%rcx,%rdx,8), %xmm0            # xmm0 = mem[0],zero
	mulsd	%xmm0, %xmm0
	divsd	(%rax,%rdx,8), %xmm0
	addsd	%xmm0, %xmm5
	incq	%rdx
	cmpq	%rdx, 16(%rsp)                  # 8-byte Folded Reload
	jne	.LBB24_117
	jmp	.LBB24_69
.LBB24_118:                             # %for.end439
	movl	$-3, (%rsp)
	movq	%rsp, %rdx
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	*32(%rsp)                       # 8-byte Folded Reload
	xorl	%eax, %eax
	addq	$152, %rsp
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
.LBB24_54:                              # %vector.ph282
	.cfi_def_cfa_offset 208
	movl	%eax, %edx
	andl	$-2, %edx
	leaq	(,%rdx,4), %rsi
	xorl	%edi, %edi
	movapd	.LCPI24_2(%rip), %xmm0          # xmm0 = [1.0E+0,1.0E+0]
	movq	%rbx, %r8
	.p2align	4, 0x90
.LBB24_55:                              # %vector.body289
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
# %bb.56:                               # %middle.block279
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
.LBB24_119:                             # %if.then5
	movq	stderr@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rcx
	movl	$.L.str.61, %edi
	jmp	.LBB24_121
.LBB24_120:                             # %if.then20
	movq	stderr@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rcx
	movl	$.L.str.62, %edi
.LBB24_121:                             # %if.then5
	movl	$34, %esi
	jmp	.LBB24_123
.LBB24_122:                             # %if.then54
	movq	stderr@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rcx
	movl	$.L.str.64, %edi
	movl	$35, %esi
.LBB24_123:                             # %if.then5
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
.LBB25_11:                              # %for.inc
                                        #   in Loop: Header=BB25_4 Depth=1
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm6
	incq	%r15
	cmpq	%r15, 56(%rsp)                  # 8-byte Folded Reload
	je	.LBB25_12
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
	movapd	%xmm7, %xmm1
	divsd	%xmm0, %xmm1
	subsd	-8(%r9,%r14,8), %xmm0
	movsd	-8(%r8,%r14,8), %xmm2           # xmm2 = mem[0],zero
	mulsd	%xmm0, %xmm2
	mulsd	%xmm2, %xmm1
	movupd	(%rbx,%r13,8), %xmm3
	movapd	%xmm1, %xmm4
	unpcklpd	%xmm1, %xmm4                    # xmm4 = xmm4[0],xmm1[0]
	mulpd	%xmm4, %xmm8
	addpd	%xmm8, %xmm3
	movupd	%xmm3, (%rbx,%r13,8)
	mulsd	%xmm1, %xmm9
	movsd	(%rbx,%rdi,8), %xmm3            # xmm3 = mem[0],zero
	addsd	%xmm9, %xmm3
	movsd	%xmm3, (%rbx,%rdi,8)
	movupd	(%rbx,%r12,8), %xmm3
	subpd	%xmm8, %xmm3
	movupd	%xmm3, (%rbx,%r12,8)
	movsd	(%rbx,%rax,8), %xmm3            # xmm3 = mem[0],zero
	subsd	%xmm9, %xmm3
	movsd	%xmm3, (%rbx,%rax,8)
	movzbl	dim(%rip), %eax
	cmpb	$1, %al
	jne	.LBB25_11
# %bb.10:                               # %if.then80
                                        #   in Loop: Header=BB25_4 Depth=1
	mulsd	40(%rsp), %xmm1                 # 8-byte Folded Reload
	movsd	24(%rbx,%r13,8), %xmm3          # xmm3 = mem[0],zero
	addsd	%xmm1, %xmm3
	movsd	%xmm3, 24(%rbx,%r13,8)
	movsd	24(%rbx,%r12,8), %xmm3          # xmm3 = mem[0],zero
	subsd	%xmm1, %xmm3
	movsd	%xmm3, 24(%rbx,%r12,8)
	jmp	.LBB25_11
.LBB25_12:
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
	movq	%r9, 112(%rsp)                  # 8-byte Spill
	movq	%r8, 104(%rsp)                  # 8-byte Spill
	movq	%rcx, 96(%rsp)                  # 8-byte Spill
	movq	%rdx, 88(%rsp)                  # 8-byte Spill
	movq	%rsi, 80(%rsp)                  # 8-byte Spill
	testl	%edi, %edi
	jle	.LBB26_1
# %bb.2:                                # %for.body.preheader
	movq	344(%rsp), %r8
	movl	%edi, %eax
	movq	%rax, 72(%rsp)                  # 8-byte Spill
	xorpd	%xmm3, %xmm3
	movzbl	dim(%rip), %eax
	xorl	%r14d, %r14d
	xorpd	%xmm0, %xmm0
                                        # implicit-def: $xmm4
                                        # implicit-def: $xmm1
                                        # kill: killed $xmm1
	jmp	.LBB26_3
	.p2align	4, 0x90
.LBB26_18:                              # %for.inc
                                        #   in Loop: Header=BB26_3 Depth=1
	movsd	128(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm10, %xmm1
	movsd	136(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	incq	%r14
	cmpq	%r14, 72(%rsp)                  # 8-byte Folded Reload
	movq	344(%rsp), %r8
	je	.LBB26_19
.LBB26_3:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movsd	%xmm0, 136(%rsp)                # 8-byte Spill
	movzbl	%al, %eax
	movl	%eax, %edx
	andl	$1, %edx
	addl	$3, %edx
	movq	80(%rsp), %rcx                  # 8-byte Reload
	movl	(%rcx,%r14,4), %ecx
	imull	%edx, %ecx
	movslq	%ecx, %rcx
	imulq	$1431655766, %rcx, %rcx         # imm = 0x55555556
	movq	%rcx, %rsi
	shrq	$63, %rsi
	shrq	$32, %rcx
	addl	%esi, %ecx
	movq	88(%rsp), %rsi                  # 8-byte Reload
	movl	(%rsi,%r14,4), %esi
	imull	%edx, %esi
	movslq	%esi, %rsi
	imulq	$1431655766, %rsi, %rsi         # imm = 0x55555556
	movq	%rsi, %rdi
	shrq	$63, %rdi
	shrq	$32, %rsi
	addl	%edi, %esi
	movq	96(%rsp), %rdi                  # 8-byte Reload
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
	movsd	16(%r8,%r12,8), %xmm5           # xmm5 = mem[0],zero
	movhpd	(%r8,%r13,8), %xmm7             # xmm7 = xmm7[0],mem[0]
	movsd	(%r8,%r15,8), %xmm0             # xmm0 = mem[0],zero
	movsd	8(%r8,%r15,8), %xmm1            # xmm1 = mem[0],zero
	movsd	16(%r8,%r15,8), %xmm2           # xmm2 = mem[0],zero
	unpcklpd	%xmm0, %xmm0                    # xmm0 = xmm0[0,0]
	movhpd	8(%r8,%r13,8), %xmm6            # xmm6 = xmm6[0],mem[0]
	subpd	%xmm0, %xmm7
	unpcklpd	%xmm1, %xmm1                    # xmm1 = xmm1[0,0]
	movhpd	16(%r8,%r13,8), %xmm5           # xmm5 = xmm5[0],mem[0]
	subpd	%xmm1, %xmm6
	unpcklpd	%xmm2, %xmm2                    # xmm2 = xmm2[0,0]
	subpd	%xmm2, %xmm5
	movapd	%xmm6, 32(%rsp)                 # 16-byte Spill
	movapd	%xmm6, %xmm0
	mulpd	%xmm6, %xmm0
	movapd	%xmm7, 16(%rsp)                 # 16-byte Spill
	movapd	%xmm7, %xmm1
	mulpd	%xmm7, %xmm1
	addpd	%xmm0, %xmm1
	movapd	%xmm5, 48(%rsp)                 # 16-byte Spill
	mulpd	%xmm5, %xmm5
	addpd	%xmm1, %xmm5
	testb	$1, %al
	je	.LBB26_5
# %bb.4:                                # %if.then
                                        #   in Loop: Header=BB26_3 Depth=1
	movsd	24(%r8,%r12,8), %xmm1           # xmm1 = mem[0],zero
	movhpd	24(%r8,%r13,8), %xmm1           # xmm1 = xmm1[0],mem[0]
	movsd	24(%r8,%r15,8), %xmm0           # xmm0 = mem[0],zero
	unpcklpd	%xmm0, %xmm0                    # xmm0 = xmm0[0,0]
	subpd	%xmm0, %xmm1
	movapd	%xmm1, 144(%rsp)                # 16-byte Spill
	movapd	%xmm1, %xmm0
	mulpd	%xmm1, %xmm0
	addpd	%xmm0, %xmm5
.LBB26_5:                               # %if.end
                                        #   in Loop: Header=BB26_3 Depth=1
	movq	104(%rsp), %rax                 # 8-byte Reload
	movslq	(%rax,%r14,4), %rbx
	movapd	%xmm5, %xmm0
	unpckhpd	%xmm5, %xmm0                    # xmm0 = xmm0[1],xmm5[1]
	ucomisd	%xmm3, %xmm0
	movaps	%xmm4, 256(%rsp)                # 16-byte Spill
	jb	.LBB26_7
# %bb.6:                                #   in Loop: Header=BB26_3 Depth=1
	xorps	%xmm1, %xmm1
	sqrtsd	%xmm0, %xmm1
	ucomisd	%xmm3, %xmm5
	jae	.LBB26_9
.LBB26_10:                              # %call.sqrt4
                                        #   in Loop: Header=BB26_3 Depth=1
	movapd	%xmm5, %xmm0
	movapd	%xmm1, (%rsp)                   # 16-byte Spill
	callq	sqrt@PLT
	movapd	(%rsp), %xmm1                   # 16-byte Reload
	jmp	.LBB26_11
	.p2align	4, 0x90
.LBB26_7:                               # %call.sqrt
                                        #   in Loop: Header=BB26_3 Depth=1
	movapd	%xmm5, (%rsp)                   # 16-byte Spill
	callq	sqrt@PLT
	movapd	(%rsp), %xmm5                   # 16-byte Reload
	xorpd	%xmm3, %xmm3
	movapd	%xmm0, %xmm1
	ucomisd	%xmm3, %xmm5
	jb	.LBB26_10
.LBB26_9:                               #   in Loop: Header=BB26_3 Depth=1
	xorps	%xmm0, %xmm0
	sqrtsd	%xmm5, %xmm0
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
	movapd	%xmm5, 192(%rsp)                # 16-byte Spill
	movapd	%xmm5, %xmm1
	movapd	%xmm3, 16(%rsp)                 # 16-byte Spill
	mulsd	%xmm3, %xmm1
	addsd	%xmm0, %xmm1
	movapd	%xmm4, (%rsp)                   # 16-byte Spill
	movapd	%xmm4, %xmm0
	movapd	%xmm2, 48(%rsp)                 # 16-byte Spill
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movzbl	dim(%rip), %ebp
	movapd	144(%rsp), %xmm2                # 16-byte Reload
	mulpd	%xmm6, %xmm2
	testb	%bpl, %bpl
	movapd	%xmm2, 160(%rsp)                # 16-byte Spill
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
	movapd	%xmm6, 176(%rsp)                # 16-byte Spill
	movapd	%xmm6, %xmm0
	unpckhpd	%xmm6, %xmm0                    # xmm0 = xmm0[1],xmm6[1]
	movapd	%xmm0, 224(%rsp)                # 16-byte Spill
	movsd	.LCPI26_2(%rip), %xmm0          # xmm0 = mem[0],zero
	maxsd	%xmm1, %xmm0
	movapd	%xmm0, 240(%rsp)                # 16-byte Spill
	callq	acos@PLT
	movapd	%xmm0, %xmm1
	movq	336(%rsp), %rax
	subsd	-8(%rax,%rbx,8), %xmm1
	movq	112(%rsp), %rax                 # 8-byte Reload
	movsd	-8(%rax,%rbx,8), %xmm2          # xmm2 = mem[0],zero
	movsd	%xmm1, 128(%rsp)                # 8-byte Spill
	mulsd	%xmm1, %xmm2
	movsd	%xmm2, 120(%rsp)                # 8-byte Spill
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
	movdqa	160(%rsp), %xmm2                # 16-byte Reload
	pand	%xmm0, %xmm2
	pandn	256(%rsp), %xmm0                # 16-byte Folded Reload
	movdqa	%xmm0, %xmm4
	por	%xmm2, %xmm4
	movsd	120(%rsp), %xmm10               # 8-byte Reload
                                        # xmm10 = mem[0],zero
	movapd	%xmm10, %xmm0
	addsd	%xmm10, %xmm0
	xorpd	.LCPI26_5(%rip), %xmm0
	divsd	%xmm1, %xmm0
	movapd	224(%rsp), %xmm11               # 16-byte Reload
	mulsd	%xmm0, %xmm11
	movapd	240(%rsp), %xmm9                # 16-byte Reload
	movapd	%xmm9, %xmm1
	movapd	192(%rsp), %xmm13               # 16-byte Reload
	mulsd	%xmm13, %xmm1
	movapd	%xmm9, %xmm2
	movapd	16(%rsp), %xmm7                 # 16-byte Reload
	mulsd	%xmm7, %xmm2
	subsd	%xmm1, %xmm7
	mulsd	%xmm11, %xmm7
	mulsd	176(%rsp), %xmm0                # 16-byte Folded Reload
	subsd	%xmm2, %xmm13
	mulsd	%xmm0, %xmm13
	movapd	%xmm9, %xmm1
	movapd	208(%rsp), %xmm12               # 16-byte Reload
	mulsd	%xmm12, %xmm1
	movapd	%xmm9, %xmm2
	movapd	32(%rsp), %xmm6                 # 16-byte Reload
	mulsd	%xmm6, %xmm2
	subsd	%xmm1, %xmm6
	mulsd	%xmm11, %xmm6
	subsd	%xmm2, %xmm12
	mulsd	%xmm0, %xmm12
	movapd	%xmm9, %xmm1
	movapd	(%rsp), %xmm8                   # 16-byte Reload
	mulsd	%xmm8, %xmm1
	movapd	%xmm9, %xmm2
	movapd	48(%rsp), %xmm5                 # 16-byte Reload
	mulsd	%xmm5, %xmm2
	subsd	%xmm1, %xmm5
	mulsd	%xmm11, %xmm5
	subsd	%xmm2, %xmm8
	mulsd	%xmm0, %xmm8
	movq	352(%rsp), %r9
	movsd	(%r9,%r13,8), %xmm1             # xmm1 = mem[0],zero
	addsd	%xmm7, %xmm1
	movsd	%xmm1, (%r9,%r13,8)
	addsd	%xmm13, %xmm7
	addsd	(%r9,%r12,8), %xmm13
	movsd	%xmm13, (%r9,%r12,8)
	movsd	(%r9,%r15,8), %xmm1             # xmm1 = mem[0],zero
	subsd	%xmm7, %xmm1
	movsd	%xmm1, (%r9,%r15,8)
	movsd	(%r9,%r8,8), %xmm1              # xmm1 = mem[0],zero
	addsd	%xmm6, %xmm1
	movsd	%xmm1, (%r9,%r8,8)
	addsd	%xmm12, %xmm6
	addsd	(%r9,%rdi,8), %xmm12
	movsd	%xmm12, (%r9,%rdi,8)
	movsd	(%r9,%rsi,8), %xmm1             # xmm1 = mem[0],zero
	subsd	%xmm6, %xmm1
	movsd	%xmm1, (%r9,%rsi,8)
	movsd	(%r9,%rdx,8), %xmm1             # xmm1 = mem[0],zero
	addsd	%xmm5, %xmm1
	movsd	%xmm1, (%r9,%rdx,8)
	addsd	%xmm8, %xmm5
	addsd	(%r9,%rcx,8), %xmm8
	movsd	%xmm8, (%r9,%rcx,8)
	movsd	(%r9,%rax,8), %xmm1             # xmm1 = mem[0],zero
	subsd	%xmm5, %xmm1
	movsd	%xmm1, (%r9,%rax,8)
	movzbl	dim(%rip), %eax
	cmpb	$1, %al
	jne	.LBB26_18
# %bb.17:                               # %if.then188
                                        #   in Loop: Header=BB26_3 Depth=1
	xorpd	.LCPI26_5(%rip), %xmm9
	movdqa	%xmm4, %xmm1
	punpckhqdq	%xmm4, %xmm1            # xmm1 = xmm1[1],xmm4[1]
	movapd	%xmm9, %xmm2
	mulsd	%xmm1, %xmm2
	addsd	%xmm4, %xmm2
	mulsd	%xmm11, %xmm2
	mulsd	%xmm4, %xmm9
	addsd	%xmm1, %xmm9
	mulsd	%xmm0, %xmm9
	movq	352(%rsp), %rcx
	movsd	24(%rcx,%r13,8), %xmm0          # xmm0 = mem[0],zero
	addsd	%xmm2, %xmm0
	movsd	%xmm0, 24(%rcx,%r13,8)
	addsd	%xmm9, %xmm2
	addsd	24(%rcx,%r12,8), %xmm9
	movsd	%xmm9, 24(%rcx,%r12,8)
	movsd	24(%rcx,%r15,8), %xmm0          # xmm0 = mem[0],zero
	subsd	%xmm2, %xmm0
	movsd	%xmm0, 24(%rcx,%r15,8)
	jmp	.LBB26_18
.LBB26_1:
	xorpd	%xmm0, %xmm0
.LBB26_19:                              # %for.end
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
	subq	$568, %rsp                      # imm = 0x238
	.cfi_def_cfa_offset 624
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r9, 376(%rsp)                  # 8-byte Spill
	movq	%r8, 368(%rsp)                  # 8-byte Spill
	movq	%rdx, 360(%rsp)                 # 8-byte Spill
	movq	%rsi, 352(%rsp)                 # 8-byte Spill
	testl	%edi, %edi
	jle	.LBB27_1
# %bb.2:                                # %for.body.preheader
	movq	656(%rsp), %r13
	movq	648(%rsp), %r8
	movq	632(%rsp), %r9
	movl	%edi, %eax
	movq	%rax, 344(%rsp)                 # 8-byte Spill
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 400(%rsp)                # 16-byte Spill
	movzbl	dim(%rip), %eax
	xorl	%r11d, %r11d
	movsd	.LCPI27_2(%rip), %xmm15         # xmm15 = mem[0],zero
                                        # implicit-def: $xmm0
                                        # kill: killed $xmm0
	xorpd	%xmm10, %xmm10
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 384(%rsp)                # 16-byte Spill
                                        # implicit-def: $xmm0
                                        # kill: killed $xmm0
	movq	%rcx, 72(%rsp)                  # 8-byte Spill
	jmp	.LBB27_3
	.p2align	4, 0x90
.LBB27_42:                              # %for.inc
                                        #   in Loop: Header=BB27_3 Depth=1
	incq	%r11
	cmpq	%r11, 344(%rsp)                 # 8-byte Folded Reload
	je	.LBB27_43
.LBB27_3:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movapd	%xmm10, %xmm6
	movzbl	%al, %eax
	movl	%eax, %esi
	andl	$1, %esi
	addl	$3, %esi
	movq	352(%rsp), %rdx                 # 8-byte Reload
	movl	(%rdx,%r11,4), %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	imulq	$1431655766, %rdx, %rbx         # imm = 0x55555556
	movq	%rbx, %rdx
	shrq	$63, %rdx
	shrq	$32, %rbx
	addl	%edx, %ebx
	movq	360(%rsp), %rdx                 # 8-byte Reload
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
	movq	368(%rsp), %rdx                 # 8-byte Reload
	movl	(%rdx,%r11,4), %edx
	movl	%edx, %r12d
	negl	%r12d
	cmovsl	%edx, %r12d
	imull	%esi, %r12d
	imulq	%rdi, %r12
	shrq	$33, %r12
	movq	%r15, 328(%rsp)                 # 8-byte Spill
	movslq	%r15d, %rdx
	movslq	%ebx, %rsi
	movsd	16(%r8,%r14,8), %xmm0           # xmm0 = mem[0],zero
	movsd	16(%r8,%rdx,8), %xmm7           # xmm7 = mem[0],zero
	movsd	16(%r8,%rsi,8), %xmm1           # xmm1 = mem[0],zero
	unpcklpd	%xmm7, %xmm1                    # xmm1 = xmm1[0],xmm7[0]
	unpcklpd	%xmm0, %xmm7                    # xmm7 = xmm7[0],xmm0[0]
	subpd	%xmm1, %xmm7
	movupd	(%r8,%rdx,8), %xmm8
	movupd	(%r8,%rsi,8), %xmm1
	movupd	(%r8,%r14,8), %xmm2
	movupd	(%r8,%r12,8), %xmm10
	subpd	%xmm2, %xmm10
	movapd	%xmm2, %xmm9
	subpd	%xmm8, %xmm9
	subpd	%xmm1, %xmm8
	movsd	16(%r8,%r12,8), %xmm11          # xmm11 = mem[0],zero
	subsd	%xmm0, %xmm11
	testb	$1, %al
	je	.LBB27_5
# %bb.4:                                # %if.then
                                        #   in Loop: Header=BB27_3 Depth=1
	movsd	24(%r8,%r14,8), %xmm1           # xmm1 = mem[0],zero
	movsd	24(%r8,%r12,8), %xmm5           # xmm5 = mem[0],zero
	subsd	%xmm1, %xmm5
	movsd	24(%r8,%rdx,8), %xmm0           # xmm0 = mem[0],zero
	movsd	24(%r8,%rsi,8), %xmm2           # xmm2 = mem[0],zero
	unpcklpd	%xmm0, %xmm2                    # xmm2 = xmm2[0],xmm0[0]
	unpcklpd	%xmm1, %xmm0                    # xmm0 = xmm0[0],xmm1[0]
	subpd	%xmm2, %xmm0
	movapd	%xmm9, %xmm3
	unpckhpd	%xmm9, %xmm3                    # xmm3 = xmm3[1],xmm9[1]
	movapd	%xmm8, %xmm1
	unpckhpd	%xmm10, %xmm1                   # xmm1 = xmm1[1],xmm10[1]
	mulpd	%xmm1, %xmm3
	movapd	%xmm8, %xmm2
	unpcklpd	%xmm9, %xmm2                    # xmm2 = xmm2[0],xmm9[0]
	movapd	%xmm9, %xmm4
	unpcklpd	%xmm10, %xmm4                   # xmm4 = xmm4[0],xmm10[0]
	mulpd	%xmm2, %xmm4
	addpd	%xmm3, %xmm4
	movapd	%xmm7, %xmm3
	shufpd	$1, %xmm11, %xmm3               # xmm3 = xmm3[1],xmm11[0]
	mulpd	%xmm7, %xmm3
	addpd	%xmm4, %xmm3
	movapd	%xmm0, %xmm4
	shufpd	$1, %xmm5, %xmm4                # xmm4 = xmm4[1],xmm5[0]
	mulpd	%xmm0, %xmm4
	addpd	%xmm3, %xmm4
	movapd	%xmm8, %xmm3
	unpckhpd	%xmm9, %xmm3                    # xmm3 = xmm3[1],xmm9[1]
	mulpd	%xmm3, %xmm3
	mulpd	%xmm2, %xmm2
	addpd	%xmm3, %xmm2
	movapd	%xmm7, %xmm3
	mulpd	%xmm7, %xmm3
	addpd	%xmm2, %xmm3
	movapd	%xmm0, %xmm13
	mulpd	%xmm0, %xmm13
	addpd	%xmm3, %xmm13
	movapd	%xmm10, %xmm2
	unpckhpd	%xmm10, %xmm2                   # xmm2 = xmm2[1],xmm10[1]
	mulpd	%xmm1, %xmm2
	movapd	%xmm8, %xmm1
	unpcklpd	%xmm10, %xmm1                   # xmm1 = xmm1[0],xmm10[0]
	movapd	%xmm10, %xmm3
	unpcklpd	%xmm10, %xmm3                   # xmm3 = xmm3[0],xmm10[0]
	mulpd	%xmm1, %xmm3
	addpd	%xmm2, %xmm3
	movapd	%xmm7, %xmm1
	unpcklpd	%xmm11, %xmm1                   # xmm1 = xmm1[0],xmm11[0]
	movapd	%xmm11, %xmm2
	unpcklpd	%xmm11, %xmm2                   # xmm2 = xmm2[0],xmm11[0]
	mulpd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	unpcklpd	%xmm5, %xmm1                    # xmm1 = xmm1[0],xmm5[0]
	movapd	%xmm5, %xmm14
	unpcklpd	%xmm0, %xmm5                    # xmm5 = xmm5[0],xmm0[0]
	movapd	%xmm5, 512(%rsp)                # 16-byte Spill
	unpckhpd	%xmm0, %xmm0                    # xmm0 = xmm0[1,1]
	movapd	%xmm0, 496(%rsp)                # 16-byte Spill
	addpd	%xmm3, %xmm2
	unpcklpd	%xmm14, %xmm14                  # xmm14 = xmm14[0,0]
	mulpd	%xmm1, %xmm14
	jmp	.LBB27_6
	.p2align	4, 0x90
.LBB27_5:                               # %if.else
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm9, %xmm1
	unpckhpd	%xmm9, %xmm1                    # xmm1 = xmm1[1],xmm9[1]
	movapd	%xmm8, %xmm0
	unpckhpd	%xmm10, %xmm0                   # xmm0 = xmm0[1],xmm10[1]
	mulpd	%xmm0, %xmm1
	movapd	%xmm8, %xmm2
	unpcklpd	%xmm9, %xmm2                    # xmm2 = xmm2[0],xmm9[0]
	movapd	%xmm9, %xmm3
	unpcklpd	%xmm10, %xmm3                   # xmm3 = xmm3[0],xmm10[0]
	mulpd	%xmm2, %xmm3
	addpd	%xmm1, %xmm3
	movapd	%xmm7, %xmm4
	shufpd	$1, %xmm11, %xmm4               # xmm4 = xmm4[1],xmm11[0]
	mulpd	%xmm7, %xmm4
	addpd	%xmm3, %xmm4
	movapd	%xmm8, %xmm1
	unpckhpd	%xmm9, %xmm1                    # xmm1 = xmm1[1],xmm9[1]
	mulpd	%xmm1, %xmm1
	mulpd	%xmm2, %xmm2
	addpd	%xmm1, %xmm2
	movapd	%xmm7, %xmm13
	mulpd	%xmm7, %xmm13
	addpd	%xmm2, %xmm13
	movapd	%xmm10, %xmm1
	unpckhpd	%xmm10, %xmm1                   # xmm1 = xmm1[1],xmm10[1]
	mulpd	%xmm0, %xmm1
	movapd	%xmm8, %xmm0
	unpcklpd	%xmm10, %xmm0                   # xmm0 = xmm0[0],xmm10[0]
	movapd	%xmm10, %xmm2
	unpcklpd	%xmm10, %xmm2                   # xmm2 = xmm2[0],xmm10[0]
	mulpd	%xmm0, %xmm2
	addpd	%xmm1, %xmm2
	movapd	%xmm7, %xmm0
	unpcklpd	%xmm11, %xmm0                   # xmm0 = xmm0[0],xmm11[0]
	movapd	%xmm11, %xmm14
	unpcklpd	%xmm11, %xmm14                  # xmm14 = xmm14[0],xmm11[0]
	mulpd	%xmm0, %xmm14
.LBB27_6:                               # %if.end
                                        #   in Loop: Header=BB27_3 Depth=1
	addpd	%xmm2, %xmm14
	movq	376(%rsp), %rax                 # 8-byte Reload
	movslq	(%rax,%r11,4), %r15
	movapd	%xmm14, %xmm2
	mulsd	.LCPI27_1(%rip), %xmm2
	movapd	%xmm4, %xmm0
	mulpd	%xmm4, %xmm0
	movapd	%xmm13, %xmm1
	unpckhpd	%xmm14, %xmm1                   # xmm1 = xmm1[1],xmm14[1]
	mulpd	%xmm13, %xmm1
	subpd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm0                    # xmm0 = xmm0[1],xmm1[1]
	movapd	%xmm0, 176(%rsp)                # 16-byte Spill
	movapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	mulsd	%xmm1, %xmm0
	ucomisd	.LCPI27_29(%rip), %xmm0
	movq	%rdx, 16(%rsp)                  # 8-byte Spill
	movq	%rsi, 8(%rsp)                   # 8-byte Spill
	movsd	%xmm6, 24(%rsp)                 # 8-byte Spill
	movq	%rbx, 336(%rsp)                 # 8-byte Spill
	movapd	%xmm2, 160(%rsp)                # 16-byte Spill
	movapd	%xmm8, 480(%rsp)                # 16-byte Spill
	movapd	%xmm7, 304(%rsp)                # 16-byte Spill
	movapd	%xmm9, 464(%rsp)                # 16-byte Spill
	movapd	%xmm10, 448(%rsp)               # 16-byte Spill
	movapd	%xmm11, 416(%rsp)               # 16-byte Spill
	movapd	%xmm13, 144(%rsp)               # 16-byte Spill
	jb	.LBB27_8
# %bb.7:                                #   in Loop: Header=BB27_3 Depth=1
	sqrtsd	%xmm0, %xmm0
	movsd	%xmm0, 32(%rsp)                 # 8-byte Spill
	movapd	%xmm2, %xmm8
	jmp	.LBB27_9
	.p2align	4, 0x90
.LBB27_8:                               # %call.sqrt
                                        #   in Loop: Header=BB27_3 Depth=1
	movq	%r11, %rbx
	movapd	%xmm4, 272(%rsp)                # 16-byte Spill
	movapd	%xmm14, 48(%rsp)                # 16-byte Spill
	callq	sqrt@PLT
	movapd	48(%rsp), %xmm14                # 16-byte Reload
	movapd	272(%rsp), %xmm4                # 16-byte Reload
	movapd	144(%rsp), %xmm13               # 16-byte Reload
	movapd	416(%rsp), %xmm11               # 16-byte Reload
	movapd	304(%rsp), %xmm7                # 16-byte Reload
	movapd	160(%rsp), %xmm8                # 16-byte Reload
	movq	8(%rsp), %rsi                   # 8-byte Reload
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movsd	.LCPI27_2(%rip), %xmm15         # xmm15 = mem[0],zero
	movq	%rbx, %r11
	movq	632(%rsp), %r9
	movq	648(%rsp), %r8
	movq	72(%rsp), %rcx                  # 8-byte Reload
	movsd	%xmm0, 32(%rsp)                 # 8-byte Spill
.LBB27_9:                               # %if.end.split
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm4, %xmm0
	movapd	.LCPI27_0(%rip), %xmm5          # xmm5 = [-0.0E+0,-0.0E+0]
	xorpd	%xmm5, %xmm0
	movapd	%xmm13, %xmm6
	unpckhpd	%xmm13, %xmm6                   # xmm6 = xmm6[1],xmm13[1]
	movapd	%xmm6, %xmm3
	mulsd	%xmm14, %xmm3
	movapd	%xmm4, %xmm2
	unpckhpd	%xmm4, %xmm2                    # xmm2 = xmm2[1],xmm4[1]
	movapd	%xmm4, %xmm9
	mulsd	%xmm2, %xmm9
	subsd	%xmm3, %xmm9
	movapd	%xmm11, %xmm3
	mulsd	%xmm6, %xmm3
	movapd	%xmm7, %xmm12
	unpckhpd	%xmm7, %xmm12                   # xmm12 = xmm12[1],xmm7[1]
	movapd	%xmm0, 208(%rsp)                # 16-byte Spill
	pshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	movdqa	%xmm1, %xmm0
	mulsd	%xmm12, %xmm1
	addsd	%xmm3, %xmm1
	movapd	%xmm7, %xmm3
	mulsd	%xmm2, %xmm3
	movapd	%xmm4, %xmm10
	mulsd	%xmm11, %xmm4
	addsd	%xmm3, %xmm4
	movapd	%xmm8, %xmm3
	mulsd	%xmm12, %xmm3
	addsd	%xmm4, %xmm3
	movapd	%xmm3, 48(%rsp)                 # 16-byte Spill
	movapd	%xmm6, %xmm3
	xorpd	%xmm5, %xmm3
	movapd	%xmm3, 240(%rsp)                # 16-byte Spill
	movapd	%xmm7, %xmm3
	movapd	%xmm6, 112(%rsp)                # 16-byte Spill
	mulsd	%xmm6, %xmm3
	movapd	%xmm10, %xmm4
	mulsd	%xmm12, %xmm4
	subsd	%xmm3, %xmm4
	movapd	%xmm4, 272(%rsp)                # 16-byte Spill
	unpckhpd	%xmm14, %xmm14                  # xmm14 = xmm14[1,1]
	movapd	%xmm14, %xmm4
	xorpd	%xmm5, %xmm4
	movapd	%xmm11, %xmm8
	movapd	%xmm2, 80(%rsp)                 # 16-byte Spill
	mulsd	%xmm2, %xmm8
	movapd	%xmm12, 432(%rsp)               # 16-byte Spill
	mulsd	%xmm12, %xmm14
	subsd	%xmm14, %xmm8
	divsd	32(%rsp), %xmm15                # 8-byte Folded Reload
	mulsd	%xmm15, %xmm9
	movapd	%xmm9, 192(%rsp)                # 16-byte Spill
	mulsd	.LCPI27_3(%rip), %xmm9
	mulsd	%xmm15, %xmm9
	movapd	96(%rsp), %xmm6                 # 16-byte Reload
	mulpd	.LCPI27_4(%rip), %xmm6
	movapd	176(%rsp), %xmm2                # 16-byte Reload
	addsd	%xmm2, %xmm2
	movapd	%xmm2, 176(%rsp)                # 16-byte Spill
	movapd	%xmm10, %xmm2
	unpcklpd	%xmm10, %xmm2                   # xmm2 = xmm2[0],xmm10[0]
	movapd	%xmm2, 288(%rsp)                # 16-byte Spill
	movapd	%xmm9, %xmm2
	unpcklpd	%xmm9, %xmm2                    # xmm2 = xmm2[0],xmm9[0]
	movapd	%xmm2, 256(%rsp)                # 16-byte Spill
	movapd	%xmm15, 544(%rsp)               # 16-byte Spill
	unpcklpd	%xmm15, %xmm15                  # xmm15 = xmm15[0,0]
	movapd	%xmm15, 96(%rsp)                # 16-byte Spill
	cmpb	$1, dim(%rip)
	movapd	%xmm9, 32(%rsp)                 # 16-byte Spill
	jne	.LBB27_11
# %bb.10:                               # %if.then309
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	208(%rsp), %xmm2                # 16-byte Reload
	movapd	%xmm2, %xmm12
	shufpd	$1, %xmm2, %xmm12               # xmm12 = xmm12[1],xmm2[0]
	movapd	112(%rsp), %xmm9                # 16-byte Reload
	movapd	%xmm9, %xmm13
	movapd	512(%rsp), %xmm3                # 16-byte Reload
	mulsd	%xmm3, %xmm13
	movapd	496(%rsp), %xmm11               # 16-byte Reload
	mulsd	%xmm11, %xmm0
	addsd	%xmm13, %xmm0
	movapd	%xmm3, %xmm7
	unpckhpd	%xmm3, %xmm7                    # xmm7 = xmm7[1],xmm3[1]
	movapd	80(%rsp), %xmm5                 # 16-byte Reload
	movapd	%xmm5, %xmm13
	mulsd	%xmm7, %xmm13
	mulsd	%xmm3, %xmm10
	addsd	%xmm13, %xmm10
	movapd	240(%rsp), %xmm13               # 16-byte Reload
	mulsd	%xmm7, %xmm13
	unpcklpd	%xmm13, %xmm10                  # xmm10 = xmm10[0],xmm13[0]
	movapd	%xmm1, 128(%rsp)                # 16-byte Spill
	movapd	288(%rsp), %xmm14               # 16-byte Reload
	movlpd	160(%rsp), %xmm14               # 16-byte Folded Reload
                                        # xmm14 = mem[0],xmm14[1]
	movapd	%xmm11, %xmm13
	unpcklpd	%xmm11, %xmm13                  # xmm13 = xmm13[0],xmm11[0]
	mulpd	%xmm13, %xmm14
	addpd	%xmm10, %xmm14
	mulsd	%xmm3, %xmm5
	movapd	%xmm4, %xmm15
	mulsd	%xmm11, %xmm15
	addsd	%xmm5, %xmm15
	mulsd	%xmm6, %xmm15
	mulpd	%xmm12, %xmm13
	mulsd	%xmm2, %xmm7
	movapd	144(%rsp), %xmm5                # 16-byte Reload
	mulsd	%xmm11, %xmm5
	addsd	%xmm7, %xmm5
	mulsd	176(%rsp), %xmm5                # 16-byte Folded Reload
	movapd	%xmm14, %xmm12
	unpckhpd	%xmm14, %xmm12                  # xmm12 = xmm12[1],xmm14[1]
	movapd	%xmm14, %xmm11
	subsd	%xmm12, %xmm11
	movapd	%xmm9, %xmm12
	movapd	32(%rsp), %xmm9                 # 16-byte Reload
	mulpd	%xmm3, %xmm12
	addpd	%xmm13, %xmm12
	movapd	%xmm15, %xmm13
	movapd	.LCPI27_0(%rip), %xmm7          # xmm7 = [-0.0E+0,-0.0E+0]
	xorpd	%xmm7, %xmm13
	mulpd	%xmm6, %xmm12
	unpcklpd	%xmm15, %xmm13                  # xmm13 = xmm13[0],xmm15[0]
	subpd	%xmm12, %xmm13
	movapd	%xmm13, %xmm15
	addpd	%xmm5, %xmm15
	unpcklpd	%xmm5, %xmm5                    # xmm5 = xmm5[0,0]
	subpd	%xmm5, %xmm13
	unpckhpd	%xmm12, %xmm13                  # xmm13 = xmm13[1],xmm12[1]
	unpcklpd	%xmm15, %xmm12                  # xmm12 = xmm12[0],xmm15[0]
	movapd	%xmm0, %xmm3
	xorpd	%xmm7, %xmm3
	subsd	%xmm14, %xmm3
	shufpd	$1, %xmm11, %xmm14              # xmm14 = xmm14[1],xmm11[0]
	unpcklpd	%xmm0, %xmm3                    # xmm3 = xmm3[0],xmm0[0]
	movapd	256(%rsp), %xmm2                # 16-byte Reload
	mulpd	%xmm2, %xmm12
	subpd	%xmm12, %xmm14
	movapd	304(%rsp), %xmm7                # 16-byte Reload
	mulpd	%xmm2, %xmm13
	subpd	%xmm13, %xmm3
	movapd	144(%rsp), %xmm13               # 16-byte Reload
	movapd	96(%rsp), %xmm2                 # 16-byte Reload
	mulpd	%xmm2, %xmm3
	movapd	%xmm3, 384(%rsp)                # 16-byte Spill
	mulpd	%xmm2, %xmm14
	movapd	%xmm14, 400(%rsp)               # 16-byte Spill
	movapd	128(%rsp), %xmm1                # 16-byte Reload
.LBB27_11:                              # %if.end361
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	432(%rsp), %xmm0                # 16-byte Reload
	movapd	%xmm0, %xmm5
	movapd	208(%rsp), %xmm2                # 16-byte Reload
	mulsd	%xmm2, %xmm5
	movapd	112(%rsp), %xmm3                # 16-byte Reload
	movapd	%xmm3, %xmm11
	mulsd	%xmm7, %xmm11
	addsd	%xmm5, %xmm11
	movapd	%xmm7, %xmm5
	mulsd	%xmm2, %xmm5
	movapd	160(%rsp), %xmm12               # 16-byte Reload
	movapd	%xmm13, %xmm7
	mulsd	%xmm0, %xmm13
	addsd	%xmm5, %xmm13
	mulsd	%xmm6, %xmm8
	movapd	%xmm6, %xmm0
	unpckhpd	%xmm6, %xmm0                    # xmm0 = xmm0[1],xmm6[1]
	movapd	%xmm0, 528(%rsp)                # 16-byte Spill
	mulsd	%xmm0, %xmm11
	movapd	%xmm8, %xmm5
	subsd	%xmm11, %xmm5
	mulsd	%xmm9, %xmm11
	movapd	%xmm1, %xmm0
	subsd	%xmm11, %xmm0
	movapd	%xmm0, 224(%rsp)                # 16-byte Spill
	mulsd	176(%rsp), %xmm13               # 16-byte Folded Reload
	movapd	%xmm1, %xmm0
	movapd	%xmm1, %xmm11
	movapd	.LCPI27_0(%rip), %xmm14         # xmm14 = [-0.0E+0,-0.0E+0]
	xorpd	%xmm14, %xmm11
	movapd	48(%rsp), %xmm1                 # 16-byte Reload
	subsd	%xmm1, %xmm11
	subsd	%xmm13, %xmm5
	mulsd	%xmm9, %xmm5
	subsd	%xmm5, %xmm11
	mulsd	%xmm6, %xmm0
	movapd	%xmm0, 128(%rsp)                # 16-byte Spill
	xorpd	%xmm14, %xmm8
	subsd	%xmm0, %xmm8
	addsd	%xmm13, %xmm8
	movapd	272(%rsp), %xmm14               # 16-byte Reload
	subsd	%xmm14, %xmm1
	mulsd	%xmm9, %xmm8
	subsd	%xmm8, %xmm1
	movapd	%xmm1, 48(%rsp)                 # 16-byte Spill
	movapd	240(%rsp), %xmm0                # 16-byte Reload
	unpcklpd	%xmm0, %xmm0                    # xmm0 = xmm0[0,0]
	movapd	480(%rsp), %xmm10               # 16-byte Reload
	mulpd	%xmm10, %xmm0
	movapd	288(%rsp), %xmm9                # 16-byte Reload
	movapd	%xmm9, %xmm8
	movapd	464(%rsp), %xmm15               # 16-byte Reload
	mulpd	%xmm15, %xmm8
	addpd	%xmm0, %xmm8
	movapd	%xmm2, %xmm5
	unpckhpd	%xmm2, %xmm5                    # xmm5 = xmm5[1],xmm2[1]
	mulpd	%xmm15, %xmm5
	movapd	%xmm3, %xmm1
	movapd	448(%rsp), %xmm0                # 16-byte Reload
	mulpd	%xmm0, %xmm1
	addpd	%xmm5, %xmm1
	movapd	%xmm10, %xmm5
	movapd	80(%rsp), %xmm13                # 16-byte Reload
	mulpd	%xmm13, %xmm5
	mulpd	%xmm0, %xmm9
	addpd	%xmm5, %xmm9
	unpcklpd	%xmm12, %xmm12                  # xmm12 = xmm12[0,0]
	mulpd	%xmm15, %xmm12
	addpd	%xmm9, %xmm12
	unpcklpd	%xmm6, %xmm6                    # xmm6 = xmm6[0,0]
	mulpd	%xmm0, %xmm13
	unpcklpd	%xmm4, %xmm4                    # xmm4 = xmm4[0,0]
	mulpd	%xmm15, %xmm4
	addpd	%xmm13, %xmm4
	movapd	%xmm1, %xmm5
	mulpd	%xmm6, %xmm5
	mulpd	%xmm6, %xmm4
	unpcklpd	%xmm2, %xmm2                    # xmm2 = xmm2[0,0]
	movapd	%xmm10, %xmm6
	mulpd	%xmm2, %xmm6
	unpcklpd	%xmm7, %xmm7                    # xmm7 = xmm7[0,0]
	mulpd	%xmm15, %xmm7
	addpd	%xmm6, %xmm7
	movapd	176(%rsp), %xmm13               # 16-byte Reload
	unpcklpd	%xmm13, %xmm13                  # xmm13 = xmm13[0,0]
	mulpd	%xmm7, %xmm13
	movapd	%xmm12, %xmm7
	mulpd	%xmm15, %xmm2
	mulpd	%xmm10, %xmm3
	addpd	%xmm2, %xmm3
	mulpd	528(%rsp), %xmm3                # 16-byte Folded Reload
	movapd	%xmm8, %xmm9
	movapd	%xmm4, %xmm2
	subpd	%xmm3, %xmm2
	movapd	256(%rsp), %xmm12               # 16-byte Reload
	mulpd	%xmm12, %xmm3
	movapd	%xmm1, %xmm0
	subpd	%xmm3, %xmm0
	movapd	.LCPI27_0(%rip), %xmm3          # xmm3 = [-0.0E+0,-0.0E+0]
	xorpd	%xmm3, %xmm1
	subpd	%xmm7, %xmm1
	subpd	%xmm13, %xmm2
	mulpd	%xmm12, %xmm2
	subpd	%xmm2, %xmm1
	xorpd	%xmm3, %xmm4
	movapd	%xmm1, %xmm6
	subpd	%xmm5, %xmm4
	addpd	%xmm13, %xmm4
	subpd	%xmm8, %xmm7
	mulpd	%xmm12, %xmm4
	subpd	%xmm4, %xmm7
	movapd	%xmm0, %xmm4
	mulpd	%xmm12, %xmm5
	subpd	%xmm5, %xmm9
	movapd	96(%rsp), %xmm0                 # 16-byte Reload
	mulpd	%xmm0, %xmm4
	mulpd	%xmm0, %xmm6
	mulpd	%xmm0, %xmm7
	mulpd	%xmm0, %xmm9
	movapd	128(%rsp), %xmm0                # 16-byte Reload
	mulsd	32(%rsp), %xmm0                 # 16-byte Folded Reload
	movapd	48(%rsp), %xmm12                # 16-byte Reload
	subsd	%xmm0, %xmm14
	movapd	224(%rsp), %xmm13               # 16-byte Reload
	movapd	544(%rsp), %xmm0                # 16-byte Reload
	mulsd	%xmm0, %xmm13
	mulsd	%xmm0, %xmm11
	mulsd	%xmm0, %xmm12
	mulsd	%xmm0, %xmm14
	movapd	%xmm14, 272(%rsp)               # 16-byte Spill
	movq	%r15, %rax
	movq	%r15, 144(%rsp)                 # 8-byte Spill
	leal	-1(%r15), %edi
	leaq	2(%rdx), %rax
	movq	%rax, 176(%rsp)                 # 8-byte Spill
	leaq	2(%rsi), %rbx
	leaq	2(%r14), %r15
	leaq	2(%r12), %rbp
	movq	prm(%rip), %rax
	cmpl	$0, 128(%rax)
	je	.LBB27_12
# %bb.16:                               # %land.lhs.true
                                        #   in Loop: Header=BB27_3 Depth=1
	cmpl	$0, (%rcx,%r11,4)
	movsd	24(%rsp), %xmm10                # 8-byte Reload
                                        # xmm10 = mem[0],zero
	movapd	192(%rsp), %xmm5                # 16-byte Reload
	jns	.LBB27_13
# %bb.17:                               # %if.then365
                                        #   in Loop: Header=BB27_3 Depth=1
	movl	%edi, 80(%rsp)                  # 4-byte Spill
	movapd	%xmm4, 96(%rsp)                 # 16-byte Spill
	movapd	%xmm6, 112(%rsp)                # 16-byte Spill
	movapd	%xmm9, 32(%rsp)                 # 16-byte Spill
	movapd	%xmm13, 224(%rsp)               # 16-byte Spill
	movapd	%xmm12, 48(%rsp)                # 16-byte Spill
	movapd	%xmm11, 128(%rsp)               # 16-byte Spill
	movapd	%xmm7, 160(%rsp)                # 16-byte Spill
	movq	%r11, 208(%rsp)                 # 8-byte Spill
	movsd	.LCPI27_2(%rip), %xmm0          # xmm0 = mem[0],zero
	minsd	%xmm5, %xmm0
	movsd	.LCPI27_5(%rip), %xmm1          # xmm1 = mem[0],zero
	maxsd	%xmm0, %xmm1
	movapd	%xmm1, 192(%rsp)                # 16-byte Spill
	movapd	%xmm1, %xmm0
	callq	acos@PLT
	movapd	464(%rsp), %xmm9                # 16-byte Reload
	movapd	%xmm9, %xmm1
	unpckhpd	%xmm9, %xmm1                    # xmm1 = xmm1[1],xmm9[1]
	movapd	%xmm1, %xmm3
	movapd	304(%rsp), %xmm8                # 16-byte Reload
	mulsd	%xmm8, %xmm3
	movapd	480(%rsp), %xmm7                # 16-byte Reload
	movapd	%xmm7, %xmm2
	unpckhpd	%xmm7, %xmm2                    # xmm2 = xmm2[1],xmm7[1]
	movapd	%xmm9, %xmm4
	mulsd	%xmm2, %xmm4
	movapd	432(%rsp), %xmm11               # 16-byte Reload
	mulsd	%xmm11, %xmm2
	subsd	%xmm3, %xmm2
	movapd	%xmm11, %xmm3
	mulsd	%xmm7, %xmm3
	mulsd	%xmm9, %xmm8
	subsd	%xmm3, %xmm8
	mulsd	%xmm1, %xmm7
	subsd	%xmm4, %xmm7
	movapd	448(%rsp), %xmm6                # 16-byte Reload
	movapd	%xmm6, %xmm3
	unpckhpd	%xmm6, %xmm3                    # xmm3 = xmm3[1],xmm6[1]
	movapd	%xmm9, %xmm4
	mulsd	%xmm3, %xmm4
	mulsd	%xmm11, %xmm3
	movapd	%xmm1, %xmm5
	movapd	416(%rsp), %xmm10               # 16-byte Reload
	mulsd	%xmm10, %xmm5
	subsd	%xmm3, %xmm5
	mulsd	%xmm9, %xmm10
	movapd	%xmm11, %xmm12
	mulsd	%xmm6, %xmm12
	subsd	%xmm10, %xmm12
	mulsd	%xmm1, %xmm6
	subsd	%xmm6, %xmm4
	movapd	%xmm12, %xmm3
	mulsd	%xmm7, %xmm3
	movapd	%xmm8, %xmm6
	mulsd	%xmm4, %xmm6
	subsd	%xmm3, %xmm6
	mulsd	%xmm2, %xmm4
	mulsd	%xmm5, %xmm7
	subsd	%xmm4, %xmm7
	mulsd	%xmm8, %xmm5
	mulsd	%xmm2, %xmm12
	subsd	%xmm5, %xmm12
	mulsd	%xmm1, %xmm7
	mulsd	%xmm9, %xmm6
	addsd	%xmm7, %xmm6
	mulsd	%xmm11, %xmm12
	addsd	%xmm6, %xmm12
	movapd	%xmm0, %xmm1
	xorpd	.LCPI27_0(%rip), %xmm1
	cmpltsd	.LCPI27_29(%rip), %xmm12
	andpd	%xmm12, %xmm1
	andnpd	%xmm0, %xmm12
	orpd	%xmm1, %xmm12
	movapd	%xmm12, %xmm0
	movq	640(%rsp), %rax
	movq	144(%rsp), %rcx                 # 8-byte Reload
	subsd	-8(%rax,%rcx,8), %xmm0
	movsd	.LCPI27_6(%rip), %xmm1          # xmm1 = mem[0],zero
	minsd	%xmm0, %xmm1
	movsd	.LCPI27_7(%rip), %xmm0          # xmm0 = mem[0],zero
	maxsd	%xmm1, %xmm0
	movq	624(%rsp), %rax
	movsd	-8(%rax,%rcx,8), %xmm1          # xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm1
	movapd	%xmm0, 288(%rsp)                # 16-byte Spill
	movapd	%xmm1, 256(%rsp)                # 16-byte Spill
	mulsd	%xmm1, %xmm0
	movsd	24(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 24(%rsp)                 # 8-byte Spill
	movapd	%xmm12, 240(%rsp)               # 16-byte Spill
	movapd	%xmm12, %xmm0
	callq	sin@PLT
	movapd	%xmm0, %xmm1
	movapd	.LCPI27_8(%rip), %xmm2          # xmm2 = [NaN,NaN]
	andpd	%xmm2, %xmm1
	ucomisd	.LCPI27_9(%rip), %xmm1
	jbe	.LBB27_19
# %bb.18:                               # %if.then429
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	256(%rsp), %xmm3                # 16-byte Reload
	mulsd	.LCPI27_1(%rip), %xmm3
	divsd	%xmm0, %xmm3
	movq	72(%rsp), %rcx                  # 8-byte Reload
	movq	648(%rsp), %r8
	movq	632(%rsp), %r9
	movq	208(%rsp), %r11                 # 8-byte Reload
	movsd	.LCPI27_2(%rip), %xmm15         # xmm15 = mem[0],zero
	movsd	24(%rsp), %xmm10                # 8-byte Reload
                                        # xmm10 = mem[0],zero
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movq	8(%rsp), %rsi                   # 8-byte Reload
	movapd	160(%rsp), %xmm7                # 16-byte Reload
	movapd	192(%rsp), %xmm5                # 16-byte Reload
	movapd	128(%rsp), %xmm11               # 16-byte Reload
	movapd	48(%rsp), %xmm12                # 16-byte Reload
	movapd	224(%rsp), %xmm13               # 16-byte Reload
	movapd	32(%rsp), %xmm9                 # 16-byte Reload
	movapd	112(%rsp), %xmm6                # 16-byte Reload
	movapd	96(%rsp), %xmm4                 # 16-byte Reload
	movl	80(%rsp), %edi                  # 4-byte Reload
	jmp	.LBB27_31
	.p2align	4, 0x90
.LBB27_12:                              #   in Loop: Header=BB27_3 Depth=1
	movsd	24(%rsp), %xmm10                # 8-byte Reload
                                        # xmm10 = mem[0],zero
	movapd	192(%rsp), %xmm5                # 16-byte Reload
.LBB27_13:                              # %multi_term
                                        #   in Loop: Header=BB27_3 Depth=1
	movsd	.LCPI27_2(%rip), %xmm15         # xmm15 = mem[0],zero
	jmp	.LBB27_14
.LBB27_19:                              # %if.else432
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	256(%rsp), %xmm3                # 16-byte Reload
	movapd	288(%rsp), %xmm4                # 16-byte Reload
	movapd	%xmm4, %xmm0
	andpd	%xmm2, %xmm0
	movsd	.LCPI27_10(%rip), %xmm1         # xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	jbe	.LBB27_25
# %bb.20:                               # %if.then434
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm4, %xmm2
	movq	640(%rsp), %rax
	movq	144(%rsp), %rdi                 # 8-byte Reload
	movsd	-8(%rax,%rdi,8), %xmm0          # xmm0 = mem[0],zero
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	movq	72(%rsp), %rcx                  # 8-byte Reload
	movq	648(%rsp), %r8
	movq	632(%rsp), %r9
	movq	624(%rsp), %r10
	movq	208(%rsp), %r11                 # 8-byte Reload
	movsd	.LCPI27_2(%rip), %xmm15         # xmm15 = mem[0],zero
	movsd	24(%rsp), %xmm10                # 8-byte Reload
                                        # xmm10 = mem[0],zero
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movq	8(%rsp), %rsi                   # 8-byte Reload
	movapd	160(%rsp), %xmm7                # 16-byte Reload
	movapd	192(%rsp), %xmm5                # 16-byte Reload
	movapd	128(%rsp), %xmm11               # 16-byte Reload
	movapd	48(%rsp), %xmm12                # 16-byte Reload
	movapd	224(%rsp), %xmm13               # 16-byte Reload
	movapd	32(%rsp), %xmm9                 # 16-byte Reload
	movapd	112(%rsp), %xmm6                # 16-byte Reload
	movapd	96(%rsp), %xmm4                 # 16-byte Reload
	jne	.LBB27_22
	jp	.LBB27_22
# %bb.21:                               # %if.then438
                                        #   in Loop: Header=BB27_3 Depth=1
	movsd	-8(%r10,%rdi,8), %xmm0          # xmm0 = mem[0],zero
	mulsd	.LCPI27_1(%rip), %xmm0
	movapd	240(%rsp), %xmm3                # 16-byte Reload
	mulsd	%xmm3, %xmm3
	divsd	.LCPI27_15(%rip), %xmm3
	addsd	%xmm15, %xmm3
	mulsd	%xmm0, %xmm3
	movl	80(%rsp), %edi                  # 4-byte Reload
	jmp	.LBB27_31
.LBB27_25:                              # %if.else460
                                        #   in Loop: Header=BB27_3 Depth=1
	xorpd	%xmm0, %xmm0
	movapd	240(%rsp), %xmm1                # 16-byte Reload
	ucomisd	%xmm0, %xmm1
	movq	72(%rsp), %rcx                  # 8-byte Reload
	movq	648(%rsp), %r8
	movq	632(%rsp), %r9
	movq	208(%rsp), %r11                 # 8-byte Reload
	movsd	.LCPI27_2(%rip), %xmm15         # xmm15 = mem[0],zero
	movsd	24(%rsp), %xmm10                # 8-byte Reload
                                        # xmm10 = mem[0],zero
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movq	8(%rsp), %rsi                   # 8-byte Reload
	movapd	160(%rsp), %xmm7                # 16-byte Reload
	movapd	192(%rsp), %xmm5                # 16-byte Reload
	movapd	128(%rsp), %xmm11               # 16-byte Reload
	movapd	48(%rsp), %xmm12                # 16-byte Reload
	movapd	224(%rsp), %xmm13               # 16-byte Reload
	movapd	32(%rsp), %xmm9                 # 16-byte Reload
	movapd	112(%rsp), %xmm6                # 16-byte Reload
	movapd	96(%rsp), %xmm4                 # 16-byte Reload
	movl	80(%rsp), %edi                  # 4-byte Reload
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
	movq	144(%rsp), %rax                 # 8-byte Reload
	movq	624(%rsp), %rdi
	movsd	-8(%rdi,%rax,8), %xmm0          # xmm0 = mem[0],zero
	addsd	%xmm0, %xmm0
	mulsd	%xmm2, %xmm2
	divsd	.LCPI27_15(%rip), %xmm2
	addsd	%xmm15, %xmm2
	mulsd	%xmm0, %xmm2
	movapd	%xmm2, %xmm3
	movl	80(%rsp), %edi                  # 4-byte Reload
	jmp	.LBB27_31
.LBB27_30:                              # %if.else472
                                        #   in Loop: Header=BB27_3 Depth=1
	mulsd	.LCPI27_13(%rip), %xmm3
	jmp	.LBB27_31
.LBB27_23:                              #   in Loop: Header=BB27_3 Depth=1
	movl	80(%rsp), %edi                  # 4-byte Reload
	jmp	.LBB27_31
	.p2align	4, 0x90
.LBB27_14:                              # %multi_term
                                        #   in Loop: Header=BB27_3 Depth=1
	movl	%edi, %r10d
	movslq	%edi, %rax
	movq	640(%rsp), %rdx
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
# %bb.15:                               # %multi_term
                                        #   in Loop: Header=BB27_3 Depth=1
	movb	%sil, %dil
	movsd	.LCPI27_18(,%rdi,8), %xmm2      # xmm2 = mem[0],zero
	movq	624(%rsp), %rsi
	movsd	(%rsi,%rax,8), %xmm1            # xmm1 = mem[0],zero
	jmpq	*.LJTI27_0(,%rdx,8)
.LBB27_35:                              # %sw.bb
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm1, %xmm3
	mulsd	%xmm2, %xmm3
	mulsd	%xmm5, %xmm2
	addsd	%xmm15, %xmm2
	jmp	.LBB27_36
	.p2align	4, 0x90
.LBB27_37:                              # %sw.bb493
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm5, %xmm0
	addsd	%xmm5, %xmm0
	mulsd	%xmm5, %xmm0
	addsd	.LCPI27_5(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm15, %xmm0
	mulsd	%xmm1, %xmm2
	mulsd	.LCPI27_26(%rip), %xmm2
	mulsd	%xmm5, %xmm2
	movapd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	jmp	.LBB27_36
	.p2align	4, 0x90
.LBB27_38:                              # %sw.bb501
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm6, 112(%rsp)                # 16-byte Spill
	movapd	%xmm15, %xmm6
	movapd	%xmm5, %xmm15
	movapd	%xmm5, %xmm8
	mulsd	%xmm5, %xmm8
	movapd	%xmm5, %xmm0
	mulsd	%xmm2, %xmm0
	movapd	%xmm8, %xmm3
	mulsd	.LCPI27_26(%rip), %xmm3
	movapd	%xmm4, %xmm5
	movsd	.LCPI27_27(%rip), %xmm4         # xmm4 = mem[0],zero
	addsd	%xmm4, %xmm3
	mulsd	%xmm0, %xmm3
	addsd	%xmm6, %xmm3
	mulsd	%xmm1, %xmm2
	mulsd	.LCPI27_28(%rip), %xmm8
	addsd	%xmm4, %xmm8
	movapd	%xmm5, %xmm4
	mulsd	%xmm2, %xmm8
	movapd	%xmm3, %xmm2
	movapd	%xmm8, %xmm3
	movapd	%xmm15, %xmm5
	movapd	%xmm6, %xmm15
	movapd	112(%rsp), %xmm6                # 16-byte Reload
	jmp	.LBB27_36
	.p2align	4, 0x90
.LBB27_39:                              # %sw.bb510
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm5, %xmm8
	mulsd	%xmm5, %xmm8
	movapd	%xmm8, %xmm0
	mulsd	.LCPI27_24(%rip), %xmm0
	movapd	%xmm8, %xmm3
	addsd	.LCPI27_5(%rip), %xmm3
	mulsd	%xmm0, %xmm3
	addsd	%xmm15, %xmm3
	mulsd	%xmm2, %xmm3
	addsd	%xmm15, %xmm3
	mulsd	%xmm1, %xmm2
	mulsd	%xmm5, %xmm2
	mulsd	.LCPI27_19(%rip), %xmm8
	addsd	.LCPI27_25(%rip), %xmm8
	mulsd	%xmm2, %xmm8
	movapd	%xmm3, %xmm2
	movapd	%xmm8, %xmm3
	jmp	.LBB27_36
	.p2align	4, 0x90
.LBB27_40:                              # %sw.bb521
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	%xmm5, %xmm0
	mulsd	%xmm5, %xmm0
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
	addsd	%xmm15, %xmm3
	mulsd	%xmm1, %xmm2
	mulsd	%xmm5, %xmm2
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
	addsd	%xmm1, %xmm10
	movl	%r10d, %edi
.LBB27_31:                              # %if.end545
                                        #   in Loop: Header=BB27_3 Depth=1
	movupd	(%r13,%rsi,8), %xmm1
	movapd	%xmm3, %xmm0
	unpcklpd	%xmm3, %xmm0                    # xmm0 = xmm0[0],xmm3[0]
	movapd	%xmm0, %xmm2
	mulpd	%xmm4, %xmm2
	addpd	%xmm1, %xmm2
	movupd	%xmm2, (%r13,%rsi,8)
	movapd	%xmm3, %xmm1
	mulsd	%xmm13, %xmm1
	addsd	(%r13,%rbx,8), %xmm1
	movsd	%xmm1, (%r13,%rbx,8)
	movupd	(%r13,%rdx,8), %xmm1
	movapd	%xmm0, %xmm2
	mulpd	%xmm6, %xmm2
	addpd	%xmm1, %xmm2
	movupd	%xmm2, (%r13,%rdx,8)
	movapd	%xmm3, %xmm1
	mulsd	%xmm11, %xmm1
	movq	176(%rsp), %rax                 # 8-byte Reload
	addsd	(%r13,%rax,8), %xmm1
	movsd	%xmm1, (%r13,%rax,8)
	movupd	(%r13,%r14,8), %xmm1
	movapd	%xmm0, %xmm2
	mulpd	%xmm7, %xmm2
	addpd	%xmm1, %xmm2
	movupd	%xmm2, (%r13,%r14,8)
	movapd	%xmm3, %xmm1
	mulsd	%xmm12, %xmm1
	addsd	(%r13,%r15,8), %xmm1
	movsd	%xmm1, (%r13,%r15,8)
	movupd	(%r13,%r12,8), %xmm1
	mulpd	%xmm9, %xmm0
	addpd	%xmm1, %xmm0
	movupd	%xmm0, (%r13,%r12,8)
	movapd	%xmm3, %xmm0
	mulsd	272(%rsp), %xmm0                # 16-byte Folded Reload
	addsd	(%r13,%rbp,8), %xmm0
	movsd	%xmm0, (%r13,%rbp,8)
	movzbl	dim(%rip), %eax
	cmpb	$1, %al
	jne	.LBB27_33
# %bb.32:                               # %if.then608
                                        #   in Loop: Header=BB27_3 Depth=1
	movapd	384(%rsp), %xmm1                # 16-byte Reload
	movapd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm0                    # xmm0 = xmm0[1],xmm1[1]
	mulsd	%xmm3, %xmm0
	addsd	24(%r13,%rsi,8), %xmm0
	movsd	%xmm0, 24(%r13,%rsi,8)
	movapd	%xmm3, %xmm0
	mulsd	%xmm1, %xmm0
	addsd	24(%r13,%rdx,8), %xmm0
	movsd	%xmm0, 24(%r13,%rdx,8)
	movapd	400(%rsp), %xmm1                # 16-byte Reload
	movapd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm0                    # xmm0 = xmm0[1],xmm1[1]
	mulsd	%xmm3, %xmm0
	addsd	24(%r13,%r14,8), %xmm0
	movsd	%xmm0, 24(%r13,%r14,8)
	mulsd	%xmm1, %xmm3
	addsd	24(%r13,%r12,8), %xmm3
	movsd	%xmm3, 24(%r13,%r12,8)
.LBB27_33:                              # %if.end629
                                        #   in Loop: Header=BB27_3 Depth=1
	movslq	%edi, %rdx
	xorpd	%xmm0, %xmm0
	ucomisd	(%r9,%rdx,8), %xmm0
	jbe	.LBB27_42
# %bb.34:                               # %if.then634
                                        #   in Loop: Header=BB27_3 Depth=1
	incl	%edi
	jmp	.LBB27_14
.LBB27_1:
	xorpd	%xmm10, %xmm10
.LBB27_43:                              # %for.end
	movapd	%xmm10, %xmm0
	addq	$568, %rsp                      # imm = 0x238
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
	.cfi_def_cfa_offset 624
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movl	$.L.str.84, %esi
	movq	336(%rsp), %rdx                 # 8-byte Reload
                                        # kill: def $edx killed $edx killed $rdx
	movq	328(%rsp), %rcx                 # 8-byte Reload
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
	movsd	%xmm1, (%rsp)                   # 8-byte Spill
	movsd	%xmm0, 40(%rsp)                 # 8-byte Spill
	movq	%r9, %r14
	movq	%r8, 32(%rsp)                   # 8-byte Spill
	movl	%ecx, 12(%rsp)                  # 4-byte Spill
	movq	%rdx, 104(%rsp)                 # 8-byte Spill
	movq	%rsi, 152(%rsp)                 # 8-byte Spill
	movq	%rdi, 136(%rsp)                 # 8-byte Spill
	movq	prm(%rip), %rax
	movl	96(%rax), %esi
	movl	$-1, %edi
	callq	ivector@PLT
	movq	prm(%rip), %rcx
	movl	96(%rcx), %edx
	xorpd	%xmm7, %xmm7
	testl	%edx, %edx
	js	.LBB28_1
# %bb.14:                               # %for.body.preheader
	movsd	.LCPI28_0(%rip), %xmm0          # xmm0 = mem[0],zero
	movapd	%xmm0, %xmm1
	movsd	40(%rsp), %xmm6                 # 8-byte Reload
                                        # xmm6 = mem[0],zero
	divsd	%xmm6, %xmm1
	movapd	%xmm1, 208(%rsp)                # 16-byte Spill
	divsd	(%rsp), %xmm0                   # 8-byte Folded Reload
	movsd	%xmm0, 144(%rsp)                # 8-byte Spill
	movq	$-1, %rsi
	.p2align	4, 0x90
.LBB28_15:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	$-1, (%rax,%rsi,4)
	incq	%rsi
	movslq	96(%rcx), %rdx
	cmpq	%rdx, %rsi
	jl	.LBB28_15
# %bb.2:                                # %for.cond3.preheader
	xorpd	%xmm8, %xmm8
	cmpl	$2, %edx
	movq	32(%rsp), %r9                   # 8-byte Reload
	jl	.LBB28_40
# %bb.3:                                # %for.body6.lr.ph
	movapd	.LCPI28_1(%rip), %xmm1          # xmm1 = <6.0E+0,u>
	movapd	208(%rsp), %xmm0                # 16-byte Reload
	unpcklpd	%xmm0, %xmm1                    # xmm1 = xmm1[0],xmm0[0]
	movapd	%xmm1, 240(%rsp)                # 16-byte Spill
	movapd	.LCPI28_2(%rip), %xmm1          # xmm1 = <1.0E+1,u>
	unpcklpd	%xmm0, %xmm1                    # xmm1 = xmm1[0],xmm0[0]
	movapd	%xmm1, 224(%rsp)                # 16-byte Spill
	xorl	%r10d, %r10d
                                        # implicit-def: $xmm0
                                        # kill: killed $xmm0
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 16(%rsp)                 # 8-byte Spill
	movsd	%xmm0, 88(%rsp)                 # 8-byte Spill
	xorpd	%xmm7, %xmm7
	movq	%rax, 24(%rsp)                  # 8-byte Spill
	jmp	.LBB28_4
	.p2align	4, 0x90
.LBB28_38:                              # %for.inc451
                                        #   in Loop: Header=BB28_4 Depth=1
	movq	24(%rsp), %rax                  # 8-byte Reload
.LBB28_39:                              # %for.inc451
                                        #   in Loop: Header=BB28_4 Depth=1
	incq	%r10
	movq	prm(%rip), %rcx
	movslq	96(%rcx), %rdx
	leaq	-1(%rdx), %rsi
	cmpq	%rsi, %r10
	jge	.LBB28_40
.LBB28_4:                               # %for.body6
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB28_9 Depth 2
                                        #     Child Loop BB28_17 Depth 2
	movq	152(%rsp), %rdx                 # 8-byte Reload
	movl	(%rdx,%r10,4), %ebp
	testl	%ebp, %ebp
	jle	.LBB28_39
# %bb.5:                                # %if.end
                                        #   in Loop: Header=BB28_4 Depth=1
	movzbl	dim(%rip), %r8d
	leal	3(%r8), %r11d
	imull	%r10d, %r11d
	cmpl	$1, %r8d
	jne	.LBB28_7
# %bb.6:                                # %if.then26
                                        #   in Loop: Header=BB28_4 Depth=1
	movsd	24(%r9,%r11,8), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, 88(%rsp)                 # 8-byte Spill
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, 16(%rsp)                 # 8-byte Spill
.LBB28_7:                               # %if.end30
                                        #   in Loop: Header=BB28_4 Depth=1
	movq	440(%rcx), %rdx
	movl	(%rdx,%r10,4), %edx
	decl	%edx
	imull	100(%rcx), %edx
	movq	%rdx, 48(%rsp)                  # 8-byte Spill
	movq	248(%rcx), %rdx
	movsd	(%rdx,%r10,8), %xmm0            # xmm0 = mem[0],zero
	mulsd	144(%rsp), %xmm0                # 8-byte Folded Reload
	movsd	%xmm0, 200(%rsp)                # 8-byte Spill
	movups	(%r9,%r11,8), %xmm0
	movaps	%xmm0, 272(%rsp)                # 16-byte Spill
	movsd	16(%r9,%r11,8), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, 192(%rsp)                # 8-byte Spill
	movq	448(%rcx), %rcx
	cmpl	$0, (%rcx,%r10,4)
	jle	.LBB28_10
# %bb.8:                                # %for.body35.lr.ph
                                        #   in Loop: Header=BB28_4 Depth=1
	movq	IexclAt(%rip), %rdx
	movq	(%rdx,%r10,8), %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB28_9:                               # %for.body35
                                        #   Parent Loop BB28_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	(%rdx,%rsi,4), %rdi
	movl	%r10d, -4(%rax,%rdi,4)
	incq	%rsi
	movslq	(%rcx,%r10,4), %rdi
	cmpq	%rdi, %rsi
	jl	.LBB28_9
.LBB28_10:                              # %for.end45
                                        #   in Loop: Header=BB28_4 Depth=1
	xorl	%ecx, %ecx
	cmpl	$0, 12(%rsp)                    # 4-byte Folded Reload
	jne	.LBB28_12
# %bb.11:                               # %if.then47
                                        #   in Loop: Header=BB28_4 Depth=1
	movq	136(%rsp), %rax                 # 8-byte Reload
	movl	(%rax,%r10,4), %ecx
.LBB28_12:                              # %if.end50
                                        #   in Loop: Header=BB28_4 Depth=1
	testl	%ebp, %ebp
	movq	%r11, 160(%rsp)                 # 8-byte Spill
	jle	.LBB28_13
# %bb.16:                               # %for.body53.lr.ph
                                        #   in Loop: Header=BB28_4 Depth=1
	movq	48(%rsp), %rax                  # 8-byte Reload
	decl	%eax
	movq	%rax, 48(%rsp)                  # 8-byte Spill
	movslq	%ecx, %rbx
	xorpd	%xmm10, %xmm10
	xorpd	%xmm9, %xmm9
	movq	%r10, 96(%rsp)                  # 8-byte Spill
	jmp	.LBB28_17
	.p2align	4, 0x90
.LBB28_34:                              # %for.inc425.sink.split
                                        #   in Loop: Header=BB28_17 Depth=2
	mulsd	184(%rsp), %xmm2                # 8-byte Folded Reload
	movsd	16(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addsd	%xmm2, %xmm0
	movsd	%xmm0, 16(%rsp)                 # 8-byte Spill
	movsd	24(%r14,%r12,8), %xmm0          # xmm0 = mem[0],zero
	subsd	%xmm2, %xmm0
	movsd	%xmm0, 24(%r14,%r12,8)
	movb	$1, %r8b
.LBB28_35:                              # %for.inc425
                                        #   in Loop: Header=BB28_17 Depth=2
	incq	%rbx
	decq	%rbp
	je	.LBB28_36
.LBB28_17:                              # %for.body53
                                        #   Parent Loop BB28_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	104(%rsp), %rax                 # 8-byte Reload
	movq	(%rax,%r10,8), %rcx
	testq	%rcx, %rcx
	jne	.LBB28_19
# %bb.18:                               # %if.then57
                                        #   in Loop: Header=BB28_17 Depth=2
	movq	nabout@GOTPCREL(%rip), %r15
	movq	(%r15), %rdi
	movl	$.L.str.85, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	movsd	%xmm7, (%rsp)                   # 8-byte Spill
	movapd	%xmm8, 64(%rsp)                 # 16-byte Spill
	movsd	%xmm9, 56(%rsp)                 # 8-byte Spill
	movapd	%xmm10, 112(%rsp)               # 16-byte Spill
	callq	fprintf@PLT
	movq	(%r15), %rdi
	callq	fflush@PLT
	movapd	112(%rsp), %xmm10               # 16-byte Reload
	movsd	56(%rsp), %xmm9                 # 8-byte Reload
                                        # xmm9 = mem[0],zero
	movq	96(%rsp), %r10                  # 8-byte Reload
	movapd	64(%rsp), %xmm8                 # 16-byte Reload
	movsd	(%rsp), %xmm7                   # 8-byte Reload
                                        # xmm7 = mem[0],zero
	movq	32(%rsp), %r9                   # 8-byte Reload
	movsd	40(%rsp), %xmm6                 # 8-byte Reload
                                        # xmm6 = mem[0],zero
	movq	104(%rsp), %rax                 # 8-byte Reload
	movq	(%rax,%r10,8), %rcx
	movzbl	dim(%rip), %r8d
.LBB28_19:                              # %if.end60
                                        #   in Loop: Header=BB28_17 Depth=2
	movslq	(%rcx,%rbx,4), %r13
	cmpl	$0, 12(%rsp)                    # 4-byte Folded Reload
	jne	.LBB28_21
# %bb.20:                               # %lor.lhs.false
                                        #   in Loop: Header=BB28_17 Depth=2
	movq	24(%rsp), %rax                  # 8-byte Reload
	movl	(%rax,%r13,4), %ecx
	cmpq	%rcx, %r10
	je	.LBB28_35
.LBB28_21:                              # %if.then71
                                        #   in Loop: Header=BB28_17 Depth=2
	movzbl	%r8b, %eax
	movl	%eax, %r15d
	andl	$1, %r15d
	addl	$3, %r15d
	imulq	%r13, %r15
	movslq	%r15d, %r12
	movsd	(%r9,%r15,8), %xmm0             # xmm0 = mem[0],zero
	movhpd	8(%r9,%r12,8), %xmm0            # xmm0 = xmm0[0],mem[0]
	movapd	272(%rsp), %xmm12               # 16-byte Reload
	subpd	%xmm0, %xmm12
	movsd	192(%rsp), %xmm11               # 8-byte Reload
                                        # xmm11 = mem[0],zero
	subsd	16(%r9,%r12,8), %xmm11
	movapd	%xmm12, %xmm0
	mulpd	%xmm12, %xmm0
	unpckhpd	%xmm0, %xmm0                    # xmm0 = xmm0[1,1]
	movapd	%xmm12, %xmm1
	mulsd	%xmm12, %xmm1
	addsd	%xmm0, %xmm1
	movapd	%xmm11, %xmm3
	mulsd	%xmm11, %xmm3
	addsd	%xmm1, %xmm3
	testb	$1, %al
	je	.LBB28_23
# %bb.22:                               # %if.then88
                                        #   in Loop: Header=BB28_17 Depth=2
	movsd	88(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	subsd	24(%r9,%r12,8), %xmm0
	movsd	%xmm0, 184(%rsp)                # 8-byte Spill
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm3
.LBB28_23:                              # %if.end94
                                        #   in Loop: Header=BB28_17 Depth=2
	ucomisd	.LCPI28_5(%rip), %xmm3
	jb	.LBB28_25
# %bb.24:                               #   in Loop: Header=BB28_17 Depth=2
	xorps	%xmm0, %xmm0
	sqrtsd	%xmm3, %xmm0
	jmp	.LBB28_26
	.p2align	4, 0x90
.LBB28_25:                              # %call.sqrt
                                        #   in Loop: Header=BB28_17 Depth=2
	movapd	%xmm3, %xmm0
	movsd	%xmm7, (%rsp)                   # 8-byte Spill
	movapd	%xmm8, 64(%rsp)                 # 16-byte Spill
	movsd	%xmm9, 56(%rsp)                 # 8-byte Spill
	movapd	%xmm10, 112(%rsp)               # 16-byte Spill
	movsd	%xmm11, 176(%rsp)               # 8-byte Spill
	movapd	%xmm12, 256(%rsp)               # 16-byte Spill
	movsd	%xmm3, 168(%rsp)                # 8-byte Spill
	callq	sqrt@PLT
	movsd	168(%rsp), %xmm3                # 8-byte Reload
                                        # xmm3 = mem[0],zero
	movapd	256(%rsp), %xmm12               # 16-byte Reload
	movsd	176(%rsp), %xmm11               # 8-byte Reload
                                        # xmm11 = mem[0],zero
	movapd	112(%rsp), %xmm10               # 16-byte Reload
	movsd	56(%rsp), %xmm9                 # 8-byte Reload
                                        # xmm9 = mem[0],zero
	movq	96(%rsp), %r10                  # 8-byte Reload
	movapd	64(%rsp), %xmm8                 # 16-byte Reload
	movsd	(%rsp), %xmm7                   # 8-byte Reload
                                        # xmm7 = mem[0],zero
	movq	32(%rsp), %r9                   # 8-byte Reload
	movsd	40(%rsp), %xmm6                 # 8-byte Reload
                                        # xmm6 = mem[0],zero
.LBB28_26:                              # %if.end94.split
                                        #   in Loop: Header=BB28_17 Depth=2
	movsd	.LCPI28_0(%rip), %xmm1          # xmm1 = mem[0],zero
	movapd	%xmm1, %xmm2
	divsd	%xmm3, %xmm2
	movq	prm(%rip), %rax
	movq	248(%rax), %rcx
	movq	440(%rax), %rsi
	movl	(%rsi,%r13,4), %edx
	movq	48(%rsp), %rdi                  # 8-byte Reload
	addl	%edx, %edi
	ucomisd	%xmm1, %xmm6
	movsd	(%rcx,%r13,8), %xmm1            # xmm1 = mem[0],zero
	mulsd	200(%rsp), %xmm1                # 8-byte Folded Reload
	movq	456(%rax), %rcx
	movslq	%edi, %rdi
	movl	(%rcx,%rdi,4), %ecx
	jne	.LBB28_28
	jp	.LBB28_28
# %bb.27:                               # %if.end94.split
                                        #   in Loop: Header=BB28_17 Depth=2
	testl	%ecx, %ecx
	jg	.LBB28_28
# %bb.31:                               # %if.else339
                                        #   in Loop: Header=BB28_17 Depth=2
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
	mulpd	224(%rsp), %xmm3                # 16-byte Folded Reload
	jmp	.LBB28_32
	.p2align	4, 0x90
.LBB28_28:                              # %if.then281
                                        #   in Loop: Header=BB28_17 Depth=2
	testl	%ecx, %ecx
	jg	.LBB28_30
# %bb.29:                               # %if.else284
                                        #   in Loop: Header=BB28_17 Depth=2
	movl	(%rsi,%r10,4), %ecx
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
.LBB28_30:                              # %if.end320
                                        #   in Loop: Header=BB28_17 Depth=2
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
	mulpd	240(%rsp), %xmm3                # 16-byte Folded Reload
.LBB28_32:                              # %if.end363
                                        #   in Loop: Header=BB28_17 Depth=2
	unpcklpd	%xmm8, %xmm4                    # xmm4 = xmm4[0],xmm8[0]
	addpd	%xmm3, %xmm4
	movapd	%xmm4, %xmm8
	leaq	1(%r12), %rcx
	leaq	2(%r12), %rax
	mulsd	%xmm2, %xmm0
	mulsd	%xmm0, %xmm1
	addsd	%xmm1, %xmm7
	xorpd	.LCPI28_3(%rip), %xmm1
	movapd	%xmm4, %xmm2
	mulsd	208(%rsp), %xmm2                # 16-byte Folded Reload
	addsd	%xmm1, %xmm2
	mulsd	%xmm0, %xmm2
	mulsd	%xmm0, %xmm2
	movapd	%xmm2, %xmm0
	unpcklpd	%xmm2, %xmm0                    # xmm0 = xmm0[0],xmm2[0]
	mulpd	%xmm0, %xmm12
	mulsd	%xmm2, %xmm11
	addpd	%xmm12, %xmm10
	addsd	%xmm11, %xmm9
	movsd	(%r14,%r15,8), %xmm0            # xmm0 = mem[0],zero
	subsd	%xmm12, %xmm0
	movsd	%xmm0, (%r14,%r15,8)
	movsd	(%r14,%rcx,8), %xmm0            # xmm0 = mem[0],zero
	unpckhpd	%xmm12, %xmm12                  # xmm12 = xmm12[1,1]
	subsd	%xmm12, %xmm0
	movsd	%xmm0, (%r14,%rcx,8)
	movsd	(%r14,%rax,8), %xmm0            # xmm0 = mem[0],zero
	subsd	%xmm11, %xmm0
	movsd	%xmm0, (%r14,%rax,8)
	unpckhpd	%xmm4, %xmm8                    # xmm8 = xmm8[1],xmm4[1]
	cmpb	$1, dim(%rip)
	je	.LBB28_34
# %bb.33:                               #   in Loop: Header=BB28_17 Depth=2
	xorl	%r8d, %r8d
	jmp	.LBB28_35
	.p2align	4, 0x90
.LBB28_13:                              #   in Loop: Header=BB28_4 Depth=1
	xorpd	%xmm10, %xmm10
	xorpd	%xmm9, %xmm9
.LBB28_36:                              # %for.end427
                                        #   in Loop: Header=BB28_4 Depth=1
	movq	160(%rsp), %rax                 # 8-byte Reload
	leaq	2(%rax), %rcx
	movupd	(%r14,%rax,8), %xmm0
	addpd	%xmm10, %xmm0
	movupd	%xmm0, (%r14,%rax,8)
	addsd	(%r14,%rcx,8), %xmm9
	movsd	%xmm9, (%r14,%rcx,8)
	testb	$1, %r8b
	je	.LBB28_38
# %bb.37:                               # %if.then444
                                        #   in Loop: Header=BB28_4 Depth=1
	movsd	24(%r14,%rax,8), %xmm0          # xmm0 = mem[0],zero
	addsd	16(%rsp), %xmm0                 # 8-byte Folded Reload
	movsd	%xmm0, 24(%r14,%rax,8)
	jmp	.LBB28_38
.LBB28_1:
	xorpd	%xmm8, %xmm8
.LBB28_40:                              # %for.end453
	movapd	%xmm8, 64(%rsp)                 # 16-byte Spill
	movsd	%xmm7, (%rsp)                   # 8-byte Spill
	movq	%rax, %rdi
	movl	$-1, %esi
                                        # kill: def $edx killed $edx killed $rdx
	callq	free_ivector@PLT
	movq	352(%rsp), %rax
	movaps	64(%rsp), %xmm0                 # 16-byte Reload
	movsd	%xmm0, (%rax)
	movq	360(%rsp), %rax
	movsd	(%rsp), %xmm0                   # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movsd	%xmm0, (%rax)
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
