.extern main
.global _start
.extern stack
_start:
    li a0,'H'
    li a7,1
    ecall #环境调用，和int一样
    li a0,'e'
    li a7,1
    ecall
    li a0,'l'
    li a7,1
    ecall
    li a0,'l'
    li a7,1
    ecall
    li a0,'o'
    li a7,1
    ecall
    li x10,0x55aa  #把0x55aa 放到x0当中去
     li a1 ,4096
     #取stack的地址给sp
     la sp,stack
     add sp, sp, a1
this: li x10,0x55aa  #把0x55aa 放到x0当中去     
	call main    #无条件跳转，一直在自旋
  now:   li x10,0x55aa      
  j now