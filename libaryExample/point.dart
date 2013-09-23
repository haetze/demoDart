library point;

import 'dart:math';

class Point{
  num x;
  num y;
  
  Point(this.x, this.y);
  Point.atXAxis(num x) : this(x, 0);
  Point.atYAxis(num y) : this(0, y);
  Point.beginning() : this(0, 0);

  num distance( Point other){
    num dX = this.x - other.x;
    num dY = this.y - other.y;
    num distance = sqrt(dX*dX + dY*dY);
    return distance;
  }
}




