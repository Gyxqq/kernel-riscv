void put(char c){
  asm volatile("li a0,'H'");
  asm volatile("li a7,1");
  asm volatile("ecall");
  return;
}
char stack[4096];
void main(){

put('H');
return;

}