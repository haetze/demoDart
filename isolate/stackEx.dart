import "dart:isolate";

void main() {
  ReceivePort rePort = new ReceivePort();
  SendPort sePort = rePort.sendPort;
  var childFuture = Isolate.spawn(Point, sePort);
  childFuture.then(( Isolate value) => print("$value"));
  //rePort.first.then((var msg)=> print("$msg"));
  rePort.listen(onData);
    
}


void onData(var e){
  ReceivePort rePort = new ReceivePort();
  SendPort sePort = rePort.sendPort;
  print("$e");
  print("${e.runtimeType}");
  if(e.runtimeType != int)
    e.send(133, sePort);
  
}

void Point(SendPort msg ){
  ReceivePort rePort = new ReceivePort();
  SendPort sePort = rePort.sendPort;
  msg.send(sePort, sePort);
  msg.send(12, sePort);
  print("$msg test");
  rePort.listen(eventOnChild);
}

void eventOnChild(var e){
  print("test");
}




