// class waar de shooter enemy wordt aangemaakt
public class Shooter {
  Kogel kogel;
  float sizeEnemy = 40; // groote
  int PointWalkX = int(random(sizeEnemy/2+100, (width-100) - sizeEnemy/2)); // de AI begin om te lopen x-direction
  int PointWalkY = int(random(sizeEnemy/2+100, (height-100) - sizeEnemy/2)); // de AI begin om te lopen y-direction
  final int startEnemylives = 3; //aantal levens is final zodat dit gereset kan worden
  int enemyHealth = 3; //aantal levens waarmee de shooter begint
  int Enemylives = enemyHealth; 
  float posXEnemy;
  float posYEnemy;
  float X;
  float Y;
  float distX;
  float distY;
  final float startSpeedEnemy = 1; //begin snelheid
  float speedEnemy = 0.5; //snelheids variable zodat het verhoogd kan worden wordt alleen niet meer gebruikt
  float moveEnemy = speedEnemy; //zodat zijn beweging gelijk is aan zijn snelheid
  float direction;
  boolean Xtrue = false; //om te kijken of er overlap is met de loop AI en de shooter 
  boolean Ytrue = false; //om te kijken of er overlap is met de loop AI en de shooter 
  boolean detectedD = false; // richting waar de naar schiet als die daar detectie heeft
  boolean detectedU = false; // richting waar de naar schiet als die daar detectie heeft
  boolean detectedL = false; // richting waar de naar schiet als die daar detectie heeft
  boolean detectedR = false; // richting waar de naar schiet als die daar detectie heeft
  boolean spawnedD = false;
  boolean spawnedU = false;
  boolean spawnedR = false;
  boolean spawnedL = false;
  boolean detected = true;
  color purple = color(177, 5, 178); //kleur die gebruikt wordt
  float detectEnemy = 200; // detectie radius
  PImage texture; // zodat er een plaatje gebruikt kan worden


  int framecount = 0;
  String spritesDownEnemy[] = {"Shooter1.png", "Shooter2.png", "Shooter3.png", };

  String spritesLeftEnemy[] ={"Shooter4.png", "Shooter5.png", "Shooter6.png"};

  String spritesRightEnemy[] ={"Shooter7.png", "Shooter8.png", "Shooter9.png"};

  String spritesUpEnemy[] ={"Shooter10.png", "Shooter11.png", "Shooter12.png"};

  int cycleDirectionEnemy = 0;
  Shooter() {
    texture = loadImage("Shooter2.png");
  }
  //tekenen van de shooter en de kogel wordt hier ook in aangemaakt
  void draw() {
    image(texture, posXEnemy, posYEnemy);
    if (kogel != null) {

      kogel.shoot();
      kogel.show();
    }
  }
  void spawn() { // de spawn van de shooter wordt hier geregeld
    switch(positionSpawn[i]) { // hiermee wordt ervoor elke shooter opnieuw gekeken naar waar die moet spawnen
      case(0): //boven
      posXEnemy = backGroundLevel.width/2 + X; // 
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
  void reset() { //het resetten van de shooters
    spawn();
    moveEnemy = 0;
    Enemylives = enemyHealth;
  }

  //lopen
  void updateX() {
    ellipse(PointWalkX, PointWalkY, 5, 5); // tekenen van de AI

    distX = max(PointWalkX, posXEnemy) - min(PointWalkX, posXEnemy); // de afstand van het looppunt en de shooter wordt berekent
    if (posXEnemy > PointWalkX && distX > 10) { //walk to left, als de positie van de shooter meer rechts is dan het looppunt dan loopt hij naar links en hij is in een radius van 10

      posXEnemy = posXEnemy - moveEnemy;
      image(spritesLeftShooter[cycleDirectionEnemy], posXEnemy, posYEnemy);
      framecount++;
      if (framecount == 9) {
        cycleDirectionEnemy++;
        framecount = 0;
      }
      if (cycleDirectionEnemy == 3) {
        cycleDirectionEnemy = 0;
      }
    } else if (posXEnemy < PointWalkX && distX > 10) { //walk to right, als de positie van de shooter meer links is dan het looppunt dan loopt hij naar rechts en hij is in een radius van 10

      posXEnemy = posXEnemy + moveEnemy;
      image(spritesRightShooter[cycleDirectionEnemy], posXEnemy, posYEnemy);
      framecount++;
      if (framecount == 9) {
        cycleDirectionEnemy++;
        framecount = 0;
      }
      if (cycleDirectionEnemy == 3) {
        cycleDirectionEnemy = 0;
      }
    } else { //done

      Xtrue = true;
    }
  }
  void updateY() { //
    distY = max(PointWalkY, posYEnemy) - min(PointWalkY, posYEnemy);
    if (posYEnemy>PointWalkY && distY > 10) { //walk up, als de positie van de shooter meer onder is dan het looppunt dan loopt hij naar boven en hij is in een radius van 10

      posYEnemy = posYEnemy - moveEnemy;
      image(spritesUpShooter[cycleDirectionEnemy], posXEnemy, posYEnemy);
      framecount++;
      if (framecount == 9) {
        cycleDirectionEnemy++;
        framecount = 0;
      }
      if (cycleDirectionEnemy == 3) {
        cycleDirectionEnemy = 0;
      }
    } else if (posYEnemy < PointWalkY && distY > 10) { //walk down, als de positie van de shooter meer boven is dan het looppunt dan loopt hij naar onder en hij is in een radius van 10

      posYEnemy = posYEnemy + moveEnemy;

      image(spritesDownShooter[cycleDirectionEnemy], posXEnemy, posYEnemy);
      framecount++;
      if (framecount == 9) {
        cycleDirectionEnemy++;
        framecount = 0;
      }
      if (cycleDirectionEnemy == 3) {
        cycleDirectionEnemy = 0;
      }
    } else {
      Ytrue = true; //done
    }
  }
  void check() { //hier wordt bepaald over de shooter op het looppunt staat is dit zo dan komt er een nieuw punt 

    if ( Xtrue == true && Ytrue == true) {
      PointWalkX = int(random(sizeEnemy/2+100, (width-100) - sizeEnemy/2) + X);
      PointWalkY = int(random(sizeEnemy/2+100, (height-181) - sizeEnemy/2) + Y);
      Xtrue = false;
      Ytrue = false;
    }
  }
  void detect() { //hier wordt er gedetecteerd waar de player is ten opzichten van de shooter 
    dist(player.x, player.y, posXEnemy, posYEnemy);
    if (dist(player.x, player.y, posXEnemy, posYEnemy) < 200) { // is de player in een radius van 200 met de shooter
      if (posYEnemy < player.y ) { // is de player onder de shooter
        detectedD = true;
      } else if (posYEnemy > player.y) { // is de player boven de shooter
        detectedU = true;
      } 
      if (posXEnemy < player.x) { // is de player rechts van de shooter
        detectedR = true;
      } else if (posXEnemy > player.x) {// is de player links van de shooter
        detectedL = true;
      }
    }
  }
  void shoot() { // het schieten van de shooter wordt hier aan gemaakt met behulp van de kogel class
    if (detected) {
      float dX = 0, dY = 0; // deze waardes gaan over de kogel van de shooter waar die moet staan
      detected = false;
      detect();
      if (detectedD)      
        dY = 3;
      else
        dY = -3;

      if (detectedR)
        dX = 3;
      else
        dX = -3;

      kogel = new Kogel(posXEnemy, posYEnemy, dX, dY);
    }

    if (detectedD) { // als de player onder de shooter is moet het volgende gebeuren
      kogel.fireD = true; // het naar beneden gaan van de kogel wordt waar
      detectedU = false; // je kan niet meer boven de shooter gedetecteerd worden
      kogel.fireU = false; // de kogel naar boven wordt dan ook uitgezet

      detectedD = false; // het detecteren van de speler stopt zodat hij niet blijft schieten
      if (!spawnedD) {     

        spawnedD = true;
      }
    }

    if (detectedU) {// als de player boven van de shooter is moet het volgende gebeuren

      kogel.fireU = true;// het naar boven gaan van de kogel wordt waar
      detectedD = false;// je kan niet meer beneden de shooter gedetecteerd worden
      kogel.fireD = false; // de kogel naar beneden wordt dan ook uitgezet

      detectedU = false;// het detecteren van de speler stopt zodat hij niet blijft schieten
      if (!spawnedU) {     

        spawnedU = true;
      }
    }

    if (detectedR) {//als de player rechts van de shooter is moet het volgende gebeuren

      kogel.fireR = true;// het naar rechts gaan van de kogel wordt waar
      detectedR = false;// het detecteren van de speler stopt zodat hij niet blijft schieten
      if (!spawnedR) {     

        spawnedR = true;
      }
    }

    if (detectedL) {//als de player links van de shooter is moet het volgende gebeuren

      kogel.fireL = true;// het naar links gaan van de kogel wordt waar
      detectedL = false;// het detecteren van de speler stopt zodat hij niet blijft schieten
      if (!spawnedL) {     

        spawnedL = true;
      }
    }
    if (kogel.y > height ||kogel.y < 0 || kogel.x > width || kogel.x < 0 && millis() >= time + 1000) {// is de kogel buiten het scherm wordt alles op false gezet zodat het "gereset" wordt
      spawnedD = false; 
      spawnedU = false; 
      spawnedR = false; 
      spawnedL = false;
      detected = true;
    }
  }
  //2.45
  //void Stronger() {

  //  if (score %10 ==0 && score != 0 && killRound == true) {

  //    roundCount ++;
  //    killRound = false;
  //    uitgevoerd = false;
  //  } else if (score %10 ==9) {
  //    killRound = true;
  //  }
  //  if (uitgevoerd == false) {
  //    for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {
  //      walkers[iEnemy].moveEnemy = walkers[iEnemy].speedEnemy;
  //      shooters[iEnemy].moveEnemy = shooters[iEnemy].speedEnemy;
  //    }
  //    switch (roundCount %5) {
  //      case (0):
  //      //spawn meer enemies

  //      CurrentNumEnemies *= 1.008;
  //      MaxEnemies = false;
  //      uitgevoerd = true;

  //      break;
  //      case (1):
  //      //beweeg sneller
  //      CurrentNumEnemies *= 1.008;
  //      for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {
  //        walkers[iEnemy].speedEnemy *= 1.25;
  //        shooters[iEnemy].speedEnemy  *= 1.25;
  //      }
  //      uitgevoerd = true;
  //      MaxEnemies = false;

  //      break;
  //      case (2):
  //      CurrentNumEnemies += 1 * 1.008;
  //      //spawn delay lager
  //      uitgevoerd = true;
  //      MaxEnemies = false;

  //      break;
  //      case (3):
  //      CurrentNumEnemies += 1 * 1.008;
  //      Enemylives += 2;
  //      uitgevoerd = true;
  //      MaxEnemies = false;

  //      break;
  //      case (4):
  //      CurrentNumEnemies += 1 * 1.008;
  //      //doet meer damage
  //      uitgevoerd = true;
  //      MaxEnemies = false;

  //      break;
  //    }
  //  }
  //}
}
