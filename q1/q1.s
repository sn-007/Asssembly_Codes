.text
.global fq1
#storing number of ones in r a x 
fq1:
    movq %rdi, %rbx                     #storing first argument in to rbx
    movq $0 , %rax                      #initialising rax to zero

    .Lstart:                            #loop while n >0
    movq %rbx , %rdi                    #duplicating n value to use later
    andq $1, %rdi                       #getting the last byte

    cmpq  $1, %rdi                      #checking the last byte obtained above with 1 
    je .L1

    .L2:
        sarq $1, %rbx                   #n= n/2
        cmpq $0, %rbx                   #if n ==0 exit
        je .Lexit
        jmp .Lstart                     #go to the while loop again


.L1:                                    #if there is a 1 increment rax 
    addq $1, %rax
    jmp .L2                             #continue

.Lexit:
    andq $1, %rax                       #checking if rax is 1 or not
    je .Lanswer1               
    movq $0 ,%rax
    ret
.Lanswer1:
    movq $1 ,%rax
    ret




    

