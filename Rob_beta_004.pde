import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

MySQL sql;

String database = "oege.ie.hva.nl"; 
String databaseName = "zsluiscm"; 
String username = "sluiscm"; 
String password = "n9YFaVSpqMeAAB"; 


Player player;
Bob bob;
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
int playerIndex = 0;
int score;
int cooldowntimer = 300;
String text;

PImage backGroundLevel;
PImage StartScreen;

Object[] objectList = new Object[6];

static final int NumberOfEnemies = 20;
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
int spaceShipY = 235;
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
Boss[] boss = new Boss[iEnemy];

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

  loadAssets();
  objectList[0] = new Object(CRATER_X, CRATER_Y, crater);
  objectList[1] = new Object(BARREL_X, BARREL_Y, barrel);
  objectList[2] = new Object(portalX1, portalY1, Teleportal[2]);
  objectList[3] = new Object(PLANK_X, PLANK_Y, plank);
  objectList[4] = new Object(portalX2, portalY2, Teleportal[2]);
  objectList[5] = new Object(spaceShipX, spaceShipY, Ship);

  for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {   
    positionSpawn[iEnemy] = (floor(random(0, 4)));
    walkers[iEnemy] = new Walker();
    shooters[iEnemy] = new Shooter();
  }
  backGroundLevel = loadImage("Backgroundtegels.png");
  StartScreen = loadImage("BackgroundMain.png");
  // StartScreen = loadImage("BackgroundMain.png");
  // file = new SoundFile(this, "Synthwave.mp3");
  //file.loop();
  laserSound = new SoundFile(this, "lasersound.mp3");
  laserSound.amp(0.05);
  Swordhit = new SoundFile(this, "swordhit.mp3");

  backGroundLevel = loadImage("Backgroundtegels.png");
  StartScreen = loadImage("BackgroundMain.png");
  StartScreen = loadImage("BackgroundMain.png");
  file = new SoundFile(this, "backgroundmusic2.0.wav");
  file.play();
  laserSound = new SoundFile(this, "lasersound.mp3");
  laserSound.amp(0.05);
  Swordhit = new SoundFile(this, "swordhit.mp3");
  WalkSound = new SoundFile(this, "walkrobot.wav");
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

  noStroke();
  player = new Player();
  bob = new Bob();
  spaceship = new spaceShip();

  //if (sql.connect()) {
  //  sql.execute("CREATE TABLE IF NOT EXISTS Game (time int, score int, gameid int, PRIMARY KEY(gameid));");
  //  sql.execute("CREATE TABLE IF NOT EXISTS Player(hp int, posx int, posy int, playerid int, PRIMARY KEY(playerid));");
  //}
}

void draw() {
  if (state == 1) {
    background(0);
    fill(200);
    textSize(stateTextSize);
    textAlign(CENTER);
    text("press 'X' to start", width/2, height/2);
    if (keyPressed && key == 'x') {
      state = 2;
    }
  }

  if (state == 2) {
    camera.updateBackground();
    camera.updateScreen();

    if (keyPressed && key =='b') {
      player.hp = 0;
    }
    if (keyPressed && key =='p') {
      state = 3;
    }
    if (player.hp <=0) {
      highscores.addScore("Player_"+playerIndex++, (int)score);
      state = 4;
      //if (sql.connect()) {
      //  sql.execute ("INSERT INTO Game (time, score) VALUES (" + time + ", " + score + ")");
      //  sql.execute("INSERT INTO Player (hp, posx, posy) VALUES(" + player.hp + ", " + player.x + ", " + player.y + ");");
      //  sql.execute("SELECT * FROM Game ORDER BY gameid DESC");

      //  if (sql.next()) {
      //    int getTime = sql.getInt("time");
      //    int getScore = sql.getInt("score");
      //    int getGameid = sql.getInt("gameid");
      //    println(getTime, getScore, getGameid);
      //  }
      //  sql.execute("SELECT * FROM Player ORDER BY playerid DESC");

      //  if (sql.next()) {
      //    int getHp = sql.getInt("hp");
      //    int getPosx = sql.getInt("posx");
      //    int getPosy = sql.getInt("posy");
      //    println(getHp, getPosx, getPosy);
      //  }
      //  sql.close();
      //  state = 4;
      //}
    }
  }
  if (state == 3) {

    fill(175);
    textAlign(CENTER);
    textSize(stateTextSize);
    text("Paused", width/2, height/2);
    text("press 'O' to continue", width/2, height/2 + stateTextSize);
    if (keyPressed && key == 'o') {
      state = 2;
    }
  }



  if (state == 4) {
    image(GameOverScreen, 0, 0);
    textAlign(CENTER);
    text(score, width/2, height/2+50);
    // display header row
    textSize(20);
    text("Place        Name        Score", 100, 70);

    textSize(16);
    // for each score in list
    for (int iScore=0; iScore<highscores.getScoreCount(); iScore++) {

      // only show the top 10 scores
      if (iScore>=9) break;

      // fetch a score from the list
      Score score = highscores.getScore(iScore);

      // display score in window
      text((iScore+1) + "            " + score.name + "        " + score.score, 100, 100 + iScore*20);
    }
    if (keyPressed && key == 'r' || keyPressed && key == 'R') {
      //reset alles 
      for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {   
        shooters[i].Enemylives = shooters[i].startEnemylives;
        shooters[i].speedEnemy = shooters[i].startSpeedEnemy;
        walkers[i].enemyHealth = walkers[i].startEnemylives;
        walkers[i].speedEnemy = walkers[i].startSpeedEnemy;

        positionSpawn[iEnemy] = (floor(random(0, 4)));
        walkers[iEnemy] = new Walker();
        shooters[iEnemy] = new Shooter();
        shooters[i].spawn();
        walkers[i].spawn();
      }
      // player.movementSpeed = player.startMovementSpeed;
      killsForRoundUp = 6;
      CurrentNumEnemies = 1;
      enemiesLeft = CurrentNumEnemies *2;
      player.hp = player.startHp; 
      roundCount = 0;
      score = 0;
      state = 2;
    }
  }
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
    player.up = true;
    if (!WalkSound.isPlaying()) {
      WalkSound.play();
    }
  }
  if (key == 's' || key == 'S') {
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
}
void keyReleased() {
  if (key == 'w' || key == 'W') {
    player.up = false;
    //WalkSound.stop();
  }
  if (key == 's' || key == 'S') {
    player.down = false;
    //WalkSound.stop();
  }
  if (key == 'a' || key == 'A') {
    player.left = false;
    //WalkSound.stop();
  }
  if (key == 'd' || key == 'D') {
    player.right = false;
    //WalkSound.stop();
  }
  keys[keyCode] = false;
  if (key == 'z') {
    sword.isHit = false;
  }
}
