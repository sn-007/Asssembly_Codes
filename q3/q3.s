.text
.global partition
# sum in rax, 
# n in rdi, 
# count in rdx
# m in rsi,
# 1 to n iterator in r8 (i)
# 1 to j iterator in r9 (j)

# temp in r15


partition:
movq $0, %rax                           # sum=0
movq $1, %r8                            # i=1

.outer_for_loop:

movq $0, %rdx                           # count=0

.inner_for_loop_start:
movq $1, %r9                            # j =1

.inner_for_loop_continued:

jmp .modoperator                        # goto mod function


# exit conition check for inner_for_loop
.exit_inner_loop:   
inc %r9                                 # j++
movq %r8 , %r15                         # temp = i
inc %r15                                # temp =i+1
cmp %r9, %r15                           # check if( i+1 vs j  )
je .countcheck                          # if( i+1 == j  ) goto countcheck
jg .inner_for_loop_continued            # if( i+1 >  j  ) goto inner for loop




.countcheck:
    cmp $2, %rdx                        # if (count ==2) goto updatesum
    je .updatesum
    jmp .exit_outer_loop                # goto exit outerloop


# exit conition check for outer_for_loop

.exit_outer_loop:
inc %r8                                 # i++
movq %rdi , %r15                        # temp =n
inc %r15                                # temp =n+1
cmp %r8, %r15                           # i vs n+1 
je .tempexit                            # n+1 == i goto .tempexit
jg .outer_for_loop                      # n+1 > i  goto .outer for loop




.modoperator: # (check i %j ==0 or not, i in r8; j in r9; count in rdx )
    movq %r8,%r14                   # temp = i

    .SubLoop:                       # iterative loop for checking mod through classic subtraction
    subq %r9 , %r14                 # temp = temp - j
    cmp $0, %r14                    #  temp vs 0 
    je .countINcrement              # temp =0 inc count
    jg .SubLoop                     #  temp > 0 continue iteration
    jl .exit_inner_loop             # temp < 0 goto exit inner loop
   




    .countINcrement:
    inc %rdx                        # count++
    jmp .exit_inner_loop            # goto exit inner loop



.updatesum:
addq %r8,%rax                       # sum = sum + i
jmp .exit_outer_loop                # goto exit outer loop


.tempexit:
    movq %rax, %r14                 # label for performing mod operator cosntitutes tempexit, transition for updating rax only when mod value > 0, retzer0 for returning rax=0

    subq %rsi ,%r14
    cmp $0, %r14
    je .retzero
    jg .transitionloop
    jl .retrax

.transitionloop:
movq %r14,%rax
jmp .tempexit


.retzero:
movq $0, %rax
ret

.retrax:
ret




