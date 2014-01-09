//import 'package:args/args.dart';
import 'dart:io';
import 'dart:convert';

int fib(int n){
  if(n<=1){
    return n;
  }
  return fib(n-2)+fib(n-1);
}

void main(){
  Stdin stream = stdin;
  var str = stream.readLineSync(encoding: UTF8);
  try{
    start( 10  /*int.parse(str)*/);
  }catch(e){
    print("$e");
  }
    
}


void start(int e){
  print("fib num at pos $e ${fib(e)}");
}
