void put(char c){
  asm volatile("li a0,'H'");
  asm volatile("li a7,1");
  asm volatile("ecall");
}
void main(){
put('H');
return;
}