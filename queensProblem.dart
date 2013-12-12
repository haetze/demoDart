import 'dart:math';

class Queen{
  num x = 0.9;
  num y = 0.9;
  
  Queen(this.x, this.y);
  Queen.atXAxis(num x) : this(x, 0);
  Queen.atYAxis(num y) : this(0, y);
  
  num distance( Queen other){
    num dX = this.x - other.x;
    num dY = this.y - other.y;
    num distance = sqrt(dX*dX + dY*dY);
    return distance;
  }
  
  bool m(Queen other){
    return (other.y - y)/(other.x - x) == 1 || (other.y-y)/(other.x-x) == -1;
  }
  
}

class Board{
  List<Queen> Queens = new List();
  Random randGen = new Random();
  
  void firstQueen(){
    Queens = new List();
    int x = randGen.nextInt(8);
    int y = randGen.nextInt(8);
    Queen queen = new Queen(x, y);
    Queens.add(queen);
    while(newQueen() == false){
      print("working");
    }
    print("done");
  }
  
  bool newQueen(){
    int id = Queens.length;
    int x, y;
    Queen queen = new Queen(0.9, 0.9);
    Queens.add(queen);
    if(id + 1 <8){
      newQueen();
    }
    int i = 0;
    bool m = false;
    bool n=false, l = false;
    do{
      i++;
      if(i >= 10000)
        break;
      x = randGen.nextInt(9);
      y = randGen.nextInt(9);
      while(x == 0 || y == 0){
        x = randGen.nextInt(9);
        y = randGen.nextInt(9);
      }
      queen = new Queen(x, y);
      Queens.forEach((other){
        n = other.x == x || n;
        l = other.y == y || l;
        m = queen.m(other) || m;
        
      });
    }while(m == true || n == true || l == true);
    
    if(i<10000000 && (m != true || n != true || l != true)){
      Queens.removeAt(id);
      Queens.insert(id, queen);
      print("x:${queen.x} y:${queen.y}");
      return true;
    }else{
      print("we should start over!");
      firstQueen();
    }
      
  }
  
}



void main(){
 Board board = new Board();
 board.firstQueen();
 
}