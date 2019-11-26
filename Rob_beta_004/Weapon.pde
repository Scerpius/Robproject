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
      vy = -6;
      /*
      if (player.dir == 1) vx = -speed; //links
      if (player.dir == 2) vx = speed; // rechts
      if (player.dir == 3) vy = speed; //omlaag
      if (player.dir == 4) vy = -speed; //omhoog
      */
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
    /*
    if (player.dir == 1){
      x = player.x - box.width;
      y = player.y; //links
    }
    if (player.dir == 2){
      x = player.x + box.width;
      y = player.y; // rechts
    }
    if (player.dir == 3){
      x = player.x;
      y = player.y + box.height; //omlaag
    }
    if (player.dir == 4){
      x = player.x; 
      y = player.y -box.height; //omhoog
    }
    */
  }



  void show() {
    image(box, x, y);
  }
}
