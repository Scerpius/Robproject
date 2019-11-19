class Collision {
  boolean top, bottom, left, right;

  boolean hasCollision() {
    boolean collision = false;
    //CHECK COLLISION
    if (player.x < object.CRATER_X + object.CRATER_WIDTH -20
      && player.x + player.player.width > object.CRATER_X +20
      && player.y < object.CRATER_Y + object.CRATER_HEIGHT - 130 
      && player.y + player.player.height > object.CRATER_Y + 70) {
      collision = true;

      //CHECK COLLISION TOP
      if (player.y + player.player.height > object.CRATER_Y + 70
        && player.y < object.CRATER_Y + object.CRATER_HEIGHT -130 
        && player.x + player.player.width > object.CRATER_X +20
        && player.x < object.CRATER_X + object.CRATER_WIDTH -20) {
        bottom = true;
        top = false;
        right = false;
        left = false;
      }
      //CHECK COLLISION LEFT
      else if (player.x + player.player.width > object.CRATER_X +20 
        && player.y + player.player.height > object.CRATER_Y +70 
        && player.y < object.CRATER_Y + object.CRATER_HEIGHT - 130) {
        right = true;
        left = false;
        top = false;
        bottom = false;
      }
      //CHECK COLLISION RIGHT
      else if (player.x < object.CRATER_X + object.CRATER_WIDTH -20
        && player.y + player.player.height > object.CRATER_Y +70
        && player.y < object.CRATER_Y + object.CRATER_HEIGHT -130) {
        left = true;
        right = false;
        top = false;
        bottom = false;
      }
      //CHECK COLLISION BOTTOM
      else {
        top = true;
        bottom = false;
        right = false;
        left = false;
      }
    }
    return collision;
  }

  boolean collidesWithPlank() {
    boolean collision = false;

    //CHECK COLLISION
    if (player.x < object.PLANK_X + object.plank.width 
      && player.x + player.player.width > object.PLANK_X 
      && player.y < object.PLANK_Y + object.plank.height 
      && player.y + player.player.height > object.PLANK_Y) {
      collision = true;
    }

    return collision;
  }
}
