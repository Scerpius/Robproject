import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

MySQL sql;

String database = "127.0.0.1"; // Database IP, ik gebruik XAMPP voor localhost (zelfde idee als MySQL Server als goed is)
String databaseName = "hva"; // Database Name, de naam die ik gebruik voor mijn database
String username = "root"; // Gebruikersnaam waarmee je in je database inlogt
String password = "Dreef123!"; // Omdat ik localhost gebruik, heb ik geen password


Player player;
Bob bob;
Camera camera;
ArrayList <Bullet> bullets = new ArrayList<Bullet>();
Sword sword;


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
int state = 1;
int CurrentNumEnemies = 10 ; //nodig
int walkCount = 0; //niet gebruikt
int KillForRoundUp = 0; //niet gebruikt
int EnemyLives = 10 ; // niet gebruikt, nodig
int iEnemy;
static int i;
int roundCount = 0;
int time = millis();
int stateTextSize= 60;
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
Boss[] boss = new Boss[iEnemy];

Powerup[] powerups= new Powerup[10];



//import processing.sound.*;
//SoundFile file;

void setup() {
  sql = new MySQL(this, database, databaseName, username, password);
  size(1280, 720);
  noStroke();
  smooth(4);

  loadAssets();
  objectList[0] = new Object(CRATER_X, CRATER_Y, crater);
  objectList[1] = new Object(BARREL_X, BARREL_Y, barrel);
  objectList[2] = new Object(portalX1, portalY1, Teleportal);
  objectList[3] = new Object(PLANK_X, PLANK_Y, plank);
  objectList[4] = new Object(portalX2, portalY2, Teleportal);

  //msql = new MySQL( this, "localhost", "gametime", "root", "HVAIG1041920#" );
  //if ( msql.connect()) {
  //}
  for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {   
    positionSpawn[iEnemy] = (floor(random(0, 4)));
    walkers[iEnemy] = new Walker();
    shooters[iEnemy] = new Shooter();

    backGroundLevel = loadImage("Backgroundtegels.png");
    // StartScreen = loadImage("BackgroundMain.png");
    // file = new SoundFile(this, "Synthwave.mp3");
    // file.loop();
  }
  for (int i = 0; i <10; i++) {
    powerups[i] = new Powerup();
  }

  teleport = new Teleporter();
  collision = new Collision();
  camera = new Camera();
  sword = new Sword();
  startscreen = new Start();

  noStroke();
  player = new Player();
  bob = new Bob();
  if (sql.connect()) {
    sql.execute("CREATE TABLE IF NOT EXISTS Game (time float, score float, playerid varchar(150), PRIMARY KEY(playerid));");
    sql.execute("CREATE TABLE IF NOT EXISTS Player(hp float, pos float, playerid float, PRIMARY KEY(playerid));");
    sql.execute("CREATE TABLE IF NOT EXISTS Enemy (enemytype varchar(150), enemyposx float, enemyposy float, enemyid float, PRIMARY KEY(enemyid));");
    sql.execute("CREATE TABLE IF NOT EXISTS Playerkiller (playerid float, enemyid float, enemytype varchar(150), " + 
      "FOREIGN KEY(playerid) REFERENCES Player(playerid), FOREIGN KEY(enemyid) REFERENCES Enemy(enemyid), PRIMARY KEY(playerid, enemyid);");

    String playerid = "1155";
    String enemytype = "walker";
    String enemytype2 = "shooter";
    int enemyid = 123;


    sql.execute("INSERT INTO Game VALUES (" + time + ", " + score + ", " +playerid+ ");");
    sql.execute("INSERT INTO Player VALUES(" + player.hp + ", " + player.x + ", " + player.y + ", " + playerid + ");");
    for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) { 


      sql.execute("INSERT INTO Enemy VALUES(" + enemytype + ", " + walkers[iEnemy].posXEnemy + ", " + walkers[iEnemy].posYEnemy + ", " + enemyid +");");
      sql.execute("INSERT INTO Enemy VALUES(" + enemytype2 + ", " + shooters[iEnemy].posXEnemy + ", " + shooters[iEnemy].posYEnemy + "," + enemyid++ +" );");
      enemyid += 2;
    }
  }
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
    if (keyPressed && key =='b'){
      player.hp = 0;
    }
    if (keyPressed && key =='p') {
      state = 3;
    }
    if (player.hp <=0){
     state = 4; 
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
  if (state == 4){
    background(0);
    fill(175);
    textAlign(CENTER);
    textSize(stateTextSize);
    text("Game over", width/2, height/2);
      text("your score was" , width/2, height/2 + stateTextSize);
      text("current highscore: 136", width/2, height/2 + 2*stateTextSize);
      text("Press 'R' to restart", width/2, height/2 + 3*stateTextSize);
      if (keyPressed && key == 'r'){
      //reset alles 
      shooters[i].Enemylives = shooters[i].startEnemylives;
     shooters[i].speedEnemy = shooters[i].startSpeedEnemy;
      walkers[i].Enemylives = walkers[i].startEnemylives;
    walkers[i].speedEnemy = walkers[i].startSpeedEnemy;
     // player.movementSpeed = player.startMovementSpeed;
      player.hp = player.startHp; 
      roundCount = 0;
      score = 0;
      state = 2;
      }
  }
}

void keyPressed() {
  //if (key == 'w' || key == 'W') {
  //  player.up = true;
  //}
  //if (key == 's' || key == 'S') {
  //  player.down = true;
  //}
  //if (key == 'a' || key == 'A') {
  //  player.left = true;
  //}
  //if (key == 'd' || key == 'D') {
  //  player.right = true;
  //}
  keys[keyCode] = true;
  if (fired == false && key == ' ') {
    Bullet b = new Bullet();
    bullets.add(b);
    b.fire(player.x, player.y);
    fired = true;
  }
  if (key == 'z') {
    sword.isHit = true;
    sword.show();
  }
}
void keyReleased() {
  //if (key == 'w' || key == 'W') {
  //  player.up = false;
  //}
  //if (key == 's' || key == 'S') {
  //  player.down = false;
  //}
  //if (key == 'a' || key == 'A') {
  //  player.left = false;
  //}
  //if (key == 'd' || key == 'D') {
  //  player.right = false;
  //}
  keys[keyCode] = false;
  if (key == 'z') {
    sword.isHit = false;
  }
}
