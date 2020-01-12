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





  //This is the method that will check if a powerup drop and what kind of powerup will drop it also check the location of the drop
  void spawn() {
    //Drop chance for fuel powerup and the normal powerups
    int powerupChance = int(random(0, 6));
    int fuelChance = int(random(4, 5));
    
    //checks if the powerup will drop
    if (powerupChance == 4) {
      //check what kind of powerup will drop for you
      whatPowerup = int(random(0, 6));
      if (whatPowerup == 0) { //hp up
        texture = loadImage("Hp.png");
      }
      if (whatPowerup == 1) { //attack speed up
        texture = loadImage("AS.png");
      }
      if (whatPowerup == 2) { //gives shield
        texture = loadImage("shield.png");
      }
      if (whatPowerup == 3) { //gives bonus speed
        texture = loadImage("Speed.png");
      }
      if (whatPowerup == 4) { //dmg up
        texture = loadImage("dmg.png");
      }
      if (whatPowerup == 5) { //gives dubbel dmg
        texture = loadImage("dubbelDamage.png");
      }


      //spawns the powerup on the location where the enemy died
      x = bob.powerupX; 
      y = bob.powerupY;
    }

    if (fuelChance == 4) {
      texture = loadImage("Fuel.png");
      whatPowerup = 6;

      x = bob.powerupX; 
      y = bob.powerupY;
    }
    
    //powerupSpawn = false;
    //kill = false;
  }



//this fuction will give the player the bonus when the player picks up a powerup 
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
      player.instakill = true;

    } 

    if (whatPowerup == 4) {
      player.dmg += 1;
      
    } 
    if (whatPowerup == 5) {
      player.dubbelDamage = true;
     
    }
    if (whatPowerup == 6) {
      if (player.fuel < player.maxFuel) { //checks if the player doesnt have the max fuel amount
        player.fuel++;
      } else { 
        player.fuel = player.maxFuel; // if the player does the number will not go up
      }
    }
  }




  Powerup() {
    x = xResetValue; //this is a location outside of the map that is used to see if the powerup is spawnable or if it should pick the next one
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
