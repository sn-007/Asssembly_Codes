.text
.global partition
partition:
    # calculating sqrt(8n+1)-1/2
    movq %rdi, %r8 # (ans = n) ans in r8
    imulq $8, %r8 # (ans= 8*n)   
    addq $1,%r8 # (ans= 8*n+1)
    jmp .root
    .root_return:
    movq %r9, %r8 # (ans = sqrt(8n+1))
    decq %r8       # (ans = sqrt(8n+1) -1)
    sarq $1, %r8    # (ans = (sqrt(8n+1) -1)/2)
    # calculated and stored in r8
# ____________________________________________________
    # %r9 = ans * ans -1 /2 (calculating n - ans * (ans - 1) / 2 - 1 )
    movq %r8, %r9 # (r9=ans)
    decq %r9    # (r9=ans-1)
    imulq %r8, %r9 # (r9= ans-1 * ans)
    sarq $1, %r9    # (r9= ans-1 * ans/2)
    addq $1, %r9 # (r9= ans*ans-1/2 +1)
    movq %rdi , %r10
    subq %r9 , %r10 # (r10=  n - ans * (ans - 1) / 2 - 1)

# ____________________________________________________________
    jmp .pow # k in %r8 return ans in %r11
    .powreturn: # (r11= 2^ans)
    movq %r10, %rax # (%rax=n - ans * (ans - 1) / 2 - 1)
    imulq %r11, %rax # (%rax=n - ans * (ans - 1) / 2 - 1 * 2^ans)
    addq $1, %rax # (rax++)
    ret



# lable for finding square root
.root: # ans in r9
movq $1, %r9

# i in %r10
movq $1, %r10
.iloop:
movq %r10, %r11            # temp= i temp in r11
imulq %r10 , %r11          # temp = i*i
cmp %r8 , %r11             # comparing with k 
jg .exit                    # exit if temp > k
    movq %r10, %r9  # (ans=i)
    jmp .iend

.iend:
addq $1 , %r10  # increment i
cmp %r8 , %r10  # cmp k and i
jg .exit
jmp .iloop

.exit:
jmp .root_return




# lable for finding
.pow: # k in %r8  temp in %r11;  i in %r12
movq $1, %r11 # (temp =1)
movq $1, %r12 # (i =1)
.piloop:
imulq $2, %r11  # temp=temp *2
addq $1, %r12    # incrementing i
cmp %r8, %r12   # cmp i and k
jg .powexit      # exit if i > k
jmp .piloop         # goto start
.powexit:
jmp .powreturn

.Note:
 # the above expression is formulated by studying  this research paper: https://cs.nyu.edu/courses/summer07/G22.2340-001/Presentations/McCann.pdf. 



