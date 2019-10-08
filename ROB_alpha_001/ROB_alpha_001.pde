
Move_Player Player_move;
boolean up = false, down = false, left = false, right = false;

Bullet bullet;
Enemy enemy;
//Enemy[] enemies = new Enemy[25];
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
boolean [] keys = new boolean[1024];

int floorSize = 40;
int deskX = 280;
int deskY = 500;
int deskSX = 150;
int deskSY = 40;

static final int NumberOfEnemies = 20;
int CurrentNumEnemies = 3 ; //nodig
int walkCount = 0; //niet gebruikt
//int shootCount= 0;
//int KillCount = 0 ; niet gebruikt
int KillForRoundUp = 0; //niet gebruikt
int EnemyLives = 10 ; // niet gebruikt, nodig
int iEnemy;
static int i;
static int[] positionSpawn = new int [NumberOfEnemies];
int[] colour = new int [NumberOfEnemies];
int roundCount = 0;
boolean MaxEnemies = false;
//Walker walker;
Walker[] walkers = new Walker[NumberOfEnemies];
//Shooter shooter;
//Bullet bullet;
//int Enemies= walkCount + shootCount;

SpawnPoint newSpawn;
LevelObjects newObject;
Bubble newBubbles;
Teleporter teleport;

void setup(){
 size(1280, 720);

  //walker = new Walker();
  // shooter = new Shooter();
  //bullet = new Bullet();
  for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {   
    positionSpawn[iEnemy] = (floor(random(0, 4)));
    walkers[iEnemy] = new Walker();
  }
    
newSpawn = new SpawnPoint();
  newObject = new LevelObjects();
  newBubbles = new Bubble();
  teleport = new Teleporter();

noStroke();
Player_move = new Move_Player();
bullet = new Bullet();
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



void draw(){
  background(0);

  Player_move.Move();
  Player_move.Display_Player();

  bullet.update();
  bullet.show();
  
  
  newSpawn.display();
  newObject.display();
  teleport.display();
  
  
  newBubbles.display();
  newBubbles.ascend();
  newBubbles.top();
  
  
    for (int iEnemy = 0; iEnemy< CurrentNumEnemies; iEnemy++) {
    walkers[iEnemy].draw();
    if (MaxEnemies == false) {
      for (i = 0; i<CurrentNumEnemies; i++) {
        walkers[i].spawn();
      }
    }
    MaxEnemies = true;
    if (walkers[iEnemy].PointWalkX - walkers[iEnemy].posXEnemy >= 9 || walkers[iEnemy].PointWalkX - walkers[iEnemy].posXEnemy <= -9 ) {
      walkers[iEnemy].updateX();
    }
    if (walkers[iEnemy].PointWalkY - walkers[iEnemy].posYEnemy >= 9 || walkers[iEnemy].PointWalkY - walkers[iEnemy].posYEnemy <= -9 && walkers[iEnemy].Xtrue == true) {
      walkers[iEnemy].updateY();
    }
    walkers[iEnemy].check();
    //}
    //do all the things it has to do
  }
  
  
  if (frameCount % 60 == 0) {
    Enemy enemy = new Enemy();
    enemies.add(enemy);
  }
  
  for(int i= 0; i < enemies.size(); i++){
   Enemy enemy = enemies.get(i);
   enemy.update();
   enemy.show();
   
  }
       for (Enemy anEnemy : enemies){
    if (overlaps(bullet.x, bullet.y, bullet.texture, anEnemy.x, anEnemy.y, anEnemy.texture)) {
      bullet.reset();
      anEnemy.reset();
    }
  }

  newSpawn.display();
  newObject.display();
  teleport.display();
  
  
  newBubbles.display();
  newBubbles.ascend();
  newBubbles.top();
    }



void keyPressed() {
  if (key == 'w' || key == 'W') {
    up = true;
  }
  if (key == 's' || key == 'S') {
    down = true;
  }
  if (key == 'a' || key == 'A') {
    left = true;
  }
  if (key == 'd' || key == 'D') {
    right = true;
  }
    if (keyPressed == true && key == ' ') {
    roundCount++;
    print(roundCount);
    Stronger();
  }
  keys[keyCode] = true;
}
void keyReleased() {
  if (key == 'w' || key == 'W') {
    up = false;
  }
  if (key == 's' || key == 'S') {
    down = false;
  }
  if (key == 'a' || key == 'A') {
    left = false;
  }
  if (key == 'd' || key == 'D') {
    right = false;
  }
  keys[keyCode] = false;
}

void Stronger() {
  switch (roundCount % 5) {
    case (0):
    //spawn meer enemies
    println("meer enemies");
    CurrentNumEnemies += 2;
    MaxEnemies = false;
    break;
    case (1):
    //beweeg sneller
    println("sneller");
    for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++){
    walkers[iEnemy].moveEnemy *= 1.25;
    }
    break;
    case (2):
    //spawn delay lager
    println("minder vertraging"); //hebben we niet
    break;
    case (3):
    //meer levens
    println("meer levens"); //nog niet
    EnemyLives += 2;
    break;
    case (4):
    //doet meer damage
    println("meer schade"); //hebben we niet
    break;
  }
}
