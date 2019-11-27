class Camera {
  //float x, y;
  float bx, by;
  float zoom = 1.75;



  void updateScreen() {
    player.update();
    player.show();

    for ( int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.update();
      b.show();
    }
    sword.update();
  }
  void updateBackground() {
    background(0);
    if (start == false) {
      startscreen.start();
    }


    if (start) {
      scale(zoom);
      background(0);
      image(backGroundLevel, bx, by);
      fill(255);
      textSize(50);
  
      player.x = width/4;
      player.y = height/4;

      for (int i = 0; i < objectList.length; i++) {
        objectList[i].display();
      }

      bob.code();
      update();

      teleport.display();
      teleport.checkBoundaryCollision();

      // newSpawn.display();
      for (int i = 0; i < powerups.length; i++) {
        powerups[i].Display_Powerup();
      }
          text = "score :";
      text(score, 150, 50);
    }
  }
  
  
  void update(){
  bx -= player.vx;
  by -= player.vy;
    
    for(int i = 0; i < shooters.length; i++){
    shooters[i].posXEnemy -= player.vx;
    shooters[i].posYEnemy -= player.vy;
  }
  for(int i = 0; i < walkers.length; i++){
    walkers[i].posXEnemy -= player.vx;
    walkers[i].posYEnemy -= player.vy;
  }
    for(int i = 0; i < powerups.length; i++){
    powerups[i].x -= player.vx;
    powerups[i].y -= player.vy;
  }
  for(int i = 0; i < objectList.length; i++){
    objectList[i].x -= player.vx;
    objectList[i].y -= player.vy;
  }
  teleport.portalX1 -= player.vx;
  teleport.portalX2 -= player.vx;
  teleport.portalY1 -= player.vy;
  teleport.portalY2 -= player.vy;
  }
}
