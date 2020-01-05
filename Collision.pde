class Collision {
  boolean hasCollision;
  boolean plankie;

  /* 
   Checkt collision met alle objecten in de objectenlijst.
   Als het object een plank is maakt het gebruik van een andere collision.
   Wat je meegeeft zijn de x, y, w, h. W en H zijn de breedte en grootte van de player.
   X en Y zijn de poistie waar de player naartoe wilt.
   Object[i] is het object waarmee hij de collision checkt.
   Als er collision is met de plank, kan hij wel de player wel bewegen.
   Dit is omdat de plank over de crater heen ligt. Zo heeft hij dus een collision met de plank en de crater tegelijk,
   waardoor het wel toegestaan is om te lopen.
   */
  boolean checkPortal(float x, float y, float w, float h) {
    for (int i = 2; i <= 4; i += 2) {
      if (x  < objectList[i].x + objectList[i].w - 10
        && x + w > objectList[i].x + 10
        && y  < objectList[i].y + objectList[i].h - 10
        && y + h > objectList[i].y + 10) {
        if (objectList[i].picture == Teleportal[2] && cooldowntimer == 300) {
          if (objectList[i].x == objectList[2].x) {
            player.vx = objectList[4].x - player.x - 100;
            player.vy = objectList[4].y - player.y + Teleportal[2].height/2 - spritesDown[1].height/2;
            cooldowntimer = 0;
            return true;
          } else if (objectList[i].x == objectList[4].x) {
            player.vx = objectList[2].x - player.x + 100  + Teleportal[2].width/2;
            player.vy = objectList[2].y - player.y + Teleportal[2].height/2 - spritesDown[1].height/2;
            cooldowntimer = 0;
            return true;
          }
        }
      }
    }
    return false;
  }

  boolean checkCollision(float x, float y, float w, float h) {
    hasCollision = false;
    plankie = false;
    for (int i = 0; i < objectList.length; i++) {
      if (objectList[i].picture == plank) {
        if (x  < objectList[i].x + objectList[i].w - 40
          && x + w > objectList[i].x + 40
          && y  < objectList[i].y + objectList[i].h - 55
          && y + h > objectList[i].y + 20) {
          plankie = true;
        }
      } else if ( objectList[i].picture == crater) {
        if (x  < objectList[i].x + objectList[i].w - 40
          && x + w > objectList[i].x + 40
          && y  < objectList[i].y + objectList[i].h - 60
          && y + h > objectList[i].y + 40 ) {
          hasCollision = true;
        }
      } else {
        if (x  < objectList[i].x + objectList[i].w - 10
          && x + w > objectList[i].x + 10
          && y  < objectList[i].y + objectList[i].h - 10
          && y + h > objectList[i].y + 10) {
          if (objectList[i].picture != Teleportal[2]) {
            hasCollision = true;
          }
        }
      }
    }
    if (plankie == true) {
      return false;
    } else {
      return hasCollision;
    }
  }
}
