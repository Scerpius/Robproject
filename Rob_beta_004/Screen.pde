class Start {
  PImage texture;

  void start() {
    rect(350, 250, 300, 400);
    rect(650, 250, 10, 400);
    rect(660, 250, 200, 400);
    fill(255,0,0);
    stroke(255,0,0);
    ellipse(762,335,50,50);
    fill(255);
    text("A",750 , 350);



    textSize(40);
    text("THE ENDLESS SURVIVAL OF ROB", 300, 100);


    texture = loadImage("Shooter2.png");
    image(texture, 750, 500);
    
 

    texture = loadImage("Walker2.png");
    image(texture, 750, 400);
   
  


    teleport.display();
    teleport.checkBoundaryCollision();

    for ( int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.update();
      b.show();
      if (b.x > 750 && b.y > 380 && b.y < 420) {
        b.reset();
      }
      if (b.x > 750 && b.y > 480 && b.y < 520) {
        b.reset();
      }
    }
  }
}
