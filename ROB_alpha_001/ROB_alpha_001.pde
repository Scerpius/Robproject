
Move_Player Player_move;
boolean up = false, down = false, left = false, right = false;

Bullet bullet;
Enemy enemy;
Enemy[] enemies = new Enemy[25];
boolean [] keys = new boolean[1024];


void setup(){
size(1080,720);

noStroke();
Player_move = new Move_Player();
bullet = new Bullet();
for (int i = 0; i<enemies.length; i++){
 enemies[i] = new Enemy(); 
}  
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
  for(int i= 0; i < enemies.length; i++){
   enemies[i].update();
   enemies[i].show();
   
  }
       for (Enemy anEnemy : enemies){
    if (overlaps(bullet.x, bullet.y, bullet.texture, anEnemy.x, anEnemy.y, anEnemy.texture)) {
      bullet.reset();
      anEnemy.reset();
    }
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
