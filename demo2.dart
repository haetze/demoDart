//two same objects are NOT the same 
class Person{
  String first, last;
  Person.fromName(String first, String last){
    this.first = first;
    this.last = last;
  }
}

main(){
  Person p1 = new Person.fromName('tomm', 'tommes');
  Person p2 = new Person.fromName('tomm', 'tommes');
  bool test = p1 == p2;
  print("$test");


}
