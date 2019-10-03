
Move_Player Player_move;
boolean up = false, down = false, left = false, right = false;


Player player;
Bullet bullet;
Enemy enemy;
Enemy[] enemies = new Enemy[25];


void setup(){
size(1080,720);

noStroke();
Player_move = new Move_Player();
player = new Player();
bullet = new Bullet();
for (int i = 0; i<enemies.length; i++){
 enemies[i] = new Enemy(); 
}
  

}



void draw(){
  background(0);

  Player_move.Move();
  Player_move.Display_Player();

 
  player.update();
  player.show();
  bullet.update();
  bullet.show();
  for(int i= 0; i < enemies.length; i++){
   enemies[i].update();
   enemies[i].show();
   
  }
  
 
  

  
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
}
