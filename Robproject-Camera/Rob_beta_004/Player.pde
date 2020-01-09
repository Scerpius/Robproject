class Player {
  float x, y; 
  float vx = 1;
  float vy = 1;
  float ms = 2;
  PImage playerSprite;

  float w;
  float h;
  final float startHp = 3;
  float hp = 3;
  float direction = 4;
  boolean left, right, up, down = false;
  boolean damageGiven = false;
  boolean shield = false;
  boolean dubbelDamage = false;
  int dmg = 1;
  float AS = 5;

  int directionx;
  int directiony;
  int cycleDirectiony;
  int cycleDirectionx;
  int framecount; 
  int oppacity;

  Player() {
    reset();
    x = 425;
    y = 375;
    w = spritesDown[1].width;
    h = spritesDown[i].height;
  }

  void reset() {
    // x = width/2; 
    // y = height-texture.height;
  }
  void show() {
    if (!down && !up && !left && !right) {
      image(spritesDown[1], x, y);
    }
  }

  void update() {
    vx = 0;
    vy = 0;
    if (start == false) {
      if ((keys[LEFT])||(keys['A'])) {
        left = true;
        vx = -1 * ms;
        direction = 1;
        image(spritesLeft[cycleDirectionx], x, y);
        framecount++;
        if (framecount == 9) {
          cycleDirectionx++;
          framecount = 0;
        }
        if (cycleDirectionx == 3) {
          cycleDirectionx = 0;
        }
      }
      if ((keys[RIGHT])||(keys['D'])) {
        right = true;
        vx = 1 * ms;
        direction = 2;
        image(spritesRight[cycleDirectionx], x, y);
        framecount++;

        if (framecount == 9) {
          cycleDirectionx++;
          framecount = 0;
        }
        if (cycleDirectionx == 3) {
          cycleDirectionx = 0;
        }
      }
      if ((keys[UP])||(keys['W'])) {
        up = true;
        vy = -1 * ms;

        direction = 4;
        tint(255, oppacity);
        image(spritesUp[cycleDirectiony], x, y);
        noTint();
        framecount++;
        if (framecount == 9) {
          cycleDirectiony++;
          framecount = 0;
        }
        if (cycleDirectiony == 3) {
          cycleDirectiony = 0;
        }
      }
      if ((keys[DOWN])||(keys['S'])) {
        down = true;
        vy = 1  * ms;
        direction = 3;
        tint(255, oppacity);
        image(spritesDown[cycleDirectiony], x, y);
        noTint();
        framecount++;
        if (framecount == 9) {
          cycleDirectiony++;
          framecount = 0;
        }
        if (cycleDirectiony == 3) {
          cycleDirectiony = 0;
        }
      }
      x = x + vx;
      y = y + vy;
      if ((up||down)&&(left||right)) {
        oppacity = 0;
      } else oppacity = 255;
    }




     if (start == true) {
      if (shield) {
        ellipse(x + (w/2), y + (h / 2), w + 30, h + 20);
      }
      if (dubbelDamage == true && damageGiven == false) {
        dmg *= 2;
        damageGiven = true;
      }
      if (dubbelDamage == false && damageGiven == true) {
        dmg /= 2;
        damageGiven = false;
      }
      if ((keys[LEFT])||(keys['A'])) {
        left = true;
        vx = -2 * ms ;
        direction = 1;
        image(spritesLeft[cycleDirectionx], x, y);
        framecount++;
        if (framecount == 9) {
          cycleDirectionx++;
          framecount = 0;
        }
        if (cycleDirectionx == 3) {
          cycleDirectionx = 0;
        }
      }
      if ((keys[RIGHT])||(keys['D'])) {
        right = true;
        vx = 2 * ms;
        direction = 2;
        image(spritesRight[cycleDirectionx], x, y);
        framecount++;

        if (framecount == 9) {
          cycleDirectionx++;
          framecount = 0;
        }
        if (cycleDirectionx == 3) {
          cycleDirectionx = 0;
        }
      }
      if ((keys[UP])||(keys['W'])) {
        up = true;
        vy = -2 * ms;
        direction = 4;
        tint(255,oppacity);
        image(spritesUp[cycleDirectiony], x, y);
        noTint();
        framecount++;
        if (framecount == 9) {
          cycleDirectiony++;
          framecount = 0;
        }
        if (cycleDirectiony == 3) {
          cycleDirectiony = 0;
        }
      }
      if ((keys[DOWN])||(keys['S'])) {
        down = true;
        vy = 2 * ms;
        direction = 3;
        tint(255,oppacity);
        image(spritesDown[cycleDirectiony], x, y);
        noTint();
        framecount++;
        if (framecount == 9) {
          cycleDirectiony++;
          framecount = 0;
        }
        if (cycleDirectiony == 3) {
          cycleDirectiony = 0;
        }
      }
      if((up||down)&&(left||right)){
       oppacity = 0; 
      } else oppacity = 255;
    }




    if (camera.bx - vx >= 270 || camera.bx - vx <= -864) {
      vx = 0;
    }
    if (camera.by - vy >= 90 || camera.by - vy <= -357) {
      vy = 0;
    }
    // If x position id out of bounds, "undo" velocity
    if ((x < 0) || (x > width - spritesDown[1].width))
      x -= vx;
  }
}






/*
public class Player {
 
 String spritesDown[] = {"Robotpos1.png", "Robotpos2.png", "Robotpos3.png", };
 
 String spritesLeft[] ={"Robotpos6.png", "Robotpos5.png", "Robotpos4.png"};
 
 String spritesRight[] ={"Robotpos7.png", "Robotpos8.png", "Robotpos9.png"};
 
 String spritesUp[] ={"Robotpos10.png", "Robotpos11.png", "Robotpos12.png"};
 
 
 float movementSpeed = 3;
 float acceleration = 1.5;
 float drag = 0.5;
 float speedx= 0;
 float speedy= 0;
 
 int directionx;
 int directiony;
 int cycleDirectiony;
 int cycleDirectionx;
 int framecount; 
 
 float x;
 float y;
 float pX;
 float pY;
 //float size;
 boolean left, right, up, down = false;
 float hp = 3;
 int direction = 4;
 PImage photo;
 PImage playerSprite;
 
 boolean shield = false;
 boolean dubbelDamage = false;
 float dmg = 3;
 float AS = 5;
 
 
 Player() {
 x = width/2;
 y = height/2 +200;
 
 
 // size = 40;
 cycleDirectiony = 0;
 cycleDirectionx = 0;
 playerSprite = loadImage("Robotpos2.png");
 }
 
 void Player_dead() {
 if (hp <= 0) {
 textSize(200);
 text("You dead", 300, 100);
 }
 }
 
 void display() {
 x = constrain (x, 0, width-67);
 y = constrain (y, 0, height-42);
 image(playerSprite, x, y);
 
 if (shield) {
 ellipse(x + (playerSprite.width/2), y + (playerSprite.height / 2), playerSprite.width + 30, playerSprite.height + 20);
 }
 }
 
 
 void move() {
 pX = x;
 pY = y;
 if (collision.checkCollision(x +speedx, y, playerSprite.width, playerSprite.height) == false) {
 x = x+speedx;
 ;
 }
 
 if (collision.checkCollision(x, y+speedy, playerSprite.width, playerSprite.height) == false) {
 y = y+speedy;
 }
 
 x = constrain(player.x, 54, width-100);
 y = constrain(player.y, 108, height-181);
 
 
 if (left) {
 speedx = speedx - acceleration;
 directionx = 1;
 direction = 1;
 if (speedx <= -movementSpeed) {
 speedx = -movementSpeed;
 }
 playerSprite = loadImage(spritesLeft[cycleDirectionx]);
 framecount++;
 if (framecount == 9) {
 cycleDirectionx++;
 framecount = 0;
 }
 if (cycleDirectionx == 3) {
 cycleDirectionx = 0;
 }
 } else if (right) {
 speedx = speedx + acceleration;
 directionx = 2;
 direction = 2;
 if (speedx >= movementSpeed) {
 speedx = movementSpeed;
 }
 playerSprite = loadImage(spritesRight[cycleDirectionx]);
 framecount++;
 if (framecount == 9) {
 cycleDirectionx++;
 framecount = 0;
 }
 if (cycleDirectionx == 3) {
 cycleDirectionx = 0;
 }
 }
 
 if (down) {
 speedy = speedy + acceleration;
 directiony = 1;
 direction = 3;
 if (speedy >= movementSpeed) {
 speedy = movementSpeed;
 }
 playerSprite = loadImage(spritesDown[cycleDirectiony]);
 framecount++;
 if (framecount == 9) {
 cycleDirectiony++;
 framecount = 0;
 }
 if (cycleDirectiony == 3) {
 cycleDirectiony = 0;
 }
 } else if (up) {
 speedy = speedy - acceleration;
 directiony = 2;
 direction =4;
 if (speedy <= -movementSpeed) {
 speedy = -movementSpeed;
 }
 playerSprite = loadImage(spritesUp[cycleDirectiony]);
 framecount++;
 if (framecount == 9) {
 cycleDirectiony++;
 framecount = 0;
 }
 if (cycleDirectiony == 3) {
 cycleDirectiony = 0;
 }
 }
 //stopping
 if (directionx == 1) {
 speedx = speedx + drag; 
 if (speedx >= 0) {
 directionx = 0;
 }
 }  
 if (directionx == 2) {
 speedx = speedx - drag; 
 if (speedx <= 0) {
 directionx = 0;
 }
 }  
 if (directiony == 1) {
 speedy = speedy - drag; 
 if (speedy <= 0) {
 directiony = 0;
 }
 }  
 if (directiony == 2) {
 speedy = speedy + drag; 
 if (speedy >= 0) {
 directiony = 0;
 }
 }
 }
 }
 */
