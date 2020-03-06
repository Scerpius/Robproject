int cycleDirection;
int cycleDirectionstart;
boolean collisionCrater = false;
boolean collisionPlank = false;
boolean playerleft = false;
boolean playerright = false;
boolean playerup = false;
boolean playerdown = false;
PImage hp;
PImage GameOverScreen;
PImage plank;
PImage barrel;
PImage crater;
PImage Ship;
PImage bullet;
PImage playerSprite;
PImage dmg;
PImage AS;
PImage PauseMenu;
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
PImage[] Teleportal = new PImage[3];
PImage[] Teleportalstart = new PImage[3];


/*
De loadassets laat alle plaatjes van te voren in zodat we die daarna makkelijk kunnen gebruiken en zodat we die niet in de game nog hoeven in te laden.
 Zo voorkom je lag.
 */

void loadAssets() { // hier laden we alle foto's in die we gebruiken in het spel
  plank = loadImage("Plank.png");

  hp = loadImage("HpHUD.png");
  AS = loadImage("ASHUD.png");
  dmg = loadImage("dmgHUD.png");
  barrel = loadImage("Barrel.png");
  crater = loadImage("Crater.png");
  playerSprite = loadImage("Player.png");
  GameOverScreen = loadImage("GameOverScreen.png");
  CheckMark = loadImage("CheckMark.png");
  Ship = loadImage("ShipEmpty.png");
  PauseMenu = loadImage("PauseMenu.png");
  bullet = loadImage("bullet.png");
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

    spritesDownWalker[0]=loadImage("Walker1.png");
    spritesDownWalker[1]=loadImage("Walker2.png");
    spritesDownWalker[2]=loadImage("Walker3.png");
    spritesLeftWalker[0]=loadImage("Walker4.png");
    spritesLeftWalker[1]=loadImage("Walker5.png");
    spritesLeftWalker[2]=loadImage("Walker6.png");
    spritesRightWalker[0]=loadImage("Walker7.png");
    spritesRightWalker[1]=loadImage("Walker8.png");
    spritesRightWalker[2]=loadImage("Walker9.png");
    spritesUpWalker[0]=loadImage("Walker10.png");
    spritesUpWalker[1]=loadImage("Walker11.png");
    spritesUpWalker[2]=loadImage("Walker12.png");

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

    Teleportal[0] = loadImage("Teleportal1.png");
    Teleportal[1] = loadImage("Teleportal2.png");
    Teleportal[2] = loadImage("Teleportal3.png");

    Teleportalstart[0] = loadImage("Teleportal1.png");
    Teleportalstart[1] = loadImage("Teleportal2.png");
    Teleportalstart[2] = loadImage("Teleportal3.png");
  }
}

class Teleporter {
  // Array of portals //

  // Declare the picture //
  void collision() {
    player.x = constrain(player.x, 50, 1185);
    player.y = constrain(player.y, 100, 550);
    if (start == true) {
      if ((player.x < CRATER_X + crater.width) && //links van crater
        (player.x + spritesDown[1].width > CRATER_X) && // rechts van crater
        (player.y < CRATER_Y + crater.height) && //boven van crater
        (player.y + spritesDown[1].height > CRATER_Y)) { //onder van crater
        collisionCrater = true;
      } else collisionCrater = false;


      if ((player.x < PLANK_X + plank.width) &&
        (player.x + spritesDown[1].width > PLANK_X) &&
        (player.y < PLANK_Y + plank.height) &&
        (player.y + spritesDown[1].height > PLANK_Y)) {
        collisionPlank = true;
      } else collisionPlank = false;

      if (collisionCrater) {
        if (collisionPlank) {
          collisionCrater = false;
        
        } else { 
          player.x -= player.vx; 
          player.y -= player.vy; 
          
        }
      }
    }






    //if (player.x < CRATER_X + crater.width) {
    //  playerleft = true;
    //} else playerleft = false;
    //if (player.x + spritesDown[1].width > CRATER_X) {
    //  playerright = true;
    //} else playerright = false;
    //if (player.y < CRATER_Y + crater.height) {
    //  playerup = true;
    //} else playerup = false;
    //if (player.y + spritesDown[1].height > CRATER_Y) {
    //  playerdown = true;
    //} else playerdown = false;
    //int i = 0;
    //i++;
    //println(i);
    //println(playerleft);
  }


  // Colors //
  final color WHITE = color(255), PURPLE = color(55, 16, 72);

  // Portal coords //

  //portal startscherm????
  int portalX3 = 730;
  int portalY3 = 410;
  int portalX4 = 410;
  int portalY4 = 410;


  // Detection Boxes //

  //Detection startscherm????????
  int detectionX3 = 782;
  int detectionY3 = 460;
  int detectionX4 = 482;
  int detectionY4 = 460;


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
      image(Teleportalstart[cycleDirectionstart], portalX4, portalY4);
      framecount ++;
      if (framecount == 90) {
        cycleDirectionstart++;
        framecount = 0;
        if (cycleDirectionstart == 3) {
          cycleDirectionstart = 0;
        }
      }
      image(Teleportalstart[cycleDirectionstart], portalX3, portalY3);
      framecount ++;
      if (framecount == 90) {
        cycleDirectionstart++;
        framecount = 0;
        if (cycleDirectionstart == 3) {
          cycleDirectionstart = 0;
        }
      }
    }

    if (start) {
      //startTime.countUp();
      image(Teleportal[cycleDirection], 70, 150);
      framecount ++;
      if (framecount == 90) {
        cycleDirection++;
        framecount = 0;
        if (cycleDirection == 3) {
          cycleDirection = 0;
        }
      }

      image(Teleportal[cycleDirection], 1100, 470);
      framecount ++;
      if (framecount == 93) {
        cycleDirection++;
        framecount = 0;
        if (cycleDirection == 3) {
          cycleDirection = 0;
        }
      }
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
        backGroundLevel = loadImage("MapDesert.png");
        start = true;
      }




      float xdistance4 = detectionX4 - player.x - spritesDown[i].width /2 ;
      float ydistance4 = detectionY4 - player.y - spritesDown[i].height /2;
      float distancetocenter4 = pythagoras(xdistance4, ydistance4);

      if (distancetocenter4 - boxSize /2 <= 0) {
        player.x = detectionX3 + 100; 
        player.y = detectionY3 - 10;
        start = true;
        backGroundLevel = loadImage("Backgroundtegels.png");
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
/*

 Hier geneer ik de tegels op een random manier. Dit wordt niet in de game zelf gebruikt omdat wij 1 keer hem hebben gegenereed en toen een screenshot hebben genomen.
 Dit hebben wij gedaan om te voorkomen dat de game anders zou gaan laggen.
 
 int[][] tegels;
 PImage imageA;
 PImage imageB;
 PImage imageC;
 PImage imageD;
 PImage imageE;
 PImage imageF;
 PImage imageG;
 PImage imageH;
 PImage imageI;
 PImage imageJ;
 PImage imageK;
 PImage imageL;
 
 
 void setup() {
 size(1280, 720);
 
 imageA = loadImage("Tegel1.png");
 imageB = loadImage("Tegel2.png");
 imageC = loadImage("Tegel3.png");
 imageD = loadImage("Tegel4.png");
 imageE = loadImage("Tegel5.png");
 imageF = loadImage("Tegel6.png");
 imageG = loadImage("Tegel7.png");
 imageH = loadImage("Tegel8.png");
 imageI = loadImage("Tegel9.png");
 imageJ = loadImage("Tegel10.png");
 imageK = loadImage("Tegel11.png");
 imageL = loadImage("Tegel12.png");
 
 tegels = new int[32][18];
 
 for (int i = 0; i < tegels.length; i++) {
 for (int j = 0; j < tegels[i].length; j++) {
 tegels[i][j] = (int)random(12);
 }
 }
 }
 
 void draw() {
 for (int i = 0; i < tegels.length; i++) {
 for (int j = 0; j < tegels[i].length; j++) {    
 if (tegels[i][j] == 0) {
 image(imageA, i*40, j*40);
 } else if (tegels[i][j] == 1) {
 image(imageB, i*40, j*40);
 } else if (tegels[i][j] == 2) {
 image(imageC, i*40, j*40);
 } else if (tegels[i][j] == 3) {
 image(imageD, i*40, j*40);
 } else if (tegels[i][j] == 4) {
 image(imageE, i*40, j*40);
 } else if (tegels[i][j] == 5) {
 image(imageF, i*40, j*40);
 } else if (tegels[i][j] == 6) {
 image(imageG, i*40, j*40);
 } else if (tegels[i][j] == 7) {
 image(imageH, i*40, j*40);
 } else if (tegels[i][j] == 8) {
 image(imageI, i*40, j*40);
 } else if (tegels[i][j] == 9) {
 image(imageJ, i*40, j*40);
 } else if (tegels[i][j] == 10) {
 image(imageK, i*40, j*40);
 } else if (tegels[i][j] == 11) {
 image(imageL, i*40, j*40);
 };
 };
 };
 };
 */
