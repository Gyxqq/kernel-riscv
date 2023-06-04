void put0(char c){
//将c的值放入a0寄存器

  asm("mv a0,%0"::"r"(c));
  asm volatile("li a7,1");
  asm volatile("ecall");
  return;
}
void print0(char str[]){
  int i=0;
  while(str[i]!='\0'){

    put0(str[i]);
    i++;
  }
  return;
}
char stack[4096]; 
void main(){ 

print0("Hello, world!\n");

return;

}