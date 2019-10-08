class Teleporter {
  float portalX1 = 80;
  float portalY1 = 80;
  int portalY2 = height-80; 
  int portalX2 = width - 80;
  boolean click = false;
  int iPortal = 120;
  int kleur = 148;
  
  
  void display() {

    int iColor = 5;
    iColor+=8;
    //Teleporter Linksboven//
    for (int iPortal = 120; iPortal > 0; iPortal -=10) {

      noStroke();

      fill(kleur, 0, 211, iColor);
      ellipse(portalX1, portalY1, iPortal, iPortal);

      stroke(0);
      ellipse(portalX1, portalY1, 120, 120);


      //Teleporter Rechtsonder//

      noStroke();
      fill(148, 0, 211, iColor);

      ellipse(portalX2, portalY2, iPortal, iPortal);

      stroke(0);
      ellipse(portalX2, portalY2, 120, 120);
    }
    float xdistance = portalX1 - mouseX;
    float ydistance = portalY1 - mouseY;
    float distancetocenter = pythagoras(xdistance, ydistance);

    if (mousePressed == true && distancetocenter <= iPortal/2 && click == false){
    kleur = 200;}
  }
}


float pythagoras(float portalX1, float portalY1) {
  float anwser;
  float antwoord1 = portalX1 * portalX1;
  float antwoord2 = portalY1 * portalY1;
  float addition = antwoord1 + antwoord2;
  anwser = sqrt(addition);

  return anwser;
}
class SpawnPoint {

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
}

class Bubble {
  float x1; 
  float y1;
  float x2;
  float y2;

  Bubble() {
    x1 = random(width-width+30, width-width+ 95);
    y1 = height-height + 140;
    x2 = random(width-width+30, width-width+ 95);
    y2 = height-height + 100;
  }
  void display() {
  }


  void ascend() {
    y1 -=0.5;
    y2 -=0.5;
  }


  void top() {
    if (y1 == 40) {
      y1 = height-height + 150; 
      x1 = random(width-width+30, width-width+ 95);
    }

    if (y2 <= 40) {
      y2 = height-height + 150; 
      x2 = random(width-width+30, width-width+ 95);
    }
  }
}

class LevelObjects {


  void display() {

    //Object Desk//
    fill(255);
    rect(deskX, deskY, deskSX, deskSY);
    fill(0);
    rect(deskX, deskY+deskSY, 10, 40);
    rect(deskX+140, deskY+deskSY, 10, 40);
  }
}
