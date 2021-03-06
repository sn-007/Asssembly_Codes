.text
.global partition
#a[] in rdi , ans[] in rsi, m in rdx, n in rcx
partition:
    movq $0 , %r8 # (index i)
 
    .Lstart:   
        movq $0 , %r9 # (index j)
    .Ljloop:

    #a[i][j] calculation stored in r10, #overallindex in r11
    movq %r8, %r11  # index=i
    imulq %rcx, %r11 # index=i * n
    addq %r9, %r11  # index=index + j
    leaq (%rdi , %r11, 4), %r10 # findex= 4*(index) + a[][]
    

    #[j][i] calculation stored in rax, #overall index in r11
    movq %r9, %r11 # index = j
    imulq %rdx, %r11 # index= j * m
    addq %r8, %r11 # index = (j * m) + i
    leaq (%rsi , %r11, 4), %r11 # index = ans[][] + 4 ((j * m) + i )

    movq (%r10) , %r13
    movq %r13, (%r11)
    

    incq %r9
    cmpq %r9, %rcx
    je .Liloop
    jmp .Ljloop

.Liloop:

    
    incq %r8
    cmpq %r8, %rdx 
    je .Lexit
    jmp .Lstart

.Lexit:
ret



.Lreturn:
movq %r10 , %rax
ret




     





    
    



    






   