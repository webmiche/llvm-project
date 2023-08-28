	.text
	.file	"implicit.c"
	.file	0 "/home/michel/ETH/AST/specbuilder/src/605" "/home/michel/ETH/AST/specbuilder/src/605/implicit.c" md5 0x3902bd7f28dace49902caa7f240f02ea
	.file	1 "implicit.c" md5 0x3902bd7f28dace49902caa7f240f02ea
	.file	2 "defines.h" md5 0x05eeb7bba098b08025cbe048b289d372
	.file	3 "/usr/include/bits" "types.h" md5 0x4a64d909bcfa62a0a7682c3ac78c6965
	.file	4 "/usr/include/bits" "stdint-intn.h" md5 0x85f68316edee664d7bd685b977adf677
	.globl	refreshArcPointers              # -- Begin function refreshArcPointers
	.type	refreshArcPointers,@function
refreshArcPointers:                     # @refreshArcPointers
.Lfunc_begin0:
	.loc	1 55 0                          # implicit.c:55:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: refreshArcPointers:net <- $rdi
	#DEBUG_VALUE: refreshArcPointers:getPos <- $rsi
	#DEBUG_VALUE: refreshArcPointers:sorted_array <- $rdx
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
	movq	%rdx, %rbx
	movq	%rsi, %r14
	movq	%rdi, %r15
	pushq	$64
	.cfi_adjust_cfa_offset 8
	popq	%r12
	.cfi_adjust_cfa_offset -8
	xorl	%r13d, %r13d
.Ltmp0:
	#DEBUG_VALUE: refreshArcPointers:i <- 0
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: refreshArcPointers:net <- $r15
	#DEBUG_VALUE: refreshArcPointers:getPos <- $r14
	#DEBUG_VALUE: refreshArcPointers:sorted_array <- $rbx
	#DEBUG_VALUE: refreshArcPointers:i <- $r13
	.loc	1 62 19 prologue_end            # implicit.c:62:19
	cmpq	400(%r15), %r13
.Ltmp1:
	.loc	1 62 5 is_stmt 0                # implicit.c:62:5
	jg	.LBB0_12
.Ltmp2:
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: refreshArcPointers:net <- $r15
	#DEBUG_VALUE: refreshArcPointers:getPos <- $r14
	#DEBUG_VALUE: refreshArcPointers:sorted_array <- $rbx
	#DEBUG_VALUE: refreshArcPointers:i <- $r13
	.loc	1 63 19 is_stmt 1               # implicit.c:63:19
	movq	552(%r15), %rbp
.Ltmp3:
	#DEBUG_VALUE: refreshArcPointers:node <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 104, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $rbp, $r13
	.loc	1 64 17                         # implicit.c:64:17
	movq	-16(%rbp,%r12), %rax
	.loc	1 64 11 is_stmt 0               # implicit.c:64:11
	testq	%rax, %rax
	.loc	1 64 27                         # implicit.c:64:27
	je	.LBB0_5
.Ltmp4:
# %bb.3:                                # %land.lhs.true
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: refreshArcPointers:net <- $r15
	#DEBUG_VALUE: refreshArcPointers:getPos <- $r14
	#DEBUG_VALUE: refreshArcPointers:sorted_array <- $rbx
	#DEBUG_VALUE: refreshArcPointers:i <- $r13
	#DEBUG_VALUE: refreshArcPointers:node <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 104, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $rbp, $r13
	.loc	1 64 47                         # implicit.c:64:47
	movl	(%rax), %esi
	.loc	1 64 50                         # implicit.c:64:50
	testl	%esi, %esi
.Ltmp5:
	.loc	1 64 11                         # implicit.c:64:11
	js	.LBB0_5
.Ltmp6:
# %bb.4:                                # %if.then
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: refreshArcPointers:net <- $r15
	#DEBUG_VALUE: refreshArcPointers:getPos <- $r14
	#DEBUG_VALUE: refreshArcPointers:sorted_array <- $rbx
	#DEBUG_VALUE: refreshArcPointers:i <- $r13
	#DEBUG_VALUE: refreshArcPointers:node <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 104, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $rbp, $r13
	.loc	1 65 43 is_stmt 1               # implicit.c:65:43
	movq	%r15, %rdi
	callq	*%r14
.Ltmp7:
	.loc	1 65 30 is_stmt 0               # implicit.c:65:30
	imulq	$72, %rax, %rax
	addq	%rbx, %rax
	.loc	1 65 27                         # implicit.c:65:27
	movq	%rax, -16(%rbp,%r12)
.Ltmp8:
.LBB0_5:                                # %if.end
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: refreshArcPointers:net <- $r15
	#DEBUG_VALUE: refreshArcPointers:getPos <- $r14
	#DEBUG_VALUE: refreshArcPointers:sorted_array <- $rbx
	#DEBUG_VALUE: refreshArcPointers:i <- $r13
	#DEBUG_VALUE: refreshArcPointers:node <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 104, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $rbp, $r13
	.loc	1 66 17 is_stmt 1               # implicit.c:66:17
	movq	(%rbp,%r12), %rax
	.loc	1 66 11 is_stmt 0               # implicit.c:66:11
	testq	%rax, %rax
	.loc	1 66 25                         # implicit.c:66:25
	je	.LBB0_8
.Ltmp9:
# %bb.6:                                # %land.lhs.true7
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: refreshArcPointers:net <- $r15
	#DEBUG_VALUE: refreshArcPointers:getPos <- $r14
	#DEBUG_VALUE: refreshArcPointers:sorted_array <- $rbx
	#DEBUG_VALUE: refreshArcPointers:i <- $r13
	#DEBUG_VALUE: refreshArcPointers:node <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 104, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $rbp, $r13
	.loc	1 66 43                         # implicit.c:66:43
	movl	(%rax), %esi
	.loc	1 66 46                         # implicit.c:66:46
	testl	%esi, %esi
.Ltmp10:
	.loc	1 66 11                         # implicit.c:66:11
	js	.LBB0_8
.Ltmp11:
# %bb.7:                                # %if.then12
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: refreshArcPointers:net <- $r15
	#DEBUG_VALUE: refreshArcPointers:getPos <- $r14
	#DEBUG_VALUE: refreshArcPointers:sorted_array <- $rbx
	#DEBUG_VALUE: refreshArcPointers:i <- $r13
	#DEBUG_VALUE: refreshArcPointers:node <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 104, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $rbp, $r13
	.loc	1 67 41 is_stmt 1               # implicit.c:67:41
	movq	%r15, %rdi
	callq	*%r14
.Ltmp12:
	.loc	1 67 28 is_stmt 0               # implicit.c:67:28
	imulq	$72, %rax, %rax
	addq	%rbx, %rax
	.loc	1 67 25                         # implicit.c:67:25
	movq	%rax, (%rbp,%r12)
.Ltmp13:
.LBB0_8:                                # %if.end19
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: refreshArcPointers:net <- $r15
	#DEBUG_VALUE: refreshArcPointers:getPos <- $r14
	#DEBUG_VALUE: refreshArcPointers:sorted_array <- $rbx
	#DEBUG_VALUE: refreshArcPointers:i <- $r13
	#DEBUG_VALUE: refreshArcPointers:node <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 104, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $rbp, $r13
	.loc	1 68 17 is_stmt 1               # implicit.c:68:17
	movq	-8(%rbp,%r12), %rax
	.loc	1 68 11 is_stmt 0               # implicit.c:68:11
	testq	%rax, %rax
	.loc	1 68 26                         # implicit.c:68:26
	je	.LBB0_11
.Ltmp14:
# %bb.9:                                # %land.lhs.true21
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: refreshArcPointers:net <- $r15
	#DEBUG_VALUE: refreshArcPointers:getPos <- $r14
	#DEBUG_VALUE: refreshArcPointers:sorted_array <- $rbx
	#DEBUG_VALUE: refreshArcPointers:i <- $r13
	#DEBUG_VALUE: refreshArcPointers:node <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 104, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $rbp, $r13
	.loc	1 68 45                         # implicit.c:68:45
	movl	(%rax), %esi
	.loc	1 68 48                         # implicit.c:68:48
	testl	%esi, %esi
.Ltmp15:
	.loc	1 68 11                         # implicit.c:68:11
	js	.LBB0_11
.Ltmp16:
# %bb.10:                               # %if.then26
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: refreshArcPointers:net <- $r15
	#DEBUG_VALUE: refreshArcPointers:getPos <- $r14
	#DEBUG_VALUE: refreshArcPointers:sorted_array <- $rbx
	#DEBUG_VALUE: refreshArcPointers:i <- $r13
	#DEBUG_VALUE: refreshArcPointers:node <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 104, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $rbp, $r13
	.loc	1 69 42 is_stmt 1               # implicit.c:69:42
	movq	%r15, %rdi
	callq	*%r14
.Ltmp17:
	.loc	1 69 29 is_stmt 0               # implicit.c:69:29
	imulq	$72, %rax, %rax
	addq	%rbx, %rax
	.loc	1 69 26                         # implicit.c:69:26
	movq	%rax, -8(%rbp,%r12)
.Ltmp18:
.LBB0_11:                               # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: refreshArcPointers:net <- $r15
	#DEBUG_VALUE: refreshArcPointers:getPos <- $r14
	#DEBUG_VALUE: refreshArcPointers:sorted_array <- $rbx
	#DEBUG_VALUE: refreshArcPointers:i <- $r13
	#DEBUG_VALUE: refreshArcPointers:node <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 104, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $rbp, $r13
	.loc	1 62 31 is_stmt 1               # implicit.c:62:31
	incq	%r13
.Ltmp19:
	#DEBUG_VALUE: refreshArcPointers:i <- $r13
	.loc	1 62 5 is_stmt 0                # implicit.c:62:5
	addq	$104, %r12
	jmp	.LBB0_1
.Ltmp20:
.LBB0_12:                               # %for.end
	#DEBUG_VALUE: refreshArcPointers:net <- $r15
	#DEBUG_VALUE: refreshArcPointers:getPos <- $r14
	#DEBUG_VALUE: refreshArcPointers:sorted_array <- $rbx
	#DEBUG_VALUE: refreshArcPointers:i <- $r13
	.loc	1 72 5 is_stmt 1                # implicit.c:72:5
	xorl	%eax, %eax
	.loc	1 72 5 epilogue_begin is_stmt 0 # implicit.c:72:5
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
.Ltmp21:
	#DEBUG_VALUE: refreshArcPointers:sorted_array <- [DW_OP_LLVM_entry_value 1] $rdx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
.Ltmp22:
	.cfi_def_cfa_offset 32
	popq	%r14
.Ltmp23:
	#DEBUG_VALUE: refreshArcPointers:getPos <- [DW_OP_LLVM_entry_value 1] $rsi
	.cfi_def_cfa_offset 24
	popq	%r15
.Ltmp24:
	#DEBUG_VALUE: refreshArcPointers:net <- [DW_OP_LLVM_entry_value 1] $rdi
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Ltmp25:
.Lfunc_end0:
	.size	refreshArcPointers, .Lfunc_end0-refreshArcPointers
	.cfi_endproc
                                        # -- End function
	.globl	refreshPositions                # -- Begin function refreshPositions
	.type	refreshPositions,@function
refreshPositions:                       # @refreshPositions
.Lfunc_begin1:
	.loc	1 84 0 is_stmt 1                # implicit.c:84:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: refreshPositions:net <- $rdi
	#DEBUG_VALUE: refreshPositions:getPos <- $rsi
	#DEBUG_VALUE: refreshPositions:new_m <- $rdx
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
	movq	%rdx, %rbp
	movq	%rsi, %r12
	movq	%rdi, %rbx
.Ltmp26:
	.loc	1 88 25 prologue_end            # implicit.c:88:25
	movq	584(%rdi), %r15
.Ltmp27:
	#DEBUG_VALUE: refreshPositions:sorted_array <- $r15
	.loc	1 89 5                          # implicit.c:89:5
	movq	%r15, %rdx
.Ltmp28:
	#DEBUG_VALUE: refreshPositions:new_m <- $rbp
	callq	refreshArcPointers
.Ltmp29:
	#DEBUG_VALUE: refreshPositions:getPos <- $r12
	#DEBUG_VALUE: refreshPositions:net <- $rbx
	.loc	1 0 5 is_stmt 0                 # implicit.c:0:5
	xorl	%r14d, %r14d
.Ltmp30:
	#DEBUG_VALUE: refreshPositions:position <- 0
	.loc	1 94 8 is_stmt 1                # implicit.c:94:8
	testq	%rbp, %rbp
	movl	$0, %r13d
	movq	%rbp, (%rsp)                    # 8-byte Spill
.Ltmp31:
	#DEBUG_VALUE: refreshPositions:new_m <- [$rsp+0]
	cmovgq	%rbp, %r13
.Ltmp32:
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: refreshPositions:net <- $rbx
	#DEBUG_VALUE: refreshPositions:getPos <- $r12
	#DEBUG_VALUE: refreshPositions:new_m <- [$rsp+0]
	#DEBUG_VALUE: refreshPositions:sorted_array <- $r15
	#DEBUG_VALUE: refreshPositions:position <- undef
	.loc	1 0 0 is_stmt 0                 # implicit.c:0:0
	movq	568(%rbx), %rbp
.Ltmp33:
	.loc	1 94 31                         # implicit.c:94:31
	subq	$1, %r13
.Ltmp34:
	.loc	1 94 3                          # implicit.c:94:3
	jb	.LBB1_5
.Ltmp35:
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	#DEBUG_VALUE: refreshPositions:net <- $rbx
	#DEBUG_VALUE: refreshPositions:getPos <- $r12
	#DEBUG_VALUE: refreshPositions:new_m <- [$rsp+0]
	#DEBUG_VALUE: refreshPositions:sorted_array <- $r15
	#DEBUG_VALUE: refreshPositions:arc <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 72, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] undef, undef
	.loc	1 96 13 is_stmt 1               # implicit.c:96:13
	movl	(%rbp,%r14), %esi
	.loc	1 96 16 is_stmt 0               # implicit.c:96:16
	testl	%esi, %esi
.Ltmp36:
	.loc	1 96 8                          # implicit.c:96:8
	js	.LBB1_4
.Ltmp37:
# %bb.3:                                # %if.end
                                        #   in Loop: Header=BB1_1 Depth=1
	#DEBUG_VALUE: refreshPositions:net <- $rbx
	#DEBUG_VALUE: refreshPositions:getPos <- $r12
	#DEBUG_VALUE: refreshPositions:new_m <- [$rsp+0]
	#DEBUG_VALUE: refreshPositions:sorted_array <- $r15
	.loc	1 0 0                           # implicit.c:0:0
	addq	%r14, %rbp
	.loc	1 98 20 is_stmt 1               # implicit.c:98:20
	movq	%rbx, %rdi
	callq	*%r12
.Ltmp38:
	#DEBUG_VALUE: refreshPositions:new_position <- $rax
	.loc	1 99 5                          # implicit.c:99:5
	imulq	$72, %rax, %rdi
	addq	%r15, %rdi
	.loc	1 99 34 is_stmt 0               # implicit.c:99:34
	pushq	$9
.Ltmp39:
	.cfi_adjust_cfa_offset 8
	popq	%rcx
	.cfi_adjust_cfa_offset -8
	movq	%rbp, %rsi
	rep;movsq (%rsi), %es:(%rdi)
.Ltmp40:
.LBB1_4:                                # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	#DEBUG_VALUE: refreshPositions:net <- $rbx
	#DEBUG_VALUE: refreshPositions:getPos <- $r12
	#DEBUG_VALUE: refreshPositions:new_m <- [$rsp+0]
	#DEBUG_VALUE: refreshPositions:sorted_array <- $r15
	#DEBUG_VALUE: refreshPositions:position <- [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	.loc	1 94 3 is_stmt 1                # implicit.c:94:3
	addq	$72, %r14
	jmp	.LBB1_1
.Ltmp41:
.LBB1_5:                                # %for.end
	#DEBUG_VALUE: refreshPositions:net <- $rbx
	#DEBUG_VALUE: refreshPositions:getPos <- $r12
	#DEBUG_VALUE: refreshPositions:new_m <- [$rsp+0]
	#DEBUG_VALUE: refreshPositions:sorted_array <- $r15
	#DEBUG_VALUE: refreshPositions:arc <- $rbp
	.loc	1 103 13                        # implicit.c:103:13
	movq	%r15, 568(%rbx)
	.loc	1 104 20                        # implicit.c:104:20
	movq	%rbp, 584(%rbx)
	.loc	1 105 33                        # implicit.c:105:33
	imulq	$72, (%rsp), %rax               # 8-byte Folded Reload
	addq	%r15, %rax
	.loc	1 105 18 is_stmt 0              # implicit.c:105:18
	movq	%rax, 576(%rbx)
	.loc	1 107 3 is_stmt 1               # implicit.c:107:3
	xorl	%eax, %eax
	.loc	1 107 3 epilogue_begin is_stmt 0 # implicit.c:107:3
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
.Ltmp42:
	#DEBUG_VALUE: refreshPositions:net <- [DW_OP_LLVM_entry_value 1] $rdi
	.cfi_def_cfa_offset 48
	popq	%r12
.Ltmp43:
	#DEBUG_VALUE: refreshPositions:getPos <- [DW_OP_LLVM_entry_value 1] $rsi
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
.Ltmp44:
	.cfi_def_cfa_offset 16
	popq	%rbp
.Ltmp45:
	.cfi_def_cfa_offset 8
	retq
.Ltmp46:
.Lfunc_end1:
	.size	refreshPositions, .Lfunc_end1-refreshPositions
	.cfi_endproc
                                        # -- End function
	.globl	marc_arcs                       # -- Begin function marc_arcs
	.type	marc_arcs,@function
marc_arcs:                              # @marc_arcs
.Lfunc_begin2:
	.loc	1 119 0 is_stmt 1               # implicit.c:119:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: marc_arcs:net <- $rdi
	#DEBUG_VALUE: marc_arcs:new_arcs <- $rsi
	#DEBUG_VALUE: marc_arcs:new_arcs_array <- $rdx
	#DEBUG_VALUE: marc_arcs:arcs_pointer_sorted <- $rcx
	#DEBUG_VALUE: marc_arcs:global_new <- 0
	#DEBUG_VALUE: marc_arcs:best_pos <- 0
	#DEBUG_VALUE: marc_arcs:num_threads <- 1
	#DEBUG_VALUE: marc_arcs:positions <- undef
	#DEBUG_VALUE: marc_arcs:values <- undef
	.loc	1 138 20 prologue_end           # implicit.c:138:20
	cmpq	$15001, 408(%rdi)               # imm = 0x3A99
	movq	$-1000000, %r8                  # imm = 0xFFF0BDC0
	movq	$-4000000, %rax                 # imm = 0xFFC2F700
	cmovlq	%r8, %rax
	.loc	1 0 0 is_stmt 0                 # implicit.c:0:0
	addq	448(%rdi), %rax
.Ltmp47:
	#DEBUG_VALUE: marc_arcs:max_new_arcs <- $rax
	#DEBUG_VALUE: marc_arcs:max_new_arcs <- $rax
	#DEBUG_VALUE: marc_arcs:max_new_arcs <- $rax
	.loc	1 143 13 is_stmt 1              # implicit.c:143:13
	andq	$0, (%rsi)
.Ltmp48:
	#DEBUG_VALUE: marc_arcs:i <- 0
	#DEBUG_VALUE: marc_arcs:i <- undef
	.loc	1 147 18                        # implicit.c:147:18
	movq	(%rdx), %r9
	.loc	1 147 15 is_stmt 0              # implicit.c:147:15
	movq	%r9, (%rsi)
	.loc	1 148 20 is_stmt 1              # implicit.c:148:20
	movq	(%rcx), %rcx
.Ltmp49:
	#DEBUG_VALUE: marc_arcs:arcs_pointer_sorted <- [DW_OP_LLVM_entry_value 1] $rcx
	#DEBUG_VALUE: marc_arcs:i <- 1
	#DEBUG_VALUE: marc_arcs:i <- undef
	.loc	1 153 19                        # implicit.c:153:19
	movq	424(%rdi), %r8
.Ltmp50:
	#DEBUG_VALUE: marc_arcs:start_id <- $r8
	.loc	1 0 19 is_stmt 0                # implicit.c:0:19
	xorl	%edx, %edx
.Ltmp51:
	#DEBUG_VALUE: marc_arcs:new_arcs_array <- [DW_OP_LLVM_entry_value 1] $rdx
.LBB2_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: marc_arcs:net <- $rdi
	#DEBUG_VALUE: marc_arcs:new_arcs <- $rsi
	#DEBUG_VALUE: marc_arcs:new_arcs_array <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: marc_arcs:arcs_pointer_sorted <- [DW_OP_LLVM_entry_value 1] $rcx
	#DEBUG_VALUE: marc_arcs:global_new <- 0
	#DEBUG_VALUE: marc_arcs:best_pos <- 0
	#DEBUG_VALUE: marc_arcs:num_threads <- 1
	#DEBUG_VALUE: marc_arcs:max_new_arcs <- $rax
	#DEBUG_VALUE: marc_arcs:start_id <- [DW_OP_LLVM_arg 0, DW_OP_consts 3999, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	#DEBUG_VALUE: marc_arcs:best_pos <- 0
	.loc	1 154 20 is_stmt 1              # implicit.c:154:20
	cmpq	%r9, %rdx
	.loc	1 154 3 is_stmt 0               # implicit.c:154:3
	jge	.LBB2_4
.Ltmp52:
# %bb.2:                                # %while.cond
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: marc_arcs:net <- $rdi
	#DEBUG_VALUE: marc_arcs:new_arcs <- $rsi
	#DEBUG_VALUE: marc_arcs:new_arcs_array <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: marc_arcs:arcs_pointer_sorted <- [DW_OP_LLVM_entry_value 1] $rcx
	#DEBUG_VALUE: marc_arcs:global_new <- 0
	#DEBUG_VALUE: marc_arcs:best_pos <- 0
	#DEBUG_VALUE: marc_arcs:num_threads <- 1
	#DEBUG_VALUE: marc_arcs:max_new_arcs <- $rax
	cmpq	%rax, %rdx
	jge	.LBB2_4
.Ltmp53:
# %bb.3:                                # %while.body
                                        #   in Loop: Header=BB2_1 Depth=1
	#DEBUG_VALUE: marc_arcs:net <- $rdi
	#DEBUG_VALUE: marc_arcs:new_arcs <- $rsi
	#DEBUG_VALUE: marc_arcs:new_arcs_array <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: marc_arcs:arcs_pointer_sorted <- [DW_OP_LLVM_entry_value 1] $rcx
	#DEBUG_VALUE: marc_arcs:global_new <- 0
	#DEBUG_VALUE: marc_arcs:best_pos <- 0
	#DEBUG_VALUE: marc_arcs:num_threads <- 1
	#DEBUG_VALUE: marc_arcs:max_new_arcs <- $rax
	.loc	1 156 19 is_stmt 1              # implicit.c:156:19
	movq	(%rcx,%rdx,8), %r9
.Ltmp54:
	#DEBUG_VALUE: marc_arcs:start_id <- [DW_OP_LLVM_arg 0, DW_OP_consts 3999, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	#DEBUG_VALUE: marc_arcs:arc <- $r9
	#DEBUG_VALUE: marc_arcs:arc <- $r9
	#DEBUG_VALUE: marc_arcs:best_pos <- 0
	#DEBUG_VALUE: marc_arcs:best_pos <- 0
	#DEBUG_VALUE: marc_arcs:i <- 1
	#DEBUG_VALUE: marc_arcs:i <- 1
	#DEBUG_VALUE: marc_arcs:best_pos <- 0
	.loc	1 170 17                        # implicit.c:170:17
	leal	(%r8,%rdx), %r10d
	movl	%r10d, (%r9)
	.loc	1 171 19                        # implicit.c:171:19
	movq	$1, 56(%r9)
	.loc	1 174 25                        # implicit.c:174:25
	incq	%rdx
.Ltmp55:
	.loc	1 154 22                        # implicit.c:154:22
	movq	(%rsi), %r9
.Ltmp56:
	.loc	1 0 22 is_stmt 0                # implicit.c:0:22
	jmp	.LBB2_1
.Ltmp57:
.LBB2_4:                                # %for.cond38
	#DEBUG_VALUE: marc_arcs:net <- $rdi
	#DEBUG_VALUE: marc_arcs:new_arcs <- $rsi
	#DEBUG_VALUE: marc_arcs:new_arcs_array <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: marc_arcs:arcs_pointer_sorted <- [DW_OP_LLVM_entry_value 1] $rcx
	#DEBUG_VALUE: marc_arcs:global_new <- 0
	#DEBUG_VALUE: marc_arcs:best_pos <- 0
	#DEBUG_VALUE: marc_arcs:num_threads <- 1
	#DEBUG_VALUE: marc_arcs:max_new_arcs <- $rax
	#DEBUG_VALUE: marc_arcs:i <- 1
	movq	%rdx, (%rsi)
	movl	$4000, %r10d                    # imm = 0xFA0
.Ltmp58:
	#DEBUG_VALUE: marc_arcs:i <- undef
	.loc	1 187 18 is_stmt 1              # implicit.c:187:18
	movq	%r10, 640(%rdi)
	.loc	1 188 22                        # implicit.c:188:22
	movq	(%rsi), %rax
.Ltmp59:
	.loc	1 188 39 is_stmt 0              # implicit.c:188:39
	movq	424(%rdi), %rcx
	.loc	1 188 41                        # implicit.c:188:41
	addq	%rcx, %rax
	decq	%rax
	.loc	1 188 45                        # implicit.c:188:45
	cqto
	idivq	%r10
	movq	%rax, %r8
	.loc	1 188 51                        # implicit.c:188:51
	leaq	1(%rax), %r9
	.loc	1 188 17                        # implicit.c:188:17
	movq	%r9, 624(%rdi)
.Ltmp60:
	.loc	1 189 18 is_stmt 1              # implicit.c:189:18
	addq	(%rsi), %rcx
	.loc	1 189 28 is_stmt 0              # implicit.c:189:28
	movq	%rcx, %rax
.Ltmp61:
	#DEBUG_VALUE: marc_arcs:max_new_arcs <- $r8
	cqto
	idivq	%r10
	.loc	1 189 32                        # implicit.c:189:32
	testq	%rdx, %rdx
.Ltmp62:
	.loc	1 189 7                         # implicit.c:189:7
	leaq	-3999(%r8,%rdx), %rax
	cmoveq	%r9, %rax
.Ltmp63:
	.loc	1 0 0                           # implicit.c:0:0
	movq	%rax, 632(%rdi)
	movl	$3999, %ecx                     # imm = 0xF9F
.Ltmp64:
.LBB2_5:                                # %while.cond66
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: marc_arcs:net <- $rdi
	#DEBUG_VALUE: marc_arcs:new_arcs <- $rsi
	#DEBUG_VALUE: marc_arcs:new_arcs_array <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: marc_arcs:arcs_pointer_sorted <- [DW_OP_LLVM_entry_value 1] $rcx
	#DEBUG_VALUE: marc_arcs:best_pos <- 0
	#DEBUG_VALUE: marc_arcs:num_threads <- 1
	#DEBUG_VALUE: marc_arcs:global_new <- [DW_OP_consts 3999, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $rcx
	#DEBUG_VALUE: marc_arcs:global_new <- [DW_OP_consts 3999, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_stack_value] $rcx
	.loc	1 193 27 is_stmt 1              # implicit.c:193:27
	testq	%rax, %rax
	.loc	1 193 3 is_stmt 0               # implicit.c:193:3
	jns	.LBB2_7
.Ltmp65:
# %bb.6:                                # %while.body70
                                        #   in Loop: Header=BB2_5 Depth=1
	#DEBUG_VALUE: marc_arcs:net <- $rdi
	#DEBUG_VALUE: marc_arcs:new_arcs <- $rsi
	#DEBUG_VALUE: marc_arcs:new_arcs_array <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: marc_arcs:arcs_pointer_sorted <- [DW_OP_LLVM_entry_value 1] $rcx
	#DEBUG_VALUE: marc_arcs:global_new <- [DW_OP_consts 3999, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_stack_value] $rcx
	#DEBUG_VALUE: marc_arcs:best_pos <- 0
	#DEBUG_VALUE: marc_arcs:num_threads <- 1
	.loc	1 194 38 is_stmt 1              # implicit.c:194:38
	addq	%r9, %rax
	.loc	1 194 22 is_stmt 0              # implicit.c:194:22
	movq	%rax, 632(%rdi)
	.loc	1 195 19 is_stmt 1              # implicit.c:195:19
	movq	%rcx, 640(%rdi)
.Ltmp66:
	.loc	1 193 3                         # implicit.c:193:3
	decq	%rcx
.Ltmp67:
	.loc	1 0 3 is_stmt 0                 # implicit.c:0:3
	jmp	.LBB2_5
.Ltmp68:
.LBB2_7:                                # %while.end76
	#DEBUG_VALUE: marc_arcs:net <- $rdi
	#DEBUG_VALUE: marc_arcs:new_arcs <- $rsi
	#DEBUG_VALUE: marc_arcs:new_arcs_array <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: marc_arcs:arcs_pointer_sorted <- [DW_OP_LLVM_entry_value 1] $rcx
	#DEBUG_VALUE: marc_arcs:global_new <- [DW_OP_consts 3999, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_stack_value] $rcx
	#DEBUG_VALUE: marc_arcs:best_pos <- 0
	#DEBUG_VALUE: marc_arcs:num_threads <- 1
	.loc	1 201 1 is_stmt 1               # implicit.c:201:1
	retq
.Ltmp69:
.Lfunc_end2:
	.size	marc_arcs, .Lfunc_end2-marc_arcs
	.cfi_endproc
                                        # -- End function
	.type	arc_compare,@function           # -- Begin function arc_compare
arc_compare:                            # @arc_compare
.Lfunc_begin3:
	.loc	1 36 0                          # implicit.c:36:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: arc_compare:a1 <- $rdi
	#DEBUG_VALUE: arc_compare:a2 <- $rsi
	.loc	1 37 8 prologue_end             # implicit.c:37:8
	movq	(%rdi), %rcx
	.loc	1 37 22 is_stmt 0               # implicit.c:37:22
	movq	(%rsi), %rax
	.loc	1 37 28                         # implicit.c:37:28
	movq	56(%rax), %rdx
	.loc	1 37 19                         # implicit.c:37:19
	cmpq	%rdx, 56(%rcx)
.Ltmp70:
	.loc	1 37 7                          # implicit.c:37:7
	jle	.LBB3_3
.Ltmp71:
# %bb.1:
	#DEBUG_VALUE: arc_compare:a1 <- $rdi
	#DEBUG_VALUE: arc_compare:a2 <- $rsi
	.loc	1 0 7                           # implicit.c:0:7
	pushq	$1
	.cfi_adjust_cfa_offset 8
	jmp	.LBB3_2
.Ltmp72:
.LBB3_3:                                # %if.end
	.cfi_def_cfa_offset 8
	#DEBUG_VALUE: arc_compare:a1 <- $rdi
	#DEBUG_VALUE: arc_compare:a2 <- $rsi
	.loc	1 39 7 is_stmt 1                # implicit.c:39:7
	jge	.LBB3_5
.Ltmp73:
# %bb.4:
	#DEBUG_VALUE: arc_compare:a1 <- $rdi
	#DEBUG_VALUE: arc_compare:a2 <- $rsi
	.loc	1 0 7 is_stmt 0                 # implicit.c:0:7
	pushq	$-1
	.cfi_adjust_cfa_offset 8
.Ltmp74:
.LBB3_2:
	#DEBUG_VALUE: arc_compare:a1 <- $rdi
	#DEBUG_VALUE: arc_compare:a2 <- $rsi
	popq	%rax
	.cfi_adjust_cfa_offset -8
	.loc	1 45 1 is_stmt 1                # implicit.c:45:1
	retq
.Ltmp75:
.LBB3_5:                                # %if.end6
	#DEBUG_VALUE: arc_compare:a1 <- $rdi
	#DEBUG_VALUE: arc_compare:a2 <- $rsi
	.loc	1 41 14                         # implicit.c:41:14
	movl	(%rcx), %ecx
	.loc	1 41 17 is_stmt 0               # implicit.c:41:17
	xorl	%edx, %edx
	cmpl	(%rax), %ecx
	setge	%dl
.Ltmp76:
	.loc	1 0 0                           # implicit.c:0:0
	leal	-1(,%rdx,2), %eax
	.loc	1 45 1 is_stmt 1                # implicit.c:45:1
	retq
.Ltmp77:
.Lfunc_end3:
	.size	arc_compare, .Lfunc_end3-arc_compare
	.cfi_endproc
                                        # -- End function
	.globl	resize_prob                     # -- Begin function resize_prob
	.type	resize_prob,@function
resize_prob:                            # @resize_prob
.Lfunc_begin4:
	.loc	1 208 0                         # implicit.c:208:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: resize_prob:net <- $rdi
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
.Ltmp78:
	.loc	1 217 24 prologue_end           # implicit.c:217:24
	movq	456(%rdi), %rax
	.loc	1 229 35                        # implicit.c:229:35
	movq	568(%rdi), %rdi
.Ltmp79:
	#DEBUG_VALUE: resize_prob:net <- $rbx
	.loc	1 0 35 is_stmt 0                # implicit.c:0:35
	movq	416(%rbx), %rcx
	.loc	1 217 16 is_stmt 1              # implicit.c:217:16
	addq	%rax, %rcx
	movq	%rcx, 416(%rbx)
	.loc	1 218 29                        # implicit.c:218:29
	addq	%rax, 448(%rbx)
	.loc	1 229 52                        # implicit.c:229:52
	imulq	$72, %rcx, %rsi
	.loc	1 229 21 is_stmt 0              # implicit.c:229:21
	callq	realloc@PLT
.Ltmp80:
	#DEBUG_VALUE: resize_prob:arc <- $rax
	.loc	1 230 10 is_stmt 1              # implicit.c:230:10
	testq	%rax, %rax
.Ltmp81:
	.loc	1 230 9 is_stmt 0               # implicit.c:230:9
	je	.LBB4_1
.Ltmp82:
# %bb.2:                                # %if.end
	#DEBUG_VALUE: resize_prob:net <- $rbx
	#DEBUG_VALUE: resize_prob:arc <- $rax
	.loc	1 0 0                           # implicit.c:0:0
	movq	%rax, %rcx
	.loc	1 237 21 is_stmt 1              # implicit.c:237:21
	movq	568(%rbx), %rsi
.Ltmp83:
	#DEBUG_VALUE: resize_prob:old_arcs <- $rsi
	.loc	1 239 15                        # implicit.c:239:15
	movq	%rax, 568(%rbx)
	.loc	1 240 26                        # implicit.c:240:26
	imulq	$72, 424(%rbx), %rax
.Ltmp84:
	#DEBUG_VALUE: resize_prob:arc <- $rcx
	addq	%rcx, %rax
	.loc	1 240 20 is_stmt 0              # implicit.c:240:20
	movq	%rax, 576(%rbx)
	.loc	1 242 24 is_stmt 1              # implicit.c:242:24
	movq	552(%rbx), %rdi
.Ltmp85:
	#DEBUG_VALUE: resize_prob:node <- $rdi
	#DEBUG_VALUE: resize_prob:root <- $rdi
	#DEBUG_VALUE: resize_prob:node <- [DW_OP_plus_uconst 104, DW_OP_stack_value] $rdi
	.loc	1 243 29                        # implicit.c:243:29
	movq	560(%rbx), %r8
.Ltmp86:
	#DEBUG_VALUE: resize_prob:stop <- $r8
	.loc	1 243 9 is_stmt 0               # implicit.c:243:9
	leaq	104(%rdi), %r9
	pushq	$72
	.cfi_adjust_cfa_offset 8
	popq	%r10
	.cfi_adjust_cfa_offset -8
.Ltmp87:
.LBB4_3:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: resize_prob:net <- $rbx
	#DEBUG_VALUE: resize_prob:arc <- $rcx
	#DEBUG_VALUE: resize_prob:old_arcs <- $rsi
	#DEBUG_VALUE: resize_prob:root <- $rdi
	#DEBUG_VALUE: resize_prob:stop <- $r8
	#DEBUG_VALUE: resize_prob:node <- $r9
	.loc	1 243 46                        # implicit.c:243:46
	cmpq	%r8, %r9
.Ltmp88:
	.loc	1 243 5                         # implicit.c:243:5
	jae	.LBB4_8
.Ltmp89:
# %bb.4:                                # %for.body
                                        #   in Loop: Header=BB4_3 Depth=1
	#DEBUG_VALUE: resize_prob:net <- $rbx
	#DEBUG_VALUE: resize_prob:arc <- $rcx
	#DEBUG_VALUE: resize_prob:old_arcs <- $rsi
	#DEBUG_VALUE: resize_prob:node <- $r9
	#DEBUG_VALUE: resize_prob:root <- $rdi
	#DEBUG_VALUE: resize_prob:stop <- $r8
	.loc	1 244 18 is_stmt 1              # implicit.c:244:18
	movq	48(%r9), %rax
	.loc	1 244 12 is_stmt 0              # implicit.c:244:12
	testq	%rax, %rax
	.loc	1 244 28                        # implicit.c:244:28
	je	.LBB4_5
.Ltmp90:
# %bb.6:                                # %land.lhs.true
                                        #   in Loop: Header=BB4_3 Depth=1
	#DEBUG_VALUE: resize_prob:net <- $rbx
	#DEBUG_VALUE: resize_prob:arc <- $rcx
	#DEBUG_VALUE: resize_prob:old_arcs <- $rsi
	#DEBUG_VALUE: resize_prob:node <- $r9
	#DEBUG_VALUE: resize_prob:root <- $rdi
	#DEBUG_VALUE: resize_prob:stop <- $r8
	.loc	1 244 42                        # implicit.c:244:42
	cmpq	%rdi, 24(%r9)
.Ltmp91:
	.loc	1 244 12                        # implicit.c:244:12
	je	.LBB4_5
.Ltmp92:
# %bb.7:                                # %if.then10
                                        #   in Loop: Header=BB4_3 Depth=1
	#DEBUG_VALUE: resize_prob:net <- $rbx
	#DEBUG_VALUE: resize_prob:arc <- $rcx
	#DEBUG_VALUE: resize_prob:old_arcs <- $rsi
	#DEBUG_VALUE: resize_prob:node <- $r9
	#DEBUG_VALUE: resize_prob:root <- $rdi
	#DEBUG_VALUE: resize_prob:stop <- $r8
	.loc	1 245 33 is_stmt 1              # implicit.c:245:33
	subq	%rsi, %rax
	cqto
	idivq	%r10
.Ltmp93:
	#DEBUG_VALUE: resize_prob:off <- $rax
	.loc	1 246 51                        # implicit.c:246:51
	imulq	$72, %rax, %rax
.Ltmp94:
	addq	%rcx, %rax
	.loc	1 246 29 is_stmt 0              # implicit.c:246:29
	movq	%rax, 48(%r9)
.Ltmp95:
.LBB4_5:                                # %for.cond.backedge
                                        #   in Loop: Header=BB4_3 Depth=1
	#DEBUG_VALUE: resize_prob:net <- $rbx
	#DEBUG_VALUE: resize_prob:arc <- $rcx
	#DEBUG_VALUE: resize_prob:old_arcs <- $rsi
	#DEBUG_VALUE: resize_prob:node <- $r9
	#DEBUG_VALUE: resize_prob:root <- $rdi
	#DEBUG_VALUE: resize_prob:stop <- $r8
	.loc	1 243 0 is_stmt 1               # implicit.c:243:0
	addq	$104, %r9
.Ltmp96:
	.loc	1 0 0 is_stmt 0                 # implicit.c:0:0
	jmp	.LBB4_3
.Ltmp97:
.LBB4_8:                                # %for.end
	#DEBUG_VALUE: resize_prob:net <- $rbx
	#DEBUG_VALUE: resize_prob:arc <- $rcx
	#DEBUG_VALUE: resize_prob:old_arcs <- $rsi
	#DEBUG_VALUE: resize_prob:node <- $r9
	#DEBUG_VALUE: resize_prob:root <- $rdi
	#DEBUG_VALUE: resize_prob:stop <- $r8
	.loc	1 250 35 is_stmt 1              # implicit.c:250:35
	movq	584(%rbx), %rdi
.Ltmp98:
	.loc	1 250 59 is_stmt 0              # implicit.c:250:59
	imulq	$72, 416(%rbx), %rsi
.Ltmp99:
	.loc	1 250 21                        # implicit.c:250:21
	callq	realloc@PLT
.Ltmp100:
	#DEBUG_VALUE: resize_prob:arc <- $rax
	.loc	1 251 22 is_stmt 1              # implicit.c:251:22
	movq	%rax, 584(%rbx)
	xorl	%eax, %eax
.Ltmp101:
	.loc	1 0 22 is_stmt 0                # implicit.c:0:22
	jmp	.LBB4_9
.Ltmp102:
.LBB4_1:                                # %if.then
	#DEBUG_VALUE: resize_prob:net <- $rbx
	#DEBUG_VALUE: resize_prob:arc <- $rax
	.loc	1 232 9 is_stmt 1               # implicit.c:232:9
	movl	$.L.str, %edi
	movq	%rbx, %rsi
	xorl	%eax, %eax
.Ltmp103:
	callq	printf@PLT
.Ltmp104:
	.loc	1 233 17                        # implicit.c:233:17
	movq	stdout@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	.loc	1 233 9 is_stmt 0               # implicit.c:233:9
	callq	fflush@PLT
.Ltmp105:
	.loc	1 0 9                           # implicit.c:0:9
	pushq	$-1
	.cfi_adjust_cfa_offset 8
	popq	%rax
.Ltmp106:
	.cfi_adjust_cfa_offset -8
.LBB4_9:                                # %cleanup
	#DEBUG_VALUE: resize_prob:net <- $rbx
	.loc	1 254 1 epilogue_begin is_stmt 1 # implicit.c:254:1
	popq	%rbx
.Ltmp107:
	#DEBUG_VALUE: resize_prob:net <- [DW_OP_LLVM_entry_value 1] $rdi
	.cfi_def_cfa_offset 8
	retq
.Ltmp108:
.Lfunc_end4:
	.size	resize_prob, .Lfunc_end4-resize_prob
	.cfi_endproc
	.file	5 "/usr/include" "stdlib.h" md5 0x63eb5d13c95e983b032100a82fad75fa
	.file	6 "/home/michel/ETH/AST" "llvm-project/build_instr/lib/clang/17/include/stddef.h" md5 0xd1776268f398bd1ca997c840ad581432
	.file	7 "/usr/include" "stdio.h" md5 0x7d7db73c9e84df2166acd5df3e106f04
	.file	8 "/usr/include/bits/types" "struct_FILE.h" md5 0x2724c33532a91348c643429afa072d1a
	.file	9 "/usr/include/bits/types" "FILE.h" md5 0x571f9fb6223c42439075fdde11a0de5d
                                        # -- End function
	.globl	insert_new_arc                  # -- Begin function insert_new_arc
	.type	insert_new_arc,@function
insert_new_arc:                         # @insert_new_arc
.Lfunc_begin5:
	.loc	1 276 0                         # implicit.c:276:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: insert_new_arc:newarc <- $rdi
	#DEBUG_VALUE: insert_new_arc:newpos <- $rsi
	#DEBUG_VALUE: insert_new_arc:tail <- $rdx
	#DEBUG_VALUE: insert_new_arc:head <- $rcx
	#DEBUG_VALUE: insert_new_arc:cost <- $r8
	#DEBUG_VALUE: insert_new_arc:red_cost <- $r9
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
.Ltmp109:
	#DEBUG_VALUE: insert_new_arc:number <- [DW_OP_plus_uconst 40] [$rsp+0]
	movq	%rdx, %r10
	movq	%rsi, %rax
	movl	40(%rsp), %esi
.Ltmp110:
	#DEBUG_VALUE: insert_new_arc:newpos <- $rax
	#DEBUG_VALUE: insert_new_arc:m <- undef
	.loc	1 279 5 prologue_end            # implicit.c:279:5
	imulq	$72, %rax, %rdx
.Ltmp111:
	#DEBUG_VALUE: insert_new_arc:tail <- $r10
	.loc	1 279 30 is_stmt 0              # implicit.c:279:30
	movq	%r10, 16(%rdi,%rdx)
	.loc	1 280 30 is_stmt 1              # implicit.c:280:30
	movq	%rcx, 24(%rdi,%rdx)
	.loc	1 281 30                        # implicit.c:281:30
	movq	%r8, 64(%rdi,%rdx)
	.loc	1 282 30                        # implicit.c:282:30
	movq	%r8, 8(%rdi,%rdx)
	.loc	1 283 30                        # implicit.c:283:30
	movq	%r9, 56(%rdi,%rdx)
	.loc	1 284 30                        # implicit.c:284:30
	movl	%esi, (%rdi,%rdx)
	.loc	1 286 17                        # implicit.c:286:17
	incq	%rax
.Ltmp112:
	#DEBUG_VALUE: insert_new_arc:newpos <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: insert_new_arc:pos <- $rax
	.loc	1 0 17 is_stmt 0                # implicit.c:0:17
	movabsq	$2, %r11
.Ltmp113:
.LBB5_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: insert_new_arc:newarc <- $rdi
	#DEBUG_VALUE: insert_new_arc:newpos <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: insert_new_arc:tail <- $r10
	#DEBUG_VALUE: insert_new_arc:head <- $rcx
	#DEBUG_VALUE: insert_new_arc:cost <- $r8
	#DEBUG_VALUE: insert_new_arc:red_cost <- $r9
	#DEBUG_VALUE: insert_new_arc:number <- [DW_OP_plus_uconst 40] [$rsp+0]
	#DEBUG_VALUE: insert_new_arc:pos <- $rax
	#DEBUG_VALUE: insert_new_arc:pos <- $rax
	.loc	1 287 15 is_stmt 1              # implicit.c:287:15
	movq	%rax, %rbx
	decq	%rbx
	.loc	1 287 18 is_stmt 0              # implicit.c:287:18
	je	.LBB5_4
.Ltmp114:
# %bb.2:                                # %land.rhs
                                        #   in Loop: Header=BB5_1 Depth=1
	#DEBUG_VALUE: insert_new_arc:newarc <- $rdi
	#DEBUG_VALUE: insert_new_arc:newpos <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: insert_new_arc:tail <- $r10
	#DEBUG_VALUE: insert_new_arc:head <- $rcx
	#DEBUG_VALUE: insert_new_arc:cost <- $r8
	#DEBUG_VALUE: insert_new_arc:red_cost <- $r9
	#DEBUG_VALUE: insert_new_arc:number <- [DW_OP_plus_uconst 40] [$rsp+0]
	#DEBUG_VALUE: insert_new_arc:pos <- $rax
	.loc	1 287 50                        # implicit.c:287:50
	cqto
.Ltmp115:
	idivq	%r11
	.loc	1 287 52                        # implicit.c:287:52
	leaq	-1(%rax), %rdx
	.loc	1 287 56                        # implicit.c:287:56
	imulq	$72, %rdx, %r14
	movq	56(%rdi,%r14), %rdx
	.loc	1 287 30                        # implicit.c:287:30
	cmpq	%r9, %rdx
	.loc	1 287 5                         # implicit.c:287:5
	jge	.LBB5_4
.Ltmp116:
# %bb.3:                                # %while.body
                                        #   in Loop: Header=BB5_1 Depth=1
	#DEBUG_VALUE: insert_new_arc:newarc <- $rdi
	#DEBUG_VALUE: insert_new_arc:newpos <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: insert_new_arc:tail <- $r10
	#DEBUG_VALUE: insert_new_arc:head <- $rcx
	#DEBUG_VALUE: insert_new_arc:cost <- $r8
	#DEBUG_VALUE: insert_new_arc:red_cost <- $r9
	#DEBUG_VALUE: insert_new_arc:number <- [DW_OP_plus_uconst 40] [$rsp+0]
	.loc	1 0 0                           # implicit.c:0:0
	addq	%rdi, %r14
	addq	$56, %r14
.Ltmp117:
	.loc	1 289 50 is_stmt 1              # implicit.c:289:50
	movq	-40(%r14), %r15
	.loc	1 289 9 is_stmt 0               # implicit.c:289:9
	imulq	$72, %rbx, %rbx
	.loc	1 289 32                        # implicit.c:289:32
	movq	%r15, 16(%rdi,%rbx)
	.loc	1 290 50 is_stmt 1              # implicit.c:290:50
	movq	-32(%r14), %r15
	.loc	1 290 32 is_stmt 0              # implicit.c:290:32
	movq	%r15, 24(%rdi,%rbx)
	.loc	1 291 50 is_stmt 1              # implicit.c:291:50
	movq	-48(%r14), %r15
	.loc	1 291 32 is_stmt 0              # implicit.c:291:32
	movq	%r15, 8(%rdi,%rbx)
	.loc	1 292 50 is_stmt 1              # implicit.c:292:50
	movq	-48(%r14), %r15
	.loc	1 292 32 is_stmt 0              # implicit.c:292:32
	movq	%r15, 64(%rdi,%rbx)
	.loc	1 293 32 is_stmt 1              # implicit.c:293:32
	movq	%rdx, 56(%rdi,%rbx)
	.loc	1 294 50                        # implicit.c:294:50
	movl	-56(%r14), %edx
	.loc	1 294 32 is_stmt 0              # implicit.c:294:32
	movl	%edx, (%rdi,%rbx)
.Ltmp118:
	#DEBUG_VALUE: insert_new_arc:pos <- $rax
	.loc	1 297 32 is_stmt 1              # implicit.c:297:32
	movq	%r10, -40(%r14)
	.loc	1 298 32                        # implicit.c:298:32
	movq	%rcx, -32(%r14)
	.loc	1 299 32                        # implicit.c:299:32
	movq	%r8, -48(%r14)
	.loc	1 300 32                        # implicit.c:300:32
	movq	%r8, 8(%r14)
	.loc	1 301 32                        # implicit.c:301:32
	movq	%r9, (%r14)
	.loc	1 302 32                        # implicit.c:302:32
	movl	%esi, -56(%r14)
	jmp	.LBB5_1
.Ltmp119:
.LBB5_4:                                # %while.end
	#DEBUG_VALUE: insert_new_arc:newarc <- $rdi
	#DEBUG_VALUE: insert_new_arc:newpos <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: insert_new_arc:tail <- $r10
	#DEBUG_VALUE: insert_new_arc:head <- $rcx
	#DEBUG_VALUE: insert_new_arc:cost <- $r8
	#DEBUG_VALUE: insert_new_arc:red_cost <- $r9
	#DEBUG_VALUE: insert_new_arc:number <- [DW_OP_plus_uconst 40] [$rsp+0]
	.loc	1 306 1 epilogue_begin          # implicit.c:306:1
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Ltmp120:
.Lfunc_end5:
	.size	insert_new_arc, .Lfunc_end5-insert_new_arc
	.cfi_endproc
                                        # -- End function
	.globl	replace_weaker_arc              # -- Begin function replace_weaker_arc
	.type	replace_weaker_arc,@function
replace_weaker_arc:                     # @replace_weaker_arc
.Lfunc_begin6:
	.loc	1 327 0                         # implicit.c:327:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: replace_weaker_arc:newarc <- $rdi
	#DEBUG_VALUE: replace_weaker_arc:tail <- $rsi
	#DEBUG_VALUE: replace_weaker_arc:head <- $rdx
	#DEBUG_VALUE: replace_weaker_arc:cost <- $rcx
	#DEBUG_VALUE: replace_weaker_arc:red_cost <- $r8
	#DEBUG_VALUE: replace_weaker_arc:max_new_par_residual_new_arcs <- $r9
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
.Ltmp121:
	#DEBUG_VALUE: replace_weaker_arc:number <- [DW_OP_plus_uconst 32] [$rsp+0]
	movl	32(%rsp), %eax
.Ltmp122:
	.loc	1 331 24 prologue_end           # implicit.c:331:24
	movq	%rsi, 16(%rdi)
	.loc	1 332 24                        # implicit.c:332:24
	movq	%rdx, 24(%rdi)
	.loc	1 333 24                        # implicit.c:333:24
	movq	%rcx, 64(%rdi)
	.loc	1 334 24                        # implicit.c:334:24
	movq	%rcx, 8(%rdi)
	.loc	1 335 24                        # implicit.c:335:24
	movq	%r8, 56(%rdi)
	.loc	1 336 24                        # implicit.c:336:24
	movl	%eax, (%rdi)
.Ltmp123:
	#DEBUG_VALUE: replace_weaker_arc:pos <- 1
	.loc	1 339 22                        # implicit.c:339:22
	movq	128(%rdi), %r10
	.loc	1 339 27 is_stmt 0              # implicit.c:339:27
	xorl	%r11d, %r11d
	cmpq	200(%rdi), %r10
	setg	%r11b
	.loc	1 339 11                        # implicit.c:339:11
	xorq	$3, %r11
.Ltmp124:
	#DEBUG_VALUE: replace_weaker_arc:cmp <- $r11
	.loc	1 0 11                          # implicit.c:0:11
	movabsq	$1, %rbx
.Ltmp125:
.LBB6_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: replace_weaker_arc:newarc <- $rdi
	#DEBUG_VALUE: replace_weaker_arc:tail <- $rsi
	#DEBUG_VALUE: replace_weaker_arc:head <- $rdx
	#DEBUG_VALUE: replace_weaker_arc:cost <- $rcx
	#DEBUG_VALUE: replace_weaker_arc:red_cost <- $r8
	#DEBUG_VALUE: replace_weaker_arc:max_new_par_residual_new_arcs <- $r9
	#DEBUG_VALUE: replace_weaker_arc:number <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: replace_weaker_arc:cmp <- $r11
	#DEBUG_VALUE: replace_weaker_arc:pos <- $rbx
	.loc	1 340 16 is_stmt 1              # implicit.c:340:16
	cmpq	%r9, %r11
	.loc	1 340 49 is_stmt 0              # implicit.c:340:49
	jg	.LBB6_7
.Ltmp126:
# %bb.2:                                # %land.rhs
                                        #   in Loop: Header=BB6_1 Depth=1
	#DEBUG_VALUE: replace_weaker_arc:newarc <- $rdi
	#DEBUG_VALUE: replace_weaker_arc:tail <- $rsi
	#DEBUG_VALUE: replace_weaker_arc:head <- $rdx
	#DEBUG_VALUE: replace_weaker_arc:cost <- $rcx
	#DEBUG_VALUE: replace_weaker_arc:red_cost <- $r8
	#DEBUG_VALUE: replace_weaker_arc:max_new_par_residual_new_arcs <- $r9
	#DEBUG_VALUE: replace_weaker_arc:number <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: replace_weaker_arc:pos <- $rbx
	#DEBUG_VALUE: replace_weaker_arc:cmp <- $r11
	.loc	1 0 0                           # implicit.c:0:0
	movq	%r11, %r10
	.loc	1 340 73                        # implicit.c:340:73
	decq	%r11
.Ltmp127:
	#DEBUG_VALUE: replace_weaker_arc:cmp <- $r10
	.loc	1 340 77                        # implicit.c:340:77
	imulq	$72, %r11, %r14
	movq	56(%rdi,%r14), %r11
	.loc	1 340 61                        # implicit.c:340:61
	cmpq	%r8, %r11
	.loc	1 340 5                         # implicit.c:340:5
	jle	.LBB6_7
.Ltmp128:
# %bb.3:                                # %while.body
                                        #   in Loop: Header=BB6_1 Depth=1
	#DEBUG_VALUE: replace_weaker_arc:newarc <- $rdi
	#DEBUG_VALUE: replace_weaker_arc:tail <- $rsi
	#DEBUG_VALUE: replace_weaker_arc:head <- $rdx
	#DEBUG_VALUE: replace_weaker_arc:cost <- $rcx
	#DEBUG_VALUE: replace_weaker_arc:red_cost <- $r8
	#DEBUG_VALUE: replace_weaker_arc:max_new_par_residual_new_arcs <- $r9
	#DEBUG_VALUE: replace_weaker_arc:number <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: replace_weaker_arc:pos <- $rbx
	#DEBUG_VALUE: replace_weaker_arc:cmp <- $r10
	.loc	1 0 0                           # implicit.c:0:0
	addq	%rdi, %r14
	addq	$56, %r14
.Ltmp129:
	.loc	1 342 44 is_stmt 1              # implicit.c:342:44
	movq	-40(%r14), %r15
	.loc	1 342 19 is_stmt 0              # implicit.c:342:19
	imulq	$72, %rbx, %rbx
.Ltmp130:
	.loc	1 342 28                        # implicit.c:342:28
	movq	%r15, -56(%rbx,%rdi)
	.loc	1 343 44 is_stmt 1              # implicit.c:343:44
	movq	-32(%r14), %r15
	.loc	1 343 28 is_stmt 0              # implicit.c:343:28
	movq	%r15, -48(%rbx,%rdi)
	.loc	1 344 44 is_stmt 1              # implicit.c:344:44
	movq	-48(%r14), %r15
	.loc	1 344 28 is_stmt 0              # implicit.c:344:28
	movq	%r15, -64(%rbx,%rdi)
	.loc	1 345 48 is_stmt 1              # implicit.c:345:48
	movq	-48(%r14), %r15
	.loc	1 345 32 is_stmt 0              # implicit.c:345:32
	movq	%r15, -8(%rbx,%rdi)
	.loc	1 346 28 is_stmt 1              # implicit.c:346:28
	movq	%r11, -16(%rbx,%rdi)
	.loc	1 347 44                        # implicit.c:347:44
	movl	-56(%r14), %r11d
	.loc	1 347 28 is_stmt 0              # implicit.c:347:28
	movl	%r11d, -72(%rbx,%rdi)
	.loc	1 349 28 is_stmt 1              # implicit.c:349:28
	movq	%rsi, -40(%r14)
	.loc	1 350 28                        # implicit.c:350:28
	movq	%rdx, -32(%r14)
	.loc	1 351 28                        # implicit.c:351:28
	movq	%rcx, -48(%r14)
	.loc	1 352 32                        # implicit.c:352:32
	movq	%rcx, 8(%r14)
	.loc	1 353 28                        # implicit.c:353:28
	movq	%r8, (%r14)
	.loc	1 354 28                        # implicit.c:354:28
	movl	%eax, -56(%r14)
.Ltmp131:
	#DEBUG_VALUE: replace_weaker_arc:pos <- $r10
	.loc	1 356 13                        # implicit.c:356:13
	leaq	(%r10,%r10), %r11
.Ltmp132:
	#DEBUG_VALUE: replace_weaker_arc:cmp <- $r11
	.loc	1 357 17                        # implicit.c:357:17
	leaq	1(,%r10,2), %r14
	movq	%r10, %rbx
	.loc	1 357 21 is_stmt 0              # implicit.c:357:21
	cmpq	%r9, %r14
.Ltmp133:
	.loc	1 357 13                        # implicit.c:357:13
	jg	.LBB6_1
.Ltmp134:
# %bb.4:                                # %if.then
                                        #   in Loop: Header=BB6_1 Depth=1
	#DEBUG_VALUE: replace_weaker_arc:newarc <- $rdi
	#DEBUG_VALUE: replace_weaker_arc:tail <- $rsi
	#DEBUG_VALUE: replace_weaker_arc:head <- $rdx
	#DEBUG_VALUE: replace_weaker_arc:cost <- $rcx
	#DEBUG_VALUE: replace_weaker_arc:red_cost <- $r8
	#DEBUG_VALUE: replace_weaker_arc:max_new_par_residual_new_arcs <- $r9
	#DEBUG_VALUE: replace_weaker_arc:number <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: replace_weaker_arc:pos <- $rbx
	#DEBUG_VALUE: replace_weaker_arc:cmp <- $r11
	.loc	1 358 27 is_stmt 1              # implicit.c:358:27
	imulq	$72, %r11, %rbx
.Ltmp135:
	#DEBUG_VALUE: replace_weaker_arc:pos <- $r10
	.loc	1 358 31 is_stmt 0              # implicit.c:358:31
	movq	-16(%rdi,%rbx), %r15
	.loc	1 358 36                        # implicit.c:358:36
	cmpq	56(%rdi,%rbx), %r15
.Ltmp136:
	.loc	1 358 17                        # implicit.c:358:17
	jl	.LBB6_6
.Ltmp137:
# %bb.5:                                # %if.then
                                        #   in Loop: Header=BB6_1 Depth=1
	#DEBUG_VALUE: replace_weaker_arc:newarc <- $rdi
	#DEBUG_VALUE: replace_weaker_arc:tail <- $rsi
	#DEBUG_VALUE: replace_weaker_arc:head <- $rdx
	#DEBUG_VALUE: replace_weaker_arc:cost <- $rcx
	#DEBUG_VALUE: replace_weaker_arc:red_cost <- $r8
	#DEBUG_VALUE: replace_weaker_arc:max_new_par_residual_new_arcs <- $r9
	#DEBUG_VALUE: replace_weaker_arc:number <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: replace_weaker_arc:pos <- $r10
	#DEBUG_VALUE: replace_weaker_arc:cmp <- $r11
	.loc	1 0 17                          # implicit.c:0:17
	movq	%r11, %r14
.Ltmp138:
	#DEBUG_VALUE: replace_weaker_arc:cmp <- $r14
.LBB6_6:                                # %if.then
                                        #   in Loop: Header=BB6_1 Depth=1
	#DEBUG_VALUE: replace_weaker_arc:newarc <- $rdi
	#DEBUG_VALUE: replace_weaker_arc:tail <- $rsi
	#DEBUG_VALUE: replace_weaker_arc:head <- $rdx
	#DEBUG_VALUE: replace_weaker_arc:cost <- $rcx
	#DEBUG_VALUE: replace_weaker_arc:red_cost <- $r8
	#DEBUG_VALUE: replace_weaker_arc:max_new_par_residual_new_arcs <- $r9
	#DEBUG_VALUE: replace_weaker_arc:number <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: replace_weaker_arc:pos <- $r10
	#DEBUG_VALUE: replace_weaker_arc:cmp <- $r11
	movq	%r10, %rbx
.Ltmp139:
	#DEBUG_VALUE: replace_weaker_arc:pos <- $rbx
	movq	%r14, %r11
.Ltmp140:
	jmp	.LBB6_1
.Ltmp141:
.LBB6_7:                                # %while.end
	#DEBUG_VALUE: replace_weaker_arc:newarc <- $rdi
	#DEBUG_VALUE: replace_weaker_arc:tail <- $rsi
	#DEBUG_VALUE: replace_weaker_arc:head <- $rdx
	#DEBUG_VALUE: replace_weaker_arc:cost <- $rcx
	#DEBUG_VALUE: replace_weaker_arc:red_cost <- $r8
	#DEBUG_VALUE: replace_weaker_arc:max_new_par_residual_new_arcs <- $r9
	#DEBUG_VALUE: replace_weaker_arc:number <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: replace_weaker_arc:pos <- $rbx
	.loc	1 363 1 epilogue_begin is_stmt 1 # implicit.c:363:1
	popq	%rbx
.Ltmp142:
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Ltmp143:
.Lfunc_end6:
	.size	replace_weaker_arc, .Lfunc_end6-replace_weaker_arc
	.cfi_endproc
                                        # -- End function
	.globl	calculate_max_redcost           # -- Begin function calculate_max_redcost
	.type	calculate_max_redcost,@function
calculate_max_redcost:                  # @calculate_max_redcost
.Lfunc_begin7:
	.loc	1 390 0                         # implicit.c:390:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: calculate_max_redcost:max_redcost <- $rsi
	#DEBUG_VALUE: calculate_max_redcost:arcs_pointer_sorted <- $rdx
	#DEBUG_VALUE: calculate_max_redcost:num_threads <- $rcx
	#DEBUG_VALUE: calculate_max_redcost:net <- undef
	.loc	1 392 16 prologue_end           # implicit.c:392:16
	andq	$0, (%rsi)
	xorl	%eax, %eax
.Ltmp144:
	#DEBUG_VALUE: calculate_max_redcost:i <- 0
	.loc	1 393 8                         # implicit.c:393:8
	testq	%rcx, %rcx
	cmovleq	%rax, %rcx
.Ltmp145:
	#DEBUG_VALUE: calculate_max_redcost:num_threads <- [DW_OP_LLVM_entry_value 1] $rcx
	.loc	1 0 8 is_stmt 0                 # implicit.c:0:8
	xorl	%edi, %edi
.Ltmp146:
.LBB7_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: calculate_max_redcost:max_redcost <- $rsi
	#DEBUG_VALUE: calculate_max_redcost:arcs_pointer_sorted <- $rdx
	#DEBUG_VALUE: calculate_max_redcost:num_threads <- [DW_OP_LLVM_entry_value 1] $rcx
	#DEBUG_VALUE: calculate_max_redcost:i <- $rdi
	.loc	1 393 17                        # implicit.c:393:17
	cmpq	%rdi, %rcx
.Ltmp147:
	.loc	1 393 3                         # implicit.c:393:3
	je	.LBB7_5
.Ltmp148:
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB7_1 Depth=1
	#DEBUG_VALUE: calculate_max_redcost:max_redcost <- $rsi
	#DEBUG_VALUE: calculate_max_redcost:arcs_pointer_sorted <- $rdx
	#DEBUG_VALUE: calculate_max_redcost:num_threads <- [DW_OP_LLVM_entry_value 1] $rcx
	#DEBUG_VALUE: calculate_max_redcost:i <- $rdi
	.loc	1 395 9 is_stmt 1               # implicit.c:395:9
	movq	(%rdx,%rdi,8), %r8
	movq	(%r8), %r8
	.loc	1 395 36 is_stmt 0              # implicit.c:395:36
	movq	56(%r8), %r8
	.loc	1 395 41                        # implicit.c:395:41
	cmpq	%rax, %r8
.Ltmp149:
	.loc	1 395 9                         # implicit.c:395:9
	jle	.LBB7_4
.Ltmp150:
# %bb.3:                                # %if.then
                                        #   in Loop: Header=BB7_1 Depth=1
	#DEBUG_VALUE: calculate_max_redcost:max_redcost <- $rsi
	#DEBUG_VALUE: calculate_max_redcost:arcs_pointer_sorted <- $rdx
	#DEBUG_VALUE: calculate_max_redcost:num_threads <- [DW_OP_LLVM_entry_value 1] $rcx
	#DEBUG_VALUE: calculate_max_redcost:i <- $rdi
	.loc	1 396 20 is_stmt 1              # implicit.c:396:20
	movq	%r8, (%rsi)
	movq	%r8, %rax
.Ltmp151:
.LBB7_4:                                # %for.inc
                                        #   in Loop: Header=BB7_1 Depth=1
	#DEBUG_VALUE: calculate_max_redcost:max_redcost <- $rsi
	#DEBUG_VALUE: calculate_max_redcost:arcs_pointer_sorted <- $rdx
	#DEBUG_VALUE: calculate_max_redcost:num_threads <- [DW_OP_LLVM_entry_value 1] $rcx
	#DEBUG_VALUE: calculate_max_redcost:i <- $rdi
	.loc	1 393 33                        # implicit.c:393:33
	incq	%rdi
.Ltmp152:
	#DEBUG_VALUE: calculate_max_redcost:i <- $rdi
	.loc	1 0 33 is_stmt 0                # implicit.c:0:33
	jmp	.LBB7_1
.Ltmp153:
.LBB7_5:                                # %for.end
	#DEBUG_VALUE: calculate_max_redcost:max_redcost <- $rsi
	#DEBUG_VALUE: calculate_max_redcost:arcs_pointer_sorted <- $rdx
	#DEBUG_VALUE: calculate_max_redcost:num_threads <- [DW_OP_LLVM_entry_value 1] $rcx
	#DEBUG_VALUE: calculate_max_redcost:i <- $rdi
	.loc	1 398 1 is_stmt 1               # implicit.c:398:1
	retq
.Ltmp154:
.Lfunc_end7:
	.size	calculate_max_redcost, .Lfunc_end7-calculate_max_redcost
	.cfi_endproc
                                        # -- End function
	.globl	switch_arcs                     # -- Begin function switch_arcs
	.type	switch_arcs,@function
switch_arcs:                            # @switch_arcs
.Lfunc_begin8:
	.loc	1 413 0                         # implicit.c:413:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: switch_arcs:num_del_arcs <- $rsi
	#DEBUG_VALUE: switch_arcs:deleted_arcs <- $rdx
	#DEBUG_VALUE: switch_arcs:arcnew <- $rcx
	#DEBUG_VALUE: switch_arcs:thread <- $r8d
	#DEBUG_VALUE: switch_arcs:max_new_par_residual_new_arcs <- $r9
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
.Ltmp155:
	#DEBUG_VALUE: switch_arcs:size_del <- [DW_OP_plus_uconst 96] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:num_threads <- [DW_OP_plus_uconst 104] [$rsp+0]
	movq	%r9, 32(%rsp)                   # 8-byte Spill
.Ltmp156:
	#DEBUG_VALUE: switch_arcs:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 32] [$rsp+0]
	movq	%rcx, %r14
	movq	%rdx, %r15
	movq	%rsi, 8(%rsp)                   # 8-byte Spill
.Ltmp157:
	#DEBUG_VALUE: switch_arcs:num_del_arcs <- [DW_OP_plus_uconst 8] [$rsp+0]
	movq	104(%rsp), %rax
	#DEBUG_VALUE: switch_arcs:net <- undef
.Ltmp158:
	#DEBUG_VALUE: switch_arcs:count <- 0
	#DEBUG_VALUE: switch_arcs:i <- 0
	#DEBUG_VALUE: switch_arcs:j <- undef
	.loc	1 417 9 prologue_end            # implicit.c:417:9
	testq	%rax, %rax
	movl	$0, %ecx
.Ltmp159:
	#DEBUG_VALUE: switch_arcs:arcnew <- $r14
	cmovgq	%rax, %rcx
	movq	%rcx, 16(%rsp)                  # 8-byte Spill
	.loc	1 417 20 is_stmt 0              # implicit.c:417:20
	movslq	%r8d, %r12
.Ltmp160:
	#DEBUG_VALUE: switch_arcs:j <- $r12
	.loc	1 0 20                          # implicit.c:0:20
	xorl	%r13d, %r13d
	xorl	%ecx, %ecx
.Ltmp161:
.LBB8_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_3 Depth 2
	#DEBUG_VALUE: switch_arcs:num_del_arcs <- [DW_OP_plus_uconst 8] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:deleted_arcs <- $r15
	#DEBUG_VALUE: switch_arcs:arcnew <- $r14
	#DEBUG_VALUE: switch_arcs:thread <- [DW_OP_LLVM_entry_value 1] $r8d
	#DEBUG_VALUE: switch_arcs:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:i <- $rcx
	#DEBUG_VALUE: switch_arcs:j <- $r12
	#DEBUG_VALUE: switch_arcs:count <- $r13
	.loc	1 417 30                        # implicit.c:417:30
	cmpq	16(%rsp), %rcx                  # 8-byte Folded Reload
.Ltmp162:
	.loc	1 417 4                         # implicit.c:417:4
	je	.LBB8_12
.Ltmp163:
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB8_1 Depth=1
	#DEBUG_VALUE: switch_arcs:num_del_arcs <- [DW_OP_plus_uconst 8] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:deleted_arcs <- $r15
	#DEBUG_VALUE: switch_arcs:arcnew <- $r14
	#DEBUG_VALUE: switch_arcs:thread <- [DW_OP_LLVM_entry_value 1] $r8d
	#DEBUG_VALUE: switch_arcs:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:count <- $r13
	#DEBUG_VALUE: switch_arcs:i <- $rcx
	#DEBUG_VALUE: switch_arcs:j <- $r12
	.loc	1 0 4                           # implicit.c:0:4
	movq	%rcx, 24(%rsp)                  # 8-byte Spill
.Ltmp164:
	#DEBUG_VALUE: switch_arcs:i <- [DW_OP_plus_uconst 24, DW_OP_deref] $rsp
	movq	8(%rsp), %rax                   # 8-byte Reload
.Ltmp165:
	.loc	1 422 24 is_stmt 1              # implicit.c:422:24
	movq	(%rax,%r12,8), %rbp
	movq	96(%rsp), %rax
	.loc	1 422 23 is_stmt 0              # implicit.c:422:23
	cmpq	%rax, %rbp
	cmovgeq	%rax, %rbp
.Ltmp166:
	#DEBUG_VALUE: switch_arcs:number_of_arcs <- $rbp
	#DEBUG_VALUE: switch_arcs:h <- 0
	.loc	1 423 11 is_stmt 1              # implicit.c:423:11
	testq	%rbp, %rbp
	movl	$0, %eax
	cmovleq	%rax, %rbp
.Ltmp167:
	.loc	1 0 11 is_stmt 0                # implicit.c:0:11
	xorl	%ebx, %ebx
.Ltmp168:
.LBB8_3:                                # %for.cond5
                                        #   Parent Loop BB8_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: switch_arcs:num_del_arcs <- [DW_OP_plus_uconst 8] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:deleted_arcs <- $r15
	#DEBUG_VALUE: switch_arcs:arcnew <- $r14
	#DEBUG_VALUE: switch_arcs:thread <- [DW_OP_LLVM_entry_value 1] $r8d
	#DEBUG_VALUE: switch_arcs:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:count <- $r13
	#DEBUG_VALUE: switch_arcs:i <- [DW_OP_plus_uconst 24, DW_OP_deref] $rsp
	#DEBUG_VALUE: switch_arcs:j <- $r12
	#DEBUG_VALUE: switch_arcs:h <- undef
	#DEBUG_VALUE: switch_arcs:count <- $r13
	.loc	1 423 20                        # implicit.c:423:20
	subq	$1, %rbp
.Ltmp169:
	.loc	1 423 6                         # implicit.c:423:6
	jb	.LBB8_11
.Ltmp170:
# %bb.4:                                # %for.body8
                                        #   in Loop: Header=BB8_3 Depth=2
	#DEBUG_VALUE: switch_arcs:num_del_arcs <- [DW_OP_plus_uconst 8] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:deleted_arcs <- $r15
	#DEBUG_VALUE: switch_arcs:arcnew <- $r14
	#DEBUG_VALUE: switch_arcs:thread <- [DW_OP_LLVM_entry_value 1] $r8d
	#DEBUG_VALUE: switch_arcs:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:count <- $r13
	#DEBUG_VALUE: switch_arcs:i <- [DW_OP_plus_uconst 24, DW_OP_deref] $rsp
	#DEBUG_VALUE: switch_arcs:j <- $r12
	.loc	1 425 20 is_stmt 1              # implicit.c:425:20
	movq	(%r15,%r12,8), %rcx
.Ltmp171:
	#DEBUG_VALUE: switch_arcs:test_arc <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 72, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] undef, undef
	.loc	1 428 13                        # implicit.c:428:13
	cmpw	$0, 32(%rcx,%rbx)
	.loc	1 428 29 is_stmt 0              # implicit.c:428:29
	jne	.LBB8_10
.Ltmp172:
# %bb.5:                                # %land.lhs.true
                                        #   in Loop: Header=BB8_3 Depth=2
	#DEBUG_VALUE: switch_arcs:num_del_arcs <- [DW_OP_plus_uconst 8] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:deleted_arcs <- $r15
	#DEBUG_VALUE: switch_arcs:arcnew <- $r14
	#DEBUG_VALUE: switch_arcs:thread <- [DW_OP_LLVM_entry_value 1] $r8d
	#DEBUG_VALUE: switch_arcs:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:count <- $r13
	#DEBUG_VALUE: switch_arcs:i <- [DW_OP_plus_uconst 24, DW_OP_deref] $rsp
	#DEBUG_VALUE: switch_arcs:j <- $r12
	.loc	1 428 0                         # implicit.c:428:0
	leaq	(%rcx,%rbx), %rdi
	.loc	1 428 44                        # implicit.c:428:44
	movq	56(%rcx,%rbx), %r8
	.loc	1 428 49                        # implicit.c:428:49
	cmpq	56(%r14), %r8
	.loc	1 428 67                        # implicit.c:428:67
	jge	.LBB8_7
.Ltmp173:
# %bb.6:                                # %land.lhs.true.if.then_crit_edge
                                        #   in Loop: Header=BB8_3 Depth=2
	#DEBUG_VALUE: switch_arcs:num_del_arcs <- [DW_OP_plus_uconst 8] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:deleted_arcs <- $r15
	#DEBUG_VALUE: switch_arcs:arcnew <- $r14
	#DEBUG_VALUE: switch_arcs:thread <- [DW_OP_LLVM_entry_value 1] $r8d
	#DEBUG_VALUE: switch_arcs:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:count <- $r13
	#DEBUG_VALUE: switch_arcs:i <- [DW_OP_plus_uconst 24, DW_OP_deref] $rsp
	#DEBUG_VALUE: switch_arcs:j <- $r12
	.loc	1 431 17 is_stmt 1              # implicit.c:431:17
	movl	(%rdi), %r10d
.Ltmp174:
.LBB8_9:                                # %if.then
                                        #   in Loop: Header=BB8_3 Depth=2
	#DEBUG_VALUE: switch_arcs:num_del_arcs <- [DW_OP_plus_uconst 8] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:deleted_arcs <- $r15
	#DEBUG_VALUE: switch_arcs:arcnew <- $r14
	#DEBUG_VALUE: switch_arcs:thread <- [DW_OP_LLVM_entry_value 1] $r8d
	#DEBUG_VALUE: switch_arcs:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:count <- $r13
	#DEBUG_VALUE: switch_arcs:i <- [DW_OP_plus_uconst 24, DW_OP_deref] $rsp
	#DEBUG_VALUE: switch_arcs:j <- $r12
	#DEBUG_VALUE: switch_arcs:copy <- [DW_OP_LLVM_fragment 0 32] $r10d
	#DEBUG_VALUE: switch_arcs:copy <- [DW_OP_LLVM_fragment 32 32] undef
	movq	8(%rcx,%rbx), %rax
.Ltmp175:
	#DEBUG_VALUE: switch_arcs:copy <- [DW_OP_LLVM_fragment 64 64] $rax
	movq	16(%rcx,%rbx), %r9
.Ltmp176:
	#DEBUG_VALUE: switch_arcs:copy <- [DW_OP_LLVM_fragment 128 64] $r9
	movq	24(%rcx,%rbx), %rdx
.Ltmp177:
	#DEBUG_VALUE: switch_arcs:copy <- [DW_OP_LLVM_fragment 192 64] $rdx
	#DEBUG_VALUE: switch_arcs:copy <- [DW_OP_LLVM_fragment 448 64] $r8
	#DEBUG_VALUE: switch_arcs:copy <- [DW_OP_LLVM_fragment 512 64] undef
	.loc	1 432 15                        # implicit.c:432:15
	incq	%r13
.Ltmp178:
	#DEBUG_VALUE: switch_arcs:count <- $r13
	.loc	1 433 22                        # implicit.c:433:22
	pushq	$9
.Ltmp179:
	.cfi_adjust_cfa_offset 8
	popq	%rcx
	.cfi_adjust_cfa_offset -8
	movq	%r14, %rsi
	rep;movsq (%rsi), %es:(%rdi)
	.loc	1 434 113                       # implicit.c:434:113
	movslq	%r10d, %rcx
	.loc	1 434 10 is_stmt 0              # implicit.c:434:10
	movq	%rcx, (%rsp)
	movq	%r14, %rdi
	movq	%r9, %rsi
	movq	%rax, %rcx
	movq	32(%rsp), %r9                   # 8-byte Reload
.Ltmp180:
	callq	replace_weaker_arc
.Ltmp181:
	.loc	1 0 10                          # implicit.c:0:10
	jmp	.LBB8_10
.Ltmp182:
.LBB8_7:                                # %lor.lhs.false
                                        #   in Loop: Header=BB8_3 Depth=2
	#DEBUG_VALUE: switch_arcs:num_del_arcs <- [DW_OP_plus_uconst 8] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:deleted_arcs <- $r15
	#DEBUG_VALUE: switch_arcs:arcnew <- $r14
	#DEBUG_VALUE: switch_arcs:thread <- [DW_OP_LLVM_entry_value 1] $r8d
	#DEBUG_VALUE: switch_arcs:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:count <- $r13
	#DEBUG_VALUE: switch_arcs:i <- [DW_OP_plus_uconst 24, DW_OP_deref] $rsp
	#DEBUG_VALUE: switch_arcs:j <- $r12
	.loc	1 428 104 is_stmt 1             # implicit.c:428:104
	jne	.LBB8_10
.Ltmp183:
# %bb.8:                                # %land.lhs.true20
                                        #   in Loop: Header=BB8_3 Depth=2
	#DEBUG_VALUE: switch_arcs:num_del_arcs <- [DW_OP_plus_uconst 8] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:deleted_arcs <- $r15
	#DEBUG_VALUE: switch_arcs:arcnew <- $r14
	#DEBUG_VALUE: switch_arcs:thread <- [DW_OP_LLVM_entry_value 1] $r8d
	#DEBUG_VALUE: switch_arcs:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:count <- $r13
	#DEBUG_VALUE: switch_arcs:i <- [DW_OP_plus_uconst 24, DW_OP_deref] $rsp
	#DEBUG_VALUE: switch_arcs:j <- $r12
	.loc	1 429 22                        # implicit.c:429:22
	movl	(%rdi), %r10d
	.loc	1 429 25 is_stmt 0              # implicit.c:429:25
	cmpl	(%r14), %r10d
.Ltmp184:
	.loc	1 428 12 is_stmt 1              # implicit.c:428:12
	jl	.LBB8_9
.Ltmp185:
.LBB8_10:                               # %for.inc
                                        #   in Loop: Header=BB8_3 Depth=2
	#DEBUG_VALUE: switch_arcs:num_del_arcs <- [DW_OP_plus_uconst 8] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:deleted_arcs <- $r15
	#DEBUG_VALUE: switch_arcs:arcnew <- $r14
	#DEBUG_VALUE: switch_arcs:thread <- [DW_OP_LLVM_entry_value 1] $r8d
	#DEBUG_VALUE: switch_arcs:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:count <- $r13
	#DEBUG_VALUE: switch_arcs:i <- [DW_OP_plus_uconst 24, DW_OP_deref] $rsp
	#DEBUG_VALUE: switch_arcs:j <- $r12
	#DEBUG_VALUE: switch_arcs:count <- $r13
	#DEBUG_VALUE: switch_arcs:h <- [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	.loc	1 423 6                         # implicit.c:423:6
	addq	$72, %rbx
	jmp	.LBB8_3
.Ltmp186:
.LBB8_11:                               # %for.inc30
                                        #   in Loop: Header=BB8_1 Depth=1
	#DEBUG_VALUE: switch_arcs:num_del_arcs <- [DW_OP_plus_uconst 8] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:deleted_arcs <- $r15
	#DEBUG_VALUE: switch_arcs:arcnew <- $r14
	#DEBUG_VALUE: switch_arcs:thread <- [DW_OP_LLVM_entry_value 1] $r8d
	#DEBUG_VALUE: switch_arcs:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:count <- $r13
	#DEBUG_VALUE: switch_arcs:i <- [DW_OP_plus_uconst 24, DW_OP_deref] $rsp
	#DEBUG_VALUE: switch_arcs:j <- $r12
	.loc	1 0 6 is_stmt 0                 # implicit.c:0:6
	movq	24(%rsp), %rcx                  # 8-byte Reload
	.loc	1 417 46 is_stmt 1              # implicit.c:417:46
	incq	%rcx
.Ltmp187:
	#DEBUG_VALUE: switch_arcs:i <- $rcx
	.loc	1 417 57 is_stmt 0              # implicit.c:417:57
	incq	%r12
.Ltmp188:
	.loc	1 417 62                        # implicit.c:417:62
	movq	%r12, %rax
	cqto
	idivq	104(%rsp)
	movq	%rdx, %r12
.Ltmp189:
	#DEBUG_VALUE: switch_arcs:j <- undef
	.loc	1 0 62                          # implicit.c:0:62
	jmp	.LBB8_1
.Ltmp190:
.LBB8_12:                               # %for.end32
	#DEBUG_VALUE: switch_arcs:num_del_arcs <- [DW_OP_plus_uconst 8] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:deleted_arcs <- $r15
	#DEBUG_VALUE: switch_arcs:arcnew <- $r14
	#DEBUG_VALUE: switch_arcs:thread <- [DW_OP_LLVM_entry_value 1] $r8d
	#DEBUG_VALUE: switch_arcs:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 32] [$rsp+0]
	#DEBUG_VALUE: switch_arcs:count <- $r13
	#DEBUG_VALUE: switch_arcs:i <- $rcx
	#DEBUG_VALUE: switch_arcs:j <- $r12
	.loc	1 440 4 is_stmt 1               # implicit.c:440:4
	movq	%r13, %rax
	.loc	1 440 4 epilogue_begin is_stmt 0 # implicit.c:440:4
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
.Ltmp191:
	.cfi_def_cfa_offset 40
	popq	%r13
.Ltmp192:
	#DEBUG_VALUE: switch_arcs:count <- $rax
	.cfi_def_cfa_offset 32
	popq	%r14
.Ltmp193:
	#DEBUG_VALUE: switch_arcs:arcnew <- [DW_OP_LLVM_entry_value 1] $rcx
	.cfi_def_cfa_offset 24
	popq	%r15
.Ltmp194:
	#DEBUG_VALUE: switch_arcs:deleted_arcs <- [DW_OP_LLVM_entry_value 1] $rdx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Ltmp195:
.Lfunc_end8:
	.size	switch_arcs, .Lfunc_end8-switch_arcs
	.cfi_endproc
                                        # -- End function
	.globl	price_out_impl                  # -- Begin function price_out_impl
	.type	price_out_impl,@function
price_out_impl:                         # @price_out_impl
.Lfunc_begin9:
	.loc	1 449 0 is_stmt 1               # implicit.c:449:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: price_out_impl:net <- $rdi
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
	subq	$216, %rsp
	.cfi_def_cfa_offset 272
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
.Ltmp196:
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	.loc	1 452 10 prologue_end           # implicit.c:452:10
	andq	$0, 192(%rsp)
.Ltmp197:
	#DEBUG_VALUE: price_out_impl:resized <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- 1
	#DEBUG_VALUE: price_out_impl:count <- 0
	.loc	1 471 33                        # implicit.c:471:33
	movq	528(%rdi), %rax
.Ltmp198:
	#DEBUG_VALUE: price_out_impl:bigM <- $rax
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	.loc	1 0 33 is_stmt 0                # implicit.c:0:33
	movq	%rax, 168(%rsp)                 # 8-byte Spill
.Ltmp199:
	#DEBUG_VALUE: price_out_impl:bigM <- [DW_OP_plus_uconst 168, DW_OP_deref] $rsp
	pushq	$8
.Ltmp200:
	.cfi_adjust_cfa_offset 8
	popq	%rbx
	.cfi_adjust_cfa_offset -8
	.loc	1 487 30 is_stmt 1              # implicit.c:487:30
	movq	%rbx, %rdi
.Ltmp201:
	#DEBUG_VALUE: price_out_impl:net <- $r14
	callq	malloc@PLT
.Ltmp202:
	.loc	1 0 30 is_stmt 0                # implicit.c:0:30
	movq	%rax, 80(%rsp)                  # 8-byte Spill
.Ltmp203:
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	.loc	1 488 28 is_stmt 1              # implicit.c:488:28
	movq	%rbx, %rdi
	callq	malloc@PLT
.Ltmp204:
	movq	%rax, %r15
.Ltmp205:
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- $r15
	.loc	1 489 37                        # implicit.c:489:37
	movq	%rbx, %rdi
	callq	malloc@PLT
.Ltmp206:
	.loc	1 0 37 is_stmt 0                # implicit.c:0:37
	movq	%rax, 64(%rsp)                  # 8-byte Spill
.Ltmp207:
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	.loc	1 490 29 is_stmt 1              # implicit.c:490:29
	movq	%rbx, %rdi
	callq	malloc@PLT
.Ltmp208:
	.loc	1 0 29 is_stmt 0                # implicit.c:0:29
	movq	%rax, 88(%rsp)                  # 8-byte Spill
.Ltmp209:
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:bigM_minus_min_impl_duration <- undef
	.loc	1 501 14 is_stmt 1              # implicit.c:501:14
	movq	408(%r14), %rcx
	.loc	1 0 0 is_stmt 0                 # implicit.c:0:0
	movq	416(%r14), %rax
	movq	424(%r14), %rdx
	movq	456(%r14), %rsi
	addq	%rdx, %rsi
	pushq	$-1
.Ltmp210:
	.cfi_adjust_cfa_offset 8
	popq	%rbx
	.cfi_adjust_cfa_offset -8
	movb	$1, %dil
	.loc	1 501 22                        # implicit.c:501:22
	cmpq	$15000, %rcx                    # imm = 0x3A98
	.loc	1 0 0                           # implicit.c:0:0
	cmpq	%rax, %rsi
	jle	.LBB9_4
.Ltmp211:
# %bb.1:                                # %land.lhs.true25
	#DEBUG_VALUE: price_out_impl:net <- $r14
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:resized <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- 1
	#DEBUG_VALUE: price_out_impl:count <- 0
	#DEBUG_VALUE: price_out_impl:bigM <- [DW_OP_plus_uconst 168, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- $r15
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	imulq	%rcx, %rcx
	shrq	%rcx
	addq	%rcx, %rdx
	cmpq	%rax, %rdx
	jle	.LBB9_4
.Ltmp212:
# %bb.2:                                # %if.then34
	#DEBUG_VALUE: price_out_impl:net <- $r14
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:resized <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- 1
	#DEBUG_VALUE: price_out_impl:count <- 0
	#DEBUG_VALUE: price_out_impl:bigM <- [DW_OP_plus_uconst 168, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- $r15
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:resized <- 1
	movq	%r14, %rdi
	callq	resize_prob
.Ltmp213:
	testq	%rax, %rax
	jne	.LBB9_59
.Ltmp214:
# %bb.3:                                # %if.end40.sink.split
	#DEBUG_VALUE: price_out_impl:net <- $r14
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:resized <- 1
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- 1
	#DEBUG_VALUE: price_out_impl:count <- 0
	#DEBUG_VALUE: price_out_impl:bigM <- [DW_OP_plus_uconst 168, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- $r15
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	movq	getOriginalArcPosition@GOTPCREL(%rip), %rsi
	movq	%r14, %rdi
	callq	refresh_neighbour_lists@PLT
.Ltmp215:
	xorl	%edi, %edi
.Ltmp216:
.LBB9_4:                                # %if.end40
	#DEBUG_VALUE: price_out_impl:net <- $r14
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- 1
	#DEBUG_VALUE: price_out_impl:count <- 0
	#DEBUG_VALUE: price_out_impl:bigM <- [DW_OP_plus_uconst 168, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- $r15
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:resized <- undef
	.loc	1 530 14 is_stmt 1              # implicit.c:530:14
	movq	408(%r14), %rax
.Ltmp217:
	.loc	1 535 25                        # implicit.c:535:25
	movq	584(%r14), %rcx
.Ltmp218:
	#DEBUG_VALUE: price_out_impl:sorted_array <- $rcx
	.loc	1 0 25 is_stmt 0                # implicit.c:0:25
	movq	%rax, 184(%rsp)                 # 8-byte Spill
.Ltmp219:
	.loc	1 530 22 is_stmt 1              # implicit.c:530:22
	cmpq	$15001, %rax                    # imm = 0x3A99
	movl	$1000, %eax                     # imm = 0x3E8
	movl	$2000, %edx                     # imm = 0x7D0
	cmovlq	%rax, %rdx
.Ltmp220:
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- $rdx
	.loc	1 0 22 is_stmt 0                # implicit.c:0:22
	movq	%rdx, 208(%rsp)                 # 8-byte Spill
.Ltmp221:
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	.loc	1 536 10 is_stmt 1              # implicit.c:536:10
	testq	%rcx, %rcx
.Ltmp222:
	.loc	1 536 9 is_stmt 0               # implicit.c:536:9
	je	.LBB9_59
.Ltmp223:
# %bb.5:                                # %if.end48
	#DEBUG_VALUE: price_out_impl:net <- $r14
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- 1
	#DEBUG_VALUE: price_out_impl:count <- 0
	#DEBUG_VALUE: price_out_impl:bigM <- [DW_OP_plus_uconst 168, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- $r15
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- $rcx
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:first_replace <- 1
	.loc	1 0 9                           # implicit.c:0:9
	movl	%edi, 148(%rsp)                 # 4-byte Spill
	.loc	1 540 21 is_stmt 1              # implicit.c:540:21
	movq	416(%r14), %rax
.Ltmp224:
	#DEBUG_VALUE: price_out_impl:size_del <- $rax
	.loc	1 0 21 is_stmt 0                # implicit.c:0:21
	movq	%rax, 120(%rsp)                 # 8-byte Spill
.Ltmp225:
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	.loc	1 538 42 is_stmt 1              # implicit.c:538:42
	movq	448(%r14), %rbx
.Ltmp226:
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- $rbx
	#DEBUG_VALUE: price_out_impl:local_first_replace <- 1
	#DEBUG_VALUE: price_out_impl:max_redcost <- 0
	.loc	1 547 19                        # implicit.c:547:19
	andq	$0, 136(%rsp)
	#DEBUG_VALUE: price_out_impl:count <- 0
.Ltmp227:
	#DEBUG_VALUE: price_out_impl:thread <- 0
	.loc	1 0 19 is_stmt 0                # implicit.c:0:19
	movq	88(%rsp), %rax                  # 8-byte Reload
	movq	%rcx, 96(%rsp)                  # 8-byte Spill
.Ltmp228:
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	.loc	1 556 28 is_stmt 1              # implicit.c:556:28
	movq	%rcx, (%rax)
	movq	80(%rsp), %rax                  # 8-byte Reload
	.loc	1 558 32                        # implicit.c:558:32
	andq	$0, (%rax)
	.loc	1 559 21                        # implicit.c:559:21
	movq	576(%r14), %r12
.Ltmp229:
	#DEBUG_VALUE: price_out_impl:arcnew <- $r12
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- 0
	#DEBUG_VALUE: price_out_impl:list_size <- -1
	.loc	1 0 21 is_stmt 0                # implicit.c:0:21
	pushq	$8
.Ltmp230:
	.cfi_adjust_cfa_offset 8
	popq	%rsi
	.cfi_adjust_cfa_offset -8
	.loc	1 563 46 is_stmt 1              # implicit.c:563:46
	movq	%rbx, %rdi
	callq	calloc@PLT
.Ltmp231:
	.loc	1 0 46 is_stmt 0                # implicit.c:0:46
	movq	64(%rsp), %rcx                  # 8-byte Reload
	.loc	1 563 35                        # implicit.c:563:35
	movq	%rax, (%rcx)
	xorl	%ecx, %ecx
.Ltmp232:
	#DEBUG_VALUE: price_out_impl:i <- 0
	.loc	1 566 12 is_stmt 1              # implicit.c:566:12
	testq	%rbx, %rbx
	movl	$0, %edx
	movq	%rbx, 112(%rsp)                 # 8-byte Spill
.Ltmp233:
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	cmovgq	%rbx, %rdx
	movq	%r12, 104(%rsp)                 # 8-byte Spill
.Ltmp234:
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	.loc	1 0 12 is_stmt 0                # implicit.c:0:12
	movq	%r12, %rsi
.Ltmp235:
.LBB9_6:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: price_out_impl:net <- $r14
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- 1
	#DEBUG_VALUE: price_out_impl:count <- 0
	#DEBUG_VALUE: price_out_impl:bigM <- [DW_OP_plus_uconst 168, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- $r15
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- 1
	#DEBUG_VALUE: price_out_impl:max_redcost <- 0
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- 0
	#DEBUG_VALUE: price_out_impl:list_size <- -1
	#DEBUG_VALUE: price_out_impl:i <- $rcx
	.loc	1 566 21                        # implicit.c:566:21
	cmpq	%rcx, %rdx
.Ltmp236:
	.loc	1 566 7                         # implicit.c:566:7
	je	.LBB9_8
.Ltmp237:
# %bb.7:                                # %for.body
                                        #   in Loop: Header=BB9_6 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- $r14
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- 1
	#DEBUG_VALUE: price_out_impl:count <- 0
	#DEBUG_VALUE: price_out_impl:bigM <- [DW_OP_plus_uconst 168, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- $r15
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- 1
	#DEBUG_VALUE: price_out_impl:max_redcost <- 0
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- 0
	#DEBUG_VALUE: price_out_impl:list_size <- -1
	#DEBUG_VALUE: price_out_impl:i <- $rcx
	.loc	1 567 40 is_stmt 1              # implicit.c:567:40
	movq	%rsi, (%rax,%rcx,8)
.Ltmp238:
	.loc	1 566 55                        # implicit.c:566:55
	incq	%rcx
.Ltmp239:
	#DEBUG_VALUE: price_out_impl:i <- $rcx
	.loc	1 566 7 is_stmt 0               # implicit.c:566:7
	addq	$72, %rsi
	jmp	.LBB9_6
.Ltmp240:
.LBB9_8:                                # %for.end
	#DEBUG_VALUE: price_out_impl:net <- $r14
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- 1
	#DEBUG_VALUE: price_out_impl:count <- 0
	#DEBUG_VALUE: price_out_impl:bigM <- [DW_OP_plus_uconst 168, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- $r15
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- 1
	#DEBUG_VALUE: price_out_impl:max_redcost <- 0
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- 0
	#DEBUG_VALUE: price_out_impl:list_size <- -1
	#DEBUG_VALUE: price_out_impl:i <- $rcx
	.loc	1 0 7                           # implicit.c:0:7
	movq	%r15, 40(%rsp)                  # 8-byte Spill
.Ltmp241:
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	.loc	1 570 21 is_stmt 1              # implicit.c:570:21
	movq	568(%r14), %r15
.Ltmp242:
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	.loc	1 0 21 is_stmt 0                # implicit.c:0:21
	xorl	%eax, %eax
.Ltmp243:
	#DEBUG_VALUE: price_out_impl:i <- 0
	movq	184(%rsp), %rcx                 # 8-byte Reload
.Ltmp244:
	.loc	1 571 12 is_stmt 1              # implicit.c:571:12
	testq	%rcx, %rcx
	movl	$0, %ebx
	cmovgq	%rcx, %rbx
	movq	%r14, 200(%rsp)                 # 8-byte Spill
.Ltmp245:
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
.LBB9_9:                                # %for.cond70
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- 1
	#DEBUG_VALUE: price_out_impl:count <- 0
	#DEBUG_VALUE: price_out_impl:bigM <- [DW_OP_plus_uconst 168, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- 1
	#DEBUG_VALUE: price_out_impl:max_redcost <- 0
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- 0
	#DEBUG_VALUE: price_out_impl:list_size <- -1
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:i <- $rax
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	.loc	1 571 21 is_stmt 0              # implicit.c:571:21
	cmpq	%rax, %rbx
	.loc	1 571 29                        # implicit.c:571:29
	je	.LBB9_12
.Ltmp246:
# %bb.10:                               # %land.rhs
                                        #   in Loop: Header=BB9_9 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- 1
	#DEBUG_VALUE: price_out_impl:count <- 0
	#DEBUG_VALUE: price_out_impl:bigM <- [DW_OP_plus_uconst 168, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- 1
	#DEBUG_VALUE: price_out_impl:max_redcost <- 0
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- 0
	#DEBUG_VALUE: price_out_impl:list_size <- -1
	#DEBUG_VALUE: price_out_impl:i <- $rax
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	.loc	1 571 48                        # implicit.c:571:48
	cmpw	$-1, 104(%r15)
.Ltmp247:
	.loc	1 571 7                         # implicit.c:571:7
	jne	.LBB9_11
.Ltmp248:
# %bb.60:                               # %for.inc78
                                        #   in Loop: Header=BB9_9 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- 1
	#DEBUG_VALUE: price_out_impl:count <- 0
	#DEBUG_VALUE: price_out_impl:bigM <- [DW_OP_plus_uconst 168, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- 1
	#DEBUG_VALUE: price_out_impl:max_redcost <- 0
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- 0
	#DEBUG_VALUE: price_out_impl:list_size <- -1
	#DEBUG_VALUE: price_out_impl:i <- $rax
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	.loc	1 571 59                        # implicit.c:571:59
	incq	%rax
.Ltmp249:
	#DEBUG_VALUE: price_out_impl:i <- $rax
	.loc	1 571 70                        # implicit.c:571:70
	addq	$216, %r15
.Ltmp250:
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	.loc	1 0 70                          # implicit.c:0:70
	jmp	.LBB9_9
.Ltmp251:
.LBB9_11:
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- 1
	#DEBUG_VALUE: price_out_impl:count <- 0
	#DEBUG_VALUE: price_out_impl:bigM <- [DW_OP_plus_uconst 168, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- 1
	#DEBUG_VALUE: price_out_impl:max_redcost <- 0
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- 0
	#DEBUG_VALUE: price_out_impl:list_size <- -1
	#DEBUG_VALUE: price_out_impl:i <- $rax
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	movq	%rax, %rbx
.Ltmp252:
	#DEBUG_VALUE: price_out_impl:i <- $rbx
.LBB9_12:                               # %for.end81
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- 1
	#DEBUG_VALUE: price_out_impl:count <- 0
	#DEBUG_VALUE: price_out_impl:bigM <- [DW_OP_plus_uconst 168, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- 1
	#DEBUG_VALUE: price_out_impl:max_redcost <- 0
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- 0
	#DEBUG_VALUE: price_out_impl:list_size <- -1
	#DEBUG_VALUE: price_out_impl:i <- $rax
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- 0
	addq	$-15, 168(%rsp)                 # 8-byte Folded Spill
.Ltmp253:
	#DEBUG_VALUE: price_out_impl:bigM <- undef
	pushq	$-1
.Ltmp254:
	.cfi_adjust_cfa_offset 8
	popq	%rax
.Ltmp255:
	.cfi_adjust_cfa_offset -8
	movq	%rax, 176(%rsp)                 # 8-byte Spill
	movw	$1, %ax
	movl	%eax, 76(%rsp)                  # 4-byte Spill
	xorl	%r14d, %r14d
	xorl	%eax, %eax
	movq	%rax, 56(%rsp)                  # 8-byte Spill
	xorl	%esi, %esi
	xorl	%r12d, %r12d
	xorl	%eax, %eax
	movq	%rax, 48(%rsp)                  # 8-byte Spill
	movw	$1, %r13w
	xorl	%ebp, %ebp
.Ltmp256:
.LBB9_13:                               # %for.cond82
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_26 Depth 2
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:i <- $rbx
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	.loc	1 574 16 is_stmt 1              # implicit.c:574:16
	cmpq	184(%rsp), %rbx                 # 8-byte Folded Reload
.Ltmp257:
	.loc	1 574 7 is_stmt 0               # implicit.c:574:7
	jge	.LBB9_42
.Ltmp258:
# %bb.14:                               # %for.body85
                                        #   in Loop: Header=BB9_13 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- $rbx
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	.loc	1 576 14 is_stmt 1              # implicit.c:576:14
	testw	%r13w, %r13w
	movq	%rsi, 24(%rsp)                  # 8-byte Spill
.Ltmp259:
	.loc	1 576 13 is_stmt 0              # implicit.c:576:13
	jne	.LBB9_16
.Ltmp260:
# %bb.15:                               # %if.then87
                                        #   in Loop: Header=BB9_13 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- $rbx
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:max_redcost <- [DW_OP_plus_uconst 136, DW_OP_deref] $rsp
	.loc	1 577 13 is_stmt 1              # implicit.c:577:13
	leaq	136(%rsp), %rsi
	movq	64(%rsp), %rdx                  # 8-byte Reload
	pushq	$1
.Ltmp261:
	.cfi_adjust_cfa_offset 8
	popq	%rcx
	.cfi_adjust_cfa_offset -8
	callq	calculate_max_redcost
.Ltmp262:
	.loc	1 0 13 is_stmt 0                # implicit.c:0:13
	movq	24(%rsp), %rsi                  # 8-byte Reload
.Ltmp263:
.LBB9_16:                               # %if.end88
                                        #   in Loop: Header=BB9_13 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- $rbx
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	.loc	1 580 16 is_stmt 1              # implicit.c:580:16
	movq	%rbx, %rax
	xorl	%edx, %edx
	divq	208(%rsp)                       # 8-byte Folded Reload
	.loc	1 580 40 is_stmt 0              # implicit.c:580:40
	testq	%rdx, %rdx
.Ltmp264:
	.loc	1 580 14                        # implicit.c:580:14
	jne	.LBB9_20
.Ltmp265:
# %bb.17:                               # %if.then91
                                        #   in Loop: Header=BB9_13 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- $rbx
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:max_redcost <- [DW_OP_plus_uconst 136, DW_OP_deref] $rsp
	.loc	1 584 13 is_stmt 1              # implicit.c:584:13
	leaq	136(%rsp), %rsi
	movq	64(%rsp), %rdx                  # 8-byte Reload
	pushq	$1
.Ltmp266:
	.cfi_adjust_cfa_offset 8
	popq	%rcx
	.cfi_adjust_cfa_offset -8
	callq	calculate_max_redcost
.Ltmp267:
	.loc	1 576 14                        # implicit.c:576:14
	testw	%r13w, %r13w
.Ltmp268:
	.loc	1 585 17                        # implicit.c:585:17
	jne	.LBB9_19
.Ltmp269:
# %bb.18:                               # %if.then93
                                        #   in Loop: Header=BB9_13 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- $rbx
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	.loc	1 0 17 is_stmt 0                # implicit.c:0:17
	movq	%rbx, 128(%rsp)                 # 8-byte Spill
.Ltmp270:
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	movq	40(%rsp), %rbx                  # 8-byte Reload
	movq	48(%rsp), %rax                  # 8-byte Reload
.Ltmp271:
	.loc	1 587 36 is_stmt 1              # implicit.c:587:36
	movq	%rax, (%rbx)
	movq	120(%rsp), %rax                 # 8-byte Reload
	.loc	1 588 15                        # implicit.c:588:15
	movq	%rax, (%rsp)
	movq	$1, 8(%rsp)
	movq	%rbx, %rsi
	movq	88(%rsp), %rdx                  # 8-byte Reload
	movq	104(%rsp), %rcx                 # 8-byte Reload
	xorl	%r8d, %r8d
	movq	112(%rsp), %r9                  # 8-byte Reload
	callq	switch_arcs
.Ltmp272:
	#DEBUG_VALUE: price_out_impl:count <- 0
	.loc	1 590 36                        # implicit.c:590:36
	andq	$0, (%rbx)
	movq	128(%rsp), %rbx                 # 8-byte Reload
	xorl	%r14d, %r14d
	xorl	%eax, %eax
	movq	%rax, 56(%rsp)                  # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 48(%rsp)                  # 8-byte Spill
.Ltmp273:
.LBB9_19:                               # %if.end100
                                        #   in Loop: Header=BB9_13 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- $rbx
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	.loc	1 0 36 is_stmt 0                # implicit.c:0:36
	movq	24(%rsp), %rsi                  # 8-byte Reload
.Ltmp274:
.LBB9_20:                               # %if.end100
                                        #   in Loop: Header=BB9_13 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- $rbx
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	.loc	1 594 29 is_stmt 1              # implicit.c:594:29
	cmpw	$-1, 104(%r15)
	movl	%r13d, 36(%rsp)                 # 4-byte Spill
.Ltmp275:
	#DEBUG_VALUE: price_out_impl:first_replace <- [DW_OP_plus_uconst 36, DW_OP_deref] $rsp
	.loc	1 594 13 is_stmt 0              # implicit.c:594:13
	je	.LBB9_22
.Ltmp276:
# %bb.21:                               # %if.then106
                                        #   in Loop: Header=BB9_13 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- [DW_OP_plus_uconst 36, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- $rbx
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	.loc	1 0 13                          # implicit.c:0:13
	movq	%rbx, %r13
.Ltmp277:
	#DEBUG_VALUE: price_out_impl:i <- $r13
	.loc	1 594 13                        # implicit.c:594:13
	leaq	72(%r15), %rbx
.Ltmp278:
	.loc	1 596 40 is_stmt 1              # implicit.c:596:40
	pushq	$1
.Ltmp279:
	.cfi_adjust_cfa_offset 8
	popq	%rdi
	.cfi_adjust_cfa_offset -8
	pushq	$16
	.cfi_adjust_cfa_offset 8
	popq	%rsi
	.cfi_adjust_cfa_offset -8
	callq	calloc@PLT
.Ltmp280:
	.loc	1 0 40 is_stmt 0                # implicit.c:0:40
	movq	24(%rsp), %rsi                  # 8-byte Reload
.Ltmp281:
	#DEBUG_VALUE: price_out_impl:new_list_elem <- $rax
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $rax
	.loc	1 597 31 is_stmt 1              # implicit.c:597:31
	movq	%r12, 8(%rax)
	.loc	1 598 30                        # implicit.c:598:30
	movq	%rbx, (%rax)
	movq	%r13, %rbx
.Ltmp282:
	#DEBUG_VALUE: price_out_impl:i <- $rbx
	.loc	1 0 30 is_stmt 0                # implicit.c:0:30
	movl	36(%rsp), %r13d                 # 4-byte Reload
	.loc	1 600 20 is_stmt 1              # implicit.c:600:20
	incq	176(%rsp)                       # 8-byte Folded Spill
.Ltmp283:
	#DEBUG_VALUE: price_out_impl:list_size <- undef
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	.loc	1 0 20 is_stmt 0                # implicit.c:0:20
	movq	%rax, %r12
.Ltmp284:
	#DEBUG_VALUE: price_out_impl:new_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
.LBB9_22:                               # %if.end111
                                        #   in Loop: Header=BB9_13 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- [DW_OP_plus_uconst 36, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- $rbx
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	.loc	1 603 27 is_stmt 1              # implicit.c:603:27
	cmpw	$-1, 32(%r15)
	.loc	1 603 36 is_stmt 0              # implicit.c:603:36
	je	.LBB9_23
.Ltmp285:
# %bb.25:                               # %if.end122
                                        #   in Loop: Header=BB9_13 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- [DW_OP_plus_uconst 36, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- $rbx
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	.loc	1 0 36                          # implicit.c:0:36
	movq	%rbx, 128(%rsp)                 # 8-byte Spill
.Ltmp286:
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	.loc	1 609 24 is_stmt 1              # implicit.c:609:24
	movq	24(%r15), %r10
.Ltmp287:
	#DEBUG_VALUE: price_out_impl:head <- $r10
	.loc	1 0 24 is_stmt 0                # implicit.c:0:24
	movq	168(%rsp), %r13                 # 8-byte Reload
.Ltmp288:
	.loc	1 497 49 is_stmt 1              # implicit.c:497:49
	subq	64(%r15), %r13
.Ltmp289:
	.loc	1 610 24                        # implicit.c:610:24
	movslq	100(%r10), %rax
	.loc	1 611 13                        # implicit.c:611:13
	addq	%rax, %r13
.Ltmp290:
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	#DEBUG_VALUE: price_out_impl:head_potential <- undef
	#DEBUG_VALUE: price_out_impl:iterator <- undef
	.loc	1 0 13 is_stmt 0                # implicit.c:0:13
	movq	136(%rsp), %rdi
	movq	%r12, %rbx
.Ltmp291:
.LBB9_26:                               # %while.cond
                                        #   Parent Loop BB9_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:head <- $r10
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	movq	8(%rbx), %rbx
.Ltmp292:
	#DEBUG_VALUE: price_out_impl:iterator <- $rbx
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:first_replace <- undef
	#DEBUG_VALUE: price_out_impl:local_first_replace <- undef
	#DEBUG_VALUE: price_out_impl:count <- undef
	.loc	1 616 9 is_stmt 1               # implicit.c:616:9
	testq	%rbx, %rbx
	je	.LBB9_27
.Ltmp293:
# %bb.28:                               # %while.body
                                        #   in Loop: Header=BB9_26 Depth=2
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:head <- $r10
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	#DEBUG_VALUE: price_out_impl:iterator <- $rbx
	.loc	1 619 29                        # implicit.c:619:29
	movq	(%rbx), %rax
.Ltmp294:
	#DEBUG_VALUE: price_out_impl:arcin <- $rax
	.loc	1 620 25                        # implicit.c:620:25
	movq	16(%rax), %rdx
.Ltmp295:
	#DEBUG_VALUE: price_out_impl:tail <- $rdx
	.loc	1 622 21                        # implicit.c:622:21
	movslq	100(%rdx), %rcx
	.loc	1 622 26 is_stmt 0              # implicit.c:622:26
	addq	64(%rax), %rcx
	.loc	1 622 44                        # implicit.c:622:44
	cmpq	%r13, %rcx
.Ltmp296:
	.loc	1 622 15                        # implicit.c:622:15
	jle	.LBB9_30
.Ltmp297:
.LBB9_29:                               # %if.then137
                                        #   in Loop: Header=BB9_26 Depth=2
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:head <- $r10
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	#DEBUG_VALUE: price_out_impl:iterator <- $rbx
	#DEBUG_VALUE: price_out_impl:iterator <- undef
	.loc	1 0 0                           # implicit.c:0:0
	incq	%rbp
.Ltmp298:
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	jmp	.LBB9_26
.Ltmp299:
.LBB9_30:                               # %if.end140
                                        #   in Loop: Header=BB9_26 Depth=2
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:head <- $r10
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	#DEBUG_VALUE: price_out_impl:iterator <- $rbx
	#DEBUG_VALUE: price_out_impl:arcin <- $rax
	#DEBUG_VALUE: price_out_impl:tail <- $rdx
	.loc	1 629 57 is_stmt 1              # implicit.c:629:57
	movq	(%r10), %r9
	.loc	1 629 49 is_stmt 0              # implicit.c:629:49
	subq	(%rdx), %r9
.Ltmp300:
	.loc	1 631 24 is_stmt 1              # implicit.c:631:24
	addq	$30, %r9
.Ltmp301:
	#DEBUG_VALUE: price_out_impl:red_cost <- $r9
	.loc	1 631 15 is_stmt 0              # implicit.c:631:15
	jns	.LBB9_29
.Ltmp302:
# %bb.31:                               # %if.then147
                                        #   in Loop: Header=BB9_26 Depth=2
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:head <- $r10
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	#DEBUG_VALUE: price_out_impl:iterator <- $rbx
	#DEBUG_VALUE: price_out_impl:arcin <- $rax
	#DEBUG_VALUE: price_out_impl:tail <- $rdx
	#DEBUG_VALUE: price_out_impl:red_cost <- $r9
	.loc	1 634 40 is_stmt 1              # implicit.c:634:40
	cmpq	112(%rsp), %rsi                 # 8-byte Folded Reload
	movq	%r10, 160(%rsp)                 # 8-byte Spill
.Ltmp303:
	#DEBUG_VALUE: price_out_impl:head <- [DW_OP_plus_uconst 160, DW_OP_deref] $rsp
	.loc	1 0 40 is_stmt 0                # implicit.c:0:40
	movq	%rdi, 152(%rsp)                 # 8-byte Spill
.Ltmp304:
	.loc	1 634 17                        # implicit.c:634:17
	jge	.LBB9_33
.Ltmp305:
# %bb.32:                               # %if.then152
                                        #   in Loop: Header=BB9_26 Depth=2
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:head <- [DW_OP_plus_uconst 160, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	#DEBUG_VALUE: price_out_impl:iterator <- $rbx
	#DEBUG_VALUE: price_out_impl:arcin <- $rax
	#DEBUG_VALUE: price_out_impl:tail <- $rdx
	#DEBUG_VALUE: price_out_impl:red_cost <- $r9
	.loc	1 636 15 is_stmt 1              # implicit.c:636:15
	movq	%rbp, 8(%rsp)
	movq	104(%rsp), %rdi                 # 8-byte Reload
	movq	%rsi, 24(%rsp)                  # 8-byte Spill
	movq	24(%rsp), %rsi                  # 8-byte Reload
	movq	%r10, %rcx
	pushq	$30
.Ltmp306:
	.cfi_adjust_cfa_offset 8
	popq	%r8
	.cfi_adjust_cfa_offset -8
	callq	insert_new_arc
.Ltmp307:
	.loc	1 0 15 is_stmt 0                # implicit.c:0:15
	movq	24(%rsp), %rsi                  # 8-byte Reload
	.loc	1 638 37 is_stmt 1              # implicit.c:638:37
	incq	%rsi
	movq	80(%rsp), %rax                  # 8-byte Reload
	movq	%rsi, (%rax)
.Ltmp308:
.LBB9_36:                               #   in Loop: Header=BB9_26 Depth=2
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:head <- [DW_OP_plus_uconst 160, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	#DEBUG_VALUE: price_out_impl:iterator <- $rbx
	.loc	1 0 37 is_stmt 0                # implicit.c:0:37
	movq	%r14, %rdi
	jmp	.LBB9_38
.Ltmp309:
.LBB9_33:                               # %if.else159
                                        #   in Loop: Header=BB9_26 Depth=2
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:head <- [DW_OP_plus_uconst 160, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	#DEBUG_VALUE: price_out_impl:iterator <- $rbx
	#DEBUG_VALUE: price_out_impl:arcin <- $rax
	#DEBUG_VALUE: price_out_impl:tail <- $rdx
	#DEBUG_VALUE: price_out_impl:red_cost <- $r9
	movq	104(%rsp), %r8                  # 8-byte Reload
.Ltmp310:
	.loc	1 640 45 is_stmt 1              # implicit.c:640:45
	cmpq	%r9, 56(%r8)
.Ltmp311:
	.loc	1 640 22 is_stmt 0              # implicit.c:640:22
	jle	.LBB9_35
.Ltmp312:
# %bb.34:                               # %if.then163
                                        #   in Loop: Header=BB9_26 Depth=2
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:head <- [DW_OP_plus_uconst 160, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	#DEBUG_VALUE: price_out_impl:iterator <- $rbx
	#DEBUG_VALUE: price_out_impl:arcin <- $rax
	#DEBUG_VALUE: price_out_impl:tail <- $rdx
	#DEBUG_VALUE: price_out_impl:red_cost <- $r9
	.loc	1 0 22                          # implicit.c:0:22
	xorl	%eax, %eax
.Ltmp313:
	.loc	1 641 19 is_stmt 1              # implicit.c:641:19
	cmpw	$0, 76(%rsp)                    # 2-byte Folded Reload
	movl	36(%rsp), %ecx                  # 4-byte Reload
.Ltmp314:
	.loc	1 641 19 is_stmt 0              # implicit.c:641:19
	cmovnel	%eax, %ecx
.Ltmp315:
	#DEBUG_VALUE: price_out_impl:first_replace <- $cx
	#DEBUG_VALUE: price_out_impl:local_first_replace <- 0
	.loc	1 0 19                          # implicit.c:0:19
	movl	%ecx, 36(%rsp)                  # 4-byte Spill
.Ltmp316:
	#DEBUG_VALUE: price_out_impl:first_replace <- [DW_OP_plus_uconst 36, DW_OP_deref] $rsp
	movq	56(%rsp), %r14                  # 8-byte Reload
	.loc	1 646 15 is_stmt 1              # implicit.c:646:15
	imulq	$72, %r14, %rdi
	addq	96(%rsp), %rdi                  # 8-byte Folded Reload
	.loc	1 646 60 is_stmt 0              # implicit.c:646:60
	pushq	$9
.Ltmp317:
	.cfi_adjust_cfa_offset 8
	popq	%rcx
	.cfi_adjust_cfa_offset -8
	movq	%rsi, 24(%rsp)                  # 8-byte Spill
	movq	%r8, %rsi
	rep;movsq (%rsi), %es:(%rdi)
	.loc	1 647 35 is_stmt 1              # implicit.c:647:35
	incq	%r14
	movq	40(%rsp), %rax                  # 8-byte Reload
	movq	%r14, (%rax)
	.loc	1 648 20                        # implicit.c:648:20
	incq	48(%rsp)                        # 8-byte Folded Spill
.Ltmp318:
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	.loc	1 649 15                        # implicit.c:649:15
	movq	%rbp, (%rsp)
	movq	%r8, %rdi
	movq	%rdx, %rsi
	movq	%r10, %rdx
.Ltmp319:
	#DEBUG_VALUE: price_out_impl:tail <- $rsi
	pushq	$30
.Ltmp320:
	.cfi_adjust_cfa_offset 8
	popq	%rcx
	.cfi_adjust_cfa_offset -8
	movq	%r9, %r8
	movq	112(%rsp), %r9                  # 8-byte Reload
.Ltmp321:
	callq	replace_weaker_arc
.Ltmp322:
	.loc	1 0 15 is_stmt 0                # implicit.c:0:15
	movq	24(%rsp), %rsi                  # 8-byte Reload
	movq	%r14, %rdi
	movl	$0, 76(%rsp)                    # 4-byte Folded Spill
	jmp	.LBB9_38
.Ltmp323:
.LBB9_35:                               # %if.else177
                                        #   in Loop: Header=BB9_26 Depth=2
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:head <- [DW_OP_plus_uconst 160, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	#DEBUG_VALUE: price_out_impl:iterator <- $rbx
	#DEBUG_VALUE: price_out_impl:arcin <- $rax
	#DEBUG_VALUE: price_out_impl:tail <- $rdx
	#DEBUG_VALUE: price_out_impl:red_cost <- $r9
	#DEBUG_VALUE: price_out_impl:max_redcost <- [DW_OP_plus_uconst 152, DW_OP_deref] $rsp
	.loc	1 651 31 is_stmt 1              # implicit.c:651:31
	cmpq	%rdi, %r9
.Ltmp324:
	.loc	1 651 22 is_stmt 0              # implicit.c:651:22
	jge	.LBB9_36
.Ltmp325:
# %bb.37:                               # %if.then180
                                        #   in Loop: Header=BB9_26 Depth=2
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_redcost <- [DW_OP_plus_uconst 152, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:head <- [DW_OP_plus_uconst 160, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	#DEBUG_VALUE: price_out_impl:iterator <- $rbx
	#DEBUG_VALUE: price_out_impl:arcin <- $rax
	#DEBUG_VALUE: price_out_impl:tail <- $rdx
	#DEBUG_VALUE: price_out_impl:red_cost <- $r9
	.loc	1 0 22                          # implicit.c:0:22
	movq	56(%rsp), %rcx                  # 8-byte Reload
.Ltmp326:
	.loc	1 652 63 is_stmt 1              # implicit.c:652:63
	leaq	1(%rcx), %rdi
	movq	40(%rsp), %rax                  # 8-byte Reload
.Ltmp327:
	movq	%rdi, (%rax)
	.loc	1 652 22 is_stmt 0              # implicit.c:652:22
	imulq	$72, %rcx, %rax
.Ltmp328:
	#DEBUG_VALUE: price_out_impl:arc <- undef
	.loc	1 0 22                          # implicit.c:0:22
	movq	96(%rsp), %rcx                  # 8-byte Reload
	.loc	1 653 29 is_stmt 1              # implicit.c:653:29
	movq	%rdx, 16(%rcx,%rax)
	.loc	1 654 29                        # implicit.c:654:29
	movq	%r10, 24(%rcx,%rax)
	pushq	$30
.Ltmp329:
	.cfi_adjust_cfa_offset 8
	.loc	1 0 29 is_stmt 0                # implicit.c:0:29
	popq	%rdx
.Ltmp330:
	.cfi_adjust_cfa_offset -8
	.loc	1 655 29 is_stmt 1              # implicit.c:655:29
	movq	%rdx, 64(%rcx,%rax)
	.loc	1 656 29                        # implicit.c:656:29
	movq	%rdx, 8(%rcx,%rax)
	.loc	1 657 29                        # implicit.c:657:29
	movq	%r9, 56(%rcx,%rax)
	.loc	1 658 29                        # implicit.c:658:29
	movl	%ebp, (%rcx,%rax)
	.loc	1 659 20                        # implicit.c:659:20
	incq	48(%rsp)                        # 8-byte Folded Spill
.Ltmp331:
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
.LBB9_38:                               # %if.end196
                                        #   in Loop: Header=BB9_26 Depth=2
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:head <- [DW_OP_plus_uconst 160, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	#DEBUG_VALUE: price_out_impl:iterator <- $rbx
	#DEBUG_VALUE: price_out_impl:first_replace <- [DW_OP_plus_uconst 36, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref_size 4, DW_OP_stack_value] $rsp
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	.loc	1 661 38                        # implicit.c:661:38
	cmpq	120(%rsp), %rdi                 # 8-byte Folded Reload
.Ltmp332:
	.loc	1 661 17 is_stmt 0              # implicit.c:661:17
	jne	.LBB9_39
.Ltmp333:
# %bb.40:                               # %if.then201
                                        #   in Loop: Header=BB9_26 Depth=2
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- [DW_OP_plus_uconst 36, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref_size 4, DW_OP_stack_value] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:head <- [DW_OP_plus_uconst 160, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	#DEBUG_VALUE: price_out_impl:iterator <- $rbx
	.loc	1 0 17                          # implicit.c:0:17
	movq	40(%rsp), %rax                  # 8-byte Reload
.Ltmp334:
	.loc	1 663 36 is_stmt 1              # implicit.c:663:36
	andq	$0, (%rax)
	xorl	%r14d, %r14d
	xorl	%eax, %eax
	movq	%rax, 56(%rsp)                  # 8-byte Spill
	jmp	.LBB9_41
.Ltmp335:
.LBB9_39:                               #   in Loop: Header=BB9_26 Depth=2
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- [DW_OP_plus_uconst 36, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref_size 4, DW_OP_stack_value] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:head <- [DW_OP_plus_uconst 160, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	#DEBUG_VALUE: price_out_impl:iterator <- $rbx
	.loc	1 0 36 is_stmt 0                # implicit.c:0:36
	movq	%rdi, %r14
	movq	%rdi, 56(%rsp)                  # 8-byte Spill
.Ltmp336:
.LBB9_41:                               # %if.end205
                                        #   in Loop: Header=BB9_26 Depth=2
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- [DW_OP_plus_uconst 36, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref_size 4, DW_OP_stack_value] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:head <- [DW_OP_plus_uconst 160, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	#DEBUG_VALUE: price_out_impl:iterator <- $rbx
	movq	160(%rsp), %r10                 # 8-byte Reload
	movq	152(%rsp), %rdi                 # 8-byte Reload
	jmp	.LBB9_29
.Ltmp337:
.LBB9_27:                               #   in Loop: Header=BB9_13 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- [DW_OP_plus_uconst 128, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:head <- $r10
	#DEBUG_VALUE: price_out_impl:latest <- $r13
	#DEBUG_VALUE: price_out_impl:iterator <- $rbx
	movq	128(%rsp), %rbx                 # 8-byte Reload
.Ltmp338:
	movl	36(%rsp), %r13d                 # 4-byte Reload
.Ltmp339:
	jmp	.LBB9_24
.Ltmp340:
.LBB9_23:                               # %if.then120
                                        #   in Loop: Header=BB9_13 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- [DW_OP_plus_uconst 36, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- $rbx
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	.loc	1 605 14 is_stmt 1              # implicit.c:605:14
	addq	176(%rsp), %rbp                 # 8-byte Folded Reload
.Ltmp341:
	#DEBUG_VALUE: price_out_impl:id <- $rbp
.LBB9_24:                               # %for.inc208
                                        #   in Loop: Header=BB9_13 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- $rbx
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	.loc	1 574 26                        # implicit.c:574:26
	incq	%rbx
.Ltmp342:
	#DEBUG_VALUE: price_out_impl:i <- $rbx
	.loc	1 574 37 is_stmt 0              # implicit.c:574:37
	addq	$216, %r15
.Ltmp343:
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	.loc	1 0 37                          # implicit.c:0:37
	jmp	.LBB9_13
.Ltmp344:
.LBB9_42:                               # %for.end211
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:count <- [DW_OP_plus_uconst 48, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:id <- $rbp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:i <- $rbx
	#DEBUG_VALUE: price_out_impl:arcout <- $r15
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	movq	40(%rsp), %rbx                  # 8-byte Reload
.Ltmp345:
	movq	48(%rsp), %rax                  # 8-byte Reload
	.loc	1 673 28 is_stmt 1              # implicit.c:673:28
	movq	%rax, (%rbx)
	movq	200(%rsp), %rbp                 # 8-byte Reload
.Ltmp346:
	.loc	1 0 28 is_stmt 0                # implicit.c:0:28
	movq	88(%rsp), %r15                  # 8-byte Reload
.Ltmp347:
	movq	104(%rsp), %r14                 # 8-byte Reload
.Ltmp348:
.LBB9_43:                               # %while.cond214
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:count <- $rax
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	.loc	1 674 14 is_stmt 1              # implicit.c:674:14
	testw	%r13w, %r13w
	.loc	1 674 7 is_stmt 0               # implicit.c:674:7
	jne	.LBB9_45
.Ltmp349:
# %bb.44:                               # %while.body216
                                        #   in Loop: Header=BB9_43 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:count <- $rax
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	#DEBUG_VALUE: price_out_impl:first_replace <- 1
	.loc	1 0 7                           # implicit.c:0:7
	movq	120(%rsp), %rax                 # 8-byte Reload
.Ltmp350:
	.loc	1 680 19 is_stmt 1              # implicit.c:680:19
	movq	%rax, (%rsp)
	movq	$1, 8(%rsp)
	movq	%rbx, %rsi
	movq	%r15, %rdx
	movq	%r14, %rcx
	xorl	%r8d, %r8d
	movq	112(%rsp), %r9                  # 8-byte Reload
	callq	switch_arcs
.Ltmp351:
	#DEBUG_VALUE: price_out_impl:count <- $rax
	.loc	1 682 15                        # implicit.c:682:15
	xorl	%r13d, %r13d
	testq	%rax, %rax
	sete	%r13b
.Ltmp352:
	#DEBUG_VALUE: price_out_impl:first_replace <- undef
	.loc	1 0 15 is_stmt 0                # implicit.c:0:15
	jmp	.LBB9_43
.Ltmp353:
.LBB9_45:                               # %while.cond222
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:first_list_elem <- $r12
	.loc	1 689 31 is_stmt 1              # implicit.c:689:31
	movq	8(%r12), %rbx
	.loc	1 0 0 is_stmt 0                 # implicit.c:0:0
	movq	%r12, %rdi
	callq	free@PLT
.Ltmp354:
	movq	%rbx, %r12
.Ltmp355:
	.loc	1 689 7                         # implicit.c:689:7
	testq	%rbx, %rbx
	jne	.LBB9_45
.Ltmp356:
# %bb.46:                               # %while.end227
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- 0
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	.loc	1 0 7                           # implicit.c:0:7
	movq	64(%rsp), %r12                  # 8-byte Reload
	.loc	1 697 20 is_stmt 1              # implicit.c:697:20
	movq	(%r12), %rbx
	movq	80(%rsp), %r15                  # 8-byte Reload
	.loc	1 697 49 is_stmt 0              # implicit.c:697:49
	movq	(%r15), %r14
	pushq	$8
.Ltmp357:
	.cfi_adjust_cfa_offset 8
	.loc	1 0 49                          # implicit.c:0:49
	popq	%rdx
	.cfi_adjust_cfa_offset -8
	.loc	1 697 9                         # implicit.c:697:9
	movl	$arc_compare, %ecx
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	spec_qsort@PLT
.Ltmp358:
	#DEBUG_VALUE: price_out_impl:new_arcs <- [DW_OP_plus_uconst 192, DW_OP_deref] $rsp
	.loc	1 0 9                           # implicit.c:0:9
	leaq	192(%rsp), %rsi
.Ltmp359:
	.loc	1 709 11 is_stmt 1              # implicit.c:709:11
	movq	%rbp, %rdi
	movq	%r15, %rdx
	movq	%r12, %rcx
	callq	marc_arcs
.Ltmp360:
	.loc	1 715 3                         # implicit.c:715:3
	movq	%rbx, %rdi
	callq	free@PLT
.Ltmp361:
	.loc	1 716 11                        # implicit.c:716:11
	testq	%r14, %r14
.Ltmp362:
	.loc	1 716 11 is_stmt 0              # implicit.c:716:11
	je	.LBB9_58
.Ltmp363:
# %bb.47:                               # %if.then237
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- [DW_OP_plus_uconst 192, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_plus_uconst 104, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	.loc	1 718 23 is_stmt 1              # implicit.c:718:23
	movq	576(%rbp), %rbx
.Ltmp364:
	#DEBUG_VALUE: price_out_impl:arcnew <- $rbx
	#DEBUG_VALUE: price_out_impl:stop <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 72, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $rbx, $r14
	.loc	1 720 13                        # implicit.c:720:13
	cmpb	$0, 148(%rsp)                   # 1-byte Folded Reload
	je	.LBB9_48
.Ltmp365:
# %bb.53:                               # %for.cond265.preheader
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- [DW_OP_plus_uconst 192, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- $rbx
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:stop <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 72, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $rbx, $r14
	.loc	1 736 11                        # implicit.c:736:11
	imulq	$72, %r14, %r15
	pushq	$9
.Ltmp366:
	.cfi_adjust_cfa_offset 8
	.loc	1 0 11 is_stmt 0                # implicit.c:0:11
	popq	%r14
.Ltmp367:
	.cfi_adjust_cfa_offset -8
.LBB9_54:                               # %for.cond265
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- $rbx
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcnew <- $rbx
	.loc	1 736 25                        # implicit.c:736:25
	testq	%r15, %r15
.Ltmp368:
	.loc	1 736 11                        # implicit.c:736:11
	je	.LBB9_58
.Ltmp369:
# %bb.55:                               # %for.body268
                                        #   in Loop: Header=BB9_54 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- $rbx
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	.loc	1 738 30 is_stmt 1              # implicit.c:738:30
	cmpq	$1, 56(%rbx)
.Ltmp370:
	.loc	1 738 17 is_stmt 0              # implicit.c:738:17
	jne	.LBB9_57
.Ltmp371:
# %bb.56:                               # %if.then272
                                        #   in Loop: Header=BB9_54 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- $rbx
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	.loc	1 739 28 is_stmt 1              # implicit.c:739:28
	andq	$0, 56(%rbx)
	.loc	1 740 29                        # implicit.c:740:29
	movw	$1, 32(%rbx)
	.loc	1 741 41                        # implicit.c:741:41
	movq	16(%rbx), %rax
	.loc	1 741 47 is_stmt 0              # implicit.c:741:47
	movq	56(%rax), %rcx
	.loc	1 741 31                        # implicit.c:741:31
	movq	%rcx, 40(%rbx)
	.loc	1 742 38 is_stmt 1              # implicit.c:742:38
	movq	%rbx, 56(%rax)
	.loc	1 743 40                        # implicit.c:743:40
	movq	24(%rbx), %rax
	.loc	1 743 46 is_stmt 0              # implicit.c:743:46
	movq	64(%rax), %rcx
	.loc	1 743 30                        # implicit.c:743:30
	movq	%rcx, 48(%rbx)
	.loc	1 744 37 is_stmt 1              # implicit.c:744:37
	movq	%rbx, 64(%rax)
	.loc	1 748 56                        # implicit.c:748:56
	movslq	(%rbx), %rsi
	.loc	1 748 28 is_stmt 0              # implicit.c:748:28
	movq	%rbp, %rdi
	callq	getArcPosition@PLT
.Ltmp372:
	.loc	1 748 15                        # implicit.c:748:15
	imulq	$72, %rax, %rdi
	addq	96(%rsp), %rdi                  # 8-byte Folded Reload
	.loc	1 748 63                        # implicit.c:748:63
	movq	%r14, %rcx
	movq	%rbx, %rsi
	rep;movsq (%rsi), %es:(%rdi)
.Ltmp373:
.LBB9_57:                               # %for.inc286
                                        #   in Loop: Header=BB9_54 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- $rbx
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	.loc	1 736 40 is_stmt 1              # implicit.c:736:40
	addq	$72, %rbx
.Ltmp374:
	#DEBUG_VALUE: price_out_impl:arcnew <- $rbx
	.loc	1 736 11 is_stmt 0              # implicit.c:736:11
	addq	$-72, %r15
	jmp	.LBB9_54
.Ltmp375:
.LBB9_48:                               # %for.cond247.preheader
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:new_arcs <- [DW_OP_plus_uconst 192, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:first_replace <- $r13w
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:arcnew <- $rbx
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:stop <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 72, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] $rbx, $r14
	.loc	1 722 11 is_stmt 1              # implicit.c:722:11
	addq	$56, %rbx
.Ltmp376:
	imulq	$72, %r14, %r15
	xorl	%r13d, %r13d
.Ltmp377:
	.loc	1 0 11 is_stmt 0                # implicit.c:0:11
	pushq	$9
.Ltmp378:
	.cfi_adjust_cfa_offset 8
	popq	%r14
	.cfi_adjust_cfa_offset -8
.Ltmp379:
.LBB9_49:                               # %for.cond247
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_LLVM_arg 0, DW_OP_consts 72, DW_OP_div, DW_OP_consts 72, DW_OP_mul, DW_OP_LLVM_arg 1, DW_OP_plus, DW_OP_stack_value] undef, undef
	.loc	1 722 25                        # implicit.c:722:25
	cmpq	%r13, %r15
.Ltmp380:
	.loc	1 722 11                        # implicit.c:722:11
	je	.LBB9_58
.Ltmp381:
# %bb.50:                               # %for.body250
                                        #   in Loop: Header=BB9_49 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	.loc	1 724 30 is_stmt 1              # implicit.c:724:30
	cmpq	$1, (%rbx,%r13)
.Ltmp382:
	.loc	1 724 17 is_stmt 0              # implicit.c:724:17
	jne	.LBB9_52
.Ltmp383:
# %bb.51:                               # %if.then254
                                        #   in Loop: Header=BB9_49 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	.loc	1 0 0                           # implicit.c:0:0
	leaq	(%rbx,%r13), %r12
	addq	$-56, %r12
.Ltmp384:
	.loc	1 725 30 is_stmt 1              # implicit.c:725:30
	andq	$0, 56(%r12)
	.loc	1 726 31                        # implicit.c:726:31
	movw	$1, 32(%r12)
	.loc	1 730 51                        # implicit.c:730:51
	movslq	(%r12), %rsi
	.loc	1 730 23 is_stmt 0              # implicit.c:730:23
	movq	%rbp, %rdi
	callq	getArcPosition@PLT
.Ltmp385:
	.loc	1 730 10                        # implicit.c:730:10
	imulq	$72, %rax, %rdi
	addq	96(%rsp), %rdi                  # 8-byte Folded Reload
	.loc	1 730 58                        # implicit.c:730:58
	movq	%r14, %rcx
	movq	%r12, %rsi
	rep;movsq (%rsi), %es:(%rdi)
.Ltmp386:
.LBB9_52:                               # %for.inc262
                                        #   in Loop: Header=BB9_49 Depth=1
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcnew <- [DW_OP_LLVM_arg 0, DW_OP_consts 72, DW_OP_div, DW_OP_consts 72, DW_OP_mul, DW_OP_consts 72, DW_OP_LLVM_arg 1, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef, undef
	.loc	1 722 11 is_stmt 1              # implicit.c:722:11
	addq	$72, %r13
	jmp	.LBB9_49
.Ltmp387:
.LBB9_58:                               # %if.end290
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_plus_uconst 200] [$rsp+0]
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_del_arcs <- [DW_OP_plus_uconst 40, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:sorted_array <- [DW_OP_plus_uconst 96, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:num_switch_iterations <- [DW_OP_plus_uconst 208, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:size_del <- [DW_OP_plus_uconst 120, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:max_new_par_residual_new_arcs <- [DW_OP_plus_uconst 112, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:local_first_replace <- [DW_OP_plus_uconst 76, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:thread <- 0
	#DEBUG_VALUE: price_out_impl:trips <- [DW_OP_plus_uconst 184, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:list_size <- [DW_OP_plus_uconst 176, DW_OP_deref] $rsp
	.loc	1 755 24                        # implicit.c:755:24
	movq	192(%rsp), %rbx
.Ltmp388:
	#DEBUG_VALUE: price_out_impl:new_arcs <- $rbx
	.loc	1 755 21 is_stmt 0              # implicit.c:755:21
	addq	%rbx, 440(%rbp)
	.loc	1 756 33 is_stmt 1              # implicit.c:756:33
	subq	%rbx, 448(%rbp)
	.loc	1 757 53                        # implicit.c:757:53
	movq	424(%rbp), %rdx
	.loc	1 757 9 is_stmt 0               # implicit.c:757:9
	movq	getArcPosition@GOTPCREL(%rip), %rsi
	movq	%rbp, %rdi
	callq	refreshPositions
.Ltmp389:
	.loc	1 0 9                           # implicit.c:0:9
	movq	424(%rbp), %rax
	.loc	1 758 25 is_stmt 1              # implicit.c:758:25
	addq	%rbx, %rax
	.loc	1 758 16 is_stmt 0              # implicit.c:758:16
	movq	%rax, 424(%rbp)
	.loc	1 759 36 is_stmt 1              # implicit.c:759:36
	imulq	$72, %rax, %rax
	addq	568(%rbp), %rax
	.loc	1 759 24 is_stmt 0              # implicit.c:759:24
	movq	%rax, 576(%rbp)
	movq	80(%rsp), %rdi                  # 8-byte Reload
	.loc	1 775 5 is_stmt 1               # implicit.c:775:5
	callq	free@PLT
.Ltmp390:
	.loc	1 0 5 is_stmt 0                 # implicit.c:0:5
	movq	40(%rsp), %rdi                  # 8-byte Reload
	.loc	1 776 5 is_stmt 1               # implicit.c:776:5
	callq	free@PLT
.Ltmp391:
	.loc	1 0 5 is_stmt 0                 # implicit.c:0:5
	movq	64(%rsp), %rdi                  # 8-byte Reload
	.loc	1 777 5 is_stmt 1               # implicit.c:777:5
	callq	free@PLT
.Ltmp392:
	.loc	1 0 5 is_stmt 0                 # implicit.c:0:5
	movq	88(%rsp), %rdi                  # 8-byte Reload
	.loc	1 778 5 is_stmt 1               # implicit.c:778:5
	callq	free@PLT
.Ltmp393:
.LBB9_59:                               # %cleanup
	#DEBUG_VALUE: price_out_impl:net <- [DW_OP_LLVM_entry_value 1] $rdi
	#DEBUG_VALUE: price_out_impl:min_impl_duration <- 15
	#DEBUG_VALUE: price_out_impl:arc_cost <- 30
	#DEBUG_VALUE: price_out_impl:num_threads <- 1
	#DEBUG_VALUE: price_out_impl:new_arcs_array <- [DW_OP_plus_uconst 80, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:arcs_pointer_sorted <- [DW_OP_plus_uconst 64, DW_OP_deref] $rsp
	#DEBUG_VALUE: price_out_impl:deleted_arcs <- [DW_OP_plus_uconst 88, DW_OP_deref] $rsp
	.loc	1 781 1                         # implicit.c:781:1
	movq	%rbx, %rax
	.loc	1 781 1 epilogue_begin is_stmt 0 # implicit.c:781:1
	addq	$216, %rsp
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
.Ltmp394:
.Lfunc_end9:
	.size	price_out_impl, .Lfunc_end9-price_out_impl
	.cfi_endproc
	.file	10 "mcfutil.h" md5 0x6fade418d230c2d9d39deb67b05e3ee3
	.file	11 "spec_qsort" "spec_qsort.h" md5 0x2040d3b0b3e021f3f0b1e71d0e28f78d
                                        # -- End function
	.globl	suspend_impl                    # -- Begin function suspend_impl
	.type	suspend_impl,@function
suspend_impl:                           # @suspend_impl
.Lfunc_begin10:
	.loc	1 794 0 is_stmt 1               # implicit.c:794:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: suspend_impl:net <- $rdi
	#DEBUG_VALUE: suspend_impl:threshold <- $rsi
	#DEBUG_VALUE: suspend_impl:all <- $rdx
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
	movq	%rdx, %r8
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movl	$4000, %r9d                     # imm = 0xFA0
.Ltmp395:
	.loc	1 801 20 prologue_end           # implicit.c:801:20
	movq	%r9, 640(%rdi)
	.loc	1 802 29                        # implicit.c:802:29
	movq	424(%rdi), %rcx
	.loc	1 802 31 is_stmt 0              # implicit.c:802:31
	leaq	-1(%rcx), %rax
	.loc	1 802 35                        # implicit.c:802:35
	cqto
.Ltmp396:
	#DEBUG_VALUE: suspend_impl:all <- $r8
	idivq	%r9
	movq	%rax, %rsi
.Ltmp397:
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	.loc	1 802 41                        # implicit.c:802:41
	leaq	1(%rax), %rdi
.Ltmp398:
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	.loc	1 802 19                        # implicit.c:802:19
	movq	%rdi, 624(%rbx)
	.loc	1 803 53 is_stmt 1              # implicit.c:803:53
	movq	%rcx, %rax
	cqto
	idivq	%r9
	.loc	1 803 38 is_stmt 0              # implicit.c:803:38
	leaq	(%rdx,%rsi), %rax
	addq	$-3999, %rax                    # imm = 0xF061
	.loc	1 803 22                        # implicit.c:803:22
	movq	%rax, 632(%rbx)
	.loc	1 804 3 is_stmt 1               # implicit.c:804:3
	leaq	(%rdx,%rsi,2), %rdx
	addq	$-3998, %rdx                    # imm = 0xF062
	movl	$3999, %esi                     # imm = 0xF9F
.Ltmp399:
.LBB10_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	#DEBUG_VALUE: suspend_impl:all <- $r8
	.loc	1 804 27 is_stmt 0              # implicit.c:804:27
	testq	%rax, %rax
	.loc	1 804 3                         # implicit.c:804:3
	jns	.LBB10_3
.Ltmp400:
# %bb.2:                                # %while.body
                                        #   in Loop: Header=BB10_1 Depth=1
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	#DEBUG_VALUE: suspend_impl:all <- $r8
	.loc	1 805 38 is_stmt 1              # implicit.c:805:38
	addq	%rdi, %rax
	.loc	1 805 22 is_stmt 0              # implicit.c:805:22
	movq	%rdx, 632(%rbx)
	.loc	1 806 19 is_stmt 1              # implicit.c:806:19
	movq	%rsi, 640(%rbx)
.Ltmp401:
	.loc	1 804 3                         # implicit.c:804:3
	decq	%rsi
	addq	%rdi, %rdx
	jmp	.LBB10_1
.Ltmp402:
.LBB10_3:                               # %while.end
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	#DEBUG_VALUE: suspend_impl:all <- $r8
	.loc	1 0 0 is_stmt 0                 # implicit.c:0:0
	movq	440(%rbx), %r14
	.loc	1 809 9 is_stmt 1               # implicit.c:809:9
	testq	%r8, %r8
.Ltmp403:
	.loc	1 809 9 is_stmt 0               # implicit.c:809:9
	je	.LBB10_4
.Ltmp404:
.LBB10_12:                              # %if.end48
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	#DEBUG_VALUE: suspend_impl:all <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: suspend_impl:susp <- $r14
	.loc	1 851 9 is_stmt 1               # implicit.c:851:9
	testq	%r14, %r14
.Ltmp405:
	.loc	1 851 9 is_stmt 0               # implicit.c:851:9
	je	.LBB10_17
.Ltmp406:
# %bb.13:                               # %if.then50
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	#DEBUG_VALUE: suspend_impl:all <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: suspend_impl:susp <- $r14
	.loc	1 853 21 is_stmt 1              # implicit.c:853:21
	subq	%r14, 440(%rbx)
	.loc	1 854 33                        # implicit.c:854:33
	addq	%r14, 448(%rbx)
	movl	$4000, %r8d                     # imm = 0xFA0
	.loc	1 856 24                        # implicit.c:856:24
	movq	%r8, 640(%rbx)
	.loc	1 857 42                        # implicit.c:857:42
	movq	%r14, %rax
	notq	%rax
	addq	%rcx, %rax
	.loc	1 857 46 is_stmt 0              # implicit.c:857:46
	cqto
	idivq	%r8
	movq	%rax, %rsi
	.loc	1 857 52                        # implicit.c:857:52
	leaq	1(%rax), %rdi
	.loc	1 857 23                        # implicit.c:857:23
	movq	%rdi, 624(%rbx)
.Ltmp407:
	.loc	1 858 21 is_stmt 1              # implicit.c:858:21
	movq	%rcx, %rax
	subq	%r14, %rax
	.loc	1 858 29 is_stmt 0              # implicit.c:858:29
	cqto
	idivq	%r8
.Ltmp408:
	.loc	1 858 13                        # implicit.c:858:13
	leaq	-4000(%rdx), %r8
.Ltmp409:
	.loc	1 858 33                        # implicit.c:858:33
	testq	%rdx, %rdx
.Ltmp410:
	.loc	1 858 13                        # implicit.c:858:13
	cmoveq	%rdx, %r8
	leaq	(%r8,%rsi), %rax
	incq	%rax
.Ltmp411:
	.loc	1 0 0                           # implicit.c:0:0
	movq	%rax, 632(%rbx)
.Ltmp412:
	.loc	1 862 7 is_stmt 1               # implicit.c:862:7
	leaq	(%r8,%rsi,2), %rdx
	addq	$2, %rdx
	movl	$3999, %esi                     # imm = 0xF9F
.Ltmp413:
.LBB10_14:                              # %while.cond78
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	#DEBUG_VALUE: suspend_impl:all <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: suspend_impl:susp <- $r14
	.loc	1 862 31 is_stmt 0              # implicit.c:862:31
	testq	%rax, %rax
	.loc	1 862 7                         # implicit.c:862:7
	jns	.LBB10_16
.Ltmp414:
# %bb.15:                               # %while.body82
                                        #   in Loop: Header=BB10_14 Depth=1
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	#DEBUG_VALUE: suspend_impl:all <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: suspend_impl:susp <- $r14
	.loc	1 863 42 is_stmt 1              # implicit.c:863:42
	addq	%rdi, %rax
	.loc	1 863 26 is_stmt 0              # implicit.c:863:26
	movq	%rdx, 632(%rbx)
	.loc	1 864 23 is_stmt 1              # implicit.c:864:23
	movq	%rsi, 640(%rbx)
.Ltmp415:
	.loc	1 862 7                         # implicit.c:862:7
	decq	%rsi
	addq	%rdi, %rdx
	jmp	.LBB10_14
.Ltmp416:
.LBB10_16:                              # %while.end89
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	#DEBUG_VALUE: suspend_impl:all <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: suspend_impl:susp <- $r14
	.loc	1 866 9                         # implicit.c:866:9
	movq	getOriginalArcPosition@GOTPCREL(%rip), %r15
.Ltmp417:
	#DEBUG_VALUE: suspend_impl:threshold <- [DW_OP_LLVM_entry_value 1] $rsi
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%rcx, %rdx
	callq	refreshPositions
.Ltmp418:
	.loc	1 867 14                        # implicit.c:867:14
	subq	%r14, 424(%rbx)
	.loc	1 868 24                        # implicit.c:868:24
	movq	%r14, %rax
	negq	%rax
	imulq	$72, %rax, %rax
	addq	%rax, 576(%rbx)
	.loc	1 869 9                         # implicit.c:869:9
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	refresh_neighbour_lists@PLT
.Ltmp419:
.LBB10_17:                              # %if.end95
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: suspend_impl:all <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: suspend_impl:susp <- $r14
	.loc	1 872 5                         # implicit.c:872:5
	movq	%r14, %rax
	.loc	1 872 5 epilogue_begin is_stmt 0 # implicit.c:872:5
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
.Ltmp420:
	#DEBUG_VALUE: suspend_impl:net <- [DW_OP_LLVM_entry_value 1] $rdi
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
.Ltmp421:
	#DEBUG_VALUE: suspend_impl:susp <- $rax
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Ltmp422:
.LBB10_4:                               # %if.else
	.cfi_def_cfa_offset 64
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	#DEBUG_VALUE: suspend_impl:all <- $r8
	.loc	1 815 26 is_stmt 1              # implicit.c:815:26
	movq	%rcx, %r12
	subq	%r14, %r12
.Ltmp423:
	#DEBUG_VALUE: suspend_impl:startid <- $r12
	#DEBUG_VALUE: suspend_impl:stop <- $r12
	.loc	1 0 26 is_stmt 0                # implicit.c:0:26
	xorl	%r14d, %r14d
.Ltmp424:
	#DEBUG_VALUE: suspend_impl:susp <- 0
	movq	%r12, %rbp
.Ltmp425:
.LBB10_5:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	#DEBUG_VALUE: suspend_impl:all <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: suspend_impl:startid <- $rbp
	#DEBUG_VALUE: suspend_impl:stop <- $r12
	#DEBUG_VALUE: suspend_impl:startid <- $rbp
	#DEBUG_VALUE: suspend_impl:stop <- $r12
	#DEBUG_VALUE: suspend_impl:susp <- $r14
	.loc	1 816 58 is_stmt 1              # implicit.c:816:58
	cmpq	%rcx, %r12
.Ltmp426:
	.loc	1 816 9 is_stmt 0               # implicit.c:816:9
	jge	.LBB10_12
.Ltmp427:
# %bb.6:                                # %for.body
                                        #   in Loop: Header=BB10_5 Depth=1
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	#DEBUG_VALUE: suspend_impl:all <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: suspend_impl:startid <- $rbp
	#DEBUG_VALUE: suspend_impl:stop <- $r12
	#DEBUG_VALUE: suspend_impl:susp <- $r14
	.loc	1 818 22 is_stmt 1              # implicit.c:818:22
	movq	568(%rbx), %r13
	.loc	1 818 29 is_stmt 0              # implicit.c:818:29
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	getArcPosition@PLT
.Ltmp428:
	.loc	1 818 27                        # implicit.c:818:27
	imulq	$72, %rax, %rcx
	leaq	(%rcx,%r13), %rax
.Ltmp429:
	#DEBUG_VALUE: suspend_impl:arc <- $rax
	.loc	1 819 22 is_stmt 1              # implicit.c:819:22
	movzwl	32(%r13,%rcx), %esi
	testl	%esi, %esi
.Ltmp430:
	.loc	1 819 17 is_stmt 0              # implicit.c:819:17
	je	.LBB10_9
.Ltmp431:
# %bb.7:                                # %for.body
                                        #   in Loop: Header=BB10_5 Depth=1
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	#DEBUG_VALUE: suspend_impl:all <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: suspend_impl:startid <- $rbp
	#DEBUG_VALUE: suspend_impl:stop <- $r12
	#DEBUG_VALUE: suspend_impl:susp <- $r14
	#DEBUG_VALUE: suspend_impl:arc <- $rax
	.loc	1 0 17                          # implicit.c:0:17
	pushq	$-2
	.cfi_adjust_cfa_offset 8
	popq	%rdx
	.cfi_adjust_cfa_offset -8
	.loc	1 819 17                        # implicit.c:819:17
	cmpl	$1, %esi
	jne	.LBB10_11
.Ltmp432:
# %bb.8:                                # %if.then21
                                        #   in Loop: Header=BB10_5 Depth=1
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	#DEBUG_VALUE: suspend_impl:all <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: suspend_impl:startid <- $rbp
	#DEBUG_VALUE: suspend_impl:stop <- $r12
	#DEBUG_VALUE: suspend_impl:susp <- $r14
	#DEBUG_VALUE: suspend_impl:arc <- $rax
	.loc	1 820 33 is_stmt 1              # implicit.c:820:33
	movq	8(%r13,%rcx), %rdx
	.loc	1 820 45 is_stmt 0              # implicit.c:820:45
	movq	16(%r13,%rcx), %rsi
	.loc	1 820 38                        # implicit.c:820:38
	subq	(%rsi), %rdx
	.loc	1 821 32 is_stmt 1              # implicit.c:821:32
	movq	24(%r13,%rcx), %rcx
	.loc	1 821 25 is_stmt 0              # implicit.c:821:25
	addq	(%rcx), %rdx
.Ltmp433:
	#DEBUG_VALUE: suspend_impl:red_cost <- $rdx
	.loc	1 0 25                          # implicit.c:0:25
	jmp	.LBB10_11
.Ltmp434:
.LBB10_9:                               # %if.then30
                                        #   in Loop: Header=BB10_5 Depth=1
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	#DEBUG_VALUE: suspend_impl:all <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: suspend_impl:startid <- $rbp
	#DEBUG_VALUE: suspend_impl:stop <- $r12
	#DEBUG_VALUE: suspend_impl:susp <- $r14
	#DEBUG_VALUE: suspend_impl:arc <- $rax
	.loc	1 828 32 is_stmt 1              # implicit.c:828:32
	movq	16(%r13,%rcx), %rsi
	pushq	$-2
	.cfi_adjust_cfa_offset 8
	popq	%rdx
	.cfi_adjust_cfa_offset -8
	.loc	1 828 48 is_stmt 0              # implicit.c:828:48
	cmpq	%rax, 48(%rsi)
.Ltmp435:
	.loc	1 828 25                        # implicit.c:828:25
	je	.LBB10_11
.Ltmp436:
# %bb.10:                               # %if.then34
                                        #   in Loop: Header=BB10_5 Depth=1
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	#DEBUG_VALUE: suspend_impl:all <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: suspend_impl:startid <- $rbp
	#DEBUG_VALUE: suspend_impl:stop <- $r12
	#DEBUG_VALUE: suspend_impl:susp <- $r14
	#DEBUG_VALUE: suspend_impl:arc <- $rax
	.loc	1 829 28 is_stmt 1              # implicit.c:829:28
	movq	24(%r13,%rcx), %rcx
	.loc	1 829 44 is_stmt 0              # implicit.c:829:44
	movq	%rax, 48(%rcx)
.Ltmp437:
.LBB10_11:                              # %if.end38
                                        #   in Loop: Header=BB10_5 Depth=1
	#DEBUG_VALUE: suspend_impl:net <- $rbx
	#DEBUG_VALUE: suspend_impl:threshold <- $r15
	#DEBUG_VALUE: suspend_impl:all <- [DW_OP_LLVM_entry_value 1] $rdx
	#DEBUG_VALUE: suspend_impl:startid <- $rbp
	#DEBUG_VALUE: suspend_impl:stop <- $r12
	#DEBUG_VALUE: suspend_impl:susp <- $r14
	#DEBUG_VALUE: suspend_impl:arc <- $rax
	#DEBUG_VALUE: suspend_impl:red_cost <- $rdx
	.loc	1 833 26 is_stmt 1              # implicit.c:833:26
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	cmpq	%r15, %rdx
	setle	%cl
	setg	%sil
.Ltmp438:
	.loc	1 833 17 is_stmt 0              # implicit.c:833:17
	movl	%ebp, %edx
.Ltmp439:
	pushq	$-1
	.cfi_adjust_cfa_offset 8
	popq	%rdi
	.cfi_adjust_cfa_offset -8
	cmovgl	%edi, %edx
	addq	%rsi, %r14
.Ltmp440:
	addq	%rcx, %rbp
.Ltmp441:
	.loc	1 0 0                           # implicit.c:0:0
	movl	%edx, (%rax)
.Ltmp442:
	#DEBUG_VALUE: suspend_impl:startid <- $rbp
	#DEBUG_VALUE: suspend_impl:susp <- $r14
	.loc	1 816 73 is_stmt 1              # implicit.c:816:73
	incq	%r12
.Ltmp443:
	#DEBUG_VALUE: suspend_impl:stop <- $r12
	.loc	1 816 65 is_stmt 0              # implicit.c:816:65
	movq	424(%rbx), %rcx
	jmp	.LBB10_5
.Ltmp444:
.Lfunc_end10:
	.size	suspend_impl, .Lfunc_end10-suspend_impl
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"network %s: not enough memory\n"
	.size	.L.str, 31

	.section	.debug_loclists,"",@progbits
	.long	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.short	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.long	88                              # Offset entry count
.Lloclists_table_base0:
	.long	.Ldebug_loc0-.Lloclists_table_base0
	.long	.Ldebug_loc1-.Lloclists_table_base0
	.long	.Ldebug_loc2-.Lloclists_table_base0
	.long	.Ldebug_loc3-.Lloclists_table_base0
	.long	.Ldebug_loc4-.Lloclists_table_base0
	.long	.Ldebug_loc5-.Lloclists_table_base0
	.long	.Ldebug_loc6-.Lloclists_table_base0
	.long	.Ldebug_loc7-.Lloclists_table_base0
	.long	.Ldebug_loc8-.Lloclists_table_base0
	.long	.Ldebug_loc9-.Lloclists_table_base0
	.long	.Ldebug_loc10-.Lloclists_table_base0
	.long	.Ldebug_loc11-.Lloclists_table_base0
	.long	.Ldebug_loc12-.Lloclists_table_base0
	.long	.Ldebug_loc13-.Lloclists_table_base0
	.long	.Ldebug_loc14-.Lloclists_table_base0
	.long	.Ldebug_loc15-.Lloclists_table_base0
	.long	.Ldebug_loc16-.Lloclists_table_base0
	.long	.Ldebug_loc17-.Lloclists_table_base0
	.long	.Ldebug_loc18-.Lloclists_table_base0
	.long	.Ldebug_loc19-.Lloclists_table_base0
	.long	.Ldebug_loc20-.Lloclists_table_base0
	.long	.Ldebug_loc21-.Lloclists_table_base0
	.long	.Ldebug_loc22-.Lloclists_table_base0
	.long	.Ldebug_loc23-.Lloclists_table_base0
	.long	.Ldebug_loc24-.Lloclists_table_base0
	.long	.Ldebug_loc25-.Lloclists_table_base0
	.long	.Ldebug_loc26-.Lloclists_table_base0
	.long	.Ldebug_loc27-.Lloclists_table_base0
	.long	.Ldebug_loc28-.Lloclists_table_base0
	.long	.Ldebug_loc29-.Lloclists_table_base0
	.long	.Ldebug_loc30-.Lloclists_table_base0
	.long	.Ldebug_loc31-.Lloclists_table_base0
	.long	.Ldebug_loc32-.Lloclists_table_base0
	.long	.Ldebug_loc33-.Lloclists_table_base0
	.long	.Ldebug_loc34-.Lloclists_table_base0
	.long	.Ldebug_loc35-.Lloclists_table_base0
	.long	.Ldebug_loc36-.Lloclists_table_base0
	.long	.Ldebug_loc37-.Lloclists_table_base0
	.long	.Ldebug_loc38-.Lloclists_table_base0
	.long	.Ldebug_loc39-.Lloclists_table_base0
	.long	.Ldebug_loc40-.Lloclists_table_base0
	.long	.Ldebug_loc41-.Lloclists_table_base0
	.long	.Ldebug_loc42-.Lloclists_table_base0
	.long	.Ldebug_loc43-.Lloclists_table_base0
	.long	.Ldebug_loc44-.Lloclists_table_base0
	.long	.Ldebug_loc45-.Lloclists_table_base0
	.long	.Ldebug_loc46-.Lloclists_table_base0
	.long	.Ldebug_loc47-.Lloclists_table_base0
	.long	.Ldebug_loc48-.Lloclists_table_base0
	.long	.Ldebug_loc49-.Lloclists_table_base0
	.long	.Ldebug_loc50-.Lloclists_table_base0
	.long	.Ldebug_loc51-.Lloclists_table_base0
	.long	.Ldebug_loc52-.Lloclists_table_base0
	.long	.Ldebug_loc53-.Lloclists_table_base0
	.long	.Ldebug_loc54-.Lloclists_table_base0
	.long	.Ldebug_loc55-.Lloclists_table_base0
	.long	.Ldebug_loc56-.Lloclists_table_base0
	.long	.Ldebug_loc57-.Lloclists_table_base0
	.long	.Ldebug_loc58-.Lloclists_table_base0
	.long	.Ldebug_loc59-.Lloclists_table_base0
	.long	.Ldebug_loc60-.Lloclists_table_base0
	.long	.Ldebug_loc61-.Lloclists_table_base0
	.long	.Ldebug_loc62-.Lloclists_table_base0
	.long	.Ldebug_loc63-.Lloclists_table_base0
	.long	.Ldebug_loc64-.Lloclists_table_base0
	.long	.Ldebug_loc65-.Lloclists_table_base0
	.long	.Ldebug_loc66-.Lloclists_table_base0
	.long	.Ldebug_loc67-.Lloclists_table_base0
	.long	.Ldebug_loc68-.Lloclists_table_base0
	.long	.Ldebug_loc69-.Lloclists_table_base0
	.long	.Ldebug_loc70-.Lloclists_table_base0
	.long	.Ldebug_loc71-.Lloclists_table_base0
	.long	.Ldebug_loc72-.Lloclists_table_base0
	.long	.Ldebug_loc73-.Lloclists_table_base0
	.long	.Ldebug_loc74-.Lloclists_table_base0
	.long	.Ldebug_loc75-.Lloclists_table_base0
	.long	.Ldebug_loc76-.Lloclists_table_base0
	.long	.Ldebug_loc77-.Lloclists_table_base0
	.long	.Ldebug_loc78-.Lloclists_table_base0
	.long	.Ldebug_loc79-.Lloclists_table_base0
	.long	.Ldebug_loc80-.Lloclists_table_base0
	.long	.Ldebug_loc81-.Lloclists_table_base0
	.long	.Ldebug_loc82-.Lloclists_table_base0
	.long	.Ldebug_loc83-.Lloclists_table_base0
	.long	.Ldebug_loc84-.Lloclists_table_base0
	.long	.Ldebug_loc85-.Lloclists_table_base0
	.long	.Ldebug_loc86-.Lloclists_table_base0
	.long	.Ldebug_loc87-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp0-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp0-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp24-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	95                              # DW_OP_reg15
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp24-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	85                              # DW_OP_reg5
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp0-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	84                              # DW_OP_reg4
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp0-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp23-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp23-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	84                              # DW_OP_reg4
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp0-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	81                              # DW_OP_reg1
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp0-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp21-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp21-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	81                              # DW_OP_reg1
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp19-.Lfunc_begin0          #   ending offset
	.byte	9                               # Loc expr size
	.byte	118                             # DW_OP_breg6
	.byte	0                               # 0
	.byte	125                             # DW_OP_breg13
	.byte	0                               # 0
	.byte	16                              # DW_OP_constu
	.byte	104                             # 104
	.byte	30                              # DW_OP_mul
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc4:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin1-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp29-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp29-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp42-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp42-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end1-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	85                              # DW_OP_reg5
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc5:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin1-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp29-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	84                              # DW_OP_reg4
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp29-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp43-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp43-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end1-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	84                              # DW_OP_reg4
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc6:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin1-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp28-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	81                              # DW_OP_reg1
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp28-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp31-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp31-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp39-.Lfunc_begin0          #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	0                               # 0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp40-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end1-.Lfunc_begin0      #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	0                               # 0
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc7:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp27-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp44-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	95                              # DW_OP_reg15
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc8:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp30-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp32-.Lfunc_begin0          #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc9:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp41-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp45-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc10:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp38-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp40-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc11:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin2-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp51-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	81                              # DW_OP_reg1
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp51-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end2-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	81                              # DW_OP_reg1
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc12:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin2-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp49-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	82                              # DW_OP_reg2
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp49-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end2-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	82                              # DW_OP_reg2
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc13:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin2-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp64-.Lfunc_begin0          #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp64-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp67-.Lfunc_begin0          #   ending offset
	.byte	10                              # Loc expr size
	.byte	114                             # DW_OP_breg2
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	159                             # 3999
	.byte	31                              # 
	.byte	28                              # DW_OP_minus
	.byte	17                              # DW_OP_consts
	.byte	127                             # -1
	.byte	27                              # DW_OP_div
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp68-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end2-.Lfunc_begin0      #   ending offset
	.byte	10                              # Loc expr size
	.byte	114                             # DW_OP_breg2
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	159                             # 3999
	.byte	31                              # 
	.byte	28                              # DW_OP_minus
	.byte	17                              # DW_OP_consts
	.byte	127                             # -1
	.byte	27                              # DW_OP_div
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc14:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp47-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp59-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp61-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp64-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	88                              # DW_OP_reg8
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc15:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp54-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp58-.Lfunc_begin0          #   ending offset
	.byte	2                               # Loc expr size
	.byte	49                              # DW_OP_lit1
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc16:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp50-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp51-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	88                              # DW_OP_reg8
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc17:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp54-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp56-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	89                              # DW_OP_reg9
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc18:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin4-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp79-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp79-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp107-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp107-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end4-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	85                              # DW_OP_reg5
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc19:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp80-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp84-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp84-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp100-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	82                              # DW_OP_reg2
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp100-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp101-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp102-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp103-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc20:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp83-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp99-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	84                              # DW_OP_reg4
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc21:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp85-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp87-.Lfunc_begin0          #   ending offset
	.byte	4                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	232                             # 104
	.byte	0                               # 
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp87-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp96-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	89                              # DW_OP_reg9
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp97-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp100-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	89                              # DW_OP_reg9
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc22:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp85-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp98-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc23:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp86-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp100-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	88                              # DW_OP_reg8
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc24:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp93-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp94-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc25:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin5-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp110-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	84                              # DW_OP_reg4
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp110-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp112-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp112-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end5-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	84                              # DW_OP_reg4
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc26:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin5-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp111-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	81                              # DW_OP_reg1
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp111-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end5-.Lfunc_begin0      #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc27:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp112-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp115-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp118-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp119-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc28:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp123-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp125-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	49                              # DW_OP_lit1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp125-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp130-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp131-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp134-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp134-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp135-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp135-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp139-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp139-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp142-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc29:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp124-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp127-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp127-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp132-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp132-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp140-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc30:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin7-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp145-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	82                              # DW_OP_reg2
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp145-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end7-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	82                              # DW_OP_reg2
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc31:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp144-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp146-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp146-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end7-.Lfunc_begin0      #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc32:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin8-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp157-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	84                              # DW_OP_reg4
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp157-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp179-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	8                               # 8
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp182-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end8-.Lfunc_begin0      #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	8                               # 8
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc33:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin8-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp161-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	81                              # DW_OP_reg1
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp161-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp194-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	95                              # DW_OP_reg15
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp194-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end8-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	81                              # DW_OP_reg1
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc34:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin8-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp159-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	82                              # DW_OP_reg2
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp159-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp193-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp193-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end8-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	82                              # DW_OP_reg2
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc35:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin8-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp161-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	88                              # super-register DW_OP_reg8
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp161-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end8-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	88                              # super-register DW_OP_reg8
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc36:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin8-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp156-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	89                              # DW_OP_reg9
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp156-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp179-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	32                              # 32
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp182-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end8-.Lfunc_begin0      #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	32                              # 32
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc37:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp155-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp161-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	224                             # 96
	.byte	0                               # 
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc38:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp155-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp161-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	232                             # 104
	.byte	0                               # 
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc39:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp158-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp161-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp161-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp192-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp192-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end8-.Lfunc_begin0      #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc40:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp158-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp161-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp161-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp164-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	82                              # DW_OP_reg2
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp164-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp179-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	24                              # 24
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp182-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp187-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	24                              # 24
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp187-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end8-.Lfunc_begin0      #   ending offset
	.byte	1                               # Loc expr size
	.byte	82                              # DW_OP_reg2
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc41:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp160-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp188-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp190-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp191-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc42:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp166-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp167-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc43:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp166-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp168-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc44:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp174-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp175-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	90                              # super-register DW_OP_reg10
	.byte	147                             # DW_OP_piece
	.byte	4                               # 4
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp175-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp176-.Lfunc_begin0         #   ending offset
	.byte	8                               # Loc expr size
	.byte	90                              # super-register DW_OP_reg10
	.byte	147                             # DW_OP_piece
	.byte	4                               # 4
	.byte	147                             # DW_OP_piece
	.byte	4                               # 4
	.byte	80                              # DW_OP_reg0
	.byte	147                             # DW_OP_piece
	.byte	8                               # 8
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp176-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp177-.Lfunc_begin0         #   ending offset
	.byte	11                              # Loc expr size
	.byte	90                              # super-register DW_OP_reg10
	.byte	147                             # DW_OP_piece
	.byte	4                               # 4
	.byte	147                             # DW_OP_piece
	.byte	4                               # 4
	.byte	80                              # DW_OP_reg0
	.byte	147                             # DW_OP_piece
	.byte	8                               # 8
	.byte	89                              # DW_OP_reg9
	.byte	147                             # DW_OP_piece
	.byte	8                               # 8
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp177-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp180-.Lfunc_begin0         #   ending offset
	.byte	19                              # Loc expr size
	.byte	90                              # super-register DW_OP_reg10
	.byte	147                             # DW_OP_piece
	.byte	4                               # 4
	.byte	147                             # DW_OP_piece
	.byte	4                               # 4
	.byte	80                              # DW_OP_reg0
	.byte	147                             # DW_OP_piece
	.byte	8                               # 8
	.byte	89                              # DW_OP_reg9
	.byte	147                             # DW_OP_piece
	.byte	8                               # 8
	.byte	81                              # DW_OP_reg1
	.byte	147                             # DW_OP_piece
	.byte	8                               # 8
	.byte	147                             # DW_OP_piece
	.byte	24                              # 24
	.byte	88                              # DW_OP_reg8
	.byte	147                             # DW_OP_piece
	.byte	8                               # 8
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp180-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp181-.Lfunc_begin0         #   ending offset
	.byte	18                              # Loc expr size
	.byte	90                              # super-register DW_OP_reg10
	.byte	147                             # DW_OP_piece
	.byte	4                               # 4
	.byte	147                             # DW_OP_piece
	.byte	4                               # 4
	.byte	80                              # DW_OP_reg0
	.byte	147                             # DW_OP_piece
	.byte	8                               # 8
	.byte	147                             # DW_OP_piece
	.byte	8                               # 8
	.byte	81                              # DW_OP_reg1
	.byte	147                             # DW_OP_piece
	.byte	8                               # 8
	.byte	147                             # DW_OP_piece
	.byte	24                              # 24
	.byte	88                              # DW_OP_reg8
	.byte	147                             # DW_OP_piece
	.byte	8                               # 8
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc45:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin9-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp201-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp201-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp245-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp245-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp254-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	200                             # 200
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp261-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	200                             # 200
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp263-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp266-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	200                             # 200
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp269-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp279-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	200                             # 200
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp284-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp306-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	200                             # 200
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp308-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp317-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	200                             # 200
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp329-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	200                             # 200
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp357-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	200                             # 200
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp363-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp366-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	200                             # 200
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp367-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp378-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	200                             # 200
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp379-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp393-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	200                             # 200
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp393-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end9-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	85                              # DW_OP_reg5
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc46:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp196-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp358-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp358-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp366-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	192                             # 192
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp375-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp378-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	192                             # 192
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp388-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp393-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc47:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp197-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp212-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp212-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp216-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	49                              # DW_OP_lit1
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc48:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp197-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end9-.Lfunc_begin0      #   ending offset
	.byte	2                               # Loc expr size
	.byte	63                              # DW_OP_lit15
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc49:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp197-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp256-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp275-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # super-register DW_OP_reg13
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp275-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp279-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	36                              # 36
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp284-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp291-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	36                              # 36
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp315-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp316-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	82                              # super-register DW_OP_reg2
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp316-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp317-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	36                              # 36
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp337-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	36                              # 36
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp340-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp341-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	36                              # 36
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp341-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp349-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # super-register DW_OP_reg13
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp349-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp352-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp353-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp377-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # super-register DW_OP_reg13
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc50:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp197-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp256-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp261-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	48                              # 48
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp263-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp266-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	48                              # 48
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp269-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp272-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	48                              # 48
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp272-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp273-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp274-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp279-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	48                              # 48
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp284-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp291-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	48                              # 48
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp318-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp320-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	48                              # 48
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp337-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	48                              # 48
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp340-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp348-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	48                              # 48
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp348-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp350-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp351-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp353-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc51:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp198-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp199-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp199-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp200-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	168                             # 168
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp211-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp230-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	168                             # 168
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp235-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp253-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	168                             # 168
	.byte	1                               # 
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc52:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp198-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end9-.Lfunc_begin0      #   ending offset
	.byte	2                               # Loc expr size
	.byte	78                              # DW_OP_lit30
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc53:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp198-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end9-.Lfunc_begin0      #   ending offset
	.byte	2                               # Loc expr size
	.byte	49                              # DW_OP_lit1
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc54:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp203-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp210-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 80
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp211-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp230-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 80
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp235-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp254-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 80
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp261-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 80
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp263-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp266-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 80
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp269-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp279-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 80
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp284-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp306-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 80
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp308-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp317-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 80
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp329-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 80
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp357-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 80
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp363-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp366-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 80
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp367-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp378-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 80
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp379-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end9-.Lfunc_begin0      #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 80
	.byte	0                               # 
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc55:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp205-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp241-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	95                              # DW_OP_reg15
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp241-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp254-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	40                              # 40
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp261-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	40                              # 40
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp263-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp266-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	40                              # 40
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp269-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp279-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	40                              # 40
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp284-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp306-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	40                              # 40
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp308-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp317-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	40                              # 40
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp329-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	40                              # 40
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp357-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	40                              # 40
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp363-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp366-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	40                              # 40
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp367-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp378-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	40                              # 40
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp379-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp393-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	40                              # 40
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc56:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp207-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp210-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	192                             # 64
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp211-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp230-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	192                             # 64
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp235-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp254-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	192                             # 64
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp261-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	192                             # 64
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp263-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp266-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	192                             # 64
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp269-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp279-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	192                             # 64
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp284-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp306-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	192                             # 64
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp308-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp317-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	192                             # 64
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp329-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	192                             # 64
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp357-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	192                             # 64
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp363-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp366-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	192                             # 64
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp367-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp378-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	192                             # 64
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp379-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end9-.Lfunc_begin0      #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	192                             # 64
	.byte	0                               # 
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc57:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp209-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp210-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	216                             # 88
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp211-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp230-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	216                             # 88
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp235-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp254-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	216                             # 88
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp261-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	216                             # 88
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp263-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp266-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	216                             # 88
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp269-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp279-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	216                             # 88
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp284-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp306-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	216                             # 88
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp308-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp317-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	216                             # 88
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp329-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	216                             # 88
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp357-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	216                             # 88
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp363-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp366-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	216                             # 88
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp367-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp378-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	216                             # 88
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp379-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end9-.Lfunc_begin0      #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	216                             # 88
	.byte	0                               # 
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc58:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp218-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp228-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	82                              # DW_OP_reg2
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp228-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp230-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	224                             # 96
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp235-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp254-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	224                             # 96
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp261-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	224                             # 96
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp263-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp266-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	224                             # 96
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp269-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp279-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	224                             # 96
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp284-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp306-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	224                             # 96
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp308-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp317-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	224                             # 96
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp329-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	224                             # 96
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp357-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	224                             # 96
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp363-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp366-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	224                             # 96
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp367-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp378-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	224                             # 96
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp379-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp393-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	224                             # 96
	.byte	0                               # 
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc59:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp220-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp221-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	81                              # DW_OP_reg1
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp221-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp230-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 208
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp235-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp254-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 208
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp261-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 208
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp263-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp266-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 208
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp269-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp279-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 208
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp284-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp306-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 208
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp308-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp317-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 208
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp329-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 208
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp357-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 208
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp363-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp366-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 208
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp367-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp378-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 208
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp379-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp393-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	208                             # 208
	.byte	1                               # 
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc60:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp224-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp225-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp225-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp230-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	248                             # 120
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp235-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp254-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	248                             # 120
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp261-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	248                             # 120
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp263-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp266-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	248                             # 120
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp269-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp279-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	248                             # 120
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp284-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp306-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	248                             # 120
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp308-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp317-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	248                             # 120
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp329-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	248                             # 120
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp357-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	248                             # 120
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp363-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp366-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	248                             # 120
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp367-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp378-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	248                             # 120
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp379-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp393-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	248                             # 120
	.byte	0                               # 
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc61:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp226-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp233-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp233-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp254-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	240                             # 112
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp261-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	240                             # 112
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp263-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp266-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	240                             # 112
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp269-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp279-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	240                             # 112
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp284-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp306-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	240                             # 112
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp308-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp317-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	240                             # 112
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp329-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	240                             # 112
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp357-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	240                             # 112
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp363-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp366-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	240                             # 112
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp367-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp378-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	240                             # 112
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp379-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp393-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	240                             # 112
	.byte	0                               # 
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc62:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp226-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp256-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp261-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	204                             # 76
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp263-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp266-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	204                             # 76
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp269-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp279-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	204                             # 76
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp284-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp291-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	204                             # 76
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp315-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp323-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	0                               # 0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp337-.Lfunc_begin0         #   ending offset
	.byte	6                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	204                             # 76
	.byte	0                               # 
	.byte	148                             # DW_OP_deref_size
	.byte	4                               # 
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp340-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp357-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	204                             # 76
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp363-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp366-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	204                             # 76
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp367-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp378-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	204                             # 76
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp379-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp393-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	204                             # 76
	.byte	0                               # 
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc63:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp226-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp256-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp260-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp261-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	136                             # 136
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp265-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp266-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	136                             # 136
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp329-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	152                             # 152
	.byte	1                               # 
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc64:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp227-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp393-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	0                               # 0
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc65:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp229-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp234-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp234-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp254-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	232                             # 104
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp261-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	232                             # 104
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp263-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp266-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	232                             # 104
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp269-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp279-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	232                             # 104
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp284-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp306-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	232                             # 104
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp308-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp317-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	232                             # 104
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp329-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	232                             # 104
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp357-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	232                             # 104
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp363-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp364-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	232                             # 104
	.byte	0                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp364-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp376-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc66:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp229-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp230-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	184                             # 184
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp235-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp254-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	184                             # 184
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp261-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	184                             # 184
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp263-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp266-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	184                             # 184
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp269-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp279-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	184                             # 184
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp284-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp306-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	184                             # 184
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp308-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp317-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	184                             # 184
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp329-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	184                             # 184
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp357-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	184                             # 184
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp363-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp366-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	184                             # 184
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp367-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp378-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	184                             # 184
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp379-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp393-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	184                             # 184
	.byte	1                               # 
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc67:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp229-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp256-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp346-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc68:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp229-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp256-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	32                              # DW_OP_not
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp261-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	176                             # 176
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp263-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp266-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	176                             # 176
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp269-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp279-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	176                             # 176
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp283-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp306-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	176                             # 176
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp308-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp317-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	176                             # 176
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp329-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	176                             # 176
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp357-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	176                             # 176
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp363-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp366-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	176                             # 176
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp367-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp378-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	176                             # 176
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp379-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp393-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	176                             # 176
	.byte	1                               # 
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc69:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp232-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp235-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp235-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp243-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	82                              # DW_OP_reg2
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp243-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp245-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp245-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp255-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp270-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp270-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp273-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	128                             # 128
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp273-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp277-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp277-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp282-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp282-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp286-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp286-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp306-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	128                             # 128
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp308-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp317-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	128                             # 128
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp329-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	128                             # 128
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp340-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	128                             # 128
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp340-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp345-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc70:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp242-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp347-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	95                              # DW_OP_reg15
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc71:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp252-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp256-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp256-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp281-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp281-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp284-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp284-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp355-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc72:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp281-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp284-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc73:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp287-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp303-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp303-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp306-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	160                             # 160
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp308-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp317-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	160                             # 160
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp329-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	160                             # 160
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp331-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp337-.Lfunc_begin0         #   ending offset
	.byte	3                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	160                             # 160
	.byte	1                               # 
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp337-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp340-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc74:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp290-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp339-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc75:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp292-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp297-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp299-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp338-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc76:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp294-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp297-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp299-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp307-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp309-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp313-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp327-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc77:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp295-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp297-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	81                              # DW_OP_reg1
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp299-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp307-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	81                              # DW_OP_reg1
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp309-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp319-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	81                              # DW_OP_reg1
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp319-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp322-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	84                              # DW_OP_reg4
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp330-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	81                              # DW_OP_reg1
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc78:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp301-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp307-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	89                              # DW_OP_reg9
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp309-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp321-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	89                              # DW_OP_reg9
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp323-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp331-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	89                              # DW_OP_reg9
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc79:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp364-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp367-.Lfunc_begin0         #   ending offset
	.byte	9                               # Loc expr size
	.byte	115                             # DW_OP_breg3
	.byte	0                               # 0
	.byte	126                             # DW_OP_breg14
	.byte	0                               # 0
	.byte	16                              # DW_OP_constu
	.byte	72                              # 72
	.byte	30                              # DW_OP_mul
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp375-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp376-.Lfunc_begin0         #   ending offset
	.byte	9                               # Loc expr size
	.byte	115                             # DW_OP_breg3
	.byte	0                               # 0
	.byte	126                             # DW_OP_breg14
	.byte	0                               # 0
	.byte	16                              # DW_OP_constu
	.byte	72                              # 72
	.byte	30                              # DW_OP_mul
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc80:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin10-.Lfunc_begin0   #   starting offset
	.uleb128 .Ltmp398-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp398-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp420-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp420-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp422-.Lfunc_begin0         #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	85                              # DW_OP_reg5
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp422-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end10-.Lfunc_begin0     #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc81:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin10-.Lfunc_begin0   #   starting offset
	.uleb128 .Ltmp397-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	84                              # DW_OP_reg4
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp397-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp417-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	95                              # DW_OP_reg15
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp417-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp422-.Lfunc_begin0         #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	84                              # DW_OP_reg4
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp422-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end10-.Lfunc_begin0     #   ending offset
	.byte	1                               # Loc expr size
	.byte	95                              # DW_OP_reg15
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc82:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin10-.Lfunc_begin0   #   starting offset
	.uleb128 .Ltmp396-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	81                              # DW_OP_reg1
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp396-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp404-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	88                              # DW_OP_reg8
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp404-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp422-.Lfunc_begin0         #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	81                              # DW_OP_reg1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp422-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp425-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	88                              # DW_OP_reg8
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp425-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end10-.Lfunc_begin0     #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	81                              # DW_OP_reg1
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc83:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp404-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp421-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp421-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp422-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp424-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp425-.Lfunc_begin0         #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp425-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp440-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp442-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end10-.Lfunc_begin0     #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc84:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp423-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp425-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp425-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp441-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp442-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end10-.Lfunc_begin0     #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc85:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp423-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end10-.Lfunc_begin0     #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc86:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp429-.Lfunc_begin0         #   starting offset
	.uleb128 .Lfunc_end10-.Lfunc_begin0     #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc87:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp433-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp434-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	81                              # DW_OP_reg1
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp437-.Lfunc_begin0         #   starting offset
	.uleb128 .Ltmp439-.Lfunc_begin0         #   ending offset
	.byte	1                               # Loc expr size
	.byte	81                              # DW_OP_reg1
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_list_header_end0:
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	37                              # DW_FORM_strx1
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	114                             # DW_AT_str_offsets_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	37                              # DW_FORM_strx1
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	115                             # DW_AT_addr_base
	.byte	23                              # DW_FORM_sec_offset
	.ascii	"\214\001"                      # DW_AT_loclists_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	1                               # DW_TAG_array_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	33                              # DW_TAG_subrange_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	55                              # DW_AT_count
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	10                              # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	56                              # DW_AT_data_member_location
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	11                              # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	12                              # Abbreviation Code
	.byte	21                              # DW_TAG_subroutine_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	13                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	14                              # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	15                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	122                             # DW_AT_call_all_calls
	.byte	25                              # DW_FORM_flag_present
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	16                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	17                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	18                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	19                              # Abbreviation Code
	.byte	72                              # DW_TAG_call_site
	.byte	0                               # DW_CHILDREN_no
	.ascii	"\203\001"                      # DW_AT_call_target
	.byte	24                              # DW_FORM_exprloc
	.byte	125                             # DW_AT_call_return_pc
	.byte	27                              # DW_FORM_addrx
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	20                              # Abbreviation Code
	.byte	72                              # DW_TAG_call_site
	.byte	0                               # DW_CHILDREN_no
	.byte	127                             # DW_AT_call_origin
	.byte	19                              # DW_FORM_ref4
	.byte	125                             # DW_AT_call_return_pc
	.byte	27                              # DW_FORM_addrx
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	21                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	122                             # DW_AT_call_all_calls
	.byte	25                              # DW_FORM_flag_present
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	22                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	23                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	28                              # DW_AT_const_value
	.byte	13                              # DW_FORM_sdata
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	24                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	25                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	122                             # DW_AT_call_all_calls
	.byte	25                              # DW_FORM_flag_present
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	26                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	27                              # Abbreviation Code
	.byte	24                              # DW_TAG_unspecified_parameters
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	28                              # Abbreviation Code
	.byte	55                              # DW_TAG_restrict_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	29                              # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	30                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	31                              # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	32                              # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	33                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	122                             # DW_AT_call_all_calls
	.byte	25                              # DW_FORM_flag_present
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	34                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	35                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	36                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	37                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	38                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	122                             # DW_AT_call_all_calls
	.byte	25                              # DW_FORM_flag_present
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	39                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	40                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	41                              # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	5                               # DW_FORM_data2
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	42                              # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	56                              # DW_AT_data_member_location
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	43                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	5                               # DWARF version number
	.byte	1                               # DWARF Unit Type
	.byte	8                               # Address Size (in bytes)
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	1                               # Abbrev [1] 0xc:0xb83 DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.short	29                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.long	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	1                               # DW_AT_low_pc
	.long	.Lfunc_end10-.Lfunc_begin0      # DW_AT_high_pc
	.long	.Laddr_table_base0              # DW_AT_addr_base
	.long	.Lloclists_table_base0          # DW_AT_loclists_base
	.byte	2                               # Abbrev [2] 0x27:0xa DW_TAG_variable
	.long	49                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	232                             # DW_AT_decl_line
	.byte	2                               # DW_AT_location
	.byte	161
	.byte	0
	.byte	3                               # Abbrev [3] 0x31:0xc DW_TAG_array_type
	.long	61                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0x36:0x6 DW_TAG_subrange_type
	.long	65                              # DW_AT_type
	.byte	31                              # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0x3d:0x4 DW_TAG_base_type
	.byte	3                               # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	6                               # Abbrev [6] 0x41:0x4 DW_TAG_base_type
	.byte	4                               # DW_AT_name
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # DW_AT_encoding
	.byte	7                               # Abbrev [7] 0x45:0x5 DW_TAG_pointer_type
	.long	74                              # DW_AT_type
	.byte	7                               # Abbrev [7] 0x4a:0x5 DW_TAG_pointer_type
	.long	79                              # DW_AT_type
	.byte	8                               # Abbrev [8] 0x4f:0x8 DW_TAG_typedef
	.long	87                              # DW_AT_type
	.byte	37                              # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	138                             # DW_AT_decl_line
	.byte	7                               # Abbrev [7] 0x57:0x5 DW_TAG_pointer_type
	.long	92                              # DW_AT_type
	.byte	9                               # Abbrev [9] 0x5c:0x57 DW_TAG_structure_type
	.byte	36                              # DW_AT_name
	.byte	72                              # DW_AT_byte_size
	.byte	2                               # DW_AT_decl_file
	.byte	168                             # DW_AT_decl_line
	.byte	10                              # Abbrev [10] 0x61:0x9 DW_TAG_member
	.byte	5                               # DW_AT_name
	.long	179                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	170                             # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x6a:0x9 DW_TAG_member
	.byte	7                               # DW_AT_name
	.long	183                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	171                             # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x73:0x9 DW_TAG_member
	.byte	12                              # DW_AT_name
	.long	211                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	172                             # DW_AT_decl_line
	.byte	16                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x7c:0x9 DW_TAG_member
	.byte	30                              # DW_AT_name
	.long	211                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	172                             # DW_AT_decl_line
	.byte	24                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x85:0x9 DW_TAG_member
	.byte	31                              # DW_AT_name
	.long	364                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	173                             # DW_AT_decl_line
	.byte	32                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x8e:0x9 DW_TAG_member
	.byte	33                              # DW_AT_name
	.long	79                              # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	174                             # DW_AT_decl_line
	.byte	40                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x97:0x9 DW_TAG_member
	.byte	34                              # DW_AT_name
	.long	79                              # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	174                             # DW_AT_decl_line
	.byte	48                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0xa0:0x9 DW_TAG_member
	.byte	23                              # DW_AT_name
	.long	356                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	175                             # DW_AT_decl_line
	.byte	56                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0xa9:0x9 DW_TAG_member
	.byte	35                              # DW_AT_name
	.long	183                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	176                             # DW_AT_decl_line
	.byte	64                              # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0xb3:0x4 DW_TAG_base_type
	.byte	6                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0xb7:0x8 DW_TAG_typedef
	.long	191                             # DW_AT_type
	.byte	11                              # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	98                              # DW_AT_decl_line
	.byte	8                               # Abbrev [8] 0xbf:0x8 DW_TAG_typedef
	.long	199                             # DW_AT_type
	.byte	10                              # DW_AT_name
	.byte	4                               # DW_AT_decl_file
	.byte	27                              # DW_AT_decl_line
	.byte	8                               # Abbrev [8] 0xc7:0x8 DW_TAG_typedef
	.long	207                             # DW_AT_type
	.byte	9                               # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	44                              # DW_AT_decl_line
	.byte	5                               # Abbrev [5] 0xcf:0x4 DW_TAG_base_type
	.byte	8                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0xd3:0x8 DW_TAG_typedef
	.long	219                             # DW_AT_type
	.byte	29                              # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	135                             # DW_AT_decl_line
	.byte	7                               # Abbrev [7] 0xdb:0x5 DW_TAG_pointer_type
	.long	224                             # DW_AT_type
	.byte	9                               # Abbrev [9] 0xe0:0x84 DW_TAG_structure_type
	.byte	28                              # DW_AT_name
	.byte	104                             # DW_AT_byte_size
	.byte	2                               # DW_AT_decl_file
	.byte	149                             # DW_AT_decl_line
	.byte	10                              # Abbrev [10] 0xe5:0x9 DW_TAG_member
	.byte	13                              # DW_AT_name
	.long	183                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	151                             # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0xee:0x9 DW_TAG_member
	.byte	14                              # DW_AT_name
	.long	179                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	152                             # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0xf7:0x9 DW_TAG_member
	.byte	15                              # DW_AT_name
	.long	211                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	153                             # DW_AT_decl_line
	.byte	16                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x100:0x9 DW_TAG_member
	.byte	16                              # DW_AT_name
	.long	211                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	154                             # DW_AT_decl_line
	.byte	24                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x109:0x9 DW_TAG_member
	.byte	17                              # DW_AT_name
	.long	211                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	155                             # DW_AT_decl_line
	.byte	32                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x112:0x9 DW_TAG_member
	.byte	18                              # DW_AT_name
	.long	211                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	156                             # DW_AT_decl_line
	.byte	40                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x11b:0x9 DW_TAG_member
	.byte	19                              # DW_AT_name
	.long	79                              # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	157                             # DW_AT_decl_line
	.byte	48                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x124:0x9 DW_TAG_member
	.byte	20                              # DW_AT_name
	.long	79                              # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	158                             # DW_AT_decl_line
	.byte	56                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x12d:0x9 DW_TAG_member
	.byte	21                              # DW_AT_name
	.long	79                              # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	158                             # DW_AT_decl_line
	.byte	64                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x136:0x9 DW_TAG_member
	.byte	22                              # DW_AT_name
	.long	79                              # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	159                             # DW_AT_decl_line
	.byte	72                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x13f:0x9 DW_TAG_member
	.byte	23                              # DW_AT_name
	.long	356                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	160                             # DW_AT_decl_line
	.byte	80                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x148:0x9 DW_TAG_member
	.byte	25                              # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	161                             # DW_AT_decl_line
	.byte	88                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x151:0x9 DW_TAG_member
	.byte	26                              # DW_AT_name
	.long	179                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	162                             # DW_AT_decl_line
	.byte	96                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x15a:0x9 DW_TAG_member
	.byte	27                              # DW_AT_name
	.long	179                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	163                             # DW_AT_decl_line
	.byte	100                             # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x164:0x8 DW_TAG_typedef
	.long	191                             # DW_AT_type
	.byte	24                              # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	97                              # DW_AT_decl_line
	.byte	5                               # Abbrev [5] 0x16c:0x4 DW_TAG_base_type
	.byte	32                              # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	2                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x170:0x5 DW_TAG_pointer_type
	.long	191                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x175:0x5 DW_TAG_pointer_type
	.long	378                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x17a:0x8 DW_TAG_typedef
	.long	92                              # DW_AT_type
	.byte	38                              # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	137                             # DW_AT_decl_line
	.byte	7                               # Abbrev [7] 0x182:0x5 DW_TAG_pointer_type
	.long	391                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x187:0x8 DW_TAG_typedef
	.long	399                             # DW_AT_type
	.byte	40                              # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	212                             # DW_AT_decl_line
	.byte	9                               # Abbrev [9] 0x18f:0x18 DW_TAG_structure_type
	.byte	40                              # DW_AT_name
	.byte	16                              # DW_AT_byte_size
	.byte	2                               # DW_AT_decl_file
	.byte	208                             # DW_AT_decl_line
	.byte	10                              # Abbrev [10] 0x194:0x9 DW_TAG_member
	.byte	36                              # DW_AT_name
	.long	373                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	210                             # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x19d:0x9 DW_TAG_member
	.byte	39                              # DW_AT_name
	.long	423                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	211                             # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x1a7:0x5 DW_TAG_pointer_type
	.long	399                             # DW_AT_type
	.byte	11                              # Abbrev [11] 0x1ac:0x1 DW_TAG_pointer_type
	.byte	7                               # Abbrev [7] 0x1ad:0x5 DW_TAG_pointer_type
	.long	434                             # DW_AT_type
	.byte	12                              # Abbrev [12] 0x1b2:0x10 DW_TAG_subroutine_type
	.long	179                             # DW_AT_type
                                        # DW_AT_prototyped
	.byte	13                              # Abbrev [13] 0x1b7:0x5 DW_TAG_formal_parameter
	.long	450                             # DW_AT_type
	.byte	13                              # Abbrev [13] 0x1bc:0x5 DW_TAG_formal_parameter
	.long	450                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x1c2:0x5 DW_TAG_pointer_type
	.long	455                             # DW_AT_type
	.byte	14                              # Abbrev [14] 0x1c7:0x1 DW_TAG_const_type
	.byte	15                              # Abbrev [15] 0x1c8:0x4a DW_TAG_subprogram
	.byte	1                               # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_call_all_calls
	.byte	127                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	48                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	191                             # DW_AT_type
                                        # DW_AT_external
	.byte	16                              # Abbrev [16] 0x1d7:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	138                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	48                              # DW_AT_decl_line
	.long	2360                            # DW_AT_type
	.byte	16                              # Abbrev [16] 0x1e0:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	139                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	48                              # DW_AT_decl_line
	.long	2724                            # DW_AT_type
	.byte	16                              # Abbrev [16] 0x1e9:0x9 DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	140                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	48                              # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	17                              # Abbrev [17] 0x1f2:0xa DW_TAG_variable
	.byte	1                               # DW_AT_location
	.byte	93
	.byte	141                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	57                              # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	18                              # Abbrev [18] 0x1fc:0x9 DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	28                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	56                              # DW_AT_decl_line
	.long	211                             # DW_AT_type
	.byte	19                              # Abbrev [19] 0x205:0x4 DW_TAG_call_site
	.byte	1                               # DW_AT_call_target
	.byte	94
	.byte	2                               # DW_AT_call_return_pc
	.byte	19                              # Abbrev [19] 0x209:0x4 DW_TAG_call_site
	.byte	1                               # DW_AT_call_target
	.byte	94
	.byte	3                               # DW_AT_call_return_pc
	.byte	19                              # Abbrev [19] 0x20d:0x4 DW_TAG_call_site
	.byte	1                               # DW_AT_call_target
	.byte	94
	.byte	4                               # DW_AT_call_return_pc
	.byte	0                               # End Of Children Mark
	.byte	15                              # Abbrev [15] 0x212:0x59 DW_TAG_subprogram
	.byte	5                               # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_call_all_calls
	.byte	128                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	77                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	191                             # DW_AT_type
                                        # DW_AT_external
	.byte	16                              # Abbrev [16] 0x221:0x9 DW_TAG_formal_parameter
	.byte	4                               # DW_AT_location
	.byte	138                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	77                              # DW_AT_decl_line
	.long	2360                            # DW_AT_type
	.byte	16                              # Abbrev [16] 0x22a:0x9 DW_TAG_formal_parameter
	.byte	5                               # DW_AT_location
	.byte	139                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	77                              # DW_AT_decl_line
	.long	2724                            # DW_AT_type
	.byte	16                              # Abbrev [16] 0x233:0x9 DW_TAG_formal_parameter
	.byte	6                               # DW_AT_location
	.byte	142                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	77                              # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	18                              # Abbrev [18] 0x23c:0x9 DW_TAG_variable
	.byte	7                               # DW_AT_location
	.byte	140                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	85                              # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	18                              # Abbrev [18] 0x245:0x9 DW_TAG_variable
	.byte	8                               # DW_AT_location
	.byte	143                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	86                              # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	18                              # Abbrev [18] 0x24e:0x9 DW_TAG_variable
	.byte	9                               # DW_AT_location
	.byte	36                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	85                              # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	18                              # Abbrev [18] 0x257:0x9 DW_TAG_variable
	.byte	10                              # DW_AT_location
	.byte	144                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	86                              # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	20                              # Abbrev [20] 0x260:0x6 DW_TAG_call_site
	.long	456                             # DW_AT_call_origin
	.byte	6                               # DW_AT_call_return_pc
	.byte	19                              # Abbrev [19] 0x266:0x4 DW_TAG_call_site
	.byte	1                               # DW_AT_call_target
	.byte	92
	.byte	7                               # DW_AT_call_return_pc
	.byte	0                               # End Of Children Mark
	.byte	21                              # Abbrev [21] 0x26b:0x81 DW_TAG_subprogram
	.byte	8                               # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_call_all_calls
	.byte	129                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	111                             # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	22                              # Abbrev [22] 0x276:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	138                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	111                             # DW_AT_decl_line
	.long	2360                            # DW_AT_type
	.byte	22                              # Abbrev [22] 0x280:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	145                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	111                             # DW_AT_decl_line
	.long	368                             # DW_AT_type
	.byte	16                              # Abbrev [16] 0x28a:0x9 DW_TAG_formal_parameter
	.byte	11                              # DW_AT_location
	.byte	146                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	111                             # DW_AT_decl_line
	.long	368                             # DW_AT_type
	.byte	16                              # Abbrev [16] 0x293:0x9 DW_TAG_formal_parameter
	.byte	12                              # DW_AT_location
	.byte	147                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	111                             # DW_AT_decl_line
	.long	69                              # DW_AT_type
	.byte	18                              # Abbrev [18] 0x29c:0x9 DW_TAG_variable
	.byte	13                              # DW_AT_location
	.byte	148                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	124                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	23                              # Abbrev [23] 0x2a5:0x9 DW_TAG_variable
	.byte	0                               # DW_AT_const_value
	.byte	149                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	125                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	23                              # Abbrev [23] 0x2ae:0x9 DW_TAG_variable
	.byte	1                               # DW_AT_const_value
	.byte	150                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	132                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	18                              # Abbrev [18] 0x2b7:0x9 DW_TAG_variable
	.byte	14                              # DW_AT_location
	.byte	151                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	121                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	18                              # Abbrev [18] 0x2c0:0x9 DW_TAG_variable
	.byte	15                              # DW_AT_location
	.byte	141                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	126                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	18                              # Abbrev [18] 0x2c9:0x9 DW_TAG_variable
	.byte	16                              # DW_AT_location
	.byte	152                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	126                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	18                              # Abbrev [18] 0x2d2:0x9 DW_TAG_variable
	.byte	17                              # DW_AT_location
	.byte	36                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	127                             # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	24                              # Abbrev [24] 0x2db:0x8 DW_TAG_variable
	.byte	153                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	122                             # DW_AT_decl_line
	.long	69                              # DW_AT_type
	.byte	24                              # Abbrev [24] 0x2e3:0x8 DW_TAG_variable
	.byte	154                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	123                             # DW_AT_decl_line
	.long	368                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	25                              # Abbrev [25] 0x2ec:0x24 DW_TAG_subprogram
	.byte	9                               # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_call_all_calls
	.byte	130                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	30                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	179                             # DW_AT_type
	.byte	22                              # Abbrev [22] 0x2fb:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	155                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	30                              # DW_AT_decl_line
	.long	2935                            # DW_AT_type
	.byte	22                              # Abbrev [22] 0x305:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	156                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	30                              # DW_AT_decl_line
	.long	2935                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	15                              # Abbrev [15] 0x310:0x67 DW_TAG_subprogram
	.byte	10                              # DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_call_all_calls
	.byte	131                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	203                             # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	191                             # DW_AT_type
                                        # DW_AT_external
	.byte	16                              # Abbrev [16] 0x31f:0x9 DW_TAG_formal_parameter
	.byte	18                              # DW_AT_location
	.byte	138                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	203                             # DW_AT_decl_line
	.long	2360                            # DW_AT_type
	.byte	18                              # Abbrev [18] 0x328:0x9 DW_TAG_variable
	.byte	19                              # DW_AT_location
	.byte	36                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	209                             # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	18                              # Abbrev [18] 0x331:0x9 DW_TAG_variable
	.byte	20                              # DW_AT_location
	.byte	157                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	209                             # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	18                              # Abbrev [18] 0x33a:0x9 DW_TAG_variable
	.byte	21                              # DW_AT_location
	.byte	28                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	210                             # DW_AT_decl_line
	.long	2940                            # DW_AT_type
	.byte	18                              # Abbrev [18] 0x343:0x9 DW_TAG_variable
	.byte	22                              # DW_AT_location
	.byte	159                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	210                             # DW_AT_decl_line
	.long	2940                            # DW_AT_type
	.byte	18                              # Abbrev [18] 0x34c:0x9 DW_TAG_variable
	.byte	23                              # DW_AT_location
	.byte	160                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	210                             # DW_AT_decl_line
	.long	2940                            # DW_AT_type
	.byte	18                              # Abbrev [18] 0x355:0x9 DW_TAG_variable
	.byte	24                              # DW_AT_location
	.byte	161                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	211                             # DW_AT_decl_line
	.long	907                             # DW_AT_type
	.byte	20                              # Abbrev [20] 0x35e:0x6 DW_TAG_call_site
	.long	887                             # DW_AT_call_origin
	.byte	11                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x364:0x6 DW_TAG_call_site
	.long	887                             # DW_AT_call_origin
	.byte	12                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x36a:0x6 DW_TAG_call_site
	.long	919                             # DW_AT_call_origin
	.byte	13                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x370:0x6 DW_TAG_call_site
	.long	950                             # DW_AT_call_origin
	.byte	14                              # DW_AT_call_return_pc
	.byte	0                               # End Of Children Mark
	.byte	26                              # Abbrev [26] 0x377:0x14 DW_TAG_subprogram
	.byte	41                              # DW_AT_name
	.byte	5                               # DW_AT_decl_file
	.short	564                             # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	428                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	13                              # Abbrev [13] 0x380:0x5 DW_TAG_formal_parameter
	.long	428                             # DW_AT_type
	.byte	13                              # Abbrev [13] 0x385:0x5 DW_TAG_formal_parameter
	.long	907                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x38b:0x8 DW_TAG_typedef
	.long	915                             # DW_AT_type
	.byte	43                              # DW_AT_name
	.byte	6                               # DW_AT_decl_file
	.byte	46                              # DW_AT_decl_line
	.byte	5                               # Abbrev [5] 0x393:0x4 DW_TAG_base_type
	.byte	42                              # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	26                              # Abbrev [26] 0x397:0x10 DW_TAG_subprogram
	.byte	44                              # DW_AT_name
	.byte	7                               # DW_AT_decl_file
	.short	356                             # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	179                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	13                              # Abbrev [13] 0x3a0:0x5 DW_TAG_formal_parameter
	.long	935                             # DW_AT_type
	.byte	27                              # Abbrev [27] 0x3a5:0x1 DW_TAG_unspecified_parameters
	.byte	0                               # End Of Children Mark
	.byte	28                              # Abbrev [28] 0x3a7:0x5 DW_TAG_restrict_type
	.long	940                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x3ac:0x5 DW_TAG_pointer_type
	.long	945                             # DW_AT_type
	.byte	29                              # Abbrev [29] 0x3b1:0x5 DW_TAG_const_type
	.long	61                              # DW_AT_type
	.byte	30                              # Abbrev [30] 0x3b6:0xe DW_TAG_subprogram
	.byte	45                              # DW_AT_name
	.byte	7                               # DW_AT_decl_file
	.byte	230                             # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	179                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	13                              # Abbrev [13] 0x3be:0x5 DW_TAG_formal_parameter
	.long	964                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x3c4:0x5 DW_TAG_pointer_type
	.long	969                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x3c9:0x8 DW_TAG_typedef
	.long	977                             # DW_AT_type
	.byte	84                              # DW_AT_name
	.byte	9                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.byte	9                               # Abbrev [9] 0x3d1:0x10b DW_TAG_structure_type
	.byte	83                              # DW_AT_name
	.byte	216                             # DW_AT_byte_size
	.byte	8                               # DW_AT_decl_file
	.byte	49                              # DW_AT_decl_line
	.byte	10                              # Abbrev [10] 0x3d6:0x9 DW_TAG_member
	.byte	46                              # DW_AT_name
	.long	179                             # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	51                              # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x3df:0x9 DW_TAG_member
	.byte	47                              # DW_AT_name
	.long	1244                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	54                              # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x3e8:0x9 DW_TAG_member
	.byte	48                              # DW_AT_name
	.long	1244                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	55                              # DW_AT_decl_line
	.byte	16                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x3f1:0x9 DW_TAG_member
	.byte	49                              # DW_AT_name
	.long	1244                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	56                              # DW_AT_decl_line
	.byte	24                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x3fa:0x9 DW_TAG_member
	.byte	50                              # DW_AT_name
	.long	1244                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	57                              # DW_AT_decl_line
	.byte	32                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x403:0x9 DW_TAG_member
	.byte	51                              # DW_AT_name
	.long	1244                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	58                              # DW_AT_decl_line
	.byte	40                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x40c:0x9 DW_TAG_member
	.byte	52                              # DW_AT_name
	.long	1244                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	59                              # DW_AT_decl_line
	.byte	48                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x415:0x9 DW_TAG_member
	.byte	53                              # DW_AT_name
	.long	1244                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	60                              # DW_AT_decl_line
	.byte	56                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x41e:0x9 DW_TAG_member
	.byte	54                              # DW_AT_name
	.long	1244                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	61                              # DW_AT_decl_line
	.byte	64                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x427:0x9 DW_TAG_member
	.byte	55                              # DW_AT_name
	.long	1244                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	64                              # DW_AT_decl_line
	.byte	72                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x430:0x9 DW_TAG_member
	.byte	56                              # DW_AT_name
	.long	1244                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	65                              # DW_AT_decl_line
	.byte	80                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x439:0x9 DW_TAG_member
	.byte	57                              # DW_AT_name
	.long	1244                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	66                              # DW_AT_decl_line
	.byte	88                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x442:0x9 DW_TAG_member
	.byte	58                              # DW_AT_name
	.long	1249                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	68                              # DW_AT_decl_line
	.byte	96                              # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x44b:0x9 DW_TAG_member
	.byte	60                              # DW_AT_name
	.long	1256                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	70                              # DW_AT_decl_line
	.byte	104                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x454:0x9 DW_TAG_member
	.byte	61                              # DW_AT_name
	.long	179                             # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	72                              # DW_AT_decl_line
	.byte	112                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x45d:0x9 DW_TAG_member
	.byte	62                              # DW_AT_name
	.long	179                             # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	73                              # DW_AT_decl_line
	.byte	116                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x466:0x9 DW_TAG_member
	.byte	63                              # DW_AT_name
	.long	1261                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	74                              # DW_AT_decl_line
	.byte	120                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x46f:0x9 DW_TAG_member
	.byte	65                              # DW_AT_name
	.long	1269                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	77                              # DW_AT_decl_line
	.byte	128                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x478:0x9 DW_TAG_member
	.byte	67                              # DW_AT_name
	.long	1273                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	78                              # DW_AT_decl_line
	.byte	130                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x481:0x9 DW_TAG_member
	.byte	69                              # DW_AT_name
	.long	1277                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	79                              # DW_AT_decl_line
	.byte	131                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x48a:0x9 DW_TAG_member
	.byte	70                              # DW_AT_name
	.long	1289                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	81                              # DW_AT_decl_line
	.byte	136                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x493:0x9 DW_TAG_member
	.byte	72                              # DW_AT_name
	.long	1298                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	89                              # DW_AT_decl_line
	.byte	144                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x49c:0x9 DW_TAG_member
	.byte	74                              # DW_AT_name
	.long	1306                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	91                              # DW_AT_decl_line
	.byte	152                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x4a5:0x9 DW_TAG_member
	.byte	76                              # DW_AT_name
	.long	1313                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	92                              # DW_AT_decl_line
	.byte	160                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x4ae:0x9 DW_TAG_member
	.byte	78                              # DW_AT_name
	.long	1256                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	93                              # DW_AT_decl_line
	.byte	168                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x4b7:0x9 DW_TAG_member
	.byte	79                              # DW_AT_name
	.long	428                             # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	94                              # DW_AT_decl_line
	.byte	176                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x4c0:0x9 DW_TAG_member
	.byte	80                              # DW_AT_name
	.long	907                             # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	95                              # DW_AT_decl_line
	.byte	184                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x4c9:0x9 DW_TAG_member
	.byte	81                              # DW_AT_name
	.long	179                             # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	96                              # DW_AT_decl_line
	.byte	192                             # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x4d2:0x9 DW_TAG_member
	.byte	82                              # DW_AT_name
	.long	1320                            # DW_AT_type
	.byte	8                               # DW_AT_decl_file
	.byte	98                              # DW_AT_decl_line
	.byte	196                             # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x4dc:0x5 DW_TAG_pointer_type
	.long	61                              # DW_AT_type
	.byte	7                               # Abbrev [7] 0x4e1:0x5 DW_TAG_pointer_type
	.long	1254                            # DW_AT_type
	.byte	31                              # Abbrev [31] 0x4e6:0x2 DW_TAG_structure_type
	.byte	59                              # DW_AT_name
                                        # DW_AT_declaration
	.byte	7                               # Abbrev [7] 0x4e8:0x5 DW_TAG_pointer_type
	.long	977                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x4ed:0x8 DW_TAG_typedef
	.long	207                             # DW_AT_type
	.byte	64                              # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	152                             # DW_AT_decl_line
	.byte	5                               # Abbrev [5] 0x4f5:0x4 DW_TAG_base_type
	.byte	66                              # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	2                               # DW_AT_byte_size
	.byte	5                               # Abbrev [5] 0x4f9:0x4 DW_TAG_base_type
	.byte	68                              # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	3                               # Abbrev [3] 0x4fd:0xc DW_TAG_array_type
	.long	61                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0x502:0x6 DW_TAG_subrange_type
	.long	65                              # DW_AT_type
	.byte	1                               # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x509:0x5 DW_TAG_pointer_type
	.long	1294                            # DW_AT_type
	.byte	32                              # Abbrev [32] 0x50e:0x4 DW_TAG_typedef
	.byte	71                              # DW_AT_name
	.byte	8                               # DW_AT_decl_file
	.byte	43                              # DW_AT_decl_line
	.byte	8                               # Abbrev [8] 0x512:0x8 DW_TAG_typedef
	.long	207                             # DW_AT_type
	.byte	73                              # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	153                             # DW_AT_decl_line
	.byte	7                               # Abbrev [7] 0x51a:0x5 DW_TAG_pointer_type
	.long	1311                            # DW_AT_type
	.byte	31                              # Abbrev [31] 0x51f:0x2 DW_TAG_structure_type
	.byte	75                              # DW_AT_name
                                        # DW_AT_declaration
	.byte	7                               # Abbrev [7] 0x521:0x5 DW_TAG_pointer_type
	.long	1318                            # DW_AT_type
	.byte	31                              # Abbrev [31] 0x526:0x2 DW_TAG_structure_type
	.byte	77                              # DW_AT_name
                                        # DW_AT_declaration
	.byte	3                               # Abbrev [3] 0x528:0xc DW_TAG_array_type
	.long	61                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0x52d:0x6 DW_TAG_subrange_type
	.long	65                              # DW_AT_type
	.byte	20                              # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	33                              # Abbrev [33] 0x534:0x6c DW_TAG_subprogram
	.byte	15                              # DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_call_all_calls
	.byte	132                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	263                             # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	34                              # Abbrev [34] 0x540:0xb DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	162                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	263                             # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	35                              # Abbrev [35] 0x54b:0xa DW_TAG_formal_parameter
	.byte	25                              # DW_AT_location
	.byte	163                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	263                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	35                              # Abbrev [35] 0x555:0xa DW_TAG_formal_parameter
	.byte	26                              # DW_AT_location
	.byte	12                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	263                             # DW_AT_decl_line
	.long	2940                            # DW_AT_type
	.byte	34                              # Abbrev [34] 0x55f:0xb DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	82
	.byte	30                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	263                             # DW_AT_decl_line
	.long	2940                            # DW_AT_type
	.byte	34                              # Abbrev [34] 0x56a:0xb DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	88
	.byte	7                               # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	264                             # DW_AT_decl_line
	.long	183                             # DW_AT_type
	.byte	34                              # Abbrev [34] 0x575:0xb DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	89
	.byte	164                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	264                             # DW_AT_decl_line
	.long	183                             # DW_AT_type
	.byte	36                              # Abbrev [36] 0x580:0x9 DW_TAG_formal_parameter
	.byte	92                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	264                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	34                              # Abbrev [34] 0x589:0xc DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	40
	.byte	26                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	264                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x595:0xa DW_TAG_variable
	.byte	27                              # DW_AT_location
	.byte	165                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	277                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	33                              # Abbrev [33] 0x5a0:0x6f DW_TAG_subprogram
	.byte	16                              # DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_call_all_calls
	.byte	133                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	314                             # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	34                              # Abbrev [34] 0x5ac:0xb DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	162                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	314                             # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	34                              # Abbrev [34] 0x5b7:0xb DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	12                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	314                             # DW_AT_decl_line
	.long	2940                            # DW_AT_type
	.byte	34                              # Abbrev [34] 0x5c2:0xb DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	81
	.byte	30                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	314                             # DW_AT_decl_line
	.long	2940                            # DW_AT_type
	.byte	34                              # Abbrev [34] 0x5cd:0xb DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	82
	.byte	7                               # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	315                             # DW_AT_decl_line
	.long	183                             # DW_AT_type
	.byte	34                              # Abbrev [34] 0x5d8:0xb DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	88
	.byte	164                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	315                             # DW_AT_decl_line
	.long	183                             # DW_AT_type
	.byte	34                              # Abbrev [34] 0x5e3:0xb DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	89
	.byte	166                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	315                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	34                              # Abbrev [34] 0x5ee:0xc DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	32
	.byte	26                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	315                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x5fa:0xa DW_TAG_variable
	.byte	28                              # DW_AT_location
	.byte	165                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	328                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x604:0xa DW_TAG_variable
	.byte	29                              # DW_AT_location
	.byte	167                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	329                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	33                              # Abbrev [33] 0x60f:0x40 DW_TAG_subprogram
	.byte	17                              # DW_AT_low_pc
	.long	.Lfunc_end7-.Lfunc_begin7       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_call_all_calls
	.byte	134                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	383                             # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	36                              # Abbrev [36] 0x61b:0x9 DW_TAG_formal_parameter
	.byte	138                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	383                             # DW_AT_decl_line
	.long	2360                            # DW_AT_type
	.byte	34                              # Abbrev [34] 0x624:0xb DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	84
	.byte	168                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	383                             # DW_AT_decl_line
	.long	368                             # DW_AT_type
	.byte	34                              # Abbrev [34] 0x62f:0xb DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	81
	.byte	147                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	383                             # DW_AT_decl_line
	.long	2953                            # DW_AT_type
	.byte	35                              # Abbrev [35] 0x63a:0xa DW_TAG_formal_parameter
	.byte	30                              # DW_AT_location
	.byte	150                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	383                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x644:0xa DW_TAG_variable
	.byte	31                              # DW_AT_location
	.byte	141                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	391                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	38                              # Abbrev [38] 0x64f:0xab DW_TAG_subprogram
	.byte	18                              # DW_AT_low_pc
	.long	.Lfunc_end8-.Lfunc_begin8       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_call_all_calls
	.byte	135                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	401                             # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	191                             # DW_AT_type
                                        # DW_AT_external
	.byte	36                              # Abbrev [36] 0x65f:0x9 DW_TAG_formal_parameter
	.byte	138                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	401                             # DW_AT_decl_line
	.long	2360                            # DW_AT_type
	.byte	35                              # Abbrev [35] 0x668:0xa DW_TAG_formal_parameter
	.byte	32                              # DW_AT_location
	.byte	169                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	401                             # DW_AT_decl_line
	.long	368                             # DW_AT_type
	.byte	35                              # Abbrev [35] 0x672:0xa DW_TAG_formal_parameter
	.byte	33                              # DW_AT_location
	.byte	170                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	401                             # DW_AT_decl_line
	.long	2935                            # DW_AT_type
	.byte	35                              # Abbrev [35] 0x67c:0xa DW_TAG_formal_parameter
	.byte	34                              # DW_AT_location
	.byte	171                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	401                             # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	35                              # Abbrev [35] 0x686:0xa DW_TAG_formal_parameter
	.byte	35                              # DW_AT_location
	.byte	172                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	401                             # DW_AT_decl_line
	.long	179                             # DW_AT_type
	.byte	35                              # Abbrev [35] 0x690:0xa DW_TAG_formal_parameter
	.byte	36                              # DW_AT_location
	.byte	166                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	401                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	35                              # Abbrev [35] 0x69a:0xa DW_TAG_formal_parameter
	.byte	37                              # DW_AT_location
	.byte	173                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	401                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	35                              # Abbrev [35] 0x6a4:0xa DW_TAG_formal_parameter
	.byte	38                              # DW_AT_location
	.byte	150                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	401                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x6ae:0xa DW_TAG_variable
	.byte	39                              # DW_AT_location
	.byte	174                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	414                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x6b8:0xa DW_TAG_variable
	.byte	40                              # DW_AT_location
	.byte	141                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	414                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x6c2:0xa DW_TAG_variable
	.byte	41                              # DW_AT_location
	.byte	175                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	414                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x6cc:0xa DW_TAG_variable
	.byte	42                              # DW_AT_location
	.byte	176                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	414                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x6d6:0xa DW_TAG_variable
	.byte	43                              # DW_AT_location
	.byte	177                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	414                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x6e0:0xa DW_TAG_variable
	.byte	44                              # DW_AT_location
	.byte	178                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	415                             # DW_AT_decl_line
	.long	378                             # DW_AT_type
	.byte	39                              # Abbrev [39] 0x6ea:0x9 DW_TAG_variable
	.byte	179                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	415                             # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	20                              # Abbrev [20] 0x6f3:0x6 DW_TAG_call_site
	.long	1440                            # DW_AT_call_origin
	.byte	19                              # DW_AT_call_return_pc
	.byte	0                               # End Of Children Mark
	.byte	38                              # Abbrev [38] 0x6fa:0x220 DW_TAG_subprogram
	.byte	20                              # DW_AT_low_pc
	.long	.Lfunc_end9-.Lfunc_begin9       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_call_all_calls
	.byte	136                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	444                             # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	191                             # DW_AT_type
                                        # DW_AT_external
	.byte	35                              # Abbrev [35] 0x70a:0xa DW_TAG_formal_parameter
	.byte	45                              # DW_AT_location
	.byte	138                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	444                             # DW_AT_decl_line
	.long	2360                            # DW_AT_type
	.byte	37                              # Abbrev [37] 0x714:0xa DW_TAG_variable
	.byte	46                              # DW_AT_location
	.byte	145                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	452                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x71e:0xa DW_TAG_variable
	.byte	47                              # DW_AT_location
	.byte	180                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	453                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x728:0xa DW_TAG_variable
	.byte	48                              # DW_AT_location
	.byte	181                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	455                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x732:0xa DW_TAG_variable
	.byte	49                              # DW_AT_location
	.byte	182                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	462                             # DW_AT_decl_line
	.long	364                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x73c:0xa DW_TAG_variable
	.byte	50                              # DW_AT_location
	.byte	174                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	463                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x746:0xa DW_TAG_variable
	.byte	51                              # DW_AT_location
	.byte	105                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	471                             # DW_AT_decl_line
	.long	183                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x750:0xa DW_TAG_variable
	.byte	52                              # DW_AT_location
	.byte	183                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	473                             # DW_AT_decl_line
	.long	183                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x75a:0xa DW_TAG_variable
	.byte	53                              # DW_AT_location
	.byte	150                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	483                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x764:0xa DW_TAG_variable
	.byte	54                              # DW_AT_location
	.byte	146                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	458                             # DW_AT_decl_line
	.long	368                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x76e:0xa DW_TAG_variable
	.byte	55                              # DW_AT_location
	.byte	169                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	459                             # DW_AT_decl_line
	.long	368                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x778:0xa DW_TAG_variable
	.byte	56                              # DW_AT_location
	.byte	147                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	460                             # DW_AT_decl_line
	.long	69                              # DW_AT_type
	.byte	37                              # Abbrev [37] 0x782:0xa DW_TAG_variable
	.byte	57                              # DW_AT_location
	.byte	170                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	460                             # DW_AT_decl_line
	.long	74                              # DW_AT_type
	.byte	37                              # Abbrev [37] 0x78c:0xa DW_TAG_variable
	.byte	58                              # DW_AT_location
	.byte	140                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	477                             # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x796:0xa DW_TAG_variable
	.byte	59                              # DW_AT_location
	.byte	184                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	464                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x7a0:0xa DW_TAG_variable
	.byte	60                              # DW_AT_location
	.byte	173                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	465                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x7aa:0xa DW_TAG_variable
	.byte	61                              # DW_AT_location
	.byte	166                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	456                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x7b4:0xa DW_TAG_variable
	.byte	62                              # DW_AT_location
	.byte	185                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	462                             # DW_AT_decl_line
	.long	364                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x7be:0xa DW_TAG_variable
	.byte	63                              # DW_AT_location
	.byte	168                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	461                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x7c8:0xa DW_TAG_variable
	.byte	64                              # DW_AT_location
	.byte	172                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	457                             # DW_AT_decl_line
	.long	179                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x7d2:0xa DW_TAG_variable
	.byte	65                              # DW_AT_location
	.byte	171                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	477                             # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x7dc:0xa DW_TAG_variable
	.byte	66                              # DW_AT_location
	.byte	186                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	451                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x7e6:0xa DW_TAG_variable
	.byte	67                              # DW_AT_location
	.byte	5                               # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	459                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x7f0:0xa DW_TAG_variable
	.byte	68                              # DW_AT_location
	.byte	187                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	459                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x7fa:0xa DW_TAG_variable
	.byte	69                              # DW_AT_location
	.byte	141                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	450                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x804:0xa DW_TAG_variable
	.byte	70                              # DW_AT_location
	.byte	188                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	477                             # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x80e:0xa DW_TAG_variable
	.byte	71                              # DW_AT_location
	.byte	189                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	467                             # DW_AT_decl_line
	.long	386                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x818:0xa DW_TAG_variable
	.byte	72                              # DW_AT_location
	.byte	190                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	468                             # DW_AT_decl_line
	.long	386                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x822:0xa DW_TAG_variable
	.byte	73                              # DW_AT_location
	.byte	30                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	478                             # DW_AT_decl_line
	.long	2940                            # DW_AT_type
	.byte	37                              # Abbrev [37] 0x82c:0xa DW_TAG_variable
	.byte	74                              # DW_AT_location
	.byte	191                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	454                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x836:0xa DW_TAG_variable
	.byte	75                              # DW_AT_location
	.byte	192                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	469                             # DW_AT_decl_line
	.long	386                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x840:0xa DW_TAG_variable
	.byte	76                              # DW_AT_location
	.byte	193                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	477                             # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x84a:0xa DW_TAG_variable
	.byte	77                              # DW_AT_location
	.byte	12                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	478                             # DW_AT_decl_line
	.long	2940                            # DW_AT_type
	.byte	37                              # Abbrev [37] 0x854:0xa DW_TAG_variable
	.byte	78                              # DW_AT_location
	.byte	164                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	474                             # DW_AT_decl_line
	.long	183                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0x85e:0xa DW_TAG_variable
	.byte	79                              # DW_AT_location
	.byte	160                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	477                             # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	39                              # Abbrev [39] 0x868:0x9 DW_TAG_variable
	.byte	194                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	472                             # DW_AT_decl_line
	.long	183                             # DW_AT_type
	.byte	39                              # Abbrev [39] 0x871:0x9 DW_TAG_variable
	.byte	195                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	475                             # DW_AT_decl_line
	.long	183                             # DW_AT_type
	.byte	39                              # Abbrev [39] 0x87a:0x9 DW_TAG_variable
	.byte	36                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	477                             # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	20                              # Abbrev [20] 0x883:0x6 DW_TAG_call_site
	.long	2330                            # DW_AT_call_origin
	.byte	21                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x889:0x6 DW_TAG_call_site
	.long	2330                            # DW_AT_call_origin
	.byte	22                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x88f:0x6 DW_TAG_call_site
	.long	2330                            # DW_AT_call_origin
	.byte	23                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x895:0x6 DW_TAG_call_site
	.long	2330                            # DW_AT_call_origin
	.byte	24                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x89b:0x6 DW_TAG_call_site
	.long	784                             # DW_AT_call_origin
	.byte	25                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x8a1:0x6 DW_TAG_call_site
	.long	2345                            # DW_AT_call_origin
	.byte	26                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x8a7:0x6 DW_TAG_call_site
	.long	2745                            # DW_AT_call_origin
	.byte	27                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x8ad:0x6 DW_TAG_call_site
	.long	1551                            # DW_AT_call_origin
	.byte	28                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x8b3:0x6 DW_TAG_call_site
	.long	1551                            # DW_AT_call_origin
	.byte	29                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x8b9:0x6 DW_TAG_call_site
	.long	1615                            # DW_AT_call_origin
	.byte	30                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x8bf:0x6 DW_TAG_call_site
	.long	2745                            # DW_AT_call_origin
	.byte	31                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x8c5:0x6 DW_TAG_call_site
	.long	1332                            # DW_AT_call_origin
	.byte	32                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x8cb:0x6 DW_TAG_call_site
	.long	1440                            # DW_AT_call_origin
	.byte	33                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x8d1:0x6 DW_TAG_call_site
	.long	1615                            # DW_AT_call_origin
	.byte	34                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x8d7:0x6 DW_TAG_call_site
	.long	2765                            # DW_AT_call_origin
	.byte	35                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x8dd:0x6 DW_TAG_call_site
	.long	2776                            # DW_AT_call_origin
	.byte	36                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x8e3:0x6 DW_TAG_call_site
	.long	619                             # DW_AT_call_origin
	.byte	37                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x8e9:0x6 DW_TAG_call_site
	.long	2765                            # DW_AT_call_origin
	.byte	38                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x8ef:0x6 DW_TAG_call_site
	.long	2801                            # DW_AT_call_origin
	.byte	39                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x8f5:0x6 DW_TAG_call_site
	.long	2801                            # DW_AT_call_origin
	.byte	40                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x8fb:0x6 DW_TAG_call_site
	.long	530                             # DW_AT_call_origin
	.byte	41                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x901:0x6 DW_TAG_call_site
	.long	2765                            # DW_AT_call_origin
	.byte	42                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x907:0x6 DW_TAG_call_site
	.long	2765                            # DW_AT_call_origin
	.byte	43                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x90d:0x6 DW_TAG_call_site
	.long	2765                            # DW_AT_call_origin
	.byte	44                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0x913:0x6 DW_TAG_call_site
	.long	2765                            # DW_AT_call_origin
	.byte	45                              # DW_AT_call_return_pc
	.byte	0                               # End Of Children Mark
	.byte	26                              # Abbrev [26] 0x91a:0xf DW_TAG_subprogram
	.byte	85                              # DW_AT_name
	.byte	5                               # DW_AT_decl_file
	.short	553                             # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	428                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	13                              # Abbrev [13] 0x923:0x5 DW_TAG_formal_parameter
	.long	907                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	40                              # Abbrev [40] 0x929:0xf DW_TAG_subprogram
	.byte	86                              # DW_AT_name
	.byte	10                              # DW_AT_decl_file
	.byte	31                              # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	13                              # Abbrev [13] 0x92d:0x5 DW_TAG_formal_parameter
	.long	2360                            # DW_AT_type
	.byte	13                              # Abbrev [13] 0x932:0x5 DW_TAG_formal_parameter
	.long	2724                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x938:0x5 DW_TAG_pointer_type
	.long	2365                            # DW_AT_type
	.byte	8                               # Abbrev [8] 0x93d:0x8 DW_TAG_typedef
	.long	2373                            # DW_AT_type
	.byte	122                             # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	206                             # DW_AT_decl_line
	.byte	41                              # Abbrev [41] 0x945:0x14f DW_TAG_structure_type
	.byte	121                             # DW_AT_name
	.short	648                             # DW_AT_byte_size
	.byte	2                               # DW_AT_decl_file
	.byte	181                             # DW_AT_decl_line
	.byte	10                              # Abbrev [10] 0x94b:0x9 DW_TAG_member
	.byte	87                              # DW_AT_name
	.long	2708                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	183                             # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	10                              # Abbrev [10] 0x954:0x9 DW_TAG_member
	.byte	88                              # DW_AT_name
	.long	2708                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	184                             # DW_AT_decl_line
	.byte	200                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x95d:0xa DW_TAG_member
	.byte	89                              # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	185                             # DW_AT_decl_line
	.short	400                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x967:0xa DW_TAG_member
	.byte	90                              # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	185                             # DW_AT_decl_line
	.short	408                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x971:0xa DW_TAG_member
	.byte	91                              # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	186                             # DW_AT_decl_line
	.short	416                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x97b:0xa DW_TAG_member
	.byte	92                              # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	186                             # DW_AT_decl_line
	.short	424                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x985:0xa DW_TAG_member
	.byte	93                              # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	186                             # DW_AT_decl_line
	.short	432                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x98f:0xa DW_TAG_member
	.byte	94                              # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	186                             # DW_AT_decl_line
	.short	440                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x999:0xa DW_TAG_member
	.byte	95                              # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	187                             # DW_AT_decl_line
	.short	448                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x9a3:0xa DW_TAG_member
	.byte	96                              # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	187                             # DW_AT_decl_line
	.short	456                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x9ad:0xa DW_TAG_member
	.byte	97                              # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	189                             # DW_AT_decl_line
	.short	464                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x9b7:0xa DW_TAG_member
	.byte	98                              # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	190                             # DW_AT_decl_line
	.short	472                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x9c1:0xa DW_TAG_member
	.byte	99                              # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	191                             # DW_AT_decl_line
	.short	480                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x9cb:0xa DW_TAG_member
	.byte	100                             # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	192                             # DW_AT_decl_line
	.short	488                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x9d5:0xa DW_TAG_member
	.byte	101                             # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	193                             # DW_AT_decl_line
	.short	496                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x9df:0xa DW_TAG_member
	.byte	102                             # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	194                             # DW_AT_decl_line
	.short	504                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x9e9:0xa DW_TAG_member
	.byte	103                             # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	195                             # DW_AT_decl_line
	.short	512                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x9f3:0xa DW_TAG_member
	.byte	104                             # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	196                             # DW_AT_decl_line
	.short	520                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0x9fd:0xa DW_TAG_member
	.byte	105                             # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	197                             # DW_AT_decl_line
	.short	528                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0xa07:0xa DW_TAG_member
	.byte	106                             # DW_AT_name
	.long	2720                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	198                             # DW_AT_decl_line
	.short	536                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0xa11:0xa DW_TAG_member
	.byte	108                             # DW_AT_name
	.long	183                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	199                             # DW_AT_decl_line
	.short	544                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0xa1b:0xa DW_TAG_member
	.byte	109                             # DW_AT_name
	.long	211                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	200                             # DW_AT_decl_line
	.short	552                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0xa25:0xa DW_TAG_member
	.byte	110                             # DW_AT_name
	.long	211                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	200                             # DW_AT_decl_line
	.short	560                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0xa2f:0xa DW_TAG_member
	.byte	111                             # DW_AT_name
	.long	79                              # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	201                             # DW_AT_decl_line
	.short	568                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0xa39:0xa DW_TAG_member
	.byte	112                             # DW_AT_name
	.long	79                              # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	201                             # DW_AT_decl_line
	.short	576                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0xa43:0xa DW_TAG_member
	.byte	113                             # DW_AT_name
	.long	79                              # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	201                             # DW_AT_decl_line
	.short	584                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0xa4d:0xa DW_TAG_member
	.byte	114                             # DW_AT_name
	.long	79                              # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	202                             # DW_AT_decl_line
	.short	592                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0xa57:0xa DW_TAG_member
	.byte	115                             # DW_AT_name
	.long	79                              # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	202                             # DW_AT_decl_line
	.short	600                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0xa61:0xa DW_TAG_member
	.byte	116                             # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	203                             # DW_AT_decl_line
	.short	608                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0xa6b:0xa DW_TAG_member
	.byte	117                             # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	204                             # DW_AT_decl_line
	.short	616                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0xa75:0xa DW_TAG_member
	.byte	118                             # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	205                             # DW_AT_decl_line
	.short	624                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0xa7f:0xa DW_TAG_member
	.byte	119                             # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	205                             # DW_AT_decl_line
	.short	632                             # DW_AT_data_member_location
	.byte	42                              # Abbrev [42] 0xa89:0xa DW_TAG_member
	.byte	120                             # DW_AT_name
	.long	191                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	205                             # DW_AT_decl_line
	.short	640                             # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	3                               # Abbrev [3] 0xa94:0xc DW_TAG_array_type
	.long	61                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0xa99:0x6 DW_TAG_subrange_type
	.long	65                              # DW_AT_type
	.byte	200                             # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0xaa0:0x4 DW_TAG_base_type
	.byte	107                             # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0xaa4:0x5 DW_TAG_pointer_type
	.long	2729                            # DW_AT_type
	.byte	12                              # Abbrev [12] 0xaa9:0x10 DW_TAG_subroutine_type
	.long	191                             # DW_AT_type
                                        # DW_AT_prototyped
	.byte	13                              # Abbrev [13] 0xaae:0x5 DW_TAG_formal_parameter
	.long	2360                            # DW_AT_type
	.byte	13                              # Abbrev [13] 0xab3:0x5 DW_TAG_formal_parameter
	.long	191                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	26                              # Abbrev [26] 0xab9:0x14 DW_TAG_subprogram
	.byte	123                             # DW_AT_name
	.byte	5                               # DW_AT_decl_file
	.short	556                             # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	428                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	13                              # Abbrev [13] 0xac2:0x5 DW_TAG_formal_parameter
	.long	907                             # DW_AT_type
	.byte	13                              # Abbrev [13] 0xac7:0x5 DW_TAG_formal_parameter
	.long	907                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	43                              # Abbrev [43] 0xacd:0xb DW_TAG_subprogram
	.byte	124                             # DW_AT_name
	.byte	5                               # DW_AT_decl_file
	.short	568                             # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	13                              # Abbrev [13] 0xad2:0x5 DW_TAG_formal_parameter
	.long	428                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	40                              # Abbrev [40] 0xad8:0x19 DW_TAG_subprogram
	.byte	125                             # DW_AT_name
	.byte	11                              # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	13                              # Abbrev [13] 0xadc:0x5 DW_TAG_formal_parameter
	.long	428                             # DW_AT_type
	.byte	13                              # Abbrev [13] 0xae1:0x5 DW_TAG_formal_parameter
	.long	907                             # DW_AT_type
	.byte	13                              # Abbrev [13] 0xae6:0x5 DW_TAG_formal_parameter
	.long	907                             # DW_AT_type
	.byte	13                              # Abbrev [13] 0xaeb:0x5 DW_TAG_formal_parameter
	.long	429                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	30                              # Abbrev [30] 0xaf1:0x13 DW_TAG_subprogram
	.byte	126                             # DW_AT_name
	.byte	10                              # DW_AT_decl_file
	.byte	37                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	191                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	13                              # Abbrev [13] 0xaf9:0x5 DW_TAG_formal_parameter
	.long	2360                            # DW_AT_type
	.byte	13                              # Abbrev [13] 0xafe:0x5 DW_TAG_formal_parameter
	.long	191                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	38                              # Abbrev [38] 0xb04:0x73 DW_TAG_subprogram
	.byte	46                              # DW_AT_low_pc
	.long	.Lfunc_end10-.Lfunc_begin10     # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_call_all_calls
	.byte	137                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	787                             # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	191                             # DW_AT_type
                                        # DW_AT_external
	.byte	35                              # Abbrev [35] 0xb14:0xa DW_TAG_formal_parameter
	.byte	80                              # DW_AT_location
	.byte	138                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	787                             # DW_AT_decl_line
	.long	2360                            # DW_AT_type
	.byte	35                              # Abbrev [35] 0xb1e:0xa DW_TAG_formal_parameter
	.byte	81                              # DW_AT_location
	.byte	196                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	787                             # DW_AT_decl_line
	.long	183                             # DW_AT_type
	.byte	35                              # Abbrev [35] 0xb28:0xa DW_TAG_formal_parameter
	.byte	82                              # DW_AT_location
	.byte	197                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	787                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0xb32:0xa DW_TAG_variable
	.byte	83                              # DW_AT_location
	.byte	198                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	795                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0xb3c:0xa DW_TAG_variable
	.byte	84                              # DW_AT_location
	.byte	199                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	799                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0xb46:0xa DW_TAG_variable
	.byte	85                              # DW_AT_location
	.byte	160                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	799                             # DW_AT_decl_line
	.long	191                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0xb50:0xa DW_TAG_variable
	.byte	86                              # DW_AT_location
	.byte	36                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	798                             # DW_AT_decl_line
	.long	373                             # DW_AT_type
	.byte	37                              # Abbrev [37] 0xb5a:0xa DW_TAG_variable
	.byte	87                              # DW_AT_location
	.byte	164                             # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	797                             # DW_AT_decl_line
	.long	183                             # DW_AT_type
	.byte	20                              # Abbrev [20] 0xb64:0x6 DW_TAG_call_site
	.long	530                             # DW_AT_call_origin
	.byte	47                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0xb6a:0x6 DW_TAG_call_site
	.long	2345                            # DW_AT_call_origin
	.byte	48                              # DW_AT_call_return_pc
	.byte	20                              # Abbrev [20] 0xb70:0x6 DW_TAG_call_site
	.long	2801                            # DW_AT_call_origin
	.byte	49                              # DW_AT_call_return_pc
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0xb77:0x5 DW_TAG_pointer_type
	.long	373                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xb7c:0x5 DW_TAG_pointer_type
	.long	2945                            # DW_AT_type
	.byte	8                               # Abbrev [8] 0xb81:0x8 DW_TAG_typedef
	.long	224                             # DW_AT_type
	.byte	158                             # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	134                             # DW_AT_decl_line
	.byte	7                               # Abbrev [7] 0xb89:0x5 DW_TAG_pointer_type
	.long	2935                            # DW_AT_type
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.long	804                             # Length of String Offsets Set
	.short	5
	.short	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 17.0.0 (git@github.com:webmiche/llvm-project.git 8ae5341dd666ebd9607a787b37484c371785e975)" # string offset=0
.Linfo_string1:
	.asciz	"/home/michel/ETH/AST/specbuilder/src/605/implicit.c" # string offset=105
.Linfo_string2:
	.asciz	"/home/michel/ETH/AST/specbuilder/src/605" # string offset=157
.Linfo_string3:
	.asciz	"char"                          # string offset=198
.Linfo_string4:
	.asciz	"__ARRAY_SIZE_TYPE__"           # string offset=203
.Linfo_string5:
	.asciz	"id"                            # string offset=223
.Linfo_string6:
	.asciz	"int"                           # string offset=226
.Linfo_string7:
	.asciz	"cost"                          # string offset=230
.Linfo_string8:
	.asciz	"long"                          # string offset=235
.Linfo_string9:
	.asciz	"__int64_t"                     # string offset=240
.Linfo_string10:
	.asciz	"int64_t"                       # string offset=250
.Linfo_string11:
	.asciz	"cost_t"                        # string offset=258
.Linfo_string12:
	.asciz	"tail"                          # string offset=265
.Linfo_string13:
	.asciz	"potential"                     # string offset=270
.Linfo_string14:
	.asciz	"orientation"                   # string offset=280
.Linfo_string15:
	.asciz	"child"                         # string offset=292
.Linfo_string16:
	.asciz	"pred"                          # string offset=298
.Linfo_string17:
	.asciz	"sibling"                       # string offset=303
.Linfo_string18:
	.asciz	"sibling_prev"                  # string offset=311
.Linfo_string19:
	.asciz	"basic_arc"                     # string offset=324
.Linfo_string20:
	.asciz	"firstout"                      # string offset=334
.Linfo_string21:
	.asciz	"firstin"                       # string offset=343
.Linfo_string22:
	.asciz	"arc_tmp"                       # string offset=351
.Linfo_string23:
	.asciz	"flow"                          # string offset=359
.Linfo_string24:
	.asciz	"flow_t"                        # string offset=364
.Linfo_string25:
	.asciz	"depth"                         # string offset=371
.Linfo_string26:
	.asciz	"number"                        # string offset=377
.Linfo_string27:
	.asciz	"time"                          # string offset=384
.Linfo_string28:
	.asciz	"node"                          # string offset=389
.Linfo_string29:
	.asciz	"node_p"                        # string offset=394
.Linfo_string30:
	.asciz	"head"                          # string offset=401
.Linfo_string31:
	.asciz	"ident"                         # string offset=406
.Linfo_string32:
	.asciz	"short"                         # string offset=412
.Linfo_string33:
	.asciz	"nextout"                       # string offset=418
.Linfo_string34:
	.asciz	"nextin"                        # string offset=426
.Linfo_string35:
	.asciz	"org_cost"                      # string offset=433
.Linfo_string36:
	.asciz	"arc"                           # string offset=442
.Linfo_string37:
	.asciz	"arc_p"                         # string offset=446
.Linfo_string38:
	.asciz	"arc_t"                         # string offset=452
.Linfo_string39:
	.asciz	"next"                          # string offset=458
.Linfo_string40:
	.asciz	"list_elem"                     # string offset=463
.Linfo_string41:
	.asciz	"realloc"                       # string offset=473
.Linfo_string42:
	.asciz	"unsigned long"                 # string offset=481
.Linfo_string43:
	.asciz	"size_t"                        # string offset=495
.Linfo_string44:
	.asciz	"printf"                        # string offset=502
.Linfo_string45:
	.asciz	"fflush"                        # string offset=509
.Linfo_string46:
	.asciz	"_flags"                        # string offset=516
.Linfo_string47:
	.asciz	"_IO_read_ptr"                  # string offset=523
.Linfo_string48:
	.asciz	"_IO_read_end"                  # string offset=536
.Linfo_string49:
	.asciz	"_IO_read_base"                 # string offset=549
.Linfo_string50:
	.asciz	"_IO_write_base"                # string offset=563
.Linfo_string51:
	.asciz	"_IO_write_ptr"                 # string offset=578
.Linfo_string52:
	.asciz	"_IO_write_end"                 # string offset=592
.Linfo_string53:
	.asciz	"_IO_buf_base"                  # string offset=606
.Linfo_string54:
	.asciz	"_IO_buf_end"                   # string offset=619
.Linfo_string55:
	.asciz	"_IO_save_base"                 # string offset=631
.Linfo_string56:
	.asciz	"_IO_backup_base"               # string offset=645
.Linfo_string57:
	.asciz	"_IO_save_end"                  # string offset=661
.Linfo_string58:
	.asciz	"_markers"                      # string offset=674
.Linfo_string59:
	.asciz	"_IO_marker"                    # string offset=683
.Linfo_string60:
	.asciz	"_chain"                        # string offset=694
.Linfo_string61:
	.asciz	"_fileno"                       # string offset=701
.Linfo_string62:
	.asciz	"_flags2"                       # string offset=709
.Linfo_string63:
	.asciz	"_old_offset"                   # string offset=717
.Linfo_string64:
	.asciz	"__off_t"                       # string offset=729
.Linfo_string65:
	.asciz	"_cur_column"                   # string offset=737
.Linfo_string66:
	.asciz	"unsigned short"                # string offset=749
.Linfo_string67:
	.asciz	"_vtable_offset"                # string offset=764
.Linfo_string68:
	.asciz	"signed char"                   # string offset=779
.Linfo_string69:
	.asciz	"_shortbuf"                     # string offset=791
.Linfo_string70:
	.asciz	"_lock"                         # string offset=801
.Linfo_string71:
	.asciz	"_IO_lock_t"                    # string offset=807
.Linfo_string72:
	.asciz	"_offset"                       # string offset=818
.Linfo_string73:
	.asciz	"__off64_t"                     # string offset=826
.Linfo_string74:
	.asciz	"_codecvt"                      # string offset=836
.Linfo_string75:
	.asciz	"_IO_codecvt"                   # string offset=845
.Linfo_string76:
	.asciz	"_wide_data"                    # string offset=857
.Linfo_string77:
	.asciz	"_IO_wide_data"                 # string offset=868
.Linfo_string78:
	.asciz	"_freeres_list"                 # string offset=882
.Linfo_string79:
	.asciz	"_freeres_buf"                  # string offset=896
.Linfo_string80:
	.asciz	"__pad5"                        # string offset=909
.Linfo_string81:
	.asciz	"_mode"                         # string offset=916
.Linfo_string82:
	.asciz	"_unused2"                      # string offset=922
.Linfo_string83:
	.asciz	"_IO_FILE"                      # string offset=931
.Linfo_string84:
	.asciz	"FILE"                          # string offset=940
.Linfo_string85:
	.asciz	"malloc"                        # string offset=945
.Linfo_string86:
	.asciz	"refresh_neighbour_lists"       # string offset=952
.Linfo_string87:
	.asciz	"inputfile"                     # string offset=976
.Linfo_string88:
	.asciz	"clustfile"                     # string offset=986
.Linfo_string89:
	.asciz	"n"                             # string offset=996
.Linfo_string90:
	.asciz	"n_trips"                       # string offset=998
.Linfo_string91:
	.asciz	"max_m"                         # string offset=1006
.Linfo_string92:
	.asciz	"m"                             # string offset=1012
.Linfo_string93:
	.asciz	"m_org"                         # string offset=1014
.Linfo_string94:
	.asciz	"m_impl"                        # string offset=1020
.Linfo_string95:
	.asciz	"max_residual_new_m"            # string offset=1027
.Linfo_string96:
	.asciz	"max_new_m"                     # string offset=1046
.Linfo_string97:
	.asciz	"primal_unbounded"              # string offset=1056
.Linfo_string98:
	.asciz	"dual_unbounded"                # string offset=1073
.Linfo_string99:
	.asciz	"perturbed"                     # string offset=1088
.Linfo_string100:
	.asciz	"feasible"                      # string offset=1098
.Linfo_string101:
	.asciz	"eps"                           # string offset=1107
.Linfo_string102:
	.asciz	"opt_tol"                       # string offset=1111
.Linfo_string103:
	.asciz	"feas_tol"                      # string offset=1119
.Linfo_string104:
	.asciz	"pert_val"                      # string offset=1128
.Linfo_string105:
	.asciz	"bigM"                          # string offset=1137
.Linfo_string106:
	.asciz	"optcost"                       # string offset=1142
.Linfo_string107:
	.asciz	"double"                        # string offset=1150
.Linfo_string108:
	.asciz	"ignore_impl"                   # string offset=1157
.Linfo_string109:
	.asciz	"nodes"                         # string offset=1169
.Linfo_string110:
	.asciz	"stop_nodes"                    # string offset=1175
.Linfo_string111:
	.asciz	"arcs"                          # string offset=1186
.Linfo_string112:
	.asciz	"stop_arcs"                     # string offset=1191
.Linfo_string113:
	.asciz	"sorted_arcs"                   # string offset=1201
.Linfo_string114:
	.asciz	"dummy_arcs"                    # string offset=1213
.Linfo_string115:
	.asciz	"stop_dummy"                    # string offset=1224
.Linfo_string116:
	.asciz	"iterations"                    # string offset=1235
.Linfo_string117:
	.asciz	"bound_exchanges"               # string offset=1246
.Linfo_string118:
	.asciz	"nr_group"                      # string offset=1262
.Linfo_string119:
	.asciz	"full_groups"                   # string offset=1271
.Linfo_string120:
	.asciz	"max_elems"                     # string offset=1283
.Linfo_string121:
	.asciz	"network"                       # string offset=1293
.Linfo_string122:
	.asciz	"network_t"                     # string offset=1301
.Linfo_string123:
	.asciz	"calloc"                        # string offset=1311
.Linfo_string124:
	.asciz	"free"                          # string offset=1318
.Linfo_string125:
	.asciz	"spec_qsort"                    # string offset=1323
.Linfo_string126:
	.asciz	"getArcPosition"                # string offset=1334
.Linfo_string127:
	.asciz	"refreshArcPointers"            # string offset=1349
.Linfo_string128:
	.asciz	"refreshPositions"              # string offset=1368
.Linfo_string129:
	.asciz	"marc_arcs"                     # string offset=1385
.Linfo_string130:
	.asciz	"arc_compare"                   # string offset=1395
.Linfo_string131:
	.asciz	"resize_prob"                   # string offset=1407
.Linfo_string132:
	.asciz	"insert_new_arc"                # string offset=1419
.Linfo_string133:
	.asciz	"replace_weaker_arc"            # string offset=1434
.Linfo_string134:
	.asciz	"calculate_max_redcost"         # string offset=1453
.Linfo_string135:
	.asciz	"switch_arcs"                   # string offset=1475
.Linfo_string136:
	.asciz	"price_out_impl"                # string offset=1487
.Linfo_string137:
	.asciz	"suspend_impl"                  # string offset=1502
.Linfo_string138:
	.asciz	"net"                           # string offset=1515
.Linfo_string139:
	.asciz	"getPos"                        # string offset=1519
.Linfo_string140:
	.asciz	"sorted_array"                  # string offset=1526
.Linfo_string141:
	.asciz	"i"                             # string offset=1539
.Linfo_string142:
	.asciz	"new_m"                         # string offset=1541
.Linfo_string143:
	.asciz	"position"                      # string offset=1547
.Linfo_string144:
	.asciz	"new_position"                  # string offset=1556
.Linfo_string145:
	.asciz	"new_arcs"                      # string offset=1569
.Linfo_string146:
	.asciz	"new_arcs_array"                # string offset=1578
.Linfo_string147:
	.asciz	"arcs_pointer_sorted"           # string offset=1593
.Linfo_string148:
	.asciz	"global_new"                    # string offset=1613
.Linfo_string149:
	.asciz	"best_pos"                      # string offset=1624
.Linfo_string150:
	.asciz	"num_threads"                   # string offset=1633
.Linfo_string151:
	.asciz	"max_new_arcs"                  # string offset=1645
.Linfo_string152:
	.asciz	"start_id"                      # string offset=1658
.Linfo_string153:
	.asciz	"positions"                     # string offset=1667
.Linfo_string154:
	.asciz	"values"                        # string offset=1677
.Linfo_string155:
	.asciz	"a1"                            # string offset=1684
.Linfo_string156:
	.asciz	"a2"                            # string offset=1687
.Linfo_string157:
	.asciz	"old_arcs"                      # string offset=1690
.Linfo_string158:
	.asciz	"node_t"                        # string offset=1699
.Linfo_string159:
	.asciz	"root"                          # string offset=1706
.Linfo_string160:
	.asciz	"stop"                          # string offset=1711
.Linfo_string161:
	.asciz	"off"                           # string offset=1716
.Linfo_string162:
	.asciz	"newarc"                        # string offset=1720
.Linfo_string163:
	.asciz	"newpos"                        # string offset=1727
.Linfo_string164:
	.asciz	"red_cost"                      # string offset=1734
.Linfo_string165:
	.asciz	"pos"                           # string offset=1743
.Linfo_string166:
	.asciz	"max_new_par_residual_new_arcs" # string offset=1747
.Linfo_string167:
	.asciz	"cmp"                           # string offset=1777
.Linfo_string168:
	.asciz	"max_redcost"                   # string offset=1781
.Linfo_string169:
	.asciz	"num_del_arcs"                  # string offset=1793
.Linfo_string170:
	.asciz	"deleted_arcs"                  # string offset=1806
.Linfo_string171:
	.asciz	"arcnew"                        # string offset=1819
.Linfo_string172:
	.asciz	"thread"                        # string offset=1826
.Linfo_string173:
	.asciz	"size_del"                      # string offset=1833
.Linfo_string174:
	.asciz	"count"                         # string offset=1842
.Linfo_string175:
	.asciz	"j"                             # string offset=1848
.Linfo_string176:
	.asciz	"number_of_arcs"                # string offset=1850
.Linfo_string177:
	.asciz	"h"                             # string offset=1865
.Linfo_string178:
	.asciz	"copy"                          # string offset=1867
.Linfo_string179:
	.asciz	"test_arc"                      # string offset=1872
.Linfo_string180:
	.asciz	"resized"                       # string offset=1881
.Linfo_string181:
	.asciz	"min_impl_duration"             # string offset=1889
.Linfo_string182:
	.asciz	"first_replace"                 # string offset=1907
.Linfo_string183:
	.asciz	"arc_cost"                      # string offset=1921
.Linfo_string184:
	.asciz	"num_switch_iterations"         # string offset=1930
.Linfo_string185:
	.asciz	"local_first_replace"           # string offset=1952
.Linfo_string186:
	.asciz	"trips"                         # string offset=1972
.Linfo_string187:
	.asciz	"list_size"                     # string offset=1978
.Linfo_string188:
	.asciz	"arcout"                        # string offset=1988
.Linfo_string189:
	.asciz	"first_list_elem"               # string offset=1995
.Linfo_string190:
	.asciz	"new_list_elem"                 # string offset=2011
.Linfo_string191:
	.asciz	"latest"                        # string offset=2025
.Linfo_string192:
	.asciz	"iterator"                      # string offset=2032
.Linfo_string193:
	.asciz	"arcin"                         # string offset=2041
.Linfo_string194:
	.asciz	"head_potential"                # string offset=2047
.Linfo_string195:
	.asciz	"bigM_minus_min_impl_duration"  # string offset=2062
.Linfo_string196:
	.asciz	"threshold"                     # string offset=2091
.Linfo_string197:
	.asciz	"all"                           # string offset=2101
.Linfo_string198:
	.asciz	"susp"                          # string offset=2105
.Linfo_string199:
	.asciz	"startid"                       # string offset=2110
	.section	.debug_str_offsets,"",@progbits
	.long	.Linfo_string0
	.long	.Linfo_string1
	.long	.Linfo_string2
	.long	.Linfo_string3
	.long	.Linfo_string4
	.long	.Linfo_string5
	.long	.Linfo_string6
	.long	.Linfo_string7
	.long	.Linfo_string8
	.long	.Linfo_string9
	.long	.Linfo_string10
	.long	.Linfo_string11
	.long	.Linfo_string12
	.long	.Linfo_string13
	.long	.Linfo_string14
	.long	.Linfo_string15
	.long	.Linfo_string16
	.long	.Linfo_string17
	.long	.Linfo_string18
	.long	.Linfo_string19
	.long	.Linfo_string20
	.long	.Linfo_string21
	.long	.Linfo_string22
	.long	.Linfo_string23
	.long	.Linfo_string24
	.long	.Linfo_string25
	.long	.Linfo_string26
	.long	.Linfo_string27
	.long	.Linfo_string28
	.long	.Linfo_string29
	.long	.Linfo_string30
	.long	.Linfo_string31
	.long	.Linfo_string32
	.long	.Linfo_string33
	.long	.Linfo_string34
	.long	.Linfo_string35
	.long	.Linfo_string36
	.long	.Linfo_string37
	.long	.Linfo_string38
	.long	.Linfo_string39
	.long	.Linfo_string40
	.long	.Linfo_string41
	.long	.Linfo_string42
	.long	.Linfo_string43
	.long	.Linfo_string44
	.long	.Linfo_string45
	.long	.Linfo_string46
	.long	.Linfo_string47
	.long	.Linfo_string48
	.long	.Linfo_string49
	.long	.Linfo_string50
	.long	.Linfo_string51
	.long	.Linfo_string52
	.long	.Linfo_string53
	.long	.Linfo_string54
	.long	.Linfo_string55
	.long	.Linfo_string56
	.long	.Linfo_string57
	.long	.Linfo_string58
	.long	.Linfo_string59
	.long	.Linfo_string60
	.long	.Linfo_string61
	.long	.Linfo_string62
	.long	.Linfo_string63
	.long	.Linfo_string64
	.long	.Linfo_string65
	.long	.Linfo_string66
	.long	.Linfo_string67
	.long	.Linfo_string68
	.long	.Linfo_string69
	.long	.Linfo_string70
	.long	.Linfo_string71
	.long	.Linfo_string72
	.long	.Linfo_string73
	.long	.Linfo_string74
	.long	.Linfo_string75
	.long	.Linfo_string76
	.long	.Linfo_string77
	.long	.Linfo_string78
	.long	.Linfo_string79
	.long	.Linfo_string80
	.long	.Linfo_string81
	.long	.Linfo_string82
	.long	.Linfo_string83
	.long	.Linfo_string84
	.long	.Linfo_string85
	.long	.Linfo_string86
	.long	.Linfo_string87
	.long	.Linfo_string88
	.long	.Linfo_string89
	.long	.Linfo_string90
	.long	.Linfo_string91
	.long	.Linfo_string92
	.long	.Linfo_string93
	.long	.Linfo_string94
	.long	.Linfo_string95
	.long	.Linfo_string96
	.long	.Linfo_string97
	.long	.Linfo_string98
	.long	.Linfo_string99
	.long	.Linfo_string100
	.long	.Linfo_string101
	.long	.Linfo_string102
	.long	.Linfo_string103
	.long	.Linfo_string104
	.long	.Linfo_string105
	.long	.Linfo_string106
	.long	.Linfo_string107
	.long	.Linfo_string108
	.long	.Linfo_string109
	.long	.Linfo_string110
	.long	.Linfo_string111
	.long	.Linfo_string112
	.long	.Linfo_string113
	.long	.Linfo_string114
	.long	.Linfo_string115
	.long	.Linfo_string116
	.long	.Linfo_string117
	.long	.Linfo_string118
	.long	.Linfo_string119
	.long	.Linfo_string120
	.long	.Linfo_string121
	.long	.Linfo_string122
	.long	.Linfo_string123
	.long	.Linfo_string124
	.long	.Linfo_string125
	.long	.Linfo_string126
	.long	.Linfo_string127
	.long	.Linfo_string128
	.long	.Linfo_string129
	.long	.Linfo_string130
	.long	.Linfo_string131
	.long	.Linfo_string132
	.long	.Linfo_string133
	.long	.Linfo_string134
	.long	.Linfo_string135
	.long	.Linfo_string136
	.long	.Linfo_string137
	.long	.Linfo_string138
	.long	.Linfo_string139
	.long	.Linfo_string140
	.long	.Linfo_string141
	.long	.Linfo_string142
	.long	.Linfo_string143
	.long	.Linfo_string144
	.long	.Linfo_string145
	.long	.Linfo_string146
	.long	.Linfo_string147
	.long	.Linfo_string148
	.long	.Linfo_string149
	.long	.Linfo_string150
	.long	.Linfo_string151
	.long	.Linfo_string152
	.long	.Linfo_string153
	.long	.Linfo_string154
	.long	.Linfo_string155
	.long	.Linfo_string156
	.long	.Linfo_string157
	.long	.Linfo_string158
	.long	.Linfo_string159
	.long	.Linfo_string160
	.long	.Linfo_string161
	.long	.Linfo_string162
	.long	.Linfo_string163
	.long	.Linfo_string164
	.long	.Linfo_string165
	.long	.Linfo_string166
	.long	.Linfo_string167
	.long	.Linfo_string168
	.long	.Linfo_string169
	.long	.Linfo_string170
	.long	.Linfo_string171
	.long	.Linfo_string172
	.long	.Linfo_string173
	.long	.Linfo_string174
	.long	.Linfo_string175
	.long	.Linfo_string176
	.long	.Linfo_string177
	.long	.Linfo_string178
	.long	.Linfo_string179
	.long	.Linfo_string180
	.long	.Linfo_string181
	.long	.Linfo_string182
	.long	.Linfo_string183
	.long	.Linfo_string184
	.long	.Linfo_string185
	.long	.Linfo_string186
	.long	.Linfo_string187
	.long	.Linfo_string188
	.long	.Linfo_string189
	.long	.Linfo_string190
	.long	.Linfo_string191
	.long	.Linfo_string192
	.long	.Linfo_string193
	.long	.Linfo_string194
	.long	.Linfo_string195
	.long	.Linfo_string196
	.long	.Linfo_string197
	.long	.Linfo_string198
	.long	.Linfo_string199
	.section	.debug_addr,"",@progbits
	.long	.Ldebug_addr_end0-.Ldebug_addr_start0 # Length of contribution
.Ldebug_addr_start0:
	.short	5                               # DWARF version number
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
.Laddr_table_base0:
	.quad	.L.str
	.quad	.Lfunc_begin0
	.quad	.Ltmp7
	.quad	.Ltmp12
	.quad	.Ltmp17
	.quad	.Lfunc_begin1
	.quad	.Ltmp29
	.quad	.Ltmp38
	.quad	.Lfunc_begin2
	.quad	.Lfunc_begin3
	.quad	.Lfunc_begin4
	.quad	.Ltmp80
	.quad	.Ltmp100
	.quad	.Ltmp104
	.quad	.Ltmp105
	.quad	.Lfunc_begin5
	.quad	.Lfunc_begin6
	.quad	.Lfunc_begin7
	.quad	.Lfunc_begin8
	.quad	.Ltmp181
	.quad	.Lfunc_begin9
	.quad	.Ltmp202
	.quad	.Ltmp204
	.quad	.Ltmp206
	.quad	.Ltmp208
	.quad	.Ltmp213
	.quad	.Ltmp215
	.quad	.Ltmp231
	.quad	.Ltmp262
	.quad	.Ltmp267
	.quad	.Ltmp272
	.quad	.Ltmp280
	.quad	.Ltmp307
	.quad	.Ltmp322
	.quad	.Ltmp351
	.quad	.Ltmp354
	.quad	.Ltmp358
	.quad	.Ltmp360
	.quad	.Ltmp361
	.quad	.Ltmp372
	.quad	.Ltmp385
	.quad	.Ltmp389
	.quad	.Ltmp390
	.quad	.Ltmp391
	.quad	.Ltmp392
	.quad	.Ltmp393
	.quad	.Lfunc_begin10
	.quad	.Ltmp418
	.quad	.Ltmp419
	.quad	.Ltmp428
.Ldebug_addr_end0:
	.ident	"clang version 17.0.0 (git@github.com:webmiche/llvm-project.git 8ae5341dd666ebd9607a787b37484c371785e975)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
