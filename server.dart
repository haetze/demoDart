import 'dart:io';
import 'dart:async';
import 'dart:isolate';

class SocketServer{
  Set<WebSocket> sockets = new Set();
  
  void socketServer(HttpServer wsServer){
    wsServer.transform(new WebSocketTransformer()).listen(( WebSocket Socket){
      print("connection open");
      Socket.add("testwswsw");
      Socket.listen((var e){
        print("$e");
      }, onError:null,onDone:remove(Socket), cancelOnError:true);
      sockets.forEach((soc){
        soc.add("new client arrived");
      });
      sockets.add(Socket);
    });
  }
  
  remove(WebSocket socket){
    sockets.remove(socket);
    print("${sockets.length}");
    
  }
  
}

class HTTPServer{
  void serverHandler(HttpServer server){
    server.listen((HttpRequest request) {
      Future getPath = getFromPath(request.uri.path);
      getPath.then((String responseText){ 
        request.response.write('$responseText');
        request.response.close();
      })
        .catchError((e){
          request.response.write('$e');
          request.response.close();

        });

    });
  }





  Future<String> getFromPath(var path){
    var completer = new Completer();
    //File script = new File(new Options().script);
    String stringPath = path.toString() == '/' ? '/index.html' : path.toString();
    String pathString;
    pathString =stringPath.substring(1, stringPath.length);
    if(pathString.startsWith('demo'))
      completer.complete('error 500');
    else{
      File file = new File('$pathString');
      String responseTe;

      file.readAsString().then((String text){
        responseTe = text;
        completer.complete(responseTe);
      })
        .catchError((e){
          responseTe = 'error 404 ';
          completer.complete(responseTe);
        });
    }
    return completer.future;
  }

  
}

void main(){
  ReceivePort rePort = new ReceivePort();
  SendPort sePort = rePort.sendPort;
  var WebServer = Isolate.spawn(WebServerStart, sePort);
  var SocketServer = Isolate.spawn(SocketServerStart, sePort);
  print('server created');
  //while(true){
  //  print("working");
  //}
}

void SocketServerStart(SendPort ms){
  SocketServer socketServer = new SocketServer();
  HttpServer.bind('127.0.0.1', 9090).then((HttpServer server ) => socketServer.socketServer(server));
}

void WebServerStart(SendPort ms){
  HTTPServer httpServer = new HTTPServer();
  HttpServer.bind('127.0.0.1', 8080).then((HttpServer server) => httpServer.serverHandler(server));
}


