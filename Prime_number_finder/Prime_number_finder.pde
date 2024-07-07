int numb = 73;
int div = 1;

while((numb%div > 0 && numb != div)||div==1){
  div ++;
  if(numb == div){
    System.out.println("This is a prime number");
  }
  else if(numb%div == 0){
    System.out.println("This is not a prime number as it is divisible by " + div);
  }
}
