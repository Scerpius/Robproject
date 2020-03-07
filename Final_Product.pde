/* 
 op het moment kan de speler lopen maar kan hij ook over het gat in het midden heen lopen.
 Daarnaast blijft de speler doorlopen wanneer je op geen van de knoppen drukt.
 Ik heb de animatie even verwijderd om zo beter de code van de movement te kunnen zien.
 Op de regels 165 en 224 heb ik extra comments gezet met toelichting over wat ik gevonden heb.
 Zou het misschien kunnen liggen aan iets in regel 535 t/m 611?
 */
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

//MySQL sql;
//String database = "oege.ie.hva.nl"; 
//String databaseName = "zsluiscm"; 
//String username = "sluiscm"; 
//String password = "n9YFaVSpqMeAAB"; 
MySQL dbcoen;
String dbHostID = "oege.ie.hva.nl";    // ip address, domain or hostname such as localhost
String dbUsername = "veenkec1";
String dbUserPass = "64B61p/oat7B68";
String dbSchema = "zveenkec1";

// This is a data model class to reflect the content of the Score entity from the database.
class RecordScore {

  public String name;
  public int score;

  public RecordScore(String name, int score) {
    this.name = name;
    this.score = score;
  }
}
ArrayList<RecordScore> dbScores;
int positionYSpacing = 36;  


char[] letters = new char[4];   // 4 letters
String result = "";
final int stateNormal     = 0;
final int stateInput      = 1;
final int stateAfterInput = 2;
int states=stateNormal; 

int id;
int Player_id;



//Time startTime;
//int ms = 0;
//int s = 0;
//int min = 0;

Player player;
Bob bob;
HitDetection hitDetection;
Achievement achievement;
Camera camera;
ArrayList <Bullet> bullets = new ArrayList<Bullet>();
Sword sword;
Stats stats;
Timer timer;
Waves waves;
spaceShip spaceship;
ScoreList highscores = new ScoreList();
Score hiScore;

//SpawnPoint newSpawn;
Walker walker;
Object object;
Collision collision;
Teleporter teleport;
Start startscreen;


boolean [] keys = new boolean[1024];
boolean fired;
boolean achievementTimer = false;
int playerIndex = 0;
int score;
int cooldowntimer = 300;
String text;

PImage backGroundLevel;
PImage StartScreen;
PImage victoryScreen;
PImage CheckMark;

Object[] objectList = new Object[6];

static final int NumberOfEnemies = 200;
int state = 2;
int CurrentNumEnemies =  3; //nodig
int killsForRoundUp = 6;
int iEnemy;
static int i;
int roundCount = 0;
int time = millis();
int stateTextSize= 60;
int enemiesLeft = CurrentNumEnemies *2;
int currentWaves = 1;
float kills = 0;
boolean start = false; 
boolean startmap2 = false;
boolean invisibility = false;
boolean bulletInvisibility = false;
boolean kill = false;
boolean uitgevoerd = false;
boolean killRound = false;
boolean up = false, down = false, left = false, right = false;
boolean detect = true;
boolean MaxEnemies = false;

boolean newWaves = true;


int powerupcount = 1;



final int CRATER_X = 540;
final int CRATER_Y = 170;
final int BARREL_X = 900;
final int BARREL_Y = 235;
int PLANK_X;
int PLANK_Y;
int spaceShipX = 550;
int spaceShipY = 240;
int portalX1 = 70;
int portalY1 = 150;
int portalX2 = 1100;
int portalY2 = 470;
int detectionX1 = 122;
int detectionY1 = 200;
int detectionX2 = 1152;
int detectionY2 = 520;


static int[] positionSpawn = new int [NumberOfEnemies];
int[] colour = new int [NumberOfEnemies];
Shooter [] shooters = new Shooter[NumberOfEnemies];
Walker[] walkers = new Walker[NumberOfEnemies];


Powerup[] powerups= new Powerup[10];




import processing.sound.*;
SoundFile file;
SoundFile Soundtrack;
SoundFile laserSound;
SoundFile Swordhit;
SoundFile WalkSound;
SoundFile Explosion;
SoundFile SwordAttack;
SoundFile Powerup;
void setup() {
  // sql = new MySQL(this, database, databaseName, username, password);
  size(1280, 720);
  noStroke();
  smooth(4);
  dbcoen = new MySQL(this, dbHostID, dbSchema, dbUsername, dbUserPass);
  dbcoen.connect();
  // dbcoen.query("SELECT * FROM  Highscore ORDER BY score DESC");
  dbcoen.query("SELECT * FROM  Player ORDER BY id DESC");
  if (dbcoen.next()) {
    int id = dbcoen.getInt("id");
    Player_id = id + 1;
    println(Player_id);
    println(id);
  }
  dbcoen.close();
  dbScores = new ArrayList<RecordScore>();
  GetScores();

  //   databaseJarmo = new MySQL(this, dbHostID, dbSchema, dbUsername, dbUserPass);
  //databaseJarmo.connect();
  //databaseJarmo.execute("INSERT INTO Player (name) VALUES ('qqqqq')"); 
  //databaseJarmo.query("SELECT * FROM  Player ORDER BY id DESC");
  //if (databaseJarmo.next()) {
  //   id = databaseJarmo.getInt("id");
  //  Player_id = id + 1;
  //  println(Player_id);
  //  println(id);
  //}
  //databaseJarmo.close();



  for (int i=0; i<letters.length; i++) {
    letters[i]='A';
  }
  loadAssets();
  /*
  In deze array staan alle objecten uit de game. Zo kan ik makkelijk de collision op elk object toepassen of de objecten gebruiken wanneer nodig.
   */
  objectList[0] = new Object(CRATER_X, CRATER_Y, crater);
  objectList[1] = new Object(BARREL_X, BARREL_Y, barrel);
  objectList[2] = new Object(portalX1, portalY1, Teleportal[2]);
  objectList[3] = new Object(PLANK_X, PLANK_Y, plank);
  objectList[4] = new Object(portalX2, portalY2, Teleportal[2]);
  objectList[5] = new Object(spaceShipX, spaceShipY, Ship);

  for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {   

    walkers[iEnemy] = new Walker();
    shooters[iEnemy] = new Shooter();
  }
  backGroundLevel = loadImage("Backgroundtegels.png");
  StartScreen = loadImage("Titlescreen.png");
  victoryScreen = loadImage("VictoryScreen.png");
  // StartScreen = loadImage("BackgroundMain.png");
  file = new SoundFile(this, "Synthwave.mp3");
  file.loop();
  file.amp(0.10);
  laserSound = new SoundFile(this, "lasersound.mp3");
  laserSound.amp(0.05);
  file = new SoundFile(this, "backgroundmusic2.0.wav");
  file.play();
  file.loop();
  file.amp(0.10);
  Swordhit = new SoundFile(this, "swordhit.mp3");
  WalkSound = new SoundFile(this, "walkrobot.wav");
  WalkSound.amp(1.20);
  Explosion = new SoundFile(this, "explosion2.0.wav");
  SwordAttack = new SoundFile(this, "swordattack.wav");
  Powerup = new SoundFile(this, "powerup.wav");


  for (int i = 0; i <10; i++) {
    powerups[i] = new Powerup();
  }

  teleport = new Teleporter();
  collision = new Collision();
  camera = new Camera();
  sword = new Sword();
  startscreen = new Start();
  stats = new Stats();
  achievement = new Achievement();
  waves = new Waves();
  timer = new Timer();
  //startTime = new Time(0);

  noStroke();
  player = new Player();
  bob = new Bob();
  hitDetection = new HitDetection();
  spaceship = new spaceShip();

  //if (sql.connect()) {
  //  sql.execute("CREATE TABLE IF NOT EXISTS Game (time int, score int, gameid int, PRIMARY KEY(gameid));");
  //  sql.execute("CREATE TABLE IF NOT EXISTS Player(hp int, posx int, posy int, playerid int, PRIMARY KEY(playerid));");
  //}
}

void GetScores() {
  if ( dbcoen.connect() )
  {
    dbcoen.query( "SELECT name, score FROM Highscore H INNER JOIN Player P ON H.Player_id = P.id" );

    println( "Table \t name \t\t score \t\t " );
    println( "===========================================" );

    int recordCount = 0;
    while ( dbcoen.next() )
    {        
      println( "  \t " + dbcoen.getString("name") + " \t\t " + dbcoen.getInt("score") + " \t\t " );
      dbScores.add(new RecordScore(dbcoen.getString("name"), dbcoen.getInt("score")));
      recordCount++;
    }
    println( " Number of records: " + recordCount );
  }
}

void draw() {
  if (achievement.Achieved1 && state == 3) {
    image(CheckMark, 620, 310);
  }
  if (achievement.Achieved2 && state == 3) {
    image(CheckMark, 620, 380);
  }
  if (achievement.Achieved3 && state == 3) {
    image(CheckMark, 650, 442);
  }
  if (achievement.Achieved4 && state == 3) {
    image(CheckMark, 675, 505);
  }
  if (state == 1 && states == stateNormal ) { //Het beginscherm. Dit is het eerste scherm wat je ziet.
    background(0);
    fill(200);
    textSize(stateTextSize);
    textAlign(CENTER);
    text("press 'X' to start", width/2, height/2);
    if (keyPressed && key == 'x') {
      state = 2;
    }
  }
  if (state == 2 && states == stateNormal) { //dit is de gamefase. Hier kan je rondlopen, het spel op pauze zetten en doodgaan.
    camera.updateBackground();
    camera.updateScreen();

    if (keyPressed && key =='b') {
      // player.hp = 0;
    }
    if (keyPressed && key =='p') { //wanneer er op de pauzeknop gedrukt wordt de status van het spel naar 3 veranderd
      state = 3;
    }
    if (player.hp <=0) { //als de speler dood is gegaan moet de speler doorgestuurd worden naar het eindscherm en moet de highscore worden laten zien
      state = 4;
    }
  }
  if (state == 3 && states == stateNormal) {    //het pauzescherm
    image(PauseMenu, 0, 0);
    // fill(175);
    textAlign(CENTER);
    textSize(stateTextSize);
    // text("Paused", width/2, height/2);
    // text("press 'O' to continue", width/2, height/2 + stateTextSize);
    if (keyPressed && key == 'o') {
      state = 2;
    }
    if (achievement.Achieved1 ) {
      image(CheckMark, 620, 280);
    }
    if (achievement.Achieved2 ) {
      image(CheckMark, 620, 350);
    }
    if (achievement.Achieved3 ) {
      image(CheckMark, 650, 410);
    }
    if (achievement.Achieved4 ) {
      image(CheckMark, 675, 470);
    }
  }



  if (state == 4) { //het game over scherm
    for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) { 
      walkers[iEnemy].reset();
      shooters[iEnemy].reset();
    }
    image(GameOverScreen, 0, 0);
    textAlign(CENTER);
    player.x = -100;
    player.y = -100;
    textSize(20);
    text("Place        Name        Score", 950, 450);

    textSize(20);
    // for each score in list
    for (int iScore=0; iScore<highscores.getScoreCount(); iScore++) {

      // only show the top 10 scores
      if (iScore>=9) break;

      // fetch a score from the list
      Score score = highscores.getScore(iScore);

      // display score in window
      text((iScore+1) + "            " + score.name + "        " + score.score, 950, 500 + iScore*20);
    }
    textSize(100);
    text(score, 300, 600);
    if (keyPressed && key == 'r' || keyPressed && key == 'R') {//als er op de R gedrukt wordt zal het spel opnieuw naar de gamefase gaan
      //en zullen alle waarden terug naar de beginwaarden gezet worden
      //reset alles 
      for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {   
        shooters[iEnemy].Enemylives = shooters[iEnemy].startEnemylives;
        shooters[iEnemy].speedEnemy = shooters[iEnemy].startSpeedEnemy;
        walkers[iEnemy].enemyHealth = walkers[iEnemy].startEnemylives;
        walkers[iEnemy].speedEnemy = walkers[iEnemy].startSpeedEnemy;

        walkers[iEnemy] = new Walker();
        shooters[iEnemy] = new Shooter();

        for (int x = 0; x<CurrentNumEnemies; x++) {// de loop die de enemies laat spawnen
          walkers[x].spawn();
          shooters[x].spawn();
        }
        for (int i = 0; i < 10; i++) 
        {
          powerups[i].reset();
        }

        player.update();        

        killsForRoundUp = 6;
        CurrentNumEnemies = 3;
        enemiesLeft = CurrentNumEnemies *2;
        player.hp = player.startHp; 
        roundCount = 0;
        score = 0;
        player.fuel = 0;     
        state = 2;
        player.x = 300;
        player.y = 300;
        currentWaves = 1;
        player.dmg = 1;
        player.fireRate = 30;
      }
    }
  }

  if (state == 5) {
    if (states==stateInput) {
      image(victoryScreen, 0, 0);
      fill(#FF0000);
      textSize(30);

      int i=0;
      for (char c : letters) { 
        fill(255);
        if (i==playerIndex) 
          fill(255);
        stroke(0);
        text(char(letters[i])+"", width/3+50+i*80, height/2-40);
        noStroke();
        i++;
      }
      textSize(20);
      text("Place        Name        Score", 850, 475);

      // for each score in list
      for (int iScore=0; iScore<highscores.getScoreCount(); iScore++) {

        // only show the top 10 scores
        if (iScore>=9) break;

        // fetch a score from the list
        Score score = highscores.getScore(iScore);

        // display score in window
        text((iScore+1) + "              " + score.name + "        " + score.score, 850, 525 + iScore*20);
      }
      textSize(100);
      text(score, 300, 600);
    } else if (states==stateAfterInput) {
      state = 6;
      result=""+letters[0]+letters[1]+letters[2]+letters[3];
      println(result); 
      highscores.addScore(result, (int)score);
      if (dbcoen.connect()) {
        // dbcoen.execute ("INSERT INTO Player (name) VALUES (" + result +  ")");
        dbcoen.execute ("INSERT INTO Player (name) VALUES ('BCBC')");
        dbcoen.execute ("INSERT INTO Session (Player_id,duration) VALUES (" + Player_id + ", " + 50  + ")");
        dbcoen.execute("INSERT INTO Highscore (score, Player_id) VALUES (" + score + ", " + Player_id  + ")");
      }
      states=stateNormal;
    }
  }
  if (state == 6) {
    image(victoryScreen, 0, 0);

    textSize(20);
    text("Place        Name        Score", 850, 475);


    // for each score in list
    for (int iScore=0; iScore<highscores.getScoreCount(); iScore++) {
      textSize(20);
      // only show the top 10 scores
      if (iScore>=9) break;

      // fetch a score from the list
      Score score = highscores.getScore(iScore);

      // display score in window
      text((iScore+1) + "              " + score.name + "        " + score.score, 850, 525 + iScore*20);
    }
    textSize(100);
    text(score, 300, 600);
    //textSize(20);
    //int positionY = positionYSpacing;
    // for(RecordScore record : dbScores){
    //  text("" + record.name, 500, positionY+400);
    //  text("" + record.score,  600, positionY+ 400);
    //  positionY += positionYSpacing;
    // }
  }
  //player.stop_player();
  player.update();
  teleport.collision();
}
void keyTyped() {
  //if (key == ' ') {
  //  highscores.addScore("Player_"+playerIndex++, (int)score);

  //}

  if (key == 'k') highscores.save("highscore.csv");
  if (key == 'l') highscores.load("highscore.csv");
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    // up = true;
    player.up = true;
    if (!WalkSound.isPlaying()) {
      WalkSound.play();
    }
  }
  if (key == 's' || key == 'S') {
    //  down = true;
    player.down = true;
    if (!WalkSound.isPlaying()) {
      WalkSound.play();
    }
  }
  if (key == 'a' || key == 'A') {
    player.left = true;
    if (!WalkSound.isPlaying()) {
      WalkSound.play();
    }
  }
  if (key == 'd' || key == 'D') {
    player.right = true;
    if (!WalkSound.isPlaying()) {
      WalkSound.play();
    }
  }
  keys[keyCode] = true;
  if (fired == false && key == ' ') {
    Bullet b = new Bullet(); 
    bullets.add(b);
    b.fire(player.x, player.y);
    fired = true;
    laserSound.play();
  }
  if (key == 'z') {
    sword.isHit = true;
    sword.show();
    SwordAttack.play();
    Swordhit.play();
  }
  if (states == stateInput) {
    if (keyCode == 'W') {
      up = true;
    }

    if (keyCode == 'S') {
      down = true;
    }
    if (states==stateInput) {
      if (keyCode == 'W') { 
        if (letters[playerIndex] > 64) { 
          letters[playerIndex]--;
          if (letters[playerIndex] == 64) {
            letters[playerIndex] = 90;
          }
        }
      } else if (keyCode == 'S') { 
        if (letters[playerIndex] < 91) {
          letters[playerIndex]++;
          if (letters[playerIndex] == 91) {
            letters[playerIndex] = 65;
          }
        }
      } else if (keyCode == 'A') {
        playerIndex--;
        if (playerIndex<0) 
          playerIndex=0;
      } else if (keyCode == 'D' ) {
        playerIndex++;
        if (playerIndex>3) 
          playerIndex=3;
      } else if (key == RETURN||key==' ') {
        states=stateAfterInput;
      }
    }
  }
}
void keyReleased() {
  if (key == 'w' || keyCode == UP) {
    player.up = false;
    //WalkSound.stop();
  }
  if (key == 's' || keyCode == DOWN) {
    player.down = false;
    //WalkSound.stop();
  }
  if (key == 'a' || keyCode == LEFT) {
    player.left = false;
    //WalkSound.stop();
  }
  if (key == 'd' || keyCode == RIGHT) {
    player.right = false;
    //WalkSound.stop();
  }
  keys[keyCode] = false;
  if (key == 'z') {
    sword.isHit = false;
  }
}
