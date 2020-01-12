class Camera {
  //float x, y;
  float bx, by;
  float zoom = 1.75;

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
      text(score, 150, 50);

      stats.draw();
      waves.checkWaves();

      if (player.shield) {
        framecount++;
        if (framecount >= 600) {
          player.shield = false;
          framecount = 0;
        }
      }

      if (player.dubbelDamage) {
        framecount++;
        if (framecount >= 600) {
          framecount = 0;
          player.dubbelDamage = false;
        }
      }
    }
  }


  void update() {
    float tempVX = player.vx;
    float tempVY = player.vy;
    spaceship.spaceShipX -= player.vx;
    spaceship.spaceShipY -= player.vy;
    for ( int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.x -= player.vx;
      b.y -= player.vy;
    }


    /*
    Checkt of de player collision heeft met een object, als hij dat niet heeft beweegt de camera. Als dat wel het geval is beweegt hij niet.
     Wanneer de camera bewogen wordt, dan beweegt alles behalve de player.
     */
    if (collision.checkPortal(player.x + tempVX, player.y + tempVY, player.w, player.h) == true) {
      bx -= player.vx;
      by -= player.vy;


      for (int i = 0; i < shooters.length; i++) {
        shooters[i].posXEnemy -= player.vx;
        shooters[i].posYEnemy -= player.vy;
        shooters[i].PointWalkX -= player.vx;
        shooters[i].PointWalkY -= player.vy;
        shooters[i].X -= player.vx;
        shooters[i].Y -= player.vy;
      }
      for (int i = 0; i < walkers.length; i++) {
        walkers[i].posXEnemy -= player.vx;
        walkers[i].posYEnemy -= player.vy;
        walkers[i].PointWalkX -= player.vx;
        walkers[i].PointWalkY -= player.vy;
        walkers[i].X -= player.vx;
        walkers[i].Y -= player.vy;
      }
      for (int i = 0; i < powerups.length; i++) {
        powerups[i].x -= player.vx;
        powerups[i].y -= player.vy;
      }
      for (int i = 0; i < objectList.length; i++) {
        objectList[i].x -= player.vx;
        objectList[i].y -= player.vy;
      }
    } else { 
      if (collision.checkCollision(player.x + tempVX, player.y, player.w, player.h) == false) {
        bx -= player.vx;

        for (int i = 0; i < shooters.length; i++) {
          shooters[i].posXEnemy -= player.vx;
          shooters[i].PointWalkX -= player.vx;
        }
        for (int i = 0; i < walkers.length; i++) {
          walkers[i].posXEnemy -= player.vx;
          walkers[i].PointWalkX -= player.vx;
        }
        for (int i = 0; i < powerups.length; i++) {
          powerups[i].x -= player.vx;
          powerups[i].xResetValue -= player.vx;
        }
        for (int i = 0; i < objectList.length; i++) {
          objectList[i].x -= player.vx;
        }
      }
      if (collision.checkCollision(player.x, player.y + tempVY, player.w, player.h) == false) {
        by -= player.vy;

        for (int i = 0; i < shooters.length; i++) {
          shooters[i].posYEnemy -= player.vy;
          shooters[i].PointWalkY -= player.vy;
        }
        for (int i = 0; i < walkers.length; i++) {
          walkers[i].posYEnemy -= player.vy;
          walkers[i].PointWalkY -= player.vy;
        }
        for (int i = 0; i < powerups.length; i++) {
          powerups[i].y -= player.vy;
        }
        for (int i = 0; i < objectList.length; i++) {
          objectList[i].y -= player.vy;
        }
      }
    }
  }
}
