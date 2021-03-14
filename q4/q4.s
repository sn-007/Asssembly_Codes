.text
.global partition
partition: 
# a[][] in rdi r14, ans[][] in rsi r15, n in rdx (n is fixes never use rdx)
movq %rdi, %r14
movq %rsi , %r15


movq $0, %rdi
call fun
ret





fun: # col in rdi
cmp %rdx, %rdi
jne .L1
jmp .copy # (have to implemet copy here copying a in to ans )

.L1:
movq $0, %r8 # (i = 0)

.iloop:
jmp .check # (value stored in r9)
.check_return:
                                                                        
cmp $1, %r9
jne .L2
# has to implement the recursion here

    # a[i][col] =1
    movq %r8, %r10 # (index =i)
    imulq %rdx, %r10 # (index = i*n)
    addq  %rdi, %r10 # ( index=n*i+col accessing a[i][col])
    imulq $8, %r10 
    addq %r14 , %r10
    movq $1, (%r10)

    # saving local variables into stack
    pushq %r8
    pushq %rdi 
    pushq %r10
    # saved

    inc %rdi
    call fun
    # restoring local variables
    popq %r10
    popq %rdi
    popq %r8
    # restored
    cmp $1, %rax
    jne .L3
    movq $1 , %rax
    ret
    .L3:
    movq $0, (%r10)



.L2:
inc %r8
cmp %rdx, %r8
je .retpkr
jmp .iloop
.retpkr:
movq $0, %rax
ret







.check: # row in r8, cor in rl in rdi, 11 c in r12
movq %rdi, %r12 # (c=col)
dec %r12 # (c=col-1)

.while1loop:
    cmp $0, %r12
    jl .while1end
    # accessing a[row][c] in index r13
    movq %r8, %r13   # (index = row)
    imulq %rdx, %r13  # (index= row*n)
    addq %r12, %r13  # ( index=row*n+c)
    imulq $8 , %r13
    addq %r14, %r13 # (index= &a[0][0] + index )
    cmp $1, (%r13)
    jne .dec1
    movq $0, %r9
    jmp .check_return
    .dec1:
    dec %r12
    jmp .while1loop
.while1end:
    movq %r8, %r11
    movq %rdi, %r12
    dec %r11
    dec %r12
.while2loop:
    cmp $0, %r11
    jl .while2end
    cmp $0, %r12
    jl .while2end
    # accessing a[r][c] in index r13
    movq %r11, %r13   # (index = r)
    imulq %rdx, %r13  # (index= r*n)
    addq %r12, %r13  # ( index=r*n+c)
    imulq $8 , %r13
    addq %r14, %r13 # (index= &a[0][0] + index )
    cmp $1, (%r13)
    jne .dec2
    movq $0, %r9
    jmp .check_return
    .dec2:
    dec %r12
    dec %r11
    jmp .while2loop

.while2end:
    movq %r8, %r11
    movq %rdi, %r12
    inc %r11
    dec %r12

.while3loop:
    cmp %rdx, %r11
    jge .while3end
    cmp $0, %r12
    jl .while3end
    # accessing a[r][c] in index r13
    movq %r11, %r13   # (index = r)
    imulq %rdx, %r13  # (index= r*n)
    addq %r12, %r13  # ( index=r*n+c)
    imulq $8 , %r13
    addq %r14, %r13 # (index= &a[0][0] + index )
    cmp $1, (%r13)
    jne .dec3
    movq $0, %r9
    jmp .check_return
    .dec3:
    dec %r12
    inc %r11
    jmp .while3loop
.while3end:
movq $1 , %r9
jmp .check_return




.copy:
 # i in r8, j in r9 , n in rdx, ans in r15, a in r14
# index in r10,%r11
movq $0, %r8 # (i = 0)
.copyi:
movq $0, %r9 # (j = 0)
.copyj:
movq  %r8, %r10 # (r10=i)
imulq %rdx, %r10 # (r10= ni)
addq %r9, %r10 # (r10 = ni +j)


movq (%r14,%r10,8), %r12 
movq  %r12 , (%r15,%r10,8)


addq $1, %r9
cmp %rdx, %r9
je .copyicheck
jmp .copyj

.copyicheck:
addq $1, %r8
cmp %rdx, %r8
je .copyexit
jmp .copyi

.copyexit:
movq $1, %rax
ret










