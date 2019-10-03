Player player;
Bullet bullet;
Enemy enemy;
Enemy[] enemies = new Enemy[25];


void setup(){
size(1080,720);
player = new Player();
bullet = new Bullet();
for (int i = 0; i<enemies.length; i++){
 enemies[i] = new Enemy(); 
}
  
}



void draw(){
  background(0);
 
  player.update();
  player.show();
  bullet.update();
  bullet.show();
  for(int i= 0; i < enemies.length; i++){
   enemies[i].update();
   enemies[i].show();
   
  }
  
 
  
  
}
