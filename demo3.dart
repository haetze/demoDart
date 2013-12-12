import 'dart:async';
import 'dart:isolate';
import 'dart:math';


void main(){
  var receiver = new ReceivePort();
  var child1 = Isolate.spawn(childIsolate, receiver.sendPort);
  Isolate child;
  child1.then((value){
    child = value;
  });
  receiver.listen((msg, _){
    if(msg == 'shutdown'){
      print('shutting down');
      receiver.close();
    }
    else{
      print('the child sends :$msg');
      child.send('do more work', receiver.sendPort);
    }
  });
  child.send('do work please', receiver.sendPort);
  
  Future result = doLongWork();
  result.catchError((e)=>print("$e happend"));
  result.then((value) => beginAsync(value))
        .then((value) => weAreDone(value))
        .then((value) => print("$value"));
  print("behind asic");
}

        
void childIsolate(){
    Random randGen = new Random();
      print("child is set to go ");
        port.receive((msg, repl){
          int n = randGen.nextInt(10);
          print('$n');
          print('doing some work with: $msg');
            if(n == 8){
              if(repl != null) repl.send('shutdown');
            }else{
              if(repl != null) repl.send('ok, i\'m done');
            }
        });
}

Future<int> beginAsync(value){
  Completer completer = new Completer(); 
  print('begin async handling');
  for(int i = 0; i<10; i++){
    i--;
    i++;
  }
  completer.complete(value);
  return completer.future;
}


Future <String>weAreDone(sucess){
  Completer com = new Completer();
  print("$sucess");
  com.complete("hiw");
  return com.future;

}

Future<int> doLongWork(){
  Completer completer = new Completer();
  int n = -1000;
  while(n<10000){
    for(int d = 0; d<100; d++){
    }
    n++;      
  }
  
  completer.complete(n);
  return completer.future;
}
