int cycleDirection;

PImage plank;
PImage barrel;
PImage crater;
PImage playerSprite;
PImage Teleportal;

String [] sprites = {"Teleportal1.png", "Teleportal2.png", "Teleportal3.png"};

void loadAssets() {
  plank = loadImage("Plank.png");
  barrel = loadImage("Barrel.png");
  crater = loadImage("Crater.png");
  playerSprite = loadImage("Player.png");
  Teleportal = loadImage(sprites[cycleDirection]);
  PLANK_X = (width-plank.width)/2;
  PLANK_Y = (height-plank.height)/2;
}

class Teleporter {
  // Array of portals //

  // Declare the picture //


  // Colors //
  final color WHITE = color(255), PURPLE = color(55, 16, 72);

  // Portal coords //

  //portal startscherm????
  int portalX3 = 1200;
  int portalY3 = 1200;
  int portalX4 = 350;
  int portalY4 = 550;


  // Detection Boxes //

  //Detection startscherm????????
  int detectionX3 = 902;
  int detectionY3 = 425;
  int detectionX4 = 402;
  int detectionY4 = 600;


  // Hitbox Size //
  int boxSize = 100;

  // Booleans //
  boolean overlap = false;

  // Time Delay //
  int framecount = 0;
  

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

    //if (start) {
    //  image(Teleportal, portalX1, portalY1);
    //  image(Teleportal, portalX2, portalY2);
    //}
    if (start == false) {
      image(Teleportal, portalX3, portalY3);
      image(Teleportal, portalX4, portalY4);
    }
  }


  // Check if there is a collision //
  void checkBoundaryCollision() {
    if (start) {
      float xdistance1 = detectionX1 - player.x - player.playerSprite.width /2 ;
      float ydistance1 = detectionY1 - player.y - player.playerSprite.height /2;
      float distancetocenter1 = pythagoras(xdistance1, ydistance1);

      if (distancetocenter1 - boxSize/2 <= 0) {
        player.x = detectionX2 - 100; 
        player.y = detectionY2 - 10;
      }

      float xdistance2 = detectionX2 - player.x - player.playerSprite.width /2 ;
      float ydistance2 = detectionY2 - player.y - player.playerSprite.height /2;
      float distancetocenter2 = pythagoras(xdistance2, ydistance2);

      if (distancetocenter2 - boxSize /2 <= 0) {
        player.x = detectionX1 + 100; 
        player.y = detectionY1 - 10;
      }
    }
    if (start == false) {
      float xdistance3 = detectionX3 - player.x - player.playerSprite.width /2 ;
      float ydistance3 = detectionY3 - player.y - player.playerSprite.height /2;
      float distancetocenter3 = pythagoras(xdistance3, ydistance3);

      if (distancetocenter3 - boxSize /2 <= 0) {
        player.x = detectionX4 + 100; 
        player.y = detectionY4 - 10;
      }




      float xdistance4 = detectionX4 - player.x - player.playerSprite.width /2 ;
      float ydistance4 = detectionY4 - player.y - player.playerSprite.height /2;
      float distancetocenter4 = pythagoras(xdistance4, ydistance4);

      if (distancetocenter4 - boxSize /2 <= 0) {
        player.x = detectionX3 + 100; 
        player.y = detectionY3 - 10;
        start = true;
      }
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
