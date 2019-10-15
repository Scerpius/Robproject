public class Move_Player {

  float xSpeed = 0;
  float ySpeed = 0;
  float maxSpeed = 10;
  float xDirection;
  float yDirection;
  float x;
  float y;
  PImage texture;
  float hp = 3;
  
  Move_Player() {
    x = width/2;
    y = height/2;
    texture = loadImage("ship.png");
  }

  void Player_dead() {
    if(Player.hp <= 0) {
    textSize(200);
    text("You dead", 300,100);
    }
  }

  void Display_Player() {
    image(texture, x, y);
  }

  void Move() { 
    //movement start
    if (up) {
      y=y-ySpeed;
      ySpeed++;
      yDirection=1;
      if (ySpeed>maxSpeed) {
        ySpeed=maxSpeed;
      }
    } else if (down) {
      y=y+ySpeed;
      ySpeed++;
      yDirection=2;
      if (ySpeed>maxSpeed) {
        ySpeed=maxSpeed;
      }
    }

    // vertical movement stop
    else if (ySpeed>0) {
      if (yDirection==2) {
        y=y+ySpeed;
        ySpeed= ySpeed -0.5;
      }  

      if (yDirection==1) {
        y=y-ySpeed;
        ySpeed= ySpeed -0.5;
      }
    }


    if (left) {
      x=x-xSpeed;
      xSpeed++;
      xDirection = 1;
      if (xSpeed > maxSpeed) {
        xSpeed = maxSpeed;
      }
    } else if (right) {
      x=x+xSpeed;
      xSpeed++;
      xDirection = 2;
      if (xSpeed > maxSpeed) {
        xSpeed = maxSpeed;
      }
    }

    //horizontal movement stop

    else if (xSpeed > 0) {
      if (xDirection == 1) {
        x=x-xSpeed;
        xSpeed= xSpeed -0.5;
      }

      if (xDirection == 2) {
        x=x+xSpeed;
        xSpeed= xSpeed -0.5;
      }
      
      if(x >= 1250){
      x = 1250; 
      }
      
      if(x <= 0){
      x = 0; 
      }
      
      if(y <= 0){
      y = 0; 
      }
      
      if(y >= 690){
      y = 690; 
      }
    }
  }
}
  
