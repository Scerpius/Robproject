int cycleDirection;

PImage GameOverScreen;
PImage plank;
PImage barrel;
PImage crater;
PImage playerSprite;
PImage Teleportal;
PImage[] spritesDown = new PImage[3];
PImage[] spritesLeft = new PImage[3];
PImage[] spritesRight = new PImage[3];
PImage[] spritesUp = new PImage[3];
PImage[] spritesDownWalker = new PImage [3];
PImage[] spritesLeftWalker = new PImage[3];
PImage[] spritesRightWalker = new PImage[3];
PImage[] spritesUpWalker = new PImage[3];
PImage[] spritesDownShooter = new PImage [3];
PImage[] spritesLeftShooter = new PImage[3];
PImage[] spritesRightShooter = new PImage[3];
PImage[] spritesUpShooter = new PImage[3];
String [] sprites = {"Teleportal1.png", "Teleportal2.png", "Teleportal3.png"};


void loadAssets() {
  plank = loadImage("Plank.png");
  barrel = loadImage("Barrel.png");
  crater = loadImage("Crater.png");
  playerSprite = loadImage("Player.png");
  Teleportal = loadImage(sprites[cycleDirection]);
  GameOverScreen = loadImage("GameOverScreen.png");
  PLANK_X = (width-plank.width)/2;
  PLANK_Y = (height-plank.height)/2;
  for (int i = 0; i<3; i++) {
    spritesDownShooter[0]=loadImage("Shooter1.png");
    spritesDownShooter[1]=loadImage("Shooter2.png");
    spritesDownShooter[2]=loadImage("Shooter3.png");
    spritesLeftShooter[0]=loadImage("Shooter4.png");
    spritesLeftShooter[1]=loadImage("Shooter5.png");
    spritesLeftShooter[2]=loadImage("Shooter6.png");
    spritesRightShooter[0]=loadImage("Shooter7.png");
    spritesRightShooter[1]=loadImage("Shooter8.png");
    spritesRightShooter[2]=loadImage("Shooter9.png");
    spritesUpShooter[0]=loadImage("Shooter10.png");
    spritesUpShooter[1]=loadImage("Shooter11.png");
    spritesUpShooter[2]=loadImage("Shooter12.png");

    spritesDownWalker[0]=loadImage("Enemy1.png");
    spritesDownWalker[1]=loadImage("Enemy2.png");
    spritesDownWalker[2]=loadImage("Enemy3.png");
    spritesLeftWalker[0]=loadImage("Enemy4.png");
    spritesLeftWalker[1]=loadImage("Enemy5.png");
    spritesLeftWalker[2]=loadImage("Enemy6.png");
    spritesRightWalker[0]=loadImage("Enemy7.png");
    spritesRightWalker[1]=loadImage("Enemy8.png");
    spritesRightWalker[2]=loadImage("Enemy9.png");
    spritesUpWalker[0]=loadImage("Enemy10.png");
    spritesUpWalker[1]=loadImage("Enemy11.png");
    spritesUpWalker[2]=loadImage("Enemy12.png");

    spritesDown[0] = loadImage("Robotpos1.png");
    spritesDown[1] = loadImage("Robotpos2.png");
    spritesDown[2] = loadImage("Robotpos3.png");
    spritesLeft[0] = loadImage("Robotpos6.png");
    spritesLeft[1] = loadImage("Robotpos5.png");
    spritesLeft[2] = loadImage("Robotpos4.png");
    spritesRight[0] = loadImage("Robotpos7.png");
    spritesRight[1] = loadImage("Robotpos8.png");
    spritesRight[2] = loadImage("Robotpos9.png");
    spritesUp[0] = loadImage("Robotpos10.png");
    spritesUp[1] = loadImage("Robotpos11.png");
    spritesUp[2] = loadImage("Robotpos12.png");
  }
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
      float xdistance1 = detectionX1 - player.x - spritesDown[1].width /2 ;
      float ydistance1 = detectionY1 - player.y - spritesDown[1].height /2;
      float distancetocenter1 = pythagoras(xdistance1, ydistance1);

      if (distancetocenter1 - boxSize/2 <= 0) {
        player.x = detectionX2 - 100; 
        player.y = detectionY2 - 10;
      }

      float xdistance2 = detectionX2 - player.x - spritesDown[1].width /2 ;
      float ydistance2 = detectionY2 - player.y - spritesDown[1].height /2;
      float distancetocenter2 = pythagoras(xdistance2, ydistance2);

      if (distancetocenter2 - boxSize /2 <= 0) {
        player.x = detectionX1 + 100; 
        player.y = detectionY1 - 10;
      }
    }
    if (start == false) {
      float xdistance3 = detectionX3 - player.x - spritesDown[1].width /2 ;
      float ydistance3 = detectionY3 - player.y - spritesDown[1].height /2;
      float distancetocenter3 = pythagoras(xdistance3, ydistance3);

      if (distancetocenter3 - boxSize /2 <= 0) {
        player.x = detectionX4 + 100; 
        player.y = detectionY4 - 10;
      }




      float xdistance4 = detectionX4 - player.x - spritesDown[i].width /2 ;
      float ydistance4 = detectionY4 - player.y - spritesDown[i].height /2;
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
