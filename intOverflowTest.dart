//import 'dart:io';
// the problems C has with integer overflow is not in Dart
void main(){
  int n = 0;
  while( n>=0 ){
    n= n+250000000000000000000000000000000000000;
    print("$n");
  }
}
