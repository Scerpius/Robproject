
class MYSQL {
  int framecount = 0;
  int circleAmount = 20;
  float timer = 0;
  float xlocations = player.x;
  float ylocations = player.y;

  float[] posx = new float[circleAmount];
  float[] posy = new float[circleAmount];
  float[] times = new float[circleAmount];

  int playerid;
  int i = 0;

  void DatabaseOpdrachtRemco() {


    framecount++;
    timer++;
    //println(framecount);



    if (i >= circleAmount) {
      if (framecount > 60) {

        posx[i] = xlocations;
        posy[i] = ylocations;
        times[i] = timer;
        println(posx[i]);
        println(posy[i]);
        i++;
        circleAmount++;
        framecount  = 0;
      }
    }
  }


  void database() {
    dbcoen.connect();  
    for (int i = 0; i <  circleAmount; i++) {
      dbcoen.execute("INSERT INTO playerstrat VALUES (" + playerid + ", " + posx[i] + ", " + posy[i]+ ", " + times[i] +"," + score + ");");
    }
  }
}
