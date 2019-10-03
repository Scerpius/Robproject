Move_Player Player_move;
boolean up = false, down = false, left = false, right = false;


Bullet bullet;


void setup(){
size(1080,720);
noStroke();
Player_move = new Move_Player();
}



void draw(){
  background(0);
  Player_move.Move();
  Player_move.Display_Player();
  
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
