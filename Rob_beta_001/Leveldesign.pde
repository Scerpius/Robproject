class Teleporter {
  // Array of portals //
  String [] sprites = {"Teleportal1.png", "Teleportal2.png", "Teleportal3.png"};

  // Declare the picture //
  PImage Teleportal;

  // Colors //
  final color WHITE = color(255), PURPLE = color(55, 16, 72);

  // Portal coords //
  int portalX1 = 70;
  int portalY1 = 150;
  int portalX2 = 1100;
  int portalY2 = 470;

  // Detection Boxes //
  int detectionX1 = 122;
  int detectionY1 = 200;
  int detectionX2 = 1152;
  int detectionY2 = 520;

  // Hitbox Size //
  int boxSize = 100;

  // Booleans //
  boolean overlap = false;

  // Time Delay //
  int framecount = 0;
  int cycleDirection;

  void display() {
    noStroke();
    noFill();

    // Left upper corner Box //
    ellipse(detectionX1, detectionY1, boxSize, boxSize);

    // Right lower corner Box //
    ellipse(detectionX2, detectionY2, boxSize, boxSize);
    stroke(255);

    // Time delay //
    framecount ++;
    if (framecount == 30) {
      cycleDirection++;
      framecount = 0;
      if (cycleDirection == 3) {
        cycleDirection = 0;
      }
    }

    // Draw the portals //
    Teleportal = loadImage(sprites[cycleDirection]);
    image(Teleportal, portalX1, portalY1);
    image(Teleportal, portalX2, portalY2);
  }

  // Check if there is a collision //
  void checkBoundaryCollision() {

    float xdistance1 = detectionX1 - player.x - player.player.width /2 ;
    float ydistance1 = detectionY1 - player.y - player.player.height /2;
    float distancetocenter1 = pythagoras(xdistance1, ydistance1);

    if (distancetocenter1 - boxSize/2 <= 0) {
      player.x = detectionX2 - 100; 
      player.y = detectionY2 - 10;
    }

    float xdistance2 = detectionX2 - player.x - player.player.width /2 ;
    float ydistance2 = detectionY2 - player.y - player.player.height /2;
    float distancetocenter2 = pythagoras(xdistance2, ydistance2);

    if (distancetocenter2 - boxSize /2 <= 0) {
      player.x = detectionX1 + 100; 
      player.y = detectionY1 - 10;
    }
  }
}


float pythagoras(float x, float y) {
  float anwser;
  float antwoord1 = x * x;
  float antwoord2 = y * y;
  float addition = antwoord1 + antwoord2;
  anwser = sqrt(addition);

  return anwser;
}

class Object {

  PImage plank;

  final int CRATER_X = 540;
  final int CRATER_Y = 150;
  final int CRATER_WIDTH = 200;
  final int CRATER_HEIGHT = 450;

  int PLANK_X;
  int PLANK_Y;

  //final int BOOKSHELF_X = 52, BOOKSHELF_Y = 45;
  int BARREL_X = 915, BARREL_Y = 415;

  Object() {
    plank = loadImage("Plank.png");

    PLANK_X = (width-plank.width)/2;
    PLANK_Y = (height-plank.height)/2;
  }

  void display() {


    //BookShelf Size = 100,132px
    // image(bookShelf, BOOKSHELF_X, BOOKSHELF_Y);
    //Barrel Size = 50, 65px
    image(barrel, BARREL_X, BARREL_Y);
    image (crater, CRATER_X, CRATER_Y, CRATER_WIDTH, CRATER_HEIGHT);
    image (portal, (width-portal.width)/2+8, 0);
    image (portal, (width-portal.width)/2, height-portal.height);
    image (plank, PLANK_X, PLANK_Y);

    if (frameCount %1800 == 0) {
      BARREL_X = 500;
    }

    //Player walkspace. Hier staat de code met waar de player kan lopen. Zo kan hij niet door muren lopen maar wel
    // in de enemy spawn

    player.x = constrain(player.x, 54, width-100);
    player.y = constrain(player.y, 108, height-181);

    if (!collision.hasCollision()) {
      collision.top = false;
      collision.bottom = false;
      collision.right = false;
      collision.left = false;
    }
    if (collision.hasCollision() && !collision.collidesWithPlank()) {
      if (collision.left) {
        player.x = object.CRATER_X + object.CRATER_WIDTH -20;
      } else if (collision.right) {
        player.x = object.CRATER_X +20 - player.player.width;
      } else if (collision.bottom) {
        player.y = object.CRATER_Y + 70 - player.player.height;
      } else {
        player.y = object.CRATER_Y + object.CRATER_HEIGHT -130;
      }
    }
  }
}
