import 'dart:isolate';

ReceivePort rePort = new ReceivePort();
SendPort sePort = rePort.sendPort;
SendPort parent;

void main(args, SendPort mes){
  
  parent = mes;
  print("from child $mes  $args");
  Map map = {
             'value':12,
             'port': mes
             
  };
  parent.send(map, sePort);
   

}