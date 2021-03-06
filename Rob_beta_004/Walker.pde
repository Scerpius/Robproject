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

  int cycleDirectionXEnemy1 = 0;
  int cycleDirectionYEnemy1 = 0;

  float sizeEnemy = 40;
  int PointWalkX = int(random(sizeEnemy/2+100, (width-100) - sizeEnemy/2));
  int PointWalkY = int(random(sizeEnemy/2+100, (height-100) - sizeEnemy/2));
  final int startEnemylives =3;
  int enemyHealth = 3;
  int Enemylives = enemyHealth;
  float posXEnemy;
  float posYEnemy;
  float X;
  float Y;
  float distX;
  float distY;
  final float startSpeedEnemy = 1;
  float speedEnemy = 0.5;
  float moveEnemy = speedEnemy; //nodig
  boolean Xtrue = false;
  boolean Ytrue = false;
  boolean detected = false;
  color purple = color(177, 5, 178);
  float distXp;
  float distYp;
  float detectEnemy = 200;
  PImage texture;
  int framecount = 0;
  boolean display = false;

  Walker() {
    texture = loadImage("Walker2.png");
  }





  //tekenen
  void draw() {
    image(texture, posXEnemy, posYEnemy);
  }
  
    void DisplayDamageTaken() {
    for ( int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      if (b.x + 27 >= posXEnemy && b.x < posXEnemy + 57 && b.y + 27 > posYEnemy && b.y < posYEnemy + 60) {
        display = true;
      }
    }
    if (display) {
      textSize(32);
      text(player.dmg, posXEnemy, posYEnemy );
    }
  }
  
  void spawn() {
    switch(positionSpawn[i]) {
      case(0): //boven
      posXEnemy = camera.bx+600;
      posYEnemy = camera.by;
      break;
      case(1): //rechts
      posXEnemy = camera.bx+1280;
      posYEnemy = camera.by+350;
      break;
      case(2): //onder
      posXEnemy = camera.bx+600;
      posYEnemy = camera.by+700;
      break;
      case(3): //links
      posXEnemy = camera.bx;
      posYEnemy = camera.by+350;
      break;
    }
  }
  void updateSpawn() {
    X -= player.vx;
    Y -= player.vy;
  }

  void reset() {
    spawn();
    //posXEnemy = -100000;
    moveEnemy = 0;
    Enemylives = enemyHealth;
  }

  //lopen
  void updateX() {

    distX = max(PointWalkX, posXEnemy) - min(PointWalkX, posXEnemy);
    if (posXEnemy > PointWalkX && distX > 10) { //walk to left

      posXEnemy = posXEnemy - moveEnemy;

      image(spritesLeftWalker[cycleDirectionXEnemy1], posXEnemy, posYEnemy);      
      framecount++;
      if (framecount == 9) {
        cycleDirectionXEnemy1++;
        framecount = 0;
      }
      if (cycleDirectionXEnemy1 == 3) {
        cycleDirectionXEnemy1 = 0;
      }
    } else if (posXEnemy < PointWalkX && distX > 10) { //walk to right

      posXEnemy = posXEnemy + moveEnemy;

      image(spritesRightWalker[cycleDirectionXEnemy1], posXEnemy, posYEnemy);
      framecount++;
      if (framecount == 9) {
        cycleDirectionXEnemy1++;
        framecount = 0;
      }
      if (cycleDirectionXEnemy1 == 3) {
        cycleDirectionXEnemy1 = 0;
      }
    } else { //done

      Xtrue = true;
    }
  }
  void updateY() { //pakt hij niet?
    distY = max(PointWalkY, posYEnemy) - min(PointWalkY, posYEnemy);
    if (posYEnemy>PointWalkY && distY > 10) { //walk up

      posYEnemy = posYEnemy - moveEnemy;

      image(spritesUpWalker[cycleDirectionXEnemy1], posXEnemy, posYEnemy);
      framecount++;
      if (framecount == 9) {
        cycleDirectionXEnemy1++;
        framecount = 0;
      }
      if (cycleDirectionXEnemy1 == 3) {
        cycleDirectionXEnemy1 = 0;
      }
    } else if (posYEnemy < PointWalkY && distY > 10) { //walk down

      posYEnemy = posYEnemy + moveEnemy; 

      image(spritesDownWalker[cycleDirectionXEnemy1], posXEnemy, posYEnemy);
      framecount++;
      if (framecount == 9) {
        cycleDirectionXEnemy1++;
        framecount = 0;
      }
      if (cycleDirectionXEnemy1 == 3) {
        cycleDirectionXEnemy1 = 0;
      }
    } else {
      Ytrue = true; //done
    }
  }
  void check() {
    if ( Xtrue == true && Ytrue == true) {
      PointWalkX = int(random(sizeEnemy/2+100, (width-100) - sizeEnemy/2) + X);
      PointWalkY = int(random(sizeEnemy/2+100, (height-181) - sizeEnemy/2) + Y);

      Xtrue = false;
      Ytrue = false;
    }
  }
  void detect() {
    distXp = max(player.x, posXEnemy) - min(player.x, posXEnemy);
    distYp = max(player.y, posYEnemy) - min(player.y, posYEnemy);   


    if (sqrt((distXp * distXp) + (distYp * distYp)) < detectEnemy) {
      detected = true;
    } else {
      detected = false;
    }
  }
  void moveToPlayer() {
    if (posYEnemy>player.y && posXEnemy > player.x) {
      posXEnemy = posXEnemy - moveEnemy; 
      posYEnemy = posYEnemy - moveEnemy;

      image(spritesRightWalker[cycleDirectionXEnemy1], posXEnemy, posYEnemy);
      framecount++;
      if (framecount == 9) {
        cycleDirectionXEnemy1++;
        framecount = 0;
      }
      if (cycleDirectionXEnemy1 == 3) {
        cycleDirectionXEnemy1 = 0;
      }
    }
    if (posYEnemy>player.y && posXEnemy < player.x) {
      posXEnemy = posXEnemy + moveEnemy; 
      posYEnemy = posYEnemy - moveEnemy;

      image(spritesUpWalker[cycleDirectionXEnemy1], posXEnemy, posYEnemy);
      framecount++;
      if (framecount == 9) {
        cycleDirectionXEnemy1++;
        framecount = 0;
      }
      if (cycleDirectionXEnemy1 == 3) {
        cycleDirectionXEnemy1 = 0;
      }
    } 
    if (posYEnemy<player.y &&   posXEnemy > player.x) {
      posXEnemy = posXEnemy - moveEnemy; 
      posYEnemy = posYEnemy + moveEnemy;

      image(spritesLeftWalker[cycleDirectionXEnemy1], posXEnemy, posYEnemy);
      framecount++;
      if (framecount == 9) {
        cycleDirectionXEnemy1++;
        framecount = 0;
      }
      if (cycleDirectionXEnemy1 == 3) {
        cycleDirectionXEnemy1 = 0;
      }
    }
    if (posYEnemy<player.y &&  posXEnemy < player.x) {
      posXEnemy = posXEnemy + moveEnemy; 
      posYEnemy = posYEnemy + moveEnemy;

      image(spritesRightWalker[cycleDirectionXEnemy1], posXEnemy, posYEnemy);
      framecount++;
      if (framecount == 9) {
        cycleDirectionXEnemy1++;
        framecount = 0;
      }
      if (cycleDirectionXEnemy1 == 3) {
        cycleDirectionXEnemy1 = 0;
      }
    }
    //geleidelijk sterker maken van de vijanden
  }
  void Stronger() {

    if (enemiesLeft == 0 && killRound == true) {

      enemiesLeft = CurrentNumEnemies*2;
      roundCount ++;
      killRound = false;
      uitgevoerd = false;
    }
    if (enemiesLeft != 0) {
      killRound = true;
    }
    if (uitgevoerd == false) {
      for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {
        walkers[iEnemy].moveEnemy = walkers[iEnemy].speedEnemy;
        shooters[iEnemy].moveEnemy = shooters[iEnemy].speedEnemy;
      }

      switch (roundCount %5) {
        case (0):
        if (roundCount != 0) {
          //spawn meer enemies
          killsForRoundUp += 2;
          CurrentNumEnemies += 1;
          enemiesLeft = CurrentNumEnemies*2;
          MaxEnemies = false;
          uitgevoerd = true;
        }
        break;
        case (1):
        //beweeg sneller

        for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {
          walkers[iEnemy].speedEnemy *= 1.25;
          shooters[iEnemy].speedEnemy  *= 1.25;
        }
        enemiesLeft = CurrentNumEnemies*2;
        uitgevoerd = true;
        MaxEnemies = false;

        break;
        case (2):
        CurrentNumEnemies += 1 * 1.008;
        //spawn delay lager
        uitgevoerd = true;
        MaxEnemies = false;
        enemiesLeft = CurrentNumEnemies*2;

        break;
        //levens omhoog
        case (3):
        CurrentNumEnemies += 1 * 1.008;
        enemiesLeft = CurrentNumEnemies*2;
        enemyHealth += 2;
        uitgevoerd = true;
        MaxEnemies = false;

        break;
        case (4):
        CurrentNumEnemies += 1 * 1.008;
        enemiesLeft = CurrentNumEnemies*2;
        //doet meer damage
        uitgevoerd = true;
        MaxEnemies = false;

        break;
      }
    }
  }
}
