import 'dart:async';
import 'dart:isolate';
import 'dart:math';


void main(){

  var child = spawnFunction(childIsolate);
  var receiver = new ReceivePort();
  receiver.receive((msg, _){
    if(msg == 'shutdown'){
      print('shutting down');
      receiver.close();
    }
    else{
      print('$msg');
      child.send('do more work', receiver.toSendPort());
    }
  });
  child.send('do work please', receiver.toSendPort());
  
  Future result = doLongWork();
  result.catchError((e)=>print("$e happend"));
  result.then((value) => beginAsync(value))
        .then((value) => weAreDone(value))
        .then((value) => print("done"));
        
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

int beginAsync(value){
  print('begin async handling');
  return value;
}


void weAreDone(sucess){
  print("$sucess");


}

Future<int> doLongWork(){
  var completer = new Completer();
  int n = -1000;
  while(n<1000000){
    for(int d = 0; n<10000; n++){
    }
    n++;      
  }
  
  completer.complete(n);
  return completer.future;
}
