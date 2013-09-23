import 'point.dart';

void main(){

  Point p1 = new Point(12,13);
  Point p2 = new Point(14,12);

  num d1 = p1.distance(p2);
  num d2 = p2.distance(p1);
  print("${p1.x}");
  print("${p2.x}");

}
