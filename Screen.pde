class Start {
  PImage texture;
  PImage texture2;

  int xLeftWall = 385;
  int yTopWall = 330;
  int xRightWall = 895;
  int yBottomWall = 660;
  int sizeWall = 10;
  int wallHeight = 340;
  int wallWidth = 510;


  int ellipseX = 817;
  int ellipseY = 525;
  int ellipseWidth = 50;
  int ellipseX2 = 817;
  int ellipseY2 = 425;
final int BULLET_START_POSITION = 440;
  int buttonX = 855;
  int buttonY = 440;
  int bulletX = 865;
  int bulletY = 420;

  float buttonX2 = 805;
  float buttonY2 = 540;

  int walkerXstart = buttonX - 515;
  int walkerYstart = buttonY;


  int sideHitBox = 705;
  int shooterX = 705;
  int shooterY = 505;
  int walkerX = 705;
  int walkerY = 405;

  int shooterBelowHitBox = 440;
  int shooterTopHitBox = 390;
  int walkerBelowHitBox = 540;
  int walkerTopHitBox = 480;





  void start() {

    //  fill(255);
    //  rect(xLeftWall, yTopWall, wallWidth, sizeWall);
    //  rect(xLeftWall, yTopWall, sizeWall, wallHeight);
    //  rect(xLeftWall, yBottomWall, wallWidth, sizeWall);
    //  rect(xRightWall, yTopWall, sizeWall, wallHeight);


    //  fill(255, 0, 0);
    //  stroke(255, 0, 0);
    //  ellipse(shooterX, shooterY + 50, ellipseWidth, ellipseWidth);
    //  fill(255);
    //  text("A", shooterX - 5 , shooterY + 55);
    //  texture = loadImage("bullet.png");
    //  image(texture , buttonX2 + 15, buttonY2);
    image(bullet, bulletX, bulletY);
  //  println(bulletY - bullet.height, height);
    if (bulletY - bullet.height < height) {
      bulletY += 5;
    } else {
      bulletY = BULLET_START_POSITION;
    }


    //  textSize(40);


texture2 = loadImage("Walker2.png");
  texture = loadImage("Shooter2.png");
    image(texture, buttonX, buttonY - 35);


    image(texture2, walkerXstart, walkerYstart -35);




    teleport.display();
    teleport.checkBoundaryCollision();

    for ( int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.update();
      b.show();
      if (b.x > sideHitBox && b.y > shooterTopHitBox && b.y < shooterBelowHitBox) {
        b.reset();
      }
      if (b.x > sideHitBox && b.y > walkerTopHitBox && b.y < walkerBelowHitBox) {
        b.reset();
      }
    }
  }
}

class Stats {
int barsize = 400;

 

  void draw() {

    //shield = loadImage("shieldHUD.png");
    for (int i = 0; i < player.hp; i++) {
      image(hp, width- 210 + (35*i), 10 );
    }
    textSize(10);
    image(AS, width-105, 150 );
    image(dmg, width-90, 110 );
    text("= " + player.dmg, width - 55, 140);
    text("= " + player.AS, width - 55, 180);



    text("= " +   player.fireRate, 365, 110);
    rect(width/2 - barsize/2 , 25, barsize, 25);
    for (int i = 0; i < player.fuel; i++) {


      float howMuchTooFill = 400 /  player.MaxFuel;

      fill(255, 0, 0);
      rect(width/2 - barsize/2, 25, howMuchTooFill + (howMuchTooFill * i), 25);
    }
  
    }
}
