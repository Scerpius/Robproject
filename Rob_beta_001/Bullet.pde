class Bullet {
  float x, y;
  float vx, vy;
  PImage texture;
  boolean isFired;
  
 Bullet() {
    texture = loadImage("bullet.png");
    reset();
  }

  void reset() {
    isFired = false; 
    x = -1000;    
    vy = 0;
  }

  void update() {
    if (isFired) {
      
      if (y < 0)
        reset();
    }
    y += vy;
    
    if (keys[' ']) fire(player.x, player.y);
  }

  void show() {
    image(texture, x, y);
  }

  void fire(float x, float y) {
    if (!isFired) {
      isFired = true;
      this.x = x;
      this.y = y;
      vy = -15.0; 
    }
  }
}
