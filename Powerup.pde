class Powerup {
  float x;
  float xResetValue = -1100; //the value the x of powerup must be to be spawnable
  float y;
  int width;
  int height;
  char i = 'm';
  boolean powerupSpawn = false;
  PImage texture;
  boolean pickUpPowerup = false;

  int whatPowerup = -999;





  //This is the method that will check if a powerup drop and what kind of powerup will drop it also check the location of the drop
  void spawn() {
    //Drop chance for fuel powerup and the normal powerups
    int powerupChance = int(random(0, 6));
    int fuelChance = int(random(4, 5));

    //checks if the powerup will drop it will if powerupchance = 4
    if (powerupChance == 4) {

      whatPowerup = int(random(0, 5));
      if (whatPowerup == 0) { //hp up
        texture = loadImage("Hp.png");
      }
      if (whatPowerup == 1) { //Attack speed up
        texture = loadImage("AS.png");
      }
      if (whatPowerup == 2) {//gives a shield
        texture = loadImage("shield.png");
      }
      if (whatPowerup == 3) { //damage up
        texture = loadImage("dmg.png");
      }
      if (whatPowerup == 4) { // gives dubbel damage
        texture = loadImage("dubbelDamage.png");
      }

      //spawns powerup on the location where enemy died
      x = bob.powerupX; 
      y = bob.powerupY;

    }
    if (fuelChance == 4) {
      texture = loadImage("Fuel.png"); // gives fuel powerup
      whatPowerup = 5;

      //spawns powerup on the location where enemy died
      x = bob.powerupX; 
      y = bob.powerupY;
    }

    powerupSpawn = false;
    kill = false;
  }
  //this fuction will give the player the bonus when the player picks up a powerup 
  void onPickup()
  {
    if (whatPowerup == 0) {
      player.hp += 1;
    } 
    if (whatPowerup == 1) {
      player.fireRate += 1;
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
        println(player.fuel);
      } else { 
        player.fuel = player.MaxFuel; // if the player does the number will not go up
      }
    }
  }




  Powerup() {
    x = xResetValue; //this value check if powerup is in the arena or outside of it. if its in the arena it cant be spawne
    y = -200;
    texture = loadImage("Hp.png");
  }





  void Display_Powerup() {
    image(texture, x, y);
  }
//when the powerup is picked up it will be send outside of the map again
  void reset() {
    x = xResetValue;
  }
}
