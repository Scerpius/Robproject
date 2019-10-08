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
  boolean Detected = false;
  color purple = color(177, 5, 178);
  float distXp;
  float distYp;
  float detectEnemy = 200;

  //tekenen
  void draw() {
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
    ellipse(PointWalkX, PointWalkY, 5, 5);
    distX = max(PointWalkX, posXEnemy) - min(PointWalkX, posXEnemy);
    if (posXEnemy > PointWalkX && distX > 10) { //walk to left
  
      posXEnemy = posXEnemy - moveEnemy;
      ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
    } else if (posXEnemy < PointWalkX && distX > 10) { //walk to right
     
      posXEnemy = posXEnemy + moveEnemy;
      ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
    } else { //done
   
      Xtrue = true;
    }
  }
  void updateY() { //pakt hij niet?
    distY = max(PointWalkY, posYEnemy) - min(PointWalkY, posYEnemy);
    if (posYEnemy>PointWalkY && distY > 10) { //walk up
   
      posYEnemy = posYEnemy - moveEnemy;
      ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
    } else if (posYEnemy < PointWalkY && distY > 10) { //walk down
    
      posYEnemy = posYEnemy + moveEnemy;
      ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
    } else {
      Ytrue = true; //done
    
    }
  }
  void check() {
    // println("Xtrue: "+Xtrue + " Ytrue: "+Ytrue); //there you mean?
    if ( Xtrue == true && Ytrue == true) {
      PointWalkY = int(random(sizeEnemy/2, height - sizeEnemy/2));
      PointWalkX = int(random(sizeEnemy/2, width-sizeEnemy/2));
      Xtrue = false;
      Ytrue = false;
    }
  }
  void detect() {
    distXp = max(mouseX, posXEnemy) - min(mouseX, posXEnemy);
    distYp = max(mouseY, posYEnemy) - min(mouseY, posYEnemy);   


    if (sqrt((distXp * distXp) + (distYp * distYp)) < detectEnemy) {
      Detected = true;
    } else {
      Detected = false;
    }
  }
  void moveToPlayer() {
    if ((posYEnemy>mouseY && distY > 10) && (posXEnemy > mouseX && distX > 10 )) {
      posXEnemy = posXEnemy - moveEnemy; 
      posYEnemy = posYEnemy - moveEnemy;
      println("1a ");
    }
    if ((posYEnemy>mouseY && distY > 10) && (posXEnemy < mouseX && distX > 10 )) {
      posXEnemy = posXEnemy + moveEnemy; 
      posYEnemy = posYEnemy - moveEnemy;
       println("'2a ");
    } 
    if ((posYEnemy<mouseY && distY > 10) && (posXEnemy > mouseX && distX > 10 )) {
      posXEnemy = posXEnemy - moveEnemy; 
      posYEnemy = posYEnemy + moveEnemy;
       println("3a ");
    }
    if ((posYEnemy<mouseY && distY > 10) && (posXEnemy < mouseX && distX > 10 )) {
      posXEnemy = posXEnemy + moveEnemy; 
      posYEnemy = posYEnemy + moveEnemy;
       println("4a ");
    }
    //geleidelijk sterker maken van de vijanden
  }
}
