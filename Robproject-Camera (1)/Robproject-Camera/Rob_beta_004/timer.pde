class Timer {

  int dbCounter = 0;
  int instaKillCounter = 0;
  int shieldCounter = 0;
  int invisCounter = 0;
  int bulletInvisCounter = 0;
  int damageDisplayCounter = 0;

  void ChecksTimers() {

    if (player.shield) {
      shieldCounter++;
      if (shieldCounter >= 600) {
        player.shield = false;
        shieldCounter = 0;
      }
    }

    if (player.dubbelDamage) {
      dbCounter++;
      if (dbCounter >= 600) {
        dbCounter = 0;
        player.dubbelDamage = false;
      }
    }


    if (player.instakill) {
      instaKillCounter++;
      if (instaKillCounter >= 300) {
        instaKillCounter = 0;
        player.instakill = false;
      }
    }
    for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) { 
      if (shooters[iEnemy].display) {
        damageDisplayCounter++;
        if (damageDisplayCounter >= 30) {
          damageDisplayCounter = 0;
          shooters[iEnemy].display = false;
        }
      }
    }
    
        for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) { 
      if (walkers[iEnemy].display) {
        damageDisplayCounter++;
        if (damageDisplayCounter >= 30) {
          damageDisplayCounter = 0;
          walkers[iEnemy].display = false;
        }
      }
    }


    if (invisibility) { //if player has been hit it will do a count for 30 frames and then make it able that the player gets hit again
      invisCounter++;
      if (invisCounter == 30) {
        invisibility = false;
        invisCounter = 0;
      }
    }
    if (bulletInvisibility) { //if player has been hit it will do a count for 30 frames and then make it able that the player gets hit again
      bulletInvisCounter++;
      if (bulletInvisCounter == 60) {
        bulletInvisibility = false;
        bulletInvisCounter = 0;
      }
    }
  }
}
