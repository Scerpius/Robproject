PImage plank;
PImage barrel;
PImage crater;
PImage portal;
PImage playerSprite;

void loadAssets() {
  plank = loadImage("Plank.png");
  barrel = loadImage("Barrel.png");
  crater = loadImage("Crater.png");
  portal = loadImage("Portal.png");
  playerSprite = loadImage("Player.png");
  PLANK_X = (width-plank.width)/2;
  PLANK_Y = (height-plank.height)/2;
}

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
  //portal startscherm????
  int portalX3 = 1200;
  int portalY3 = 1200;
  int portalX4 = 350;
  int portalY4 = 550;


  // Detection Boxes //
  int detectionX1 = 122;
  int detectionY1 = 200;
  int detectionX2 = 1152;
  int detectionY2 = 520;
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
    if (start) {
      image(Teleportal, portalX1, portalY1);
      image(Teleportal, portalX2, portalY2);
      
    }
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
        player.y = 
          detectionY1 - 10;
      }
    }
    if (start == false) {
      float xdistance3 = detectionX3 - player.x - player.playerSprite.width /2 ;
      float ydistance3 = detectionY3 - player.y - player.playerSprite.height /2;
      float distancetocenter3 = pythagoras(xdistance3, ydistance3);

      if (distancetocenter3 - boxSize /2 <= 0) {
        player.x = detectionX4 + 100; 
        player.y = 
          detectionY4 - 10;
      }




      float xdistance4 = detectionX4 - player.x - player.playerSprite.width /2 ;
      float ydistance4 = detectionY4 - player.y - player.playerSprite.height /2;
      float distancetocenter4 = pythagoras(xdistance4, ydistance4);

      if (distancetocenter4 - boxSize /2 <= 0) {
        player.x = detectionX3 + 100; 
        player.y = 
        detectionY3 - 10;
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
//class Object {





//}

//void display() {


//  //BookShelf Size = 100,132px
//  // image(bookShelf, BOOKSHELF_X, BOOKSHELF_Y);
//  //Barrel Size = 50, 65px
//  image(barrel, BARREL_X, BARREL_Y);
//  image (crater, CRATER_X, CRATER_Y, CRATER_WIDTH, CRATER_HEIGHT);
//  image (portal, (width-portal.width)/2, 0);
//  image (portal, (width-portal.width)/2, height-portal.height);
//  image (plank, PLANK_X, PLANK_Y);

//  }

//  //Player walkspace. Hier staat de code met waar de player kan lopen. Zo kan hij niet door muren lopen maar wel
//  // in de enemy spawn

//  //player.x = constrain(player.x, 54, width-100);
//  //player.y = constrain(player.y, 108, height-181);

//  if (!collision.hasCollision()) {
//    collision.top = false;
//    collision.bottom = false;
//    collision.right = false;
//    collision.left = false;
//  }
//  if (collision.hasCollision() && !collision.collidesWithPlank()) {
//    if (collision.left) {
//      player.x = object.CRATER_X + object.CRATER_WIDTH ;
//    } else if (collision.right) {
//      player.x = object.CRATER_X  - player.player.width;
//    } else if (collision.bottom) {
//      player.y = object.CRATER_Y - player.player.height;
//    } else {
//      player.y = object.CRATER_Y + object.CRATER_HEIGHT;
//    }
//  }
//}
//}
