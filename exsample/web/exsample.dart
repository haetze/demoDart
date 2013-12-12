import 'dart:html';

WebSocket Soc = new WebSocket("ws://127.0.0.1:9090");


void main() {
  window.alert("${window.closed}");
  query("#hi")
  ..onClick.listen(eventHandlerKey);
  
  Soc.onOpen.listen((var e){
    window.alert("open");
    
  });
  Soc.onMessage.listen((MessageEvent e){
    print("${e.data.toString()}");
    Soc.send("wq");
  });
}

void eventHandlerKey(var e){
  window.alert("got event $e");
  Soc.send("from function");
}


