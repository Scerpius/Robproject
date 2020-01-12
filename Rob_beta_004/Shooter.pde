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

  int framecount = 0;
  String spritesDownEnemy[] = {"Shooter1.png", "Shooter2.png", "Shooter3.png", };

  String spritesLeftEnemy[] ={"Shooter4.png", "Shooter5.png", "Shooter6.png"};

  String spritesRightEnemy[] ={"Shooter7.png", "Shooter8.png", "Shooter9.png"};

  String spritesUpEnemy[] ={"Shooter10.png", "Shooter11.png", "Shooter12.png"};

  int cycleDirectionEnemy = 0;
  Shooter() {
    texture = loadImage("Shooter2.png");
  }







  void draw() {
    image(texture, posXEnemy, posYEnemy);
    if (kogel != null) {

      kogel.shoot(); 
      kogel.show();
    }
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
    moveEnemy = 0;
    Enemylives = enemyHealth;
  }













  void updateX() {
    ellipse(PointWalkX, PointWalkY, 5, 5);
    distX = max(PointWalkX, posXEnemy) - min(PointWalkX, posXEnemy);
    if (posXEnemy > PointWalkX && distX > 10) { //walk to left

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
    } else if (posXEnemy < PointWalkX && distX > 10) { //walk to right

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
    if (posYEnemy>PointWalkY && distY > 10) { //walk up

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
    } else if (posYEnemy < PointWalkY && distY > 10) { //walk down

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








  void check() {

    if ( Xtrue == true && Ytrue == true) {
      PointWalkX = int(random(sizeEnemy/2+100, (width-100) - sizeEnemy/2) + X);
      PointWalkY = int(random(sizeEnemy/2+100, (height-181) - sizeEnemy/2) + Y);
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

      detected = true;
      return true;
    } else {
      detected = false;
      return false;
    }
  }









  void shoot() {

    if (!spawned) {
      //println("help");
      float dX = 0, dY = 0;
      distYp = (posYEnemy - player.y);
      distXp= (posXEnemy - player.x);
      //println(distXp, " ", distYp);
      if (detect()) {
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
        }
        kogel = new Kogel(posXEnemy, posYEnemy, dX, dY);
      }
      spawned = true;
    }
    //float tempVX = player.vx;
    //float tempVY = player.vy;
    //if (Collision.checkPortal(player.x + tempVX, player.y + tempVY, player.w, player.h) ) {
    //}
  }
}
