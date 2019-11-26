public class  Kogel {
  float killMe;
  float x;
  float y;
  float vx = 0;
  float vy = 0;
  float dx = -999, dy = -999;
  
  boolean fireD = false;
  boolean fireU = false;
  boolean fireR = false;
  boolean fireL = false;
  PImage texture;

  Kogel(float _x , float _y, float directionX, float directionY) {
    x = _x;
    y = _y;
    dx = directionX;
    dy = directionY;
    vx += dx;
    vy += dy;
    
    texture = loadImage("bullet.png");
  }

  void show() {
    image(texture, x, y);
  }

  void shoot() {
    
    x += vx;
    y += vy;
    
    /*
    if (fireD) {
      println(vy);
      y+= vy;
     
    }
    if (fireU) {
      println(vy);
      y-= vy;
      
    }
    if (fireR) {
      x+= vx;
      
    }
    if (fireL) {
      x-= vx;
     
    }*/
  }
}
