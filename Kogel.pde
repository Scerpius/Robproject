public class  Kogel {
  float x;
  float y;
  float vx = 0;
  float vy = 0;
  
  PImage texture;

  Kogel(float _x , float _y, float directionX, float directionY) {
    x = _x;
    y = _y;
    vx = directionX;
    vy = directionY;
    
    texture = loadImage("bullet.png");
  }

  void show() {
    image(texture, x, y);
  }
  
  void reset(){
    x = -1000;    
    vy = 0;
    vx = 0;
  }

  void shoot() {
    //println("hoi, ik beweeg");
    //println(x, " ", vx, " ", player.vx);
    //println(y, " ", vy, " ", player.vy);
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
