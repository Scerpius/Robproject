 class Bullet {
   // Properties of a Bullet. i.e.: a Bullet HAS:
  float x, y; // a position
  float vx, vy; // a velocity (direction)
  float speed = 10;
  PImage texture;
  boolean isFired; // a way to see if it is being fired
  
  
// The Constructor, to set initial values, etc
  Bullet() {
    texture = loadImage("bullet.png");
    reset();
  }

  void reset() { // the bullet is not being fired right now
    isFired = false; 
    // a bullets starts outside the window when it is not being fired
    x = -100000;    
    // The bullet starts out with 0 velocity
    vy = 0;
    vx = 0;
  }
// Whenever you want to update a bullet, call this method
  void update() {
    if (player.fireRate <= 11){
     player.fireRate = 10; 
    }
    // if the bullet is being fired
    if (isFired) {

      if (y < 0)
        reset(); // if the bullet runs out of our window, return it to its initial state
    }
    // use the velocity to calculate the new position
    y += vy;
    x += vx;
    if (frameCount %player.fireRate == 0 && fired == true) { // sets a firerate on the bullet
      fired = false;
    }
  }

// Whenever you want to draw the bullet, call this method
  void show() {
    image(texture, x, y);
  }
// Call this method to signify that the bullet has been fired
  void fire(float x, float y) {
    if (!isFired) {
      isFired = true;
      // Start the bullet at the player position
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
    box = loadImage("sword_slice.png");
  }
  void update() {

    if (player.direction == 1) {
      x = player.x - box.width;
      y = player.y; //links
    }
    if (player.direction == 2) {
      x = player.x + box.width;
      y = player.y; // rechts
    }
    if (player.direction == 3) {
      x = player.x;
      y = player.y + box.height; //omlaag
    }
    if (player.direction == 4) {
      x = player.x; 
      y = player.y -box.height; //omhoog
    }
  }



  void show() {
    image(box, x, y);
  }
}
