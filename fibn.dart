import 'dart:io';
import 'dart:convert';

int fib(int n){
  if(n<=1){
    return n;
  }
  return fib(n-2)+fib(n-1);
}

void main(){
  try{
    start(50  /*int.parse(str)*/);
  }catch(e){
    print("$e");
  }
    
}


void start(int e){
  print("fib num at pos $e ${fib(e)}");
}
