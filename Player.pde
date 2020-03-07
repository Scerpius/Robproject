class Player {
  float x, y; 
  float vx = 0;
  float vy = 0;
  float movementSpeed = 4;
  float acceleration = 3;
  float drag = 0.5;
  PImage playerSprite;
  float fuel;
  final float MaxFuel = 4;
  float w;
  float h;
  final float startHp = 3;
  float hp = 3;
  float direction = 4;
  boolean left, right, up, down = false;
  boolean damageGiven = false;
  boolean shield = false;
  boolean dubbelDamage = false;
  boolean Plank = false;
  int dmg = 1;
  float AS = 5;
  int stationaryPosition; 
  float fireRate= 30;
  int directionx;
  int directiony;
  int cycleDirectiony;
  int cycleDirectionx;
  int framecount; 
  int oppacity;

  Player() {
    reset();
    x = width/2-50;
    y = height/2-50;
    w = spritesDown[1].width;
    h = spritesDown[i].height;
  }

  void reset() {
    //x = 425;
    //y = 375;
  }

  void update() {

    if (start == false) {
      if ((keys[LEFT])||(keys['A'])) { //when you press the left arrow key or the A key then.....
        left = true;
        vx = vx - acceleration;
        directionx = 1;
        if (vx <= -movementSpeed) {
          vx = -movementSpeed;
        }
        direction = 1;
        image(spritesLeft[cycleDirectionx], x, y); //grav image Spritesleft[i] and place it at x and y
        framecount++; //Add one each frame to the variable 'framecount'.
        if (framecount == 9) { // if variable 'framecount' reaches 9 add one to variable 'cycleDirectionx' and reset framecount back to 0.
          cycleDirectionx++;
          framecount = 0;
        }
        if (cycleDirectionx == 3) { // if variable 'cycleDirection' reaches 3 reset it back to 0.
          cycleDirectionx =0;
        }
        stationaryPosition = 0; // if left is pressed, set stationaryPosition to 0;
      } 
      if ((keys[RIGHT])||(keys['D'])) {
        right = true;
        vx = vx + acceleration;
        directionx = 2;
        if (vx >= movementSpeed) {
          vx = movementSpeed;
        }
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
        stationaryPosition = 1;
      }
      if ((keys[UP])||(keys['W'])) {
        up = true;
        vy = vy - acceleration;
        directiony = 2;
        if (vy >= movementSpeed) {
          vx = movementSpeed;
        }

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
        stationaryPosition = 2;
      }
      if ((keys[DOWN])||(keys['S'])) {
        down = true;
        vy = vy + acceleration;
        directiony = 1;
        if (vy >= movementSpeed) {
          vy = movementSpeed;
        }
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
        stationaryPosition = 3;
      }
      x = x + vx;
      y = y + vy;
      if ((up||down)&&(left||right)) {
        oppacity = 0;
      } else oppacity = 255;
    }



    //De start van de echte game 
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

      boolean playercolided = false;
      float oldX = x;
      float oldY = y;


      // if (collision.collision == false) {
      if ((keys[LEFT])||(keys['A'])) { //when you press the left arrow key or the A key then.....


        left = true;
        vx =- acceleration;
        directionx = 1;
        if (vx <= -movementSpeed) {
          //volgens mij komt hij hier niet in, dit kan zijn omdat hij nooit sneller gaat dan de movement speed
          println("Left");
          vx = -movementSpeed;
        }

        direction = 1;
        image(spritesLeft[cycleDirectionx], x, y); //grav image Spritesleft[i] and place it at x and y
        framecount++; //Add one each frame to the variable 'framecount'.


        if (framecount == 9) { // if variable 'framecount' reaches 9 add one to variable 'cycleDirectionx' and reset framecount back to 0.
          cycleDirectionx++;
          framecount = 0;
        }

        if (cycleDirectionx == 3) { // if variable 'cycleDirection' reaches 3 reset it back to 0.
          cycleDirectionx =0;
        }
        stationaryPosition = 0; // if left is pressed, set stationaryPosition to 0;
      }


      if ((keys[RIGHT])||(keys['D'])) {


        right = true;
        vx =+ acceleration;

        directionx = 2;
        if (vx >= movementSpeed) {
          println("Right");
          vx = movementSpeed;
        }
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
        stationaryPosition = 1;
      }
      if ((keys[UP])||(keys['W'])) {


        up = true;
        vy =- acceleration;

        directiony = 2;
        if (vy >= movementSpeed) {
          println("Up");
          vx = movementSpeed;
        }

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
        stationaryPosition = 2;
      }
      if ((keys[DOWN])||(keys['S'])) {

        down = true;
        vy =+ acceleration;

        directiony = 1;
        if (vy >= movementSpeed) {
          println("Down");
          vy = movementSpeed;
        }
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
        stationaryPosition = 3;
      }

      x += vx;
      y += vy;
      if (x  >= 540 && x <= 740 && y + 40 <= 335 && y  >= 170)

      {
        if (player.fuel == player.MaxFuel && key == 'c' || key == 'C') { 
          states=stateInput;
          state = 5;
        }
        playercolided = true;
        x = oldX;
        y = oldY;
      }

      if (x  >= 540 && x <= 740 && y + 50 <= 550 && y  >= 335)

      {
        playercolided = true;
        x = oldX;
        y = oldY;
      }


      if ((player.x < BARREL_X + barrel.width)&&
        (player.x + spritesDown[1].width >BARREL_X)&&
        (player.y < BARREL_Y + barrel.height)&&
        (player.y + spritesDown[1].height > BARREL_Y)) {
        playercolided = true;
        x = oldX;
        y = oldY;
      }




      x =  constrain(x, 50, 1185);
      y = constrain(y, 100, 550); 

      if ((up||down)&&(left||right)) {
        oppacity = 0;
      } else oppacity = 255;
    }




    // Hier wordt if statement altijd uitgevoerd waardoor de snelheden weer op 0 worden gezet. Als ik dit wegcomment lijkt de speler een oneindige snelheid te krijgen.
    if (player.x - vx >= width-90 || player.x - vx <= width-90) {
      vx = 0;
    }
    if (player.y - vy >= 270 || player.y - vy <= width-270) {
      vy = 0;
    }
    // If x position is out of bounds, "undo" velocity
    if ((x < 0) || (x > width - spritesDown[1].width)) {
      x -= vx;
    }
  }
  
  
    void show() {
    //if (collision.collision == false) {
    if (stationaryPosition == 0 && !((keys[LEFT])||(keys['A']))) { // if stationary position is 0 display the standing still image of the player facing left.
      image(spritesLeft[1], x, y);
    }
    if (stationaryPosition == 1 && !((keys[RIGHT])||(keys['D']))) { // if stationary position is 1 dispay the standing still image of the player facing right.
      image(spritesRight[1], x, y);
    }
    if (stationaryPosition == 2 && !((keys[UP])||(keys['W']))) { // if stationary position is 2 display the standing still image of the player facing up.
      image(spritesUp[1], x, y);
    }
    if (stationaryPosition == 3 && !((keys[DOWN])||(keys['S']))) { // if stationary position is 3 display the standing still image of the player facing down.
      image(spritesDown[1], x, y);
      //  }
    }
  }


  void stop_player() {
    if (directionx == 1) {
      vx = vx + drag; 
      if (vx >= 0) {
        directionx = 0;
      }
    }  
    if (directionx == 2) {
      vx = vx - drag; 
      if (vx <= 0) {
        directionx = 0;
      }
    }  
    if (directiony == 1) {
      vy = vy - drag; 
      if (vy <= 0) {
        directiony = 0;
      }
    }  
    if (directiony == 2) {
      vy = vy + drag; 
      if (vy >= 0) {
        directiony = 0;
      }
    }
  }
}
