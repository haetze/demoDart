import 'dart:convert';
import 'dart:io';

void newFib(){
  var a = 0, b = 1;
  void f(){
    a = b;
    b = a+b;
    return a;
  }


  return f;
}



void main(){
  var f = newFib();
  Stdin stream = stdin;
  var str = stream.readLineSync(encoding: UTF8);
  var a;
  try{
    a = int.parse(str);
  }catch(e){
    print("$e");
  }
  DateTime t1 = new DateTime.now();
  for(int i = 1; i<a; i++){
    f();
  }
  print(f());

  DateTime t2 = new DateTime.now();
  print(" needed :${t2.millisecondsSinceEpoch - t1.millisecondsSinceEpoch}");
}
