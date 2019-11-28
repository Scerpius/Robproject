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


int score;
String text;

PImage backGroundLevel;
PImage StartScreen;

Object[] objectList = new Object[5];

static final int NumberOfEnemies = 20;
int CurrentNumEnemies = 10 ; //nodig
int walkCount = 0; //niet gebruikt
int KillForRoundUp = 0; //niet gebruikt
int EnemyLives = 10 ; // niet gebruikt, nodig
int iEnemy;
static int i;
int roundCount = 0;
int time = millis();
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


static int[] positionSpawn = new int [NumberOfEnemies];
int[] colour = new int [NumberOfEnemies];
Shooter [] shooters = new Shooter[NumberOfEnemies];
Walker[] walkers = new Walker[NumberOfEnemies];

Powerup[] powerups= new Powerup[10];



import processing.sound.*;
SoundFile file;

void setup() {
  sql = new MySQL(this, database, databaseName, username, password);
  size(1280, 720);
  noStroke();
  smooth(4);

  loadAssets();
  objectList[0] = new Object(CRATER_X, CRATER_Y, crater);
  objectList[1] = new Object(BARREL_X, BARREL_Y, barrel);
  objectList[2] = new Object(CRATER_X, CRATER_Y, crater);
  objectList[3] = new Object(CRATER_X, CRATER_Y, crater);
  objectList[4] = new Object(PLANK_X, PLANK_Y, plank);

  for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {   
    positionSpawn[iEnemy] = (floor(random(0, 4)));
    walkers[iEnemy] = new Walker();
    shooters[iEnemy] = new Shooter();

    backGroundLevel = loadImage("Backgroundtegels.png");
    // StartScreen = loadImage("BackgroundMain.png");
    // file = new SoundFile(this, "Synthwave.wav");
    //file.loop();
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
  camera.updateBackground();
  camera.updateScreen();
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
  if (key == ' ') {
    Bullet b = new Bullet();
    bullets.add(b);
    b.fire(player.x, player.y);
  }
  if (key == 'z') {
    sword.isHit = true;
    sword.show();
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
  if (key == 'z') {
    sword.isHit = false;
  }
}
