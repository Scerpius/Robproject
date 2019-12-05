class Start {
  PImage texture;

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
  
  int buttonX = 805;
  int buttonY = 440;
  
  int buttonX2 = 805;
  int buttonY2 = 540;
  

  
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
   
    fill(255);
    rect(xLeftWall, yTopWall, wallWidth, sizeWall);
    rect(xLeftWall, yTopWall, sizeWall , wallHeight);
    rect(xLeftWall,yBottomWall,wallWidth,sizeWall);
    rect(xRightWall, yTopWall ,sizeWall, wallHeight);
   

    fill(255, 0, 0);
    stroke(255, 0, 0);
    ellipse(ellipseX, ellipseY, ellipseWidth, ellipseWidth);
    fill(0,255,0);
        stroke(0, 255, 0);
    ellipse(ellipseX2, ellipseY2, ellipseWidth, ellipseWidth);
    fill(255);
    text("A", buttonX, buttonY);
    text("Z", buttonX2, buttonY2);



    textSize(40);
   


    texture = loadImage("Shooter2.png");
    image(texture, shooterX, shooterY);



    texture = loadImage("Walker2.png");
    image(texture, walkerX, walkerY);




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
  int x;
  int y;
  int width;
  int height;
  PImage hp;
  PImage shield;


  void draw() {
    //rect(0,0,1280,100);
    hp = loadImage("HpHUD.png");
    //shield = loadImage("shieldHUD.png");
    for (int i = 0; i < player.hp; i++) {
      image(hp, player.x + 215 + (35*i), player.y - 190 );
    }


    
  }
}
