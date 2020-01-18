public class Achievement {
  int killenemies = 5;
  int stack = 2;
  int dubbleStack = 5;
  boolean addAchievement = true;
  int framecount = 0;
  int survive = 3600;
  int multiplier = 2;
  
  
  void display() {

    textSize(10);
    text("Achievements", 50,70);
    text("kill" + "50" +  "enemies", 50, 90);
    text("kill" + "75" +  "enemies", 50, 110);
    text("kill" + "100" +  "enemies", 50, 130);
    text("survive" + "60sec", 50, 150);
  }


  void update() {
    if (score == killenemies && addAchievement) {
      player.hp ++;
      addAchievement = false;
    }
    else if (score == killenemies + stack && addAchievement) {
    player.ms += multiplier * multiplier;
      addAchievement = false;
    }
    else if (score == killenemies + dubbleStack && addAchievement){
    player.hp += multiplier;
    player.AS += multiplier;
    player.ms += multiplier;
      addAchievement = false;
    }
    if (framecount == survive && addAchievement) {
      player.dmg ++;
      player.AS ++;
      addAchievement = false;
  }
}
}
