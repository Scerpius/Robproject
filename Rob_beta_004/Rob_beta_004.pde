import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;


String dbHostID = "oege.ie.hva.nl"; //Oege server
String dbUsername = "veenkec1";  //Database username
String dbUserPass = "64B61p/oat7B68";  //Database Password
String dbSchema = "zveenkec1";  //Database schema naam

MySQL msql;


  String Name = "Up we go";
  String Description = "Press the up button";
  int Points = 200;
  int Achieved = 1;
  String GameName = "Hoi";
  String FirstName = "Pieter";
  String BirthDate = "01-09-1991";
  
  
Player player;
Bob bob;
Camera camera;
ArrayList <Bullet> bullets = new ArrayList<Bullet>();
Sword sword;
Stats stats;


//SpawnPoint newSpawn;
Walker walker;
Object object;
Collision collision;
Teleporter teleport;
Start startscreen;

boolean [] keys = new boolean[1024];
boolean fired;

int score;
int cooldowntimer = 300;
String text;

PImage backGroundLevel;
PImage StartScreen;

Object[] objectList = new Object[5];

static final int NumberOfEnemies = 20;
int state = 2;
int CurrentNumEnemies = 1; //nodig
int killsForRoundUp = 6;
int iEnemy;
static int i;
int roundCount = 0;
int time = millis();
int stateTextSize= 60;
int enemiesLeft = CurrentNumEnemies *2;
boolean start = false;

boolean invisibility = false;
boolean kill = false;
boolean uitgevoerd = false;
boolean killRound = false;
boolean up = false, down = false, left = false, right = false;
boolean detect = true;
boolean MaxEnemies = false;
int powerupcount = 0;


final int CRATER_X = 540;
final int CRATER_Y = 170;
final int BARREL_X = 900;
final int BARREL_Y = 235;
int PLANK_X;
int PLANK_Y;
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
//Boss[] boss = new Boss[iEnemy];

Powerup[] powerups= new Powerup[10];



import processing.sound.*;
SoundFile file;
SoundFile Soundtrack;
SoundFile laserSound;
SoundFile Swordhit;
void setup() {
  msql = new MySQL (this, dbHostID, dbSchema, dbUsername, dbUserPass);
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

  //msql = new MySQL( this, "localhost", "gametime", "root", "HVAIG1041920#" );
  //if ( msql.connect()) {
  //}
  for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {   
    positionSpawn[iEnemy] = (floor(random(0, 4)));
    walkers[iEnemy] = new Walker();
    shooters[iEnemy] = new Shooter();

    backGroundLevel = loadImage("Backgroundtegels.png");
    StartScreen = loadImage("BackgroundMain.png");
    // StartScreen = loadImage("BackgroundMain.png");
    // file = new SoundFile(this, "Synthwave.mp3");
    // file.loop();
    laserSound = new SoundFile(this, "lasersound.mp3");
    laserSound.amp(0.05);
    Swordhit = new SoundFile(this, "swordhit.mp3");
  }
  for (int i = 0; i <10; i++) {
    powerups[i] = new Powerup();
  }

  teleport = new Teleporter();
  collision = new Collision();
  camera = new Camera();
  sword = new Sword();
  startscreen = new Start();
  stats = new Stats();

  noStroke();
  player = new Player();
  bob = new Bob();

  //     msql.connect();
  //    msql.execute("CREATE TABLE IF NOT EXISTS Achievements (AchievementID int, Name varchar(45), Description Varchar(300), playerID int, Points Int,  PRIMARY KEY(AchievementID));");
  //    msql.execute("CREATE TABLE IF NOT EXISTS Player(PlayerID int, Gamename varchar(45), First name varchar(45), Birthdate date, PRIMARY KEY(playerid));");
  //    msql.execute("CREATE TABLE IF NOT EXISTS Player_has_Achievements(PlayerID int, AchievementID int, PRIMARY KEY(PlayerID, AchievementID) FOREIGN KEY(PlayerID, AchievementID) REFERENCE Player(PlayerID), Achievements(AchievementID);");
  //msql.close();
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
      state = 4;
      if (msql.connect()) {
    msql.execute("INSERT INTO Achievements (AName, Description, Points) VALUES ('" + Name + "', '" + Description + "', " + Points + ");");
    msql.execute("INSERT INTO User (GameName, FirstName, BirthDate) VALUES ('" + GameName + "', '" + FirstName + "', '" + BirthDate + "');");
  }
  msql.close();
      
    }
    //println(camera.bx + " " + walkers[0].X); 
    //println(camera.by + " " + walkers[0].Y);
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
    if (keyPressed && key == 'r') {
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

void keyPressed() {
  if (key == 'w' || key == 'W') {
    player.up = true;
  }
  if (key == 's' || key == 'S') {
    player.down = true;
  }
  if (key == 'a' || key == 'A') {
    player.left = true;
  }
  if (key == 'd' || key == 'D') {
    player.right = true;
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
    //  Swordhit.play();
  }
}
void keyReleased() {
  if (key == 'w' || key == 'W') {
    player.up = false;
  }
  if (key == 's' || key == 'S') {
    player.down = false;
  }
  if (key == 'a' || key == 'A') {
    player.left = false;
  }
  if (key == 'd' || key == 'D') {
    player.right = false;
  }
  keys[keyCode] = false;
  if (key == 'z') {
    sword.isHit = false;
  }
}
