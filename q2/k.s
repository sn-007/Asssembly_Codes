.text
.global transpose
transpose:
    movq $0, %r12                   #i to be used in the loop
    movq %rdi, %rax                 #transfering the location of matrix A to matrix B (new matrix)
    movq %rsi, %rbx                 #storing the value of n(number of rows) in a new variable
    imulq %rdx, %rbx                #calculating m*n (total number of elements)
    imulq $8, %rbx                  #calculating the space used by the input matrix
    addq %rbx, %rax                 #starting our new matrix just after the input matrix
    je .loopfori                    #sending the matrices in loop

.loopfori:
    movq $0, %r13                   #intializing j to be used in the loop as 0 each time
    jmp .loopforj                   #iterating through each row of the matrix

.loopforj:
    movq %rdx, %rbx                 #storing the value of m(number of columns) in a new variable
    imulq %r12, %rbx                #calculating m*i
    addq %r13, %rbx                 #calculating m*i + j
    movq (%rdi, %rbx, 8), %r14      #getting the value of A[m*i + j]


    movq %rsi, %rbx                 #storing the value of n(number of rows) in a new variable
    imulq %r13, %rbx                #calculating n*j
    addq %r12, %rbx                 #calculating n*j + i
    movq %r14, (%rax, %rbx, 8)      #storing the value of A[m*i + j] in B[n*j + i]
    
    inc %r13                        #increment the value of j by 1 after each loop
    cmp %rdx, %r13                  #checking if j is equal to m or not
    jne .loopforj                   #if j is not equal to m then going to the next element in the row
    inc %r12                        #increment the value of i by 1 after going through each row
    cmp %rsi, %r12                  #checking if i is equal to n or not
    jne .loopfori                   #if i is not equal to n then going to the next row else return
    ret
    