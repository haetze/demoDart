import 'dart:isolate';

class Child{
  ReceivePort receive;
  SendPort send;
  SendPort parent;
  
  void start(SendPort port){
    receive = new ReceivePort();
    send = receive.sendPort;
    parent = port;
    receive.listen(onMessage);
    parent.send(send);
  }
  
  void onMessage(var e){
    print("$e");
    parent.send(1234);
  }
}

void main(){ 
  ReceivePort rePort = new ReceivePort();
  SendPort sePort = rePort.sendPort;
  var childFuture = Isolate.spawn(Point, sePort);
  rePort.listen(onData);
}

void Point(SendPort s){
  Child child = new Child();
  child.start(s);
  
}


void onData(var e){
  if(e.runtimeType != int)
    e.send(123);
  else
    print("$e");

}








