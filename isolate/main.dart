import 'dart:isolate';

void main(){
  ReceivePort rePort = new ReceivePort();
  SendPort sePort = rePort.sendPort;
  var reverser = Isolate.spawnUri(Uri.parse("./child.dart"), ["","wsswsw"], sePort);
  print("from parent");
  rePort.listen(message);
 
}

void message(var mes){
  print("${mes['port']}");
}