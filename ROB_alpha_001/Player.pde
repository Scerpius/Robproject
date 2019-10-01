class Player {
  float x, y;
  float vx, vy;
  PImage texture;
  Player() {
    texture = loadImage("ship.png");
    reset();
  }
  
  void reset() {
   x = width/2;
   y = 450;
    
  }
  
  void update() {
   vx = 0;
   vy = 0;
   if (keys[LEFT]) vx = - 10;
   if (keys[RIGHT]) vx =  10;
   if (keys[UP]) vy = -10;
   if (keys[DOWN]) vy = 10;
   x += vx;
   y += vy;
   
    
  }
  
  void show(){
   image(texture,x,y);
   //fill(255);
   // rect(x,y,50,50); 
    
    
  }
  
  
  
  
  
  }
