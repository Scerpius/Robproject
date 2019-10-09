static final int NumberOfEnemies = 20;
int CurrentNumEnemies = 1 ; //nodig
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
boolean detect = true;
//Shooter shooter;
//Bullet bullet;
//int Enemies= walkCount + shootCount;
void setup() {
  size(1280, 720);

  //walker = new Walker();
  // shooter = new Shooter();
  //bullet = new Bullet();
  for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {   
    positionSpawn[iEnemy] = (floor(random(0, 4)));
    walkers[iEnemy] = new Walker();
  }
}

void draw() {
  background(0);
  ellipse(mouseX, mouseY, 50, 50);

  //despawnen
  // while (EnemyLives > 0) {
  for (int iEnemy = 0; iEnemy< CurrentNumEnemies; iEnemy++) {
    fill(255 - 50* iEnemy, 0, 255);
    walkers[iEnemy].draw();
    if (MaxEnemies == false) {
      for (i = 0; i<CurrentNumEnemies; i++) {
        walkers[i].spawn();
      }
    }
    MaxEnemies = true;

    walkers[iEnemy].detect();
    if (walkers[iEnemy].Detected == true) {
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
}
//}
//}
//do all the things it has to do
void keyPressed() {
  if (keyPressed == true && key == ' ') {
    roundCount++;
    print(roundCount);
    Stronger();
  }
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
    for (iEnemy = 0; iEnemy<NumberOfEnemies; iEnemy++) {
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
