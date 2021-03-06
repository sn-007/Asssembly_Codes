.text
.global fun
fun:
    movq %rdi, %r10
    addq $4, %r10
    movq $1, (%r10)
    ret
