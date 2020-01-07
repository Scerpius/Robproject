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
  
      boolean kogelHit(float x0, float y0, PImage texture0, float x1, float y1, PImage texture1) {  
    int w0 = texture0.width, 
      h0 = texture0.height, 
      w1 = texture1.width, 
      h1 = texture1.height;

    if (x0 > x1   + w1 || x0 + w0 < x1 || 
      y0 > y1 + h1 || y0 + h0 < y1)
      return false;
    else
      return true;
  }
 

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
    
      if(kogelHit(x,y,texture,player.x,player.y,playerSprite) == true){
     player.hp -= 1;
     reset();
     
   }
    
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
