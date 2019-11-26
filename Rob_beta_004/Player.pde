public class Player {

  PImage playerSprite;
  float movementSpeed = 3;
  float acceleration = 1.5;
  float drag = 0.5;
  float speedx= 0;
  float speedy= 0;
  int directionx;
  int directiony;
  float x;
  float y;
  float w;
  float h;
  float pX;
  float pY;
  //float size;
  boolean left, right, up, down = false;
  float hp = 3;
  int dir = 4;

  Player(PImage photo) {
    playerSprite = photo;
    x = width/2;
    y = height/2 +200;
    
     w = playerSprite.width;
    h = playerSprite.height;
   // size = 40;
  }

   void Player_dead() {
    if(hp <= 0) {
    textSize(200);
    text("You dead", 300,100);
    }
  }
  
  void display() {
    x = constrain (x, 0, width-67);
    y = constrain (y, 0, height-42);
    image(playerSprite, x, y);
  }


  void move() {
    pX = x;
    pY = y;
    if(collision.checkCollision(x +speedx, y, w, h) == false){
      x = x+speedx;;
    }
    
    if(collision.checkCollision(x, y+speedy, w, h) == false){
      y = y+speedy;
    }
    
    x = constrain(player.x, 54, width-100);
    y = constrain(player.y, 108, height-181);


    if (left) {
      speedx = speedx - acceleration;
      directionx = 1;
      dir = 1;
      if (speedx <= -movementSpeed) {
        speedx = -movementSpeed;
      }
    } else if (right) {
      speedx = speedx + acceleration;
      directionx = 2;
      dir = 2;
      if (speedx >= movementSpeed) {
        speedx = movementSpeed;
      }
    }
    if (down) {
      speedy = speedy + acceleration;
      directiony = 1;
      dir = 3;
      if (speedy >= movementSpeed) {
        speedy = movementSpeed;
      }
    } else if (up) {
      speedy = speedy - acceleration;
      directiony = 2;
      dir =4;
      if (speedy <= -movementSpeed) {
        speedy = -movementSpeed;
      }
    }
    //stopping
     if (directionx == 1) {
      speedx = speedx + drag; 
      if (speedx >= 0) {
        directionx = 0;
      }
    }  if (directionx == 2) {
      speedx = speedx - drag; 
      if (speedx <= 0) {
        directionx = 0;
      }
    }  if (directiony == 1) {
      speedy = speedy - drag; 
      if (speedy <= 0) {
        directiony = 0;
      }
    }  if (directiony == 2) {
      speedy = speedy + drag; 
      if (speedy >= 0) {
        directiony = 0;
      }
    }
  }

}
  
