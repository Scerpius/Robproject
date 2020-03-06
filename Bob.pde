class Bob {
  float powerupX;
  float powerupY;
  //  float framecount = 0;

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



  void code () {// hier is een sup "class" gemaakt zodat er maar 1 regel nodig is in de main om dit op te roepen
    for (int iEnemy = 0; iEnemy< CurrentNumEnemies; iEnemy++) {// de loop dit de enemies opnieuw laat spawnen

      shooters[iEnemy].updateSpawn();
      walkers[iEnemy].updateSpawn();
      shooters[iEnemy]. DisplayDamageTaken();
      walkers[iEnemy]. DisplayDamageTaken();
    }
    for (int iEnemy = 0; iEnemy< CurrentNumEnemies; iEnemy++) {// de loop die de enemies tekent
      walkers[iEnemy].draw();
      shooters[iEnemy].draw();
      if (MaxEnemies == false) {
        for (int x = 0; x<CurrentNumEnemies; x++) {// de loop die de enemies laat spawnen
          walkers[x].spawn();
          shooters[x].spawn();
          println("Walker: " + x + "has locationx: " + walkers[x].posXEnemy);
          println("shooter: " + x + "has locationx: " + shooters[x].posXEnemy);
          println("Walker: " + x + "has locationx: " + walkers[x].posYEnemy);
          println("shooter: " + x + "has locationx: " + shooters[x].posYEnemy);
       
          
        }
      }
      MaxEnemies = true;

      walkers[iEnemy].detect();// hier wordt de detect opgeroepen zodat de player gaat lopen is het waar
      if (walkers[iEnemy].detected == true) {

        walkers[iEnemy].moveToPlayer();
      } else {

        if (!walkers[iEnemy].Xtrue) {
          walkers[iEnemy].updateX();
        }

        if (!walkers[iEnemy].Ytrue && walkers[iEnemy].Xtrue == true) {// is de enemy al op zijn punt dan wordt hier een nieuwe opgeroepen
          walkers[iEnemy].updateX();
        }
        walkers[iEnemy].updateY();


        walkers[iEnemy].check(); //deze lijn pakt hij niet meer
        //walkers[iEnemy].Stronger();

        walkers[iEnemy].check(); 
       
      }

      shooters[iEnemy].detect();// hier wordt neer gezet wat er geroepen moet worden als hij iets detect voor de aangegeven richting 
      if (shooters[iEnemy].detected == true) {
        for (int iBullet = 0; iBullet<CurrentNumEnemies; iBullet++) {// de loop van de kogels
          //image(Kogel.texture, shooters[iEnemy].posXEnemy, shooters[iEnemy].posYEnemy) ;

          shooters[iEnemy].shoot();

          //Kogel.shoot();
        }
      } else if (shooters[iEnemy].detectedU == true) {// hier wordt neer gezet wat er geroepen moet worden als hij iets detect voor de aangegeven richting
        for (int iBullet = 0; iBullet<CurrentNumEnemies; iBullet++) {
          //image(Kogel.texture, shooters[iEnemy].posXEnemy, shooters[iEnemy].posYEnemy) ;

          shooters[iEnemy].shoot();

          //Kogel.shoot();
        }
      } else if (shooters[iEnemy].detectedR == true) {// hier wordt neer gezet wat er geroepen moet worden als hij iets detect voor de aangegeven richting
        for (int iBullet = 0; iBullet<CurrentNumEnemies; iBullet++) {
          //image(Kogel.texture, shooters[iEnemy].posXEnemy, shooters[iEnemy].posYEnemy) ;

          shooters[iEnemy].shoot();

          //Kogel.shoot();
        }
      } else if (shooters[iEnemy].detectedL == true) {// hier wordt neer gezet wat er geroepen moet worden als hij iets detect voor de aangegeven richting
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
        //shooters[iEnemy].Stronger();
      }
    }

    for (Walker anWalker : walkers) {
      for (Bullet anBullet : bullets) {
        if (overlaps(anBullet.x, anBullet.y, anBullet.texture, anWalker.posXEnemy, anWalker.posYEnemy, spritesDownWalker[1])) {
          //Explosion.play();
          powerupX = anWalker.posXEnemy;//slaat de xpositie van de enemy doet waarneer hij geraakt wordt als de enemy dood gaat wordt deze locatie gebruikt om powerup te spawnen op die locatie
          powerupY = anWalker.posYEnemy; //slaat de ypositie van de enemy doet waarneer hij geraakt wordt als de enemy dood gaat wordt deze locatie gebruikt om powerup te spawnen op die locatie
          anBullet.reset();
          anWalker.Enemylives = anWalker.Enemylives - player.dmg;
          if (anWalker.Enemylives <= 0) {// als het aantal levens van de walker nul of lager wordt, moet de score omhoog gaan en het aantal
          //enemies wat verslagen moet worden naar beneden.
            anWalker.reset();
            score = score + 1;
            kills++;
            //als enemy dood gaat wordt er gekeken naar de eerste mogelijke powerup die buiten de arena is om die powerup the spawnen met de funcite powerup.spawn();
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
        if (overlaps(anBullet.x, anBullet.y, anBullet.texture, anShooter.posXEnemy, anShooter.posYEnemy, spritesDownShooter[1])) {
          //Explosion.play();
          powerupX = anShooter.posXEnemy;//slaat de xpositie van de enemy doet waarneer hij geraakt wordt als de enemy dood gaat wordt deze locatie gebruikt om powerup te spawnen op die locatie
          powerupY = anShooter.posYEnemy; //slaat de ypositie van de enemy doet waarneer hij geraakt wordt als de enemy dood gaat wordt deze locatie gebruikt om powerup te spawnen op die locatie
          anBullet.reset();
          anShooter.Enemylives =  anShooter.Enemylives - player.dmg;
          if (anShooter.Enemylives <= 0) {
           anShooter.reset();
           score = score + 1;
           kills++;
//als enemy dood gaat wordt er gekeken naar de eerste mogelijke powerup die buiten de arena is om die powerup the spawnen met de funcite powerup.spawn();
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
      if (overlaps(sword.x, sword.y, sword.box, anWalker.posXEnemy, anWalker.posYEnemy, spritesDownWalker[1])) {
        if ( sword.isHit == true) {
          powerupX = anWalker.posXEnemy;//slaat de xpositie van de enemy doet waarneer hij geraakt wordt als de enemy dood gaat wordt deze locatie gebruikt om powerup te spawnen op die locatie
          powerupY = anWalker.posYEnemy; //slaat de ypositie van de enemy doet waarneer hij geraakt wordt als de enemy dood gaat wordt deze locatie gebruikt om powerup te spawnen op die locatie
          anWalker.reset();
          score = score + 1;
          kills++;
       
          //als enemy dood gaat wordt er gekeken naar de eerste mogelijke powerup die buiten de arena is om die powerup the spawnen met de funcite powerup.spawn();
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
      if (overlaps(sword.x, sword.y, sword.box, anShooter.posXEnemy, anShooter.posYEnemy, spritesDownShooter[1])) {
        if ( sword.isHit == true) {
          powerupX = anShooter.posXEnemy;//slaat de xpositie van de enemy doet waarneer hij geraakt wordt als de enemy dood gaat wordt deze locatie gebruikt om powerup te spawnen op die locatie
          powerupY = anShooter.posYEnemy; //slaat de ypositie van de enemy doet waarneer hij geraakt wordt als de enemy dood gaat wordt deze locatie gebruikt om powerup te spawnen op die locatie
          anShooter.reset();
          score = score + 1;
          kills++;
          for (int i = 0; i < powerups.length; i++) {
            if (powerups[i].x == powerups[i].xResetValue) {
              powerups[i].spawn();
              break;
            }
          }
        }
      }
    }


 //als de speler een powerup raakt wordt de powerup gereset en krijgt de player de juiste bonus
    for (Powerup anPowerup : powerups) {
      if (overlaps(player.x, player.y, spritesDown[1], anPowerup.x, anPowerup.y, anPowerup.texture)) {
        //Powerup.play();
        anPowerup.pickUpPowerup = true;
        anPowerup.onPickup();//roept de onpickup funcite op in de class powerup zodat de powerup de juiste bonus aan de speler geeft
        anPowerup.reset(); //roept de reset functie op in de class powerup zodat de locatie van deze powerup op xresetvalue wordt gezet
      }
    }

    for (Walker anWalker : walkers) {
      if (overlaps(player.x, player.y, spritesDown[1], anWalker.posXEnemy, anWalker.posYEnemy, spritesDownWalker[1])) {
        if (player.shield) {//als invisibility true is kan de speler niet geraak worden. als dit niet het geval is gaat er 1 leven van speler af
          player.shield = false; 
          invisibility = true;
        }
        if (player.shield == false && invisibility == false) {
         
            player.hp -= 1;         
           invisibility = true;
        }
      }
    }
  }
}
