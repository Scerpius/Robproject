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

    int powerupChance = int(random(0, 6));
    //println("powerupChance : " + powerupChance);
    int fuelChance = int(random(0, 10));

    if (powerupChance == 4) {

      whatPowerup = int(random(0, 5));
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
        texture = loadImage("dmg.png");
      }
      if (whatPowerup == 4) { 
        texture = loadImage("dubbelDamage.png");
      }








      x = bob.powerupX; 
      y = bob.powerupY;
      //println(bob.powerupX);
      //println(bob.powerupY);
    }
    if (fuelChance == 4) {
      texture = loadImage("Fuel.png");
      whatPowerup = 5;

      x = bob.powerupX; 
      y = bob.powerupY;
    }

    powerupSpawn = false;
    kill = false;
  }

  void onPickup()
  {
    if (whatPowerup == 0) {
      player.hp += 1;
    } 
    if (whatPowerup == 1) {
      player.AS += 1;
    } 
    if (whatPowerup == 2) {
      player.shield = true;
    }
    if (whatPowerup == 3) {
      player.dmg += 1;
    } 

    if (whatPowerup == 4) {
      player.dubbelDamage = true;
    } 
    if (whatPowerup == 5) {
      if (player.fuel < player.MaxFuel) { //checks if the player doesnt have the max fuel amount 
        player.fuel++;
      } else { 
        player.fuel = player.MaxFuel; // if the player does the number will not go up
      }
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
