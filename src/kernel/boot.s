.extern main
.global _start
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
	j main    