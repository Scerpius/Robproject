class Camera {
  float bx, by;
  
  int framecount = 0;
  int framecountdmg = 0;
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
    if (start == false) {
      image(StartScreen, bx, by);
      startscreen.start();
    }
    if (start) {
      image(backGroundLevel, bx, by);
fill(255);
      textSize(50);

      for (int i = 0; i < objectList.length; i++) {
        objectList[i].display();
      }

bob.code();

     
      cooldowntimer++;
      cooldowntimer = constrain (cooldowntimer, 0, 300);
      teleport.display();
      teleport.checkBoundaryCollision();
      spaceship.display();
      spaceship.collision();
      achievement.display();
      achievement.update();

      // newSpawn.display();
      for (int i = 0; i < powerups.length; i++) {
        powerups[i].Display_Powerup();
      }
      text = "score :";
      text(score, 50, 50);

      stats.draw();
  
      waves.checkWaves();
      timer.ChecksTimers();


    }
  }    
}
