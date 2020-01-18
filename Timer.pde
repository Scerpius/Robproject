class Timer {

  int dbCounter = 0; //dubbeldamage counter
  int instaKillCounter = 0; //instakill counter
  int shieldCounter = 0;// shieldcounter
  int invisCounter = 0; //invisibility counter
  int bulletInvisCounter = 0; // bulletinvisibility counter
  int damageDisplayCounter = 0; //damage display counter

  void ChecksTimers() {
    //als shield waar is start de timer en als de 10 seconden over zijn wordt het shild automatisch uitgezet
    if (player.shield) {
      shieldCounter++;
      if (shieldCounter >= 600) {
        player.shield = false;
        shieldCounter = 0;
      }
    }
    //als dubbel damage waar is start de timer en als de 10 seconden over zijn wordt het dubbel damage automatisch uitgezet
    if (player.dubbelDamage) {
      dbCounter++;
      if (dbCounter >= 600) {
        dbCounter = 0;
        player.dubbelDamage = false;
      }
    }


      //als speler enemy raakt start de timer en voor de volgende 30 frames zal de speler een damage nummer zien boven de enemy    for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) { 
      if (shooters[iEnemy].display) {
        damageDisplayCounter++;
        if (damageDisplayCounter >= 30) {
          damageDisplayCounter = 0;
          shooters[iEnemy].display = false;
        }
      }
    }
    //als speler enemy raakt start de timer en voor de volgende 30 frames zal de speler een damage nummer zien boven de enemy
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
