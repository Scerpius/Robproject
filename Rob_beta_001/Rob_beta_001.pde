player player;
Bullet bullet;
Bob bob;

//SpawnPoint newSpawn;
Walker walker;
Object object;
Collision collision;
Teleporter teleport;

int score;
String text;

PImage backGroundLevel;

static final int NumberOfEnemies = 20;
int CurrentNumEnemies = 10 ; //nodig
int walkCount = 0; //niet gebruikt
int KillForRoundUp = 0; //niet gebruikt
int EnemyLives = 10 ; // niet gebruikt, nodig
int iEnemy;
static int i;
int roundCount = 0;
int time = millis();


boolean [] keys = new boolean[1024];
boolean invisibility = false;
boolean kill = false;
boolean uitgevoerd = false;
boolean killRound = false;
boolean up = false, down = false, left = false, right = false;
boolean detect = true;
boolean MaxEnemies = false;
int powerupcount = 0;
boolean pickUpPowerup = false;




static int[] positionSpawn = new int [NumberOfEnemies];
int[] colour = new int [NumberOfEnemies];
Shooter [] shooters = new Shooter[NumberOfEnemies];
Walker[] walkers = new Walker[NumberOfEnemies];

Powerup[] powerups= new Powerup[10];


void setup() {
  size(1280, 720);
  noStroke();
  smooth(4);
  for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {   
    positionSpawn[iEnemy] = (floor(random(0, 4)));
    walkers[iEnemy] = new Walker();
    shooters[iEnemy] = new Shooter();

    backGroundLevel = loadImage("Backgroundtegels.png");
  }
  for (int i = 0; i <10; i++) {
    powerups[i] = new Powerup();
  }


  // newSpawn = new SpawnPoint();
  teleport = new Teleporter();
  object = new Object();
  collision = new Collision();

  noStroke();
  player = new player();
  bullet = new Bullet();
  bob = new Bob();
}

boolean overlaps(float x0, float y0, PImage texture0, float x1, float y1, PImage texture1) {  
  int w0 = texture0.width, 
    h0 = texture0.height, 
    w1 = texture1.width, 
    h1 = texture1.height;

  if (x0 > x1   + w1 || x0 + w0 < x1 || 
    y0 > y1 + h1 || y0 + h0 < y1)
    return false;
  else
    return true;
}



void draw() {

  background(0);
  image(backGroundLevel, 0, 0);
  fill(255);
  textSize(50);
  text = "score :";
  text(score, 150, 50);

  object.display(); 
  player.move();
  player.display();

  bullet.update();
  bullet.show();

  bob.code();

  teleport.display();
  teleport.checkBoundaryCollision();

  // newSpawn.display();
  for (int i = 0; i < 10; i++) {
    powerups[i].spawn();
    powerups[i].Display_Powerup();
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
  //  if (keyPressed == true && key == ' ') {
  // roundCount++;
  // print(roundCount);
  // Stronger();
  //  }
  keys[keyCode] = true;
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
}

/*

 void Stronger() {
 switch (roundCount % 5) {
 case (0):
 //spawn meer enemies
 // println("meer enemies");
 CurrentNumEnemies += 2;
 MaxEnemies = false;
 break;
 case (1):
 //beweeg sneller
 // println("sneller");
 for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {
 walkers[iEnemy].moveEnemy *= 1.25;
 }
 break;
 case (2):
 //spawn delay lager
 // println("minder vertraging"); //hebben we niet
 break;
 case (3):
 //meer levens
 // println("meer levens"); //nog niet
 EnemyLives += 2;
 break;
 case (4):
 //doet meer damage
 // println("meer schade"); //hebben we niet
 break;
 }
 }
 */
