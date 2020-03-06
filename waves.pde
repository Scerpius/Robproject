class Waves {

  void checkWaves() {
    if (kills == CurrentNumEnemies*2) {
      kills = 0;
      CurrentNumEnemies +=1;
      println("number of enemies = " + CurrentNumEnemies);
      for (int i = 0; i < CurrentNumEnemies; i++) {
 
        println( " Number of enemies that spawned: " + CurrentNumEnemies);
        walkers[i].spawn();
        walkers[i].moveEnemy = 3 + 1/2 * currentWaves;
        shooters[i].moveEnemy = 3 + 1/2 * currentWaves;
        walkers[i].enemyHealth = 3 + 1/2 * currentWaves;
        shooters[i].enemyHealth = 3 + 1/2 * currentWaves;
        shooters[i].spawn();
      }
      currentWaves++;
    }
  }
}
