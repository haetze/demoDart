#!/usr/bin/dart
import 'dart:math';

class Point{
  num x;
  num y;
  Point(num x, num y){
    this.x = x;
    this.y = y;
  }
  num distance( Point p2){
      num dx = this.x - p2.x;
      num dy = this.y - p2.y;
      num distance = sqrt(dx*dx+dy*dy);
      return distance;
  }


}

void main(){
  Point p1 = new Point(1,8);
  Point p2 = new Point(8,1);  
  print("${p1.x} \t${p1.y}");
  print("${p2.x} \t${p2.y}");
  num dis = p1.distance(p2);
  bool test = p1 == p2;
  print("$test");
  print("$dis");

}

