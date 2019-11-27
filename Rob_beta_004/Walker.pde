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
    String spritesDownEnemy[] = {"Enemy1.png", "Enemy2.png", "Enemy3.png", };

  String spritesLeftEnemy[] ={"Enemy4.png", "Enemy5.png", "Enemy6.png"};

  String spritesRightEnemy[] ={"Enemy7.png", "Enemy8.png", "Enemy9.png"};

  String spritesUpEnemy[] ={"Enemy10.png", "Enemy11.png", "Enemy12.png"};

  int cycleDirectionXEnemy1 = 0;
  int cycleDirectionYEnemy1 = 0;
  
  float sizeEnemy = 40;
  int PointWalkX = int(random(sizeEnemy/2+100, (width-100) - sizeEnemy/2));
  int PointWalkY = int(random(sizeEnemy/2+100, (height-100) - sizeEnemy/2));
  int Enemylives = 3;
  float posXEnemy;
  float posYEnemy;
  float distX;
  float distY;
  float speedEnemy = 1;
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
    texture = loadImage("Enemy2.png");
  }





  //tekenen
  void draw() {
    //ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
    image(texture, posXEnemy, posYEnemy);
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

  void reset() {
    spawn();
    moveEnemy = 0;
  }

  //lopen
  void updateX() {
    ellipse(PointWalkX, PointWalkY, 5, 5);
    distX = max(PointWalkX, posXEnemy) - min(PointWalkX, posXEnemy);
    if (posXEnemy > PointWalkX && distX > 10) { //walk to left

      posXEnemy = posXEnemy - moveEnemy;
      ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
      
            texture = loadImage(spritesLeftEnemy[cycleDirectionXEnemy1]);
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
      ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
      
       texture = loadImage(spritesRightEnemy[cycleDirectionXEnemy1]);
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
      ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
      
       texture = loadImage(spritesUpEnemy[cycleDirectionXEnemy1]);
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
      ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
      
       texture = loadImage(spritesDownEnemy[cycleDirectionXEnemy1]);
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
      PointWalkX = int(random(sizeEnemy/2+100, (width-100) - sizeEnemy/2));
      PointWalkY = int(random(sizeEnemy/2+100, (height-181) - sizeEnemy/2));
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
            
      texture = loadImage(spritesRightEnemy[cycleDirectionXEnemy1]);
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
            
      texture = loadImage(spritesUpEnemy[cycleDirectionXEnemy1]);
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
            
      texture = loadImage(spritesLeftEnemy[cycleDirectionXEnemy1]);
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
      
      texture = loadImage(spritesRightEnemy[cycleDirectionXEnemy1]);
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

    if (score %20 ==0 && score != 0 && killRound == true) {

      roundCount ++;
      killRound = false;
      uitgevoerd = false;
    } else if (score %10 ==9) {
      killRound = true;
    }
    if (uitgevoerd == false) {
      for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {
        walkers[iEnemy].moveEnemy = walkers[iEnemy].speedEnemy;
        shooters[iEnemy].moveEnemy = shooters[iEnemy].speedEnemy;
      }
      switch (roundCount %5) {
        case (0):
        //spawn meer enemies

        CurrentNumEnemies += 2;
        MaxEnemies = false;
        uitgevoerd = true;

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
        case (3):
        CurrentNumEnemies += 1 * 1.008;
        EnemyLives += 2;
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
