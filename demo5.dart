import 'dart:io';
import 'dart:math';
import 'dart:async';

void main(){
  HttpServer.bind('127.0.0.1', 8080).then((server) => serverHandler(server));
  print('server created');
}

void serverHandler(var server){
  server.listen((HttpRequest request) {
    final Path path = new Path(request.uri.path).canonicalize();
    Future getPath = getFromPath(path);
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


Future<String> getFromPath(Path path){
  var completer = new Completer();
  File script = new File(new Options().script);
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





