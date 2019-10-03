public class Move_Player {

  float xSpeed = 0;
  float ySpeed = 0;
  float maxSpeed = 10;
  float xDirection;
  float yDirection;
  float x;
  float y;
  float size;

  Move_Player() {
    x = width/2;
    y = height/2;
    size = 30;
  }


  void Display_Player() {
    rect(x, y, size, size);
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
        ySpeed--;
      }  

      if (yDirection==1) {
        y=y-ySpeed;
        ySpeed--;
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
        xSpeed--;
      }

      if (xDirection == 2) {
        x=x+xSpeed;
        xSpeed--;
      }
    }
  }
}
