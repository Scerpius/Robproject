public class  Kogel {
  float killMe;
  float x;
  float y;
  float vx = 10;
  float vy = 10;
  boolean fireD = false;
  boolean fireU = false;
  boolean fireR = false;
  boolean fireL = false;
  PImage texture;

  Kogel(float _x , float _y) {
    x = _x;
    y = _y;
    texture = loadImage("bullet.png");
  }

  void show() {
    image(texture, x, y);
  }

  void shoot() {
    if (fireD) {
      y+= vy;
     
    }
    if (fireU) {
      y-= vy;
      
    }
    if (fireR) {
      x+= vx;
      
    }
    if (fireL) {
      x-= vx;
     
    }
  }
}
