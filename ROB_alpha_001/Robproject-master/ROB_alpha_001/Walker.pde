//enemy spawn op random spawnpoint
//enemy loopt rond
//als enemy player detecteert{
//volg player
//kom dichterbij
//als enemy player raakt{
//player krijgt damage
//enemy wacht 1 seconde
//}
//}
//als enemy levens < 0 {
//enemy despawnt
//wacht 5 seconden - constante * rondes
//}
public class Walker {
  int playerX = mouseX;
  int playerY = mouseY;
  float sizeEnemy = 40;
  int PointWalkX = int(random(sizeEnemy/2, width - sizeEnemy/2));
  int PointWalkY = int(random(sizeEnemy/2, height - sizeEnemy/2));
  float posXEnemy;
  float posYEnemy;
  float distX;
  float distY;
  float moveEnemy = 2; //nodig
  boolean Xtrue = false;
  boolean Ytrue = false;
  color purple = color(177, 5, 178);

  //tekenen
  void draw() {
    fill(purple);
    ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
  }
  void spawn() {
    switch(positionSpawn[i]) {
      case(0):
      posXEnemy = random(width/2 -35, width/2 + 35);
      posYEnemy = random(0, 30);
      break;
      case(1):
      posXEnemy = random(width-30, width);
      posYEnemy = random(height/2-35, height/2+35);
      break;
      case(2):
      posXEnemy = random(width/2 -35, width/2 + 35);
      posYEnemy = random(height-30, height);
      break;
      case(3):
      posXEnemy = random(0, 30);
      posYEnemy = random(height/2-35, height/2+35);
      break;
    }

    walkCount++;
  }

  //lopen
  void updateX() {
    distX = max(PointWalkX, posXEnemy) - min(PointWalkX, posXEnemy);
    if (posXEnemy > PointWalkX && distX > 10) {
      posXEnemy = posXEnemy - moveEnemy;
      ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
    } else if (posXEnemy < PointWalkX && distX > 10) {
      posXEnemy = posXEnemy + moveEnemy;
      ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
    } else {

      Xtrue = true;
    }
  }
  void updateY() {
    distY = max(PointWalkY, posYEnemy) - min(PointWalkY, posYEnemy);
    if (posYEnemy>PointWalkY && distY > 10) {
      posYEnemy = posYEnemy - moveEnemy;
      ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
    } else if (posYEnemy < PointWalkY && distY > 10) {
      posYEnemy = posYEnemy + moveEnemy;
      ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
    } else {
      Ytrue = true;
    }
  }
  void check() {
    if ( Xtrue == true && Ytrue == true) {
      PointWalkY = int(random(sizeEnemy/2, height - sizeEnemy/2));
      PointWalkX = int(random(sizeEnemy/2, width-sizeEnemy/2));
      Xtrue = false;
      Ytrue = false;
      println("yeet");
    }
  }
  void detect() {
  
  }

  //geleidelijk sterker maken van de vijanden
}
