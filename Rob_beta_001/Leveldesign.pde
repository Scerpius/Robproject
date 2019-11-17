/*class Teleporter {
 
 float portalX1 = 80;
 float portalY1 = 80;
 int portalY2 = height-80; 
 int portalX2 = width - 80;
 boolean click = false;
 int iPortal = 120;
 int kleur = 148;
 int ballside = iPortal/2;
 
 float x = portalX1;
 float y = portalY1;
 
 void display() {
 
 int iColor = 5;
 iColor+=8;
 //Teleporter Linksboven//
 for (int iPortal = 120; iPortal > 0; iPortal -=10) {
 
 noStroke();
 
 fill(kleur, 0, 211, iColor);
 ellipse(portalX1, portalY1, iPortal, iPortal);
 
 stroke(0);
 ellipse(portalX1, portalY1, iPortal, iPortal);
 
 
 //Teleporter Rechtsonder//
 
 noStroke();
 fill(148, 0, 211, iColor);
 
 ellipse(portalX2, portalY2, iPortal, iPortal);
 
 stroke(0);
 ellipse(portalX2, portalY2, iPortal, iPortal);
 
 }
 float xdistance1 = portalX1 - Player_move.x;
 float ydistance1 = portalY1 - Player_move.y;
 float distancetocenter1 = pythagoras(xdistance1, ydistance1);
 
 if (distancetocenter1 - ballside <= 0) {
 Player_move.x = 1185; 
 Player_move.y = 500;
 }
 
 float xdistance2 = portalX2 - Player_move.x;
 float ydistance2 = portalY2 - Player_move.y;
 float distancetocenter2 = pythagoras(xdistance2, ydistance2);
 
 if (distancetocenter2 - ballside <= 0) {
 Player_move.x = portalX1 - 15; 
 Player_move.y = 200;
 
 
 
 
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
 } */
/*class SpawnPoint {
 
 void display() {
 //Enemy spawnpoint Left
 fill(255, 0, 0);
 rect(0, 250, 70, 220);
 //Enemy spawnpoint Right
 fill(255, 0, 0);
 rect(1210, 250, 70, 220);
 //Enemy spawnpoint Up
 fill(255, 0, 0);
 rect(530, 0, 220, 70);
 //Enemy spawnpoint Down
 fill(255, 0, 0);
 rect(530, 650, 220, 70);
 }
 }*/

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

if(!collision.hasCollision()){
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
