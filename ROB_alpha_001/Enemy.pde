class Enemy {
  float x, y;
  float vx = random(-3, 3);
  float vy = random(-3, 3);
  PImage texture;

  Enemy() {
    x = random(0, width);
    y = random(0, 100);
    texture = loadImage("red_invader.png");
  }

  void reset(){
   x = -1000;
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
