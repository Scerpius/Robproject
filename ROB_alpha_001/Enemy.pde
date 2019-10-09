class Enemy {
  float x, y;
  float vx = random(-2, 2);
  float vy = random(-2, 2);
  PImage texture;

  Enemy() {
    x = random(width/2-100, width/2+100); //top spawn point
    y = random(0, 100);  
    texture = loadImage("red_invader.png");
 
  }

  void reset(){
   x = -1100;
   vx = 0;
   vy = 0;
  }

  void update() {
    x = x + vx;
    y = y + vy;
    if (x < 0 || x> width) {
      vx *= -1;
    }

    if (y<0 || y> 300) {
      vy *= -1;
    }
  }

  void show () {
    image(texture,x,y);
  }
}
