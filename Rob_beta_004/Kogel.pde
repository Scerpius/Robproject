//de class waar de kogel wordt aangemaakt
public class  Kogel {
  
  float x;// de x waarde van de kogel
  float y;// de y waarde van de kogel
  float vx = 0; // de x snelheid van de kogel
  float vy = 0;// de y snehlheid van de kogel
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
  
  void reset(){
    x = -1000;    
    vy = 0;
    vx = 0;
    dx = 0;
    dy = 0;
  }

  void shoot() {
    
    x += vx - player.vx;
    y += vy - player.vy;
    
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
