public class Shooter {
  Kogel kogel;
  float sizeEnemy =40;
  int PointWalkX = int(random(sizeEnemy/2+100, (width-100) - sizeEnemy/2));
  int PointWalkY = int(random(sizeEnemy/2+100, (height-100) - sizeEnemy/2));
  final int startEnemylives = 3;
  int Enemylives = 3;
  float posXEnemy;
  float posYEnemy;
  float distX;
  float distY;
  final float startSpeedEnemy = 1;
  float speedEnemy = 1;
  float moveEnemy = speedEnemy; //nodig
  float direction;
  boolean Xtrue = false;
  boolean Ytrue = false;
  boolean detectedD = false;
  boolean detectedU = false;
  boolean detectedL = false;
  boolean detectedR = false;
  boolean spawnedD = false;
  boolean spawnedU = false;
  boolean spawnedR = false;
  boolean spawnedL = false;
  boolean spawned = true;
  color purple = color(177, 5, 178);
  float distXp;
  float distYp;
  float detectEnemy = 200;
  PImage texture;


  Shooter() {
    texture = loadImage("red_invader.png");
  }
  //tekenen
  void draw() {
    //ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
    image(texture, posXEnemy, posYEnemy);
    if (kogel != null) {

      kogel.shoot();
      kogel.show();
    }
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
      PointWalkX = int(random(sizeEnemy/2+100, (width-100) - sizeEnemy/2));
      PointWalkY = int(random(sizeEnemy/2+100, (height-181) - sizeEnemy/2));
      Xtrue = false;
      Ytrue = false;
    }
  }
  void detect() {
    dist(player.x, player.y, posXEnemy, posYEnemy);
    if (dist(player.x, player.y, posXEnemy, posYEnemy) < 200) {
      if (posYEnemy < player.y ) {
        detectedD = true;
      } else if (posYEnemy > player.y) {
        detectedU = true;
      } 
      if (posXEnemy < player.x) {
        detectedR = true;
      } else if (posXEnemy > player.x) {
        detectedL = true;
      }
    }
  }
  void shoot() {
    if (spawned) {
      float dX = 0, dY = 0;
      spawned = false;
      detect();
      if (detectedD)      
        dY = 10;
      else
        dY = -10;

      if (detectedR)
        dX = 10;
      else
        dX = -10;

      kogel = new Kogel(posXEnemy, posYEnemy, dX, dY);
    }

    if (detectedD) {
      kogel.fireD = true;
      detectedU = false;
      kogel.fireU = false;

      detectedD = false;
      if (!spawnedD) {     

        spawnedD = true;
      }
    }

    if (detectedU) {

      kogel.fireU = true;
      detectedD = false;
      kogel.fireD = false;

      detectedU = false;
      if (!spawnedU) {     

        spawnedU = true;
      }
    }

    if (detectedR) {

      kogel.fireR = true;
      detectedR = false;
      if (!spawnedR) {     

        spawnedR = true;
      }
    }

    if (detectedL) {

      kogel.fireL = true;
      detectedL = false;
      if (!spawnedL) {     

        spawnedL = true;
      }
    }
    if (kogel.y > height ||kogel.y < 0 || kogel.x > width || kogel.x < 0 && millis() >= time + 1000) {
      spawnedD = false; 
      spawnedU = false; 
      spawnedR = false; 
      spawnedL = false;
      spawned = true;
    }
  }
  //2.45
  void Stronger() {

    if (score %10 ==0 && score != 0 && killRound == true) {

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

        CurrentNumEnemies *= 1.008;
        MaxEnemies = false;
        uitgevoerd = true;

        break;
        case (1):
        //beweeg sneller
        CurrentNumEnemies *= 1.008;
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
