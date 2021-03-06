.text
.global partition
#a[] in rdi , ans[] in rsi, m in rdx, n in rcx
partition:
    movq $0 , %r8 # (index i)
    .Liloop:
        movq $0 , %r9 # (index j)
        .Ljloop:
            # acessing &ans[j][i] final adress in %r10 (index1)
            movq %r9  , %r10 # (index1 = j )
            imulq %rdx , %r10 # (index1 = index1 * m)
            addq %r8  , %r10 # (index1 = index1 + i)
            imulq $4   , %r10 # (index1 = index1 * 4)
            addq %rsi , %r10 # (index1 = index1 + &ans[o][o])

            # acessing &a[i][j] final adress in %r11 (index)
            movq %r8  , %r11 # (index = i )
            imulq %rcx , %r11 # (index = index * n)
            addq %r9  , %r11 # (index = index + j)
            imulq $4   , %r11 # (index = index * 4)
            addq %rdi , %r11 # (index = index + &a[o][o])

            # storing value of a[i][j] in %r12
            movq (%r11) , %r12
            movq  %r12  , (%r10)


            incq %r9
            cmp %rcx, %r9
            jl .Ljloop
            je .Licheck



    .Licheck:
    incq %r8
    cmp %rdx , %r8
    jl .Liloop
    je .Lexit  



.Lexit:
    ret



     





    
    



    






   