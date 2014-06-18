library point;

import 'dart:math';

class Point{
  num x;
  num y;
  num z; 
  Point(this.x, this.y, this.z);
  Point.atXAxis(num x) : this(x, 0, 0);
  Point.atYAxis(num y) : this(0, y, 0);
  Point.atZAxis(num z) : this(0, 0, z);

  Point.beginning() : this(0, 0, 0);

  num distance2D( Point other){
    num dX = this.x - other.x;
    num dY = this.y - other.y;
    num distance = sqrt(dX*dX + dY*dY);
    return distance;
  }
  num distance3D( Point other){
    num dis2D = this.distance2D(other);
    num dZ = this.z - other.z;
    num distance = sqrt(dis2D*dis2D+dZ*dZ);
    return distance;
  }

}

class Vektor{
    num x;
    num y;
    num z;
    
    Vektor(this.x, this.y, this.z);
    Vektor.fromPoints(Point p1, Point p2) : this(p2.x-p1.x, p2.y-p1.y, p2.z-p1.z);
    Vektor addVektor(Vektor other){
      return new Vektor(this.x+other.x, this.y+other.y, this.z+other.z);
    }
    Vektor subVektor(Vektor other){
      return new Vektor(this.x-other.x, this.y-other.y, this.z-other.z);
    }
    Vektor multSkalar(num n){
      return new Vektor(this.x*n, this.y*n, this.z*n);
    }
    Vektor difSkalae(num n){
      return new Vektor(this.x/n, this.y/n, this.z/n);
    }
    
}





