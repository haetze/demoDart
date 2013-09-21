import 'dart:math';

class Point{
  num x;
  num y;
  Point(num x, num y){
    this.x = x;
    this.y = y;
  }

}

void main(){
  Point p1 = new Point(1,8);
  Point p2 = new Point(8,1);  
  print("${p1.x} \n${p1.y}");
  print("${p2.x} \n${p2.y}");
  num dis = distance(p1, p2);
  bool test = p1 == p2;
  print("$test");
  print("$dis");

}

num distance(Point p1, Point p2){
  num dx = p1.x - p2.x;
  num dy = p1.y - p2.y;
  num distance = sqrt(dx*dx+dy*dy);
  return distance;





}
