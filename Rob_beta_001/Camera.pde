class Camera{
  float x, y;
  float vx, vy;
 

  
void updateScreen(){
  player.move();
  player.display();

  bullet.update();
  bullet.show();
  
}
void updateBackground(){
  background(0);
  image(backGroundLevel, 0, 0);
  fill(255);
  textSize(50);
  text = "score :";
  text(score, 150, 50);

  object.display(); 
   bob.code();
  
  teleport.display();
  teleport.checkBoundaryCollision();

  // newSpawn.display();
for (int i = 0; i < 10; i++){
  powerups[i].spawn();
  powerups[i].Display_Powerup();
}
  
}
  
  
  
  
}
