class Powerup {
  float x;
  float xResetValue = -1100;
  float y;
  int width;
  int height;
  char i = 'm';
  boolean powerupSpawn = false;
  PImage texture;
  boolean pickUpPowerup = false;

  int whatPowerup = -999;






  void spawn() {

    int powerupChance = int(random(4, 5));
    //println("powerupChance : " + powerupChance);

    if (powerupChance == 4) {

      whatPowerup = int(random(3, 4));
      if (whatPowerup == 0) { 
        texture = loadImage("Hp.png");
      }
      if (whatPowerup == 1) { 
        texture = loadImage("AS.png");
      }
      if (whatPowerup == 2) { 
        texture = loadImage("shield.png");
      }
      if (whatPowerup == 3) { 
        texture = loadImage("Speed.png");
      }
      if (whatPowerup == 4) { 
        texture = loadImage("dmg.png");
      }
      if (whatPowerup == 5) { 
        texture = loadImage("dubbelDamage.png");
      }



      x = bob.powerupX; 
      y = bob.powerupY;
      //println(bob.powerupX);
      //println(bob.powerupY);
      powerupcount++;

      if (powerupcount == 9) { 
        powerupcount = 0;
      }
    }

    powerupSpawn = false;
    kill = false;
  }

  void onPickup()
  {
    if (whatPowerup == 0) {
      player.hp += 1;
      println(player.hp + " :D" );
    } 
    if (whatPowerup == 1) {
      player.AS += 1;
      println(player.AS + " :D" );
    } 
    if (whatPowerup == 2) {
      player.shield = true;
      println(player.shield + " :D" );
      if (millis() >= time + 30000) {
       player.shield = false;
        time = millis();
      }


      
    } 
    if (whatPowerup == 3) {
      player.movementSpeed += 1;
      println(player.movementSpeed + " :D" );
    } 

    if (whatPowerup == 4) {
      player.dmg += 1;
      println(player.dmg + " :D" );
    } 
    if (whatPowerup == 5) {
      player.dubbelDamage = true;
      if (millis() >= time + 30000) {
        player.dubbelDamage = false;
        time = millis();
      }

      println(player.dubbelDamage + " :D" );
    }
  }




  Powerup() {
    x = xResetValue;
    y = -200;
    texture = loadImage("Hp.png");
  }





  void Display_Powerup() {
    image(texture, x, y);
  }

  void reset() {
    x = xResetValue;
  }
}
