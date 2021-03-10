.text
.global partition
#a[] in rdi , ans[] in rsi, m in rdx, n in rcx
partition:
    

    movq $0 , %r8 # (index i)
 
    .Liloop:   
        movq $0 , %r9 # (index j)
    .Ljloop:
         # acessing &a[i][j] final adress in %rax (index)
            movq %r8  , %r11 # (index = i )
            imulq %rcx , %r11 # (index = i * n)
            addq %r9  , %r11 # (index = i*n + j)
            movq (%rdi, %r11, 8) , %rax
        

         # acessing &ans[j][i] final adress in %r10 (index1)
            movq %r9  , %r10 # (index1 = j )
            imulq %rdx , %r10 # (index1 = j * m)
            addq %r8  , %r10 # (index1 = j*m + i)
            movq %rax , (%rsi, %r10, 8)

        # checking condition for j loop
            inc %r9
            cmp %r9, %rcx
            je .checki
            jne .Ljloop
    # checking condition for i loop
    .checki:
        #ret
        inc %r8
        cmpq %r8, %rdx 
        je .Lexit
        jne .Liloop


            
    
.Lexit:
    ret
     




     





    
    



    






   