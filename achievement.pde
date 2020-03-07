public class Achievement {
  int killenemies = 50;
  int stack = 100;
  int dubbleStack = 200;
  boolean addAchievement = true; // dit is er zodat de achievements maar 1 maal gehaald kunnen worden
  boolean addAchievement2 = true;
  boolean addAchievement3 = true;
  boolean addAchievement4 = true;
  int framecount = 0;
  int survive = 3600;
  int multiplier = 2;
  boolean Achieved1 = false;
  boolean Achieved2 = false;
  boolean Achieved3 = false;
  boolean Achieved4 = false;

  boolean addachievementTimer = true;
  boolean addachievementTimer2 = true;
  boolean addachievementTimer3= true;


  void display() { // het showen van de achievements

    //textSize(10);
    //text("Achievements", 50, 70);
    //text("kill" + "50" +  "enemies", 50, 90);
    //text("kill" + "75" +  "enemies", 50, 110);
    //text("kill" + "100" +  "enemies", 50, 130);
    //text("survive" + "60sec", 50, 150);
  }


  void update() {
    //kill" + "50" +  "enemies
    if (score == killenemies && addAchievement) { // als de score gelijk is aan hoeveelheid enemies die je moet killen 
      player.hp ++; 
      addAchievement = false; // de boolean gaat op false hiermee kan de achievement maar 1x gehaald worden
      Achieved1 = true;
      println(Achieved1);
    }

    
    if (timer.achievementTimer) {
      textSize(32);
      text("achievement unlocked", width/2 - 165, height/2 - 200);
    } 
    if (currentWaves == 2 && addachievementTimer) {
      timer.achievementTimer = true;
      player.dmg ++;
      player.AS +=5;
      player.hp ++;
      addachievementTimer = false;
    }
    if (currentWaves == 5 && addachievementTimer2) {
      timer.achievementTimer = true;

      player.dmg ++;
      player.AS ++;
      player.hp +=2;
      addachievementTimer2 = false;
    }
    if (currentWaves == 8 && addachievementTimer3) {
      timer.achievementTimer = true;

      player.dmg +=2;
      player.AS ++;
      player.hp ++;
      addachievementTimer3 = false;
    }


    //kill" + "75" +  "enemies

    if (score == killenemies + stack && addAchievement2) {
      // player.ms +=  multiplier;

      Achieved2 = true;
      println(Achieved2);
      addAchievement2 = false;
    }

    //kill" + "100" +  "enemies
    if (score == killenemies + dubbleStack && addAchievement3) {
      player.hp += multiplier;
      player.AS += multiplier;
      //  player.ms += multiplier;

      Achieved3 = true;
      println(Achieved3);
      addAchievement3 = false;
    }

    //survive" + "60sec
    if (framecount == survive && addAchievement4) { // als het aantal frames gelijk staat aan de hoeveelheid vereiste tijd
      player.dmg ++;
      player.AS ++;

      Achieved4 = true;
      println(Achieved4);
      addAchievement4 = false;
    }
  }
}
