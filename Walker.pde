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
  int staticPosition;
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
  float detectEnemy = 300;
  int framecount = 0;
  boolean display = false;

  Walker() {
    //  texture = loadImage("Walker2.png");
  }





  //tekenen
  void draw() {
    //image(texture, posXEnemy, posYEnemy);
  }



  void spawn() { // de spawn van de shooter wordt hier geregeld
    i = (floor(random(0, 4))); 
    switch(i) { // hiermee wordt ervoor elke shooter opnieuw gekeken naar waar die moet spawnen
      case(0): //boven
      posXEnemy = 600;
      posYEnemy = 40;
      break;
      case(1): //rechts
      posXEnemy = 1250;
      posYEnemy = 250;
      break;
      case(2): //onder
      posXEnemy = 600;
      posYEnemy = 600;
      break;
      case(3): //links
      posXEnemy = 30;
      posYEnemy = 250;
      break;
    }
  }
  void updateSpawn() {
    X -= player.vx;
    Y -= player.vy;
  }

  void reset() { //het resetten van de shooters
    moveEnemy = 0;
    Enemylives = enemyHealth;
    posXEnemy = -9999;
  }

  //lopen
  void updateX() {

    distX = max(PointWalkX, posXEnemy) - min(PointWalkX, posXEnemy);//dit is het begin van het lopen. Hier kijkt het programma welke kant
    //het punt waar de enemy naartoe moet lopen
    if (posXEnemy > PointWalkX && distX > 200) { //als deze statement waar is zal de enemy in een rechte lijn naar links lopen
      staticPosition = 0;
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
    } else if (posXEnemy < PointWalkX && distX > 200) { //als deze statement waar is zal de enemy in een rechte lijn naar rechts lopen
      staticPosition = 1;
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
    } else { //als de enemy op de zelfde lijn staat als het punt waar hij naartoe moet lopen, moet hij verticaal gaan lopen.

      Xtrue = true;
    }
  }
  void updateY() { //dit werkt hetzelfde als de void updateX
    distY = max(PointWalkY, posYEnemy) - min(PointWalkY, posYEnemy);
    if (posYEnemy>PointWalkY && distY > 200) { //walk up
      staticPosition = 2;
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
    } else if (posYEnemy < PointWalkY && distY > 200) { //walk down
      staticPosition = 3;
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
    } else {//hier wordt gekeken of de vijand ook op de Y richting op het puntje staat
      Ytrue = true; //done
    }
  }
  void check() {//als hij zowel op de horizontale richting als de verticale richting op het puntje staat
    //moet er een nieuw punt gecreerd worden op het veld waar de vijand naartoe loopt.
    if ( Xtrue == true && Ytrue == true) {
      PointWalkX = int(random(sizeEnemy/2+100, (width-100) - sizeEnemy/2) );
      PointWalkY = int(random(sizeEnemy/2+100, (height-181) - sizeEnemy/2) );

      Xtrue = false; //vervolgens moet hij weer gaan lopen
      Ytrue = false;
    }
  }
  void detect() {//hier wordt gekeken of de speler boven, onder, links of rechts van de vijand staat
    distXp = max(player.x, posXEnemy) - min(player.x, posXEnemy);
    distYp = max(player.y, posYEnemy) - min(player.y, posYEnemy);   

    //vervolgens wordt er gekeken of de speler binnen de radius die de vijand kan detecteren is
    if (sqrt((distXp * distXp) + (distYp * distYp)) < detectEnemy) {
      detected = true;
    } else {
      detected = false;
    }
  }
  void moveToPlayer() {//wanneer  de vijand de speler detecteert, gaat hij hem volgen
    if (posYEnemy>player.y && posXEnemy > player.x) {//als de speler links boven  de vijand is, moet de vijand links naar boven gaan lopen
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
    if (posYEnemy>player.y && posXEnemy < player.x) { //als de speler rechts boven  de vijand is, moet de vijand rechts naar boven gaan lopen
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
    if (posYEnemy<player.y &&   posXEnemy > player.x) { //als de speler links onder  de vijand is, moet de vijand links naar beneden gaan lopen
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
    if (posYEnemy<player.y &&  posXEnemy < player.x) { //als de speler rechts onder  de vijand is, moet de vijand rechts naar beneden gaan lopen
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
    if (posYEnemy < player.y && posXEnemy == player.x) {
      posYEnemy ++;

      image(spritesDownWalker[cycleDirectionXEnemy1], posXEnemy, posYEnemy);
      framecount++;
      if (framecount == 9) {
        cycleDirectionXEnemy1++;
        framecount = 0;
      }
      if (cycleDirectionXEnemy1 == 3) {
        cycleDirectionXEnemy1 = 0;
      }
    }
    // Move in a straight line up //
    if (posYEnemy > player.y && posXEnemy == player.x) {
      posYEnemy --;

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
    // Move in a straight line to the left //
    if (posYEnemy == player.y && posXEnemy > player.x) {
      posXEnemy --;

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
    // Move in a straight line to the right //
    if (posYEnemy == player.y && posXEnemy < player.x) {
      posXEnemy ++;

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
  }

}
//void Stronger() {
//       if (enemiesLeft != 0) {
//        killRound = true;
//      }

//    if (enemiesLeft == 0 && killRound == true) {

//      enemiesLeft = CurrentNumEnemies*2;
//      roundCount ++;
//      killRound = false;
//    uitgevoerd = false;





//      switch (roundCount %5) {
//        case (0):
//        if (roundCount != 0) {
//          //spawn meer enemies
//          killsForRoundUp += 2;
//          CurrentNumEnemies += 1;
//          enemiesLeft = CurrentNumEnemies*2;
//          MaxEnemies = false;
//          uitgevoerd = true;
//        }
//        break;
//        case (1):
//        //beweeg sneller

//        for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {
//          walkers[iEnemy].speedEnemy *= 1.25;
//          shooters[iEnemy].speedEnemy  *= 1.25;
//        }
//        enemiesLeft = CurrentNumEnemies*2;
//        uitgevoerd = true;
//        MaxEnemies = false;

//        break;
//        case (2):
//        CurrentNumEnemies += 1 * 1.008;
//        //spawn delay lager
//        uitgevoerd = true;
//        MaxEnemies = false;
//        enemiesLeft = CurrentNumEnemies*2;

//        break;
//        //levens omhoog
//        case (3):
//        CurrentNumEnemies += 1 * 1.008;
//        enemiesLeft = CurrentNumEnemies*2;
//        enemyHealth += 2;
//        uitgevoerd = true;
//        MaxEnemies = false;

//        break;
//        case (4):
//        CurrentNumEnemies += 1 * 1.008;
//        enemiesLeft = CurrentNumEnemies*2;
//        //doet meer damage
//        uitgevoerd = true;
//        MaxEnemies = false;

//        break;
//      }
//      if (uitgevoerd == true) {
//        for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {
//          walkers[iEnemy].moveEnemy = walkers[iEnemy].speedEnemy;
//          shooters[iEnemy].moveEnemy = shooters[iEnemy].speedEnemy;
//          println("test");
//        }
//      }
//    }
//  }
//}
