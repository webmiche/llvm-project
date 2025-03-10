.text
.globl foo_relaxed

foo_relaxed:
    vmovups (%rsi), %ymm0
    vmovups %ymm0, (%rdi)
    movq $1, (%rdx)
    vzeroupper
    retq
