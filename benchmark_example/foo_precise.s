.text
.globl foo_precise

foo_precise:
    vmovups 8(%rsi), %xmm0
    vmovups %xmm0, 8(%rdi)
    movq 24(%rsi), %rax
    movq %rax, 24(%rdi)
    movq $1, (%rdi)
    retq
