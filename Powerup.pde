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
    int fuelChance = int(random(0,10));

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
       texture = loadImage("dmg.png");
      }
      if (whatPowerup == 5) { 
        texture = loadImage("dubbelDamage.png");
      }
      
    
    
       
    


      x = bob.powerupX; 
      y = bob.powerupY;
      //println(bob.powerupX);
      //println(bob.powerupY);
    }
    if (fuelChance == 4) {
      texture = loadImage("Fuel.png");
      whatPowerup = 6;

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
      //println(player.hp + " :D" );
    } 
    if (whatPowerup == 1) {
      player.AS += 1;
      //println(player.AS + " :D" );
    } 
    if (whatPowerup == 2) {
      player.shield = true;
      //println(player.shield + " :D" );
      if (millis() >= time + 30000) {
       player.shield = false;
        time = millis();
      }


      
    } 
    if (whatPowerup == 3) {
     //player.ms += 0.25;
     //println(player.ms + " :D" );
    } 

    if (whatPowerup == 4) {
      player.dmg += 1;
     // println(player.dmg + " :D" );
    } 
    if (whatPowerup == 5) {
      player.dubbelDamage = true;
      if (millis() >= time + 30000) {
        player.dubbelDamage = false;
        time = millis();
      }

      //println(player.dubbelDamage + " :D" );
    }
      if (whatPowerup == 6) {
      if (player.MaxFuel <= 2) {
        player.fuel++;
      } else { 
        player.fuel = 3;
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
