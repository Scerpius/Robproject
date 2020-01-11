class Lol{
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
    //boss[iEnemy].detect();
    //if (boss[iEnemy].detectedD == true) {
    //  for (int iBullet = 0; iBullet<CurrentNumEnemies; iBullet++) {
    //    //image(Kogel.texture, shooters[iEnemy].posXEnemy, shooters[iEnemy].posYEnemy) ;

    //    boss[iEnemy].shoot();

    //    //Kogel.shoot();
    //  }
    //} else if (boss[iEnemy].detectedU == true) {
    //  for (int iBullet = 0; iBullet<CurrentNumEnemies; iBullet++) {
    //    //image(Kogel.texture, shooters[iEnemy].posXEnemy, shooters[iEnemy].posYEnemy) ;

    //    boss[iEnemy].shoot();

    //    //Kogel.shoot();
    //  }
    //} else if (boss[iEnemy].detectedR == true) {
    //  for (int iBullet = 0; iBullet<CurrentNumEnemies; iBullet++) {
    //    //image(Kogel.texture, shooters[iEnemy].posXEnemy, shooters[iEnemy].posYEnemy) ;

    //    boss[iEnemy].shoot();

    //    //Kogel.shoot();
    //  }
    //} else if (boss[iEnemy].detectedL == true) {
    //  for (int iBullet = 0; iBullet<CurrentNumEnemies; iBullet++) {


    //    boss[iEnemy].shoot();
    //  }
    //} else {

    //  if (!boss[iEnemy].Xtrue) {
    //    boss[iEnemy].updateX();
    //  }

    //  if (!boss[iEnemy].Ytrue && boss[iEnemy].Xtrue == true) {
    //    boss[iEnemy].updateX();
    //  }
    //  boss[iEnemy].updateY();


    //  boss[iEnemy].check();
      
    //}

    //for (Boss anBoss : boss) {
    //  for (Bullet anBullet : bullets) {
    //    if (overlaps(anBullet.x, anBullet.y, anBullet.texture, anBoss.posXEnemy, anBoss.posYEnemy, anBoss.texture)) {
    //      powerupX = anBoss.posXEnemy;
    //      powerupY = anBoss.posYEnemy;

    //      anBullet.reset();
    //      anBoss.Enemylives =  anBoss.Enemylives -1;
    //      if (anBoss.Enemylives == 0) {
    //        anBoss.reset();
    //        score = score + 10;
    //      }
    //    }
    //  }
    //}
  }
}
