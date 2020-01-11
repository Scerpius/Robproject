import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

String dbHostID = "oege.ie.hva.nl"; //Oege server
String dbUsername = "veenkec1";  //Database username
String dbUserPass = "64B61p/oat7B68";  //Database Password
String dbSchema = "zveenkec1";  //Database schema naam
MySQL databaseJarmo;


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
Timer startTimer;

int ms = 0;
int s = 0;
int min = 0;

int idPlayer;

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
int CurrentNumEnemies = 3; //nodig
int killsForRoundUp = 6;
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
  // sql = new MySQL(this, database, databaseName, username, password)

  databaseJarmo = new MySQL(this, dbHostID, dbSchema, dbUsername, dbUserPass);
  databaseJarmo.connect();
  databaseJarmo.query("SELECT * FROM  Session ORDER BY idplayer DESC");
  if (databaseJarmo.next()) {
    int id = databaseJarmo.getInt("idplayer");
    idPlayer = id + 1;
    println(idPlayer);
    println(id);
  }
  databaseJarmo.close();


  size(1280, 720);
  noStroke();
  smooth(4);
/*
De loadassets laat alle plaatjes van te voren in zodat we die daarna makkelijk kunnen gebruiken en zodat we die niet in de game nog hoeven in te laden.
Zo voorkom je lag.
*/
  loadAssets();
  
  /*
  In deze array staan alle objecten uit de game. Zo kan ik makkelijk de collision op elk object toepassen of de objecten gebruiken wanneer nodig.
  */
  
  objectList[0] = new Object(CRATER_X, CRATER_Y, crater);
  objectList[1] = new Object(BARREL_X, BARREL_Y, barrel);
  objectList[2] = new Object(portalX1, portalY1, Teleportal[2]);
  objectList[3] = new Object(PLANK_X, PLANK_Y, plank);
  objectList[4] = new Object(portalX2, portalY2, Teleportal[2]);

  for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {   
    positionSpawn[iEnemy] = (floor(random(0, 4)));
    walkers[iEnemy] = new Walker();
    shooters[iEnemy] = new Shooter();
/*

Hier geneer ik de tegels op een random manier. Dit wordt niet in de game zelf gebruikt omdat wij 1 keer hem hebben gegenereed en toen een screenshot hebben genomen.
Dit hebben wij gedaan om te voorkomen dat de game anders zou gaan laggen.

int[][] tegels;
PImage imageA;
PImage imageB;
PImage imageC;
PImage imageD;
PImage imageE;
PImage imageF;
PImage imageG;
PImage imageH;
PImage imageI;
PImage imageJ;
PImage imageK;
PImage imageL;


void setup() {
  size(1280, 720);

  imageA = loadImage("Tegel1.png");
  imageB = loadImage("Tegel2.png");
  imageC = loadImage("Tegel3.png");
  imageD = loadImage("Tegel4.png");
  imageE = loadImage("Tegel5.png");
  imageF = loadImage("Tegel6.png");
  imageG = loadImage("Tegel7.png");
  imageH = loadImage("Tegel8.png");
  imageI = loadImage("Tegel9.png");
  imageJ = loadImage("Tegel10.png");
  imageK = loadImage("Tegel11.png");
  imageL = loadImage("Tegel12.png");

  tegels = new int[32][18];

  for (int i = 0; i < tegels.length; i++) {
    for (int j = 0; j < tegels[i].length; j++) {
      tegels[i][j] = (int)random(12);
    }
  }
}

void draw() {
  for (int i = 0; i < tegels.length; i++) {
    for (int j = 0; j < tegels[i].length; j++) {    
      if (tegels[i][j] == 0) {
        image(imageA, i*40, j*40);
      } else if (tegels[i][j] == 1) {
        image(imageB, i*40, j*40);
      } else if (tegels[i][j] == 2) {
        image(imageC, i*40, j*40);
      } else if (tegels[i][j] == 3) {
        image(imageD, i*40, j*40);
      } else if (tegels[i][j] == 4) {
        image(imageE, i*40, j*40);
      } else if (tegels[i][j] == 5) {
        image(imageF, i*40, j*40);
      } else if (tegels[i][j] == 6) {
        image(imageG, i*40, j*40);
      } else if (tegels[i][j] == 7) {
        image(imageH, i*40, j*40);
      } else if (tegels[i][j] == 8) {
        image(imageI, i*40, j*40);
      } else if (tegels[i][j] == 9) {
        image(imageJ, i*40, j*40);
      } else if (tegels[i][j] == 10) {
        image(imageK, i*40, j*40);
      } else if (tegels[i][j] == 11) {
        image(imageL, i*40, j*40);
      };
    };
  };
};
*/

    backGroundLevel = loadImage("Backgroundtegels.png");
    StartScreen = loadImage("BackgroundMain.png");
    // StartScreen = loadImage("BackgroundMain.png");
    // file = new SoundFile(this, "Synthwave.mp3");
    // file.loop();
    laserSound = new SoundFile(this, "lasersound.mp3");
    laserSound.amp(0.05);
    Swordhit = new SoundFile(this, "swordhit.mp3");
    WalkSound = new SoundFile(this, "walkrobot.wav");
    Explosion = new SoundFile(this, "explosion2.0.wav");
    SwordAttack = new SoundFile(this, "swordattack.wav");
    Powerup = new SoundFile(this, "powerup.wav");
  }
  for (int i = 0; i <10; i++) {
    powerups[i] = new Powerup();
  }

  startTimer = new Timer(0);
  teleport = new Teleporter();
  collision = new Collision();
  camera = new Camera();
  sword = new Sword();
  startscreen = new Start();
  stats = new Stats();

  noStroke();
  player = new Player();
  bob = new Bob();
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
    textSize(stateTextSize);
    if (keyPressed && key =='b') {
      player.hp = 0;
    }
    if (keyPressed && key =='p') {
      state = 3;
    }
    if (player.hp <=0) {
      state = 4;
      if (databaseJarmo.connect()) {
        databaseJarmo.execute("INSERT INTO Session (time, score, roundCount, CurrentNumEnemies) VALUES (" + s + "," + score + "," + roundCount + "," + CurrentNumEnemies + ");")  ;
      }
      databaseJarmo.close();
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
    if (keyPressed && key == 'r') {
      //reset alles 
      shooters[i].Enemylives = shooters[i].startEnemylives;
      shooters[i].speedEnemy = shooters[i].startSpeedEnemy;
      walkers[i].enemyHealth = walkers[i].startEnemylives;
      walkers[i].speedEnemy = walkers[i].startSpeedEnemy;
      shooters[i].spawn();
      walkers[i].spawn();
      // player.movementSpeed = player.startMovementSpeed;
      killsForRoundUp = 6;
      CurrentNumEnemies = 1;
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
    // WalkSound.play();
  }
  if (key == 's' || key == 'S') {
    player.down = true;
    //  WalkSound.play();
  }
  if (key == 'a' || key == 'A') {
    player.left = true;
    //  WalkSound.play();
  }
  if (key == 'd' || key == 'D') {
    player.right = true;
    //  WalkSound.play();
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
    //  Swordhit.play();
  }
}
void keyReleased() {
  if (key == 'w' || key == 'W') {
    player.up = false;
    //  WalkSound.stop();
  }
  if (key == 's' || key == 'S') {
    player.down = false;
    // WalkSound.stop();
  }
  if (key == 'a' || key == 'A') {
    player.left = false;
    // WalkSound.stop();
  }
  if (key == 'd' || key == 'D') {
    player.right = false;
    // WalkSound.stop();
  }
  keys[keyCode] = false;
  if (key == 'z') {
    sword.isHit = false;
  }
}
