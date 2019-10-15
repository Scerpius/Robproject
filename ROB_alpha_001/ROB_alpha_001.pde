
Move_Player Player;
boolean up = false, down = false, left = false, right = false;

Bullet bullet;
Enemy enemy;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
int score;
String text;

boolean [] keys = new boolean[1024];

int deskX = 280;
int deskY = 500;
int deskSX = 150;
int deskSY = 40;
PImage photo;

static final int NumberOfEnemies = 20;
int CurrentNumEnemies = 10 ; //nodig
int walkCount = 0; //niet gebruikt
int KillForRoundUp = 0; //niet gebruikt
int EnemyLives = 10 ; // niet gebruikt, nodig
int iEnemy;
static int i;
static int[] positionSpawn = new int [NumberOfEnemies];
int[] colour = new int [NumberOfEnemies];
int roundCount = 0;
boolean MaxEnemies = false;
Walker walker;
Walker[] walkers = new Walker[NumberOfEnemies];
boolean detect = true;
SpawnPoint newSpawn;
LevelObjects newObject;
Bubble newBubbles;
Teleporter teleport;
boolean invisibility = false;
boolean kill = false;
int time = millis();

void setup(){
 size(1280, 720);
noStroke();
smooth(4);
  for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {   
    positionSpawn[iEnemy] = (floor(random(0, 4)));
    walkers[iEnemy] = new Walker();
  }
    
newSpawn = new SpawnPoint();
  newObject = new LevelObjects();
  newBubbles = new Bubble();
  teleport = new Teleporter();
  photo = loadImage("Backgroundtegels.png");

noStroke();
Player = new Move_Player();
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
  image(photo, 0, 0);
  fill(255);
  textSize(50);
  text = "score :";
  text(score, 150, 50);
  
  Player.Player_dead();
  Player.Move();
  Player.Display_Player();

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

    walkers[iEnemy].detect();
    if (walkers[iEnemy].detected == true) {
      print("1b ", walkers[iEnemy]);
      walkers[iEnemy].moveToPlayer();
      // if (walkers[nEnemy].inRangeOfPlayer())
      //  moveToPlayer();
      //else 
      // moveAround();
      //}
    } else {
      // if (walkers[iEnemy].PointWalkX - walkers[iEnemy].posXEnemy >= 9 || walkers[iEnemy].PointWalkX - walkers[iEnemy].posXEnemy <= -9 ) {
    
      if (!walkers[iEnemy].Xtrue) {
        walkers[iEnemy].updateX();
      }
      //if (walkers[iEnemy].PointWalkY - walkers[iEnemy].posYEnemy >= 9 || walkers[iEnemy].PointWalkY - walkers[iEnemy].posYEnemy <= -9 && walkers[iEnemy].Xtrue == true) {
   
      if (!walkers[iEnemy].Ytrue && walkers[iEnemy].Xtrue == true) {
        walkers[iEnemy].updateX();
      }
      walkers[iEnemy].updateY();

  
      walkers[iEnemy].check(); //deze lijn pakt hij niet meer
    }
  }

  
  if (frameCount % 30 == 0) {
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
      score = score + 1;
    }
  }
   for (Walker anWalker : walkers){
    if (overlaps(bullet.x, bullet.y, bullet.texture, anWalker.posXEnemy, anWalker.posYEnemy, anWalker.texture)) {
      bullet.reset();
      anWalker.reset();
      score = score + 1;
    }
  }
  
     for (Walker anWalker : walkers){
    if (overlaps(Player.x, Player.y, Player.texture, anWalker.posXEnemy, anWalker.posYEnemy, anWalker.texture)) {
     if(invisibility == false) {
      Player.hp = Player.hp - 1;
     }
      invisibility = true;
      if(invisibility) {  if(millis() >= time + 1000) {
        invisibility = false;
      }
        
    }
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
  //  if (keyPressed == true && key == ' ') {
   // roundCount++;
   // print(roundCount);
   // Stronger();
//  }
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
