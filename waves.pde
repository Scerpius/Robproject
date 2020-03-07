class Waves {

  void checkWaves() {
 
    if (kills == CurrentNumEnemies*2) {
      kills = 0;
      CurrentNumEnemies +=1;
      println("number of enemies = " + CurrentNumEnemies);
      for (int i = 0; i < CurrentNumEnemies; i++) {
 
   
        walkers[i].spawn();
        walkers[i].moveEnemy = 0.5 * currentWaves;
        shooters[i].moveEnemy = 0.5 * currentWaves;
        walkers[i].enemyHealth = 3 + 1;
        shooters[i].enemyHealth = 3 + 1;
        shooters[i].spawn();
      }
      currentWaves++;
    }
  }
}
