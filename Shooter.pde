public class Shooter {
  Kogel kogel;
  float sizeEnemy = 40;
  int PointWalkX = int(random(sizeEnemy/2+100, (width-100) - sizeEnemy/2));// de AI begin om te lopen x-direction
  int PointWalkY = int(random(sizeEnemy/2+100, (height-100) - sizeEnemy/2)); // de AI begin om te lopen y-direction
  final int startEnemylives = 3; //aantal levens is final zodat dit gereset kan worden
  int enemyHealth = 3; //aantal levens waarmee de shooter begint
  int Enemylives = enemyHealth;
  int dirXBullet = 0;
  int dirYBullet = 0;
  float posXEnemy;
  float posYEnemy;
  float fireRate = 120;
  float X;
  float Y;
  float distX;
  float distY;
  final float startSpeedEnemy = 1; //begin snelheid
  float speedEnemy = 0.5; //snelheids variable zodat het verhoogd kan worden wordt alleen niet meer gebruikt
  float moveEnemy = speedEnemy; //zodat zijn beweging gelijk is aan zijn snelheid
  float direction;
  boolean Xtrue = false;
  boolean Ytrue = false;
  boolean detected = false;
  boolean detectedD = false;
  boolean detectedU = false;
  boolean detectedL = false;
  boolean detectedR = false;
  boolean spawnedD = false;
  boolean spawnedU = false;
  boolean spawnedR = false;
  boolean spawnedL = false;
  boolean spawned = false;
  color purple = color(177, 5, 178);
  float distXp;
  float distYp;
  float detectEnemy = 200;
  PImage texture;
  boolean display = false;

  int stationaryPosition;

  int framecount = 0;


  int cycleDirectionEnemy = 0;
  Shooter() {
    // texture = loadImage("Shooter2.png");
  }







  void draw() {
    // image(texture, posXEnemy, posYEnemy);
    if (kogel != null) {

      kogel.shoot(); 
      kogel.show();
    }
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













  void updateX() {

      //  ellipse(PointWalkX, PointWalkY, 5, 5);
      distX = max(PointWalkX, posXEnemy) - min(PointWalkX, posXEnemy); // de afstand van het looppunt en de shooter wordt berekent
      if (posXEnemy > PointWalkX && distX > 25) { //walk to left, als de positie van de shooter meer rechts is dan het looppunt dan loopt hij naar links en hij is in een radius van 10
        stationaryPosition = 0;
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
      } else if (posXEnemy < PointWalkX && distX > 25) { //walk to right
        stationaryPosition = 1;
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
    
  









  void updateY() { 
    
      distY = max(PointWalkY, posYEnemy) - min(PointWalkY, posYEnemy);
      if (posYEnemy>PointWalkY && distY > 25) { //walk up
        stationaryPosition = 2;
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
      } else if (posYEnemy < PointWalkY && distY > 25) { //walk down
        stationaryPosition = 3;
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

    if ( Xtrue == true && Ytrue == true) { // als de enemy op zijn locatie is 
      PointWalkX = int(random(sizeEnemy/2+100, (width-100) - sizeEnemy/2) ); // maak een nieuwe locatie aan en loop daar heen
      PointWalkY = int(random(sizeEnemy/2+100, (height-181) - sizeEnemy/2) );
      Xtrue = false;
      Ytrue = false;
    }

    //to do: add width
    if (kogel != null) {
      //println("de kogel bestaat");
      if (kogel.y > height ||kogel.y < 0 || kogel.x > width || kogel.x < 0 && millis() >= time + 1000) {
        spawned = false;
        kogel = null;
      }
    }
  }







  boolean detect() {

      //dist(player.x, player.y, posXEnemy, posYEnemy);
      if (dist(player.x, player.y, posXEnemy, posYEnemy) < 200) {      
        if (stationaryPosition == 0) {         
          image(spritesLeftShooter[1], posXEnemy, posYEnemy);             
        }
        if (stationaryPosition == 1) {   
          image(spritesRightShooter[1], posXEnemy, posYEnemy);               
        }
        if (stationaryPosition == 2) {   
          image(spritesUpShooter[1], posXEnemy, posYEnemy);                
        }
        if (stationaryPosition == 3) {   
          image(spritesDownShooter[1], posXEnemy, posYEnemy);               
        }
       
        detected = true;
        return true;
      } else {
        detected = false;
        return false;
    
    }
  }









  void shoot() {

    if (frameCount% fireRate == 0) {
      // Als de kogel niet gespawnd is moet hij de speler zoeken
      //println("help");
      float dX = 0, dY = 0;
      distYp = (posYEnemy - player.y);
      distXp= (posXEnemy - player.x);
      //println(distXp, " ", distYp);
      if (detect()) { //zodra de speler gedetecteerd is moet de shooter kijken aan welke kant de speler staat zodat hij weet welke kant hij op moet schieten
        //println("ja");
        if (/*player.x > posXEnemy*/ distXp <-10) {
          dX = 3;
        } else if (/*player.x < posXEnemy*/ distXp > 10) {
          dX = -3;
        } else { 
          dX = 0;
        }
        if (distYp < -10/*player.y < posYEnemy*/) {
          dY = 3;
        } else if (/*player.y > posYEnemy*/ distYp > 10) {
          dY = -3;
        } else { 
          dY= 0;
        }//vervolgens moet hij een kogel aanmaken op de positie van de shooter en die kogel in een bepaalde richting sturen
        kogel = new Kogel(posXEnemy, posYEnemy, dX, dY);
      }//zodra dit gedaan is moet het programma zien dat er een kogel is gespawned zodat hij deze niet nog een keer probeert te laten spawnen
      spawned = true;
    }
    //float tempVX = player.vx;
    //float tempVY = player.vy;
    //if (Collision.checkPortal(player.x + tempVX, player.y + tempVY, player.w, player.h) ) {
    //}
  }
}
