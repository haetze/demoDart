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
    start(int.parse(str));
  }catch(e){
    print("$e");
  }
    
}


void start(int e){
  
  DateTime t1 = new DateTime.now();
  print("fib num at pos $e ${fib(e)}");
  DateTime t2 = new DateTime.now();
  print(" needed :${t2.millisecondsSinceEpoch - t1.millisecondsSinceEpoch}");
  
}
