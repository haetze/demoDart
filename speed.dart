
void main(){
  DateTime d = new DateTime.now();
  for (var i = 0; i<100000; i++){
    print("done");
  }
  DateTime d2 = new DateTime.now();
  print("${d2.millisecondsSinceEpoch - d.millisecondsSinceEpoch}");
}

