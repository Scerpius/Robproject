class Player {
  float x, y; 
  float vx = 3;
  float vy = 3;
  float ms = 1;
  PImage playerSprite;

  float w;
  float h;
  final float startHp = 3;
  float hp = 3;
  float direction;
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
        vx = -3 * ms;
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
        vx = 3 * ms;
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
        vy = -3 * ms;
       
        direction = 4;
        image(spritesUp[cycleDirectiony], x, y);
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
        vy = 3 * ms ;
        direction = 3;
        image(spritesDown[cycleDirectiony], x, y);
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
        vx = -3 * ms ;
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
        vx = 3 * ms;
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
        vy = -3 * ms;
        direction = 4;
        image(spritesUp[cycleDirectiony], x, y);
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
        vy = 3 * ms;
        direction = 3;
        image(spritesDown[cycleDirectiony], x, y);
        framecount++;
        if (framecount == 9) {
          cycleDirectiony++;
          framecount = 0;
        }
        if (cycleDirectiony == 3) {
          cycleDirectiony = 0;
        }
      }
    }



//Dit checkt of locatie van de player tegen de muur aanloopt. 
//Zoja dan zet hij de snelheid dat de player heeft op 0 zodat hij niet door de muur heen kan lopen.
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
