import 'dart:convert';
import 'dart:io';

void newFib(){
  var a2 = 0, a = 0, b = 1;
  void f(){
    a2 = a;
    a = b;
    b = a2+b;
    return a2;
  }


  return f;
}



void main(){
  var f = newFib();
  /*Stdin stream = stdin;
  var str = stream.readLineSync(encoding: UTF8);
  var a;
  try{
    a = int.parse(str);
  }catch(e){
    print("$e");
  }*/
  for(int i = 1; i<=1000; i++){
    f();
  }
  print(f());

}
