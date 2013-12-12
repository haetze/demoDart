import 'dart:io';

List<String> dd = new List(10000);

void main(){
  DateTime tim = new DateTime.now();
  //loads the file
  File file = new File('backupSms.xml');
  //creates a var for the file string
  String fileString;
  //the attribut data you want to extract
  String searchPart = 'body';
  //try catch clause for loading the file String
  try{
    //loads string
    fileString = file.readAsStringSync();
  }catch(e){
    //prints the exception
    print("$e");
    //return
    return ;
  }
  //generartes the list of data
  extractData(fileString, searchPart, 0);

  //prints out 
  for(int n = 0; n<dd.length; ++n){
    if(dd[n] != null)
      print("${dd[n]} , $n");
    else
      n = dd.length;
  }
  DateTime tim2 = new DateTime.now();
  print("${tim2.millisecondsSinceEpoch - tim.millisecondsSinceEpoch}");
}



void extractData(String forSearch, String toSearch, int n){
  //get the position
  if(forSearch.indexOf(toSearch) == -1){
  }else{
    int position = forSearch.indexOf(toSearch);
    int end = forSearch.indexOf('"', position+toSearch.length+2);
    String data = forSearch.substring(position, end+1);
    try{
      dd[n] = data;
      extractData(forSearch.substring(end, forSearch.length), toSearch, n+1);
    }catch(e){
      print('error not big enough elements in list avible');
    }
   // print("$data");
  }
}
  

