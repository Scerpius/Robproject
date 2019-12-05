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


  Walker() {
    texture = loadImage("Walker2.png");
  }





  //tekenen
  void draw() {
    image(texture, posXEnemy, posYEnemy);
  }
  void spawn() {
    switch(positionSpawn[i]) {
      case(0): //boven
      posXEnemy = backGroundLevel.width/2 + X;
      posYEnemy = backGroundLevel.height-690 + Y;
      break;
      case(1): //rechts
      posXEnemy = backGroundLevel.width-15 + X;
      posYEnemy = backGroundLevel.height-470 + Y;
      break;
      case(2): //onder
      posXEnemy = backGroundLevel.width/2 + X;
      posYEnemy = backGroundLevel.height-texture.height + Y;
      break;
      case(3): //links
      posXEnemy = backGroundLevel.width-1265 + X;
      posYEnemy = backGroundLevel.height-470 + Y;
      break;
    }
  }
  void updateSpawn() {
    X -= player.vx;
    Y -= player.vy;
  }

  void reset() {
    spawn();
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
    // println("Xtrue: "+Xtrue + " Ytrue: "+Ytrue); //there you mean?
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
    println(score + " " + killsForRoundUp + " " + score % killsForRoundUp + roundCount);
    if (score % killsForRoundUp  ==0 && score != 0 && killRound == true) {

      roundCount ++;
      killRound = false;
      uitgevoerd = false;
    } else if (score % killsForRoundUp == killsForRoundUp - 1) {
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
          uitgevoerd = true;
          MaxEnemies = false;

          break;
          case (2):
          CurrentNumEnemies += 1 * 1.008;
          //spawn delay lager
          uitgevoerd = true;
          MaxEnemies = false;

          break;
          //levens omhoog
          case (3):
          CurrentNumEnemies += 1 * 1.008;
          enemyHealth += 2;
          uitgevoerd = true;
          MaxEnemies = false;

          break;
          case (4):
          CurrentNumEnemies += 1 * 1.008;
          //doet meer damage
          uitgevoerd = true;
          MaxEnemies = false;

          break;
        }
      }
    }
  }
