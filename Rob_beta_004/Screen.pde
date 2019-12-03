class Start {
  PImage texture;
  int xBox1 = 350;
  int xBox2 = 650;
  int xBox3 = 660;
  int yBox1 = 350;

  int widthBox1 = 300;
  int widthBox2 = 200;
  int heightBox1 = 300;
  int heightBox2 = 10;

  int ellipseX = 762;
  int ellipseY = 380;
  int ellipseWidth = 50;
  
  int buttonX = 750;
  int buttonY = 395;
  
  int titelX = 300;
  int titelY = 100;
  
  int sideHitBox = 750;
  int shooterX = 750;
  int shooterY = 555;
  int walkerX = 750;
  int walkerY = 455;
  
  int shooterBelowHitBox = 475;
  int shooterTopHitBox = 435;
  int walkerBelowHitBox = 575;
  int walkerTopHitBox = 535;

  void start() {
    rect(xBox1, yBox1, widthBox1, heightBox1);
    rect(xBox2, yBox1, heightBox2, heightBox1);
    rect(xBox3, yBox1, widthBox2, heightBox1);
    fill(255, 0, 0);
    stroke(255, 0, 0);
    ellipse(ellipseX, ellipseY, ellipseWidth, ellipseWidth);
    fill(255);
    text("A", buttonX, buttonY);



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
