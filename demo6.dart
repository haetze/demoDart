import 'dart:math' as Math;

void main(){
  DateTime now = new DateTime.now();
  print("${now.millisecondsSinceEpoch}");
  Math.Random randgen = new Math.Random();
  while(true){
    num n = randgen.nextInt(100);
    if(n == 50)
      break;
    print('not yet with $n');
  }
  print('end of the loop');
  DateTime now2 = new DateTime.now();
  print("${now2.millisecondsSinceEpoch}");
}

