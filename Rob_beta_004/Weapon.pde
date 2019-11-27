class Bullet {
  float x, y;
  float vx, vy;
  float speed = 6;
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
    vx = 0;
  }

  void update() {
    if (isFired) {

      if (y < 0)
        reset();
    }
    y += vy;
    x += vx;
    /*
    if (keys[' ']){
     Bullet b = new Bullet();
     bullets.add(b);
     b.fire(player.x, player.y);
     };
     */
  }


  void show() {
    image(texture, x, y);
  }

  void fire(float x, float y) {
    if (!isFired) {
      isFired = true;
      this.x = x;
      this.y = y;
      
      if (player.direction == 1) vx = -speed; //links
      if (player.direction == 2) vx = speed; // rechts
      if (player.direction == 3) vy = speed; //omlaag
      if (player.direction == 4) vy = -speed; //omhoog
      
    }
    
  }
}

class Sword {
  float x, y;
  boolean isHit;
  PImage box;


  Sword() {
    box = loadImage("box.png");
  }
  void update() {
    
    if (player.direction == 1){
      x = player.x - box.width;
      y = player.y; //links
    }
    if (player.direction == 2){
      x = player.x + box.width;
      y = player.y; // rechts
    }
    if (player.direction == 3){
      x = player.x;
      y = player.y + box.height; //omlaag
    }
    if (player.direction == 4){
      x = player.x; 
      y = player.y -box.height; //omhoog
    }
    
  }



  void show() {
    image(box, x, y);
  }
}
