class Powerup {
  int x;
  int y;
  int width;
  int height;
  char i = 'm';
  boolean powerupSpawn = false;
  PImage texture;




  void spawn() {
    if (kill) {
      int powerupChance = int(random(0, 10));

      if (powerupChance == 4) {
        int what_Powerup = int(random(0, 6));
        if (what_Powerup == 0) { 
          texture = loadImage("Hp.png");
          // HP + 1
        }
        if (what_Powerup == 1) { 
          texture = loadImage("AS.png");
          // attack speed up
        }
        if (what_Powerup == 2) { 
          texture = loadImage("Speed.png");
          // movement speed up
        }
        if (what_Powerup == 3) { 
          texture = loadImage("shiel.png");
          //player gets a shield
        }
        if (what_Powerup == 4) { 
          texture = loadImage("player0.png");
          // player gets dubbel damage
        }
        if (what_Powerup == 5) { 
          texture = loadImage("green_invader.png");
          //damage up ????????????!?!?!?!?!?!?!?!?!??!!?!?
        }



        powerups[powerupcount].x = int(random(0, 1280));
        powerups[powerupcount].y = int(random(0, 720));
        powerupcount++;

        if (powerupcount == 9) { 
          powerupcount = 0;
        }
      }
    }
    powerupSpawn = false;
    kill = false;
  }




  Powerup() {
    x = -200;
    y = -200;
    texture = loadImage("Hp.png");
  }





  void Display_Powerup() {
    image(texture, x, y);
  }

  void reset() {
    x = -1100;
  }
}
