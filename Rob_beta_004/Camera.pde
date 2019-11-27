class Camera {
  //float x, y;
  //float vx, vy;



  void updateScreen() {
    player.move();
    player.display();

    for ( int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.update();
      b.show();
    }
  }
  void updateBackground() {
    background(0);
    if (start == false) {
      startscreen.start();
    }


    if (start) {
      background(0);
      image(backGroundLevel, 0, 0);
      fill(255);
      textSize(50);
      text = "score :";
      text(score, 150, 50);

      for (int i = 0; i < objectList.length; i++) {
        objectList[i].display();
      }

      bob.code();

      teleport.display();
      teleport.checkBoundaryCollision();

      // newSpawn.display();
      for (int i = 0; i < powerups.length; i++) {
        powerups[i].Display_Powerup();
      }
    }
  }
}
