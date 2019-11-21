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
      } else if( objectList[i].picture == crater){
        if (x  < objectList[i].x + objectList[i].w - 40
          && x + w > objectList[i].x + 40
          && y  < objectList[i].y + objectList[i].h - 40
          && y + h > objectList[i].y + 40 ) {
          hasCollision = true;
        }
      }
      else{
        if (x  < objectList[i].x + objectList[i].w - 10
          && x + w > objectList[i].x + 10
          && y  < objectList[i].y + objectList[i].h - 10
          && y + h > objectList[i].y + 10) {
          hasCollision = true;
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