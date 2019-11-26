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
  
  float dmg = 3;
  float AS = 5;
  boolean shield = false;
  boolean dubbelDamage = false;




  void spawn() {

    int powerupChance = int(random(0, 10));
    println("powerupChance : " + powerupChance);

    if (powerupChance == 4) {

      whatPowerup = int(random(0, 6));
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
        texture = loadImage("boots.png");
      }
      if (whatPowerup == 5) { 
        texture = loadImage("Portal.png");
      }



      x = bob.powerupX; 
      y = bob.powerupY;
      println(bob.powerupX);
      println(bob.powerupY);
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
      AS += 1;
      println(AS + " :D" );
    } 
    if (whatPowerup == 2) {
       shield = true;
      println(shield + " :D" );
    } 
    if (whatPowerup == 3) {
     // player.movementSpeed += 1;
     // println(player.movementSpeed + " :D" );
    } 
    if (whatPowerup == 4) {
      dmg += 1;
      println(dmg + " :D" );
    } 
    if (whatPowerup == 5) {
      dubbelDamage = true;
      println(dubbelDamage + " :D" );
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
