class Bob {
  float powerupX;
  float powerupY;

  boolean overlaps(float x0, float y0, PImage texture0, float x1, float y1, PImage texture1) {  
    int w0 = texture0.width, 
      h0 = texture0.height, 
      w1 = texture1.width, 
      h1 = texture1.height;

    if (x0 > x1   + w1 || x0 + w0 < x1 || 
      y0 > y1 + h1 || y0 + h0 < y1)
      return false;
    else
      return true;
  }

  void code () {
    for (int iEnemy = 0; iEnemy< CurrentNumEnemies; iEnemy++) {
      walkers[iEnemy].draw();
      shooters[iEnemy].draw();
      if (MaxEnemies == false) {
        for (i = 0; i<CurrentNumEnemies; i++) {
          walkers[i].spawn();
          shooters[i].spawn();
        }
      }
      MaxEnemies = true;

      walkers[iEnemy].detect();
      if (walkers[iEnemy].detected == true) {

        walkers[iEnemy].moveToPlayer();
      } else {

        if (!walkers[iEnemy].Xtrue) {
          walkers[iEnemy].updateX();
        }

        if (!walkers[iEnemy].Ytrue && walkers[iEnemy].Xtrue == true) {
          walkers[iEnemy].updateX();
        }
        walkers[iEnemy].updateY();


        walkers[iEnemy].check(); //deze lijn pakt hij niet meer
        walkers[iEnemy].Stronger();
      }

      shooters[iEnemy].detect();
      if (shooters[iEnemy].detectedD == true) {
        for (int iBullet = 0; iBullet<CurrentNumEnemies; iBullet++) {
          //image(Kogel.texture, shooters[iEnemy].posXEnemy, shooters[iEnemy].posYEnemy) ;

          shooters[iEnemy].shoot();

          //Kogel.shoot();
        }
      } else if (shooters[iEnemy].detectedU == true) {
        for (int iBullet = 0; iBullet<CurrentNumEnemies; iBullet++) {
          //image(Kogel.texture, shooters[iEnemy].posXEnemy, shooters[iEnemy].posYEnemy) ;

          shooters[iEnemy].shoot();

          //Kogel.shoot();
        }
      } else if (shooters[iEnemy].detectedR == true) {
        for (int iBullet = 0; iBullet<CurrentNumEnemies; iBullet++) {
          //image(Kogel.texture, shooters[iEnemy].posXEnemy, shooters[iEnemy].posYEnemy) ;

          shooters[iEnemy].shoot();

          //Kogel.shoot();
        }
      } else if (shooters[iEnemy].detectedL == true) {
        for (int iBullet = 0; iBullet<CurrentNumEnemies; iBullet++) {


          shooters[iEnemy].shoot();
        }
      } else {

        if (!shooters[iEnemy].Xtrue) {
          shooters[iEnemy].updateX();
        }

        if (!shooters[iEnemy].Ytrue && shooters[iEnemy].Xtrue == true) {
          shooters[iEnemy].updateX();
        }
        shooters[iEnemy].updateY();


        shooters[iEnemy].check();
        shooters[iEnemy].Stronger();
      }
    }

    for (Walker anWalker : walkers) {
      for (Bullet anBullet : bullets) {
        if (overlaps(anBullet.x, anBullet.y, anBullet.texture, anWalker.posXEnemy, anWalker.posYEnemy, anWalker.texture)) {
          powerupX = anWalker.posXEnemy;
          powerupY = anWalker.posYEnemy;
          anBullet.reset();
          anWalker.Enemylives = anWalker.Enemylives - 1;
          if (anWalker.Enemylives <= 0) {
            anWalker.reset();
            score = score + 1;
            for (int i = 0; i < powerups.length; i++) {
              if (powerups[i].x == powerups[i].xResetValue) {
                powerups[i].spawn();
                break;
              }
            }
          }
        }
      }
    }

    for (Shooter anShooter : shooters) {
      for (Bullet anBullet : bullets) {
        if (overlaps(anBullet.x, anBullet.y, anBullet.texture, anShooter.posXEnemy, anShooter.posYEnemy, anShooter.texture)) {
          powerupX = anShooter.posXEnemy;
          powerupY = anShooter.posYEnemy;

          anBullet.reset();
          anShooter.Enemylives =  anShooter.Enemylives -1;
          if (anShooter.Enemylives <= 0) {
            anShooter.reset();
            score = score + 1;

            for (int i = 0; i < powerups.length; i++) {
              if (powerups[i].x == powerups[i].xResetValue) {
                powerups[i].spawn();
                break;
              }
            }
          }
        }
      }
    }
    for (Walker anWalker : walkers) {
      if (overlaps(sword.x, sword.y, sword.box, anWalker.posXEnemy, anWalker.posYEnemy, anWalker.texture)) {
        if ( sword.isHit == true) {
          powerupX = anWalker.posXEnemy;
          powerupY = anWalker.posYEnemy;
          anWalker.reset();
          score = score + 1;
          for (int i = 0; i < powerups.length; i++) {
            if (powerups[i].x == powerups[i].xResetValue) {
              powerups[i].spawn();
              break;
            }
          }
        }
      }
    }



    for (Shooter anShooter : shooters) {
      if (overlaps(sword.x, sword.y, sword.box, anShooter.posXEnemy, anShooter.posYEnemy, anShooter.texture)) {
        if ( sword.isHit == true) {
          powerupX = anShooter.posXEnemy;
          powerupY = anShooter.posYEnemy;


          anShooter.reset();
          score = score + 1;
          for (int i = 0; i < powerups.length; i++) {
            if (powerups[i].x == powerups[i].xResetValue) {
              powerups[i].spawn();
              break;
            }
          }
        }
      }
    }



    for (Powerup anPowerup : powerups) {
      if (overlaps(player.x, player.y, player.playerSprite, anPowerup.x, anPowerup.y, anPowerup.texture)) {
        anPowerup.pickUpPowerup = true;
        anPowerup.onPickup();
        anPowerup.reset();
      }
    }

    for (Walker anWalker : walkers) {
      if (overlaps(player.x, player.y, player.playerSprite, anWalker.posXEnemy, anWalker.posYEnemy, anWalker.texture)) {
        if (invisibility == false) {
          player.hp = player.hp - 1;
        }
        invisibility = true;
        if (invisibility) {  
          if (millis() >= time + 1000) {
            invisibility = false;
          }
          time = millis();
        }
      }
    }
  }
}
