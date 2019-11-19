public class player {


  PImage player;
  float movementSpeed = 3;
  float acceleration = 1.5;
  float drag = 0.5;
  float speedx= 0;
  float speedy= 0;
  int directionx;
  int directiony;
  float x;
  float y;
  //float size;
  boolean left, right, up, down = false;
  float hp = 3;



  player() {
    player = loadImage("Player.png");
    x = width/2;
    y = height/2 +200;
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
    image(player, x, y);
  }


  void move() {
    x = x+speedx;
    y = y+speedy;


    if (left) {
      speedx = speedx - acceleration;
      directionx = 1;
      if (speedx <= -movementSpeed) {
        speedx = -movementSpeed;
      }
    } else if (right) {
      speedx = speedx + acceleration;
      directionx = 2;
      if (speedx >= movementSpeed) {
        speedx = movementSpeed;
      }
    }
    if (down) {
      speedy = speedy + acceleration;
      directiony = 1;
      if (speedy >= movementSpeed) {
        speedy = movementSpeed;
      }
    } else if (up) {
      speedy = speedy - acceleration;
      directiony = 2;
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
  
