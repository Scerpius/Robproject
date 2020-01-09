class Waves {

  void checkWaves() {
    if (kills == CurrentNumEnemies*2) {
      newWaves = true;
      kills = 0;
    }
    if (newWaves) {
      CurrentNumEnemies +=1;
      for (i = 0; i<CurrentNumEnemies; i++) {
        walkers[i].spawn();
        shooters[i].spawn();
      }
      currentWaves++;
      println(CurrentNumEnemies);
      newWaves = false;
    }
  }
}
