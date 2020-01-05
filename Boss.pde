//public class Boss {
//  Kogel kogel;
//  float sizeEnemy =40;
//  int PointWalkX = int(random(sizeEnemy/2+100, (width-100) - sizeEnemy/2));
//  int PointWalkY = int(random(sizeEnemy/2+100, (height-100) - sizeEnemy/2));
//  int Enemylives = 10;
//  float posXEnemy;
//  float posYEnemy;
//  float distX;
//  float distY;
//  float speedEnemy = 0.5;
//  float moveEnemy = speedEnemy; //nodig
//  float direction;
//  boolean Xtrue = false;
//  boolean Ytrue = false;
//  boolean detectedD = false;
//  boolean detectedU = false;
//  boolean detectedL = false;
//  boolean detectedR = false;
//  boolean spawnedD = false;
//  boolean spawnedU = false;
//  boolean spawnedR = false;
//  boolean spawnedL = false;
//  boolean spawned = true;
//  color purple = color(177, 5, 178);
//  float distXp;
//  float distYp;
//  float detectEnemy = 200;
//  PImage texture;


//  Boss() {
//    texture = loadImage("red_invader.png");
//  }
//  //tekenen
//  void draw() {
//    //ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
//    image(texture, posXEnemy, posYEnemy);
//    if (kogel != null) {

//      kogel.shoot();
//      kogel.show();
//    }
//  }
//  void spawn() {
//    posXEnemy = width/2;
//    posYEnemy = height/2;
//  }

//  void reset() {
//    spawn();
//    moveEnemy = 0;
//  }

//  //lopen
//  void updateX() {
//    ellipse(PointWalkX, PointWalkY, 5, 5);
//    distX = max(PointWalkX, posXEnemy) - min(PointWalkX, posXEnemy);
//    if (posXEnemy > PointWalkX && distX > 10) { //walk to left

//      posXEnemy = posXEnemy - moveEnemy;
//      ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
//    } else if (posXEnemy < PointWalkX && distX > 10) { //walk to right

//      posXEnemy = posXEnemy + moveEnemy;
//      ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
//    } else { //done

//      Xtrue = true;
//    }
//  }
//  void updateY() { //pakt hij niet?
//    distY = max(PointWalkY, posYEnemy) - min(PointWalkY, posYEnemy);
//    if (posYEnemy>PointWalkY && distY > 10) { //walk up

//      posYEnemy = posYEnemy - moveEnemy;
//      ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
//    } else if (posYEnemy < PointWalkY && distY > 10) { //walk down

//      posYEnemy = posYEnemy + moveEnemy;
//      ellipse(posXEnemy, posYEnemy, sizeEnemy, sizeEnemy);
//    } else {
//      Ytrue = true; //done
//    }
//  }
//  void check() {
//    if ( Xtrue == true && Ytrue == true) {
//      PointWalkX = int(random(sizeEnemy/2+100, (width-100) - sizeEnemy/2));
//      PointWalkY = int(random(sizeEnemy/2+100, (height-181) - sizeEnemy/2));
//      Xtrue = false;
//      Ytrue = false;
//    }
//  }
//  void detect() {
//    dist(player.x, player.y, posXEnemy, posYEnemy);
//    if (dist(player.x, player.y, posXEnemy, posYEnemy) < 200) {
//      if (posYEnemy < player.y ) {
//        detectedD = true;
//      } else if (posYEnemy > player.y) {
//        detectedU = true;
//      } 
//      if (posXEnemy < player.x) {
//        detectedR = true;
//      } else if (posXEnemy > player.x) {
//        detectedL = true;
//      }
//    }
//  }
//  void shoot() {
//    if (spawned) {
//      float dX = 0, dY = 0;
//      spawned = false;
//      detect();
//      if (detectedD)      
//        dY = 20;
//      else
//        dY = -20;

//      if (detectedR)
//        dX = 20;
//      else
//        dX = -20;

//      kogel = new Kogel(posXEnemy, posYEnemy, dX, dY);
//    }

//    if (kogel.y > height ||kogel.y < 0 || kogel.x > width || kogel.x < 0 && millis() >= time + 1000) {
//      spawned = true;
//    }
//  }
//}
