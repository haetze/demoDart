import 'dart:io';
import 'dart:async';
import 'dart:math';

void main(){
  File test = new File('test.txt');
  File createFile = new File('file.text');

  test.readAsString().then((String contents) => handleFileText(contents));
  test.readAsLines().then((List<String> lines) => handleFileLines(lines));
  test.readAsBytes().then((List<int> bytes) => handleFileBytes(bytes));
  createFile.create().then((File file) => handleCreatedFile(file));
  print("set to go");

}

void handleFileText(String text){
  print("$text");

}

void handleFileLines(List<String> lineList){
  print("it is ${lineList.length} lines long");
}

void handleFileBytes( List<int> bytes){
  print("the file is ${bytes.length} bytes long");
  for(int n = 0; n<bytes.length; ++n){
    print("${bytes[n]}");
  }
}

void handleCreatedFile( File file){
  print("file.txt created");
  Random randGen = new Random();
  int n = randGen.nextInt(10000);
  file.readAsString().then((String contents){
    file.openWrite().write('$contents\n${n.toString()}');
  });
}
