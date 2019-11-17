class Bob {


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
      } 
       else if (shooters[iEnemy].detectedU == true) {
        for (int iBullet = 0; iBullet<CurrentNumEnemies; iBullet++) {
          //image(Kogel.texture, shooters[iEnemy].posXEnemy, shooters[iEnemy].posYEnemy) ;

          shooters[iEnemy].shoot();

          //Kogel.shoot();
        }
      }
       else if (shooters[iEnemy].detectedR == true) {
        for (int iBullet = 0; iBullet<CurrentNumEnemies; iBullet++) {
          //image(Kogel.texture, shooters[iEnemy].posXEnemy, shooters[iEnemy].posYEnemy) ;

          shooters[iEnemy].shoot();

          //Kogel.shoot();
        }
      }
       else if (shooters[iEnemy].detectedL == true) {
        for (int iBullet = 0; iBullet<CurrentNumEnemies; iBullet++) {
         

          shooters[iEnemy].shoot();

        }
      }
      else {

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
      if (overlaps(bullet.x, bullet.y, bullet.texture, anWalker.posXEnemy, anWalker.posYEnemy, anWalker.texture)) {
        bullet.reset();
        anWalker.reset();
        score = score + 1;
      }
    }

    for (Shooter anShooter : shooters) {
      if (overlaps(bullet.x, bullet.y, bullet.texture, anShooter.posXEnemy, anShooter.posYEnemy, anShooter.texture)) {
        bullet.reset();
        anShooter.reset();
        score = score + 1;
      }
    }

    for (Walker anWalker : walkers) {
      if (overlaps(player.x, player.y, player.player, anWalker.posXEnemy, anWalker.posYEnemy, anWalker.texture)) {
        if (invisibility == false) {
          player.hp = player.hp - 1;
        }
        invisibility = true;
        if (invisibility) {  
          if (millis() >= time + 1000) {
            invisibility = false;
          }
        }
      }
    }
  }
}
