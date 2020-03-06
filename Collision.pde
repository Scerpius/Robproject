class Collision {
  boolean hasCollision;
  boolean Plank;
  /*
   Dit zijn offsetvariabelen. De waarde maken de collision net wat mooier zodat de overlap van de twee plaatjes er wat mooier en realistischer eruit zien.
  */
  
  int offsetPortalRight = 10;
  int offsetPortalLeft = 10;
  int offsetPortalDown = 10;
  int offsetPortalUp = 10;
  
  int offsetTeleportRight = 100;
  int offsetTeleportLeft = 100;
  
  int offsetPlankRight = 40;
  int offsetPlankLeft = 40;
  int offsetPlankDown = 55;
  int offsetPlankUp = 20;
  
  int offsetCraterRight = 40;
  int offsetCraterLeft = 40;
  int offsetCraterDown = 60;
  int offsetCraterUp = 40;
  
  int offsetAllObjectsRight = 10;
  int offsetAllObjectsLeft = 10;
  int offsetAllObjectsDown = 10;
  int offsetAllObjectsUp = 10;
  
  int offsetShipDown = 40;
  int offsetShipUp = 20;
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
      if (x  < objectList[i].x + objectList[i].w - offsetPortalRight
        && x + w > objectList[i].x + offsetPortalLeft
        && y  < objectList[i].y + objectList[i].h - offsetPortalDown
        && y + h > objectList[i].y + offsetPortalUp) {
        if (objectList[i].picture == Teleportal[2] && cooldowntimer == 300) {
          if (objectList[i].x == objectList[2].x) {
            player.vx = objectList[4].x - player.x - offsetTeleportRight;
            player.vy = objectList[4].y - player.y + Teleportal[2].height/2 - spritesDown[1].height/2;
            cooldowntimer = 0;
            return true;
          } else if (objectList[i].x == objectList[4].x) {
            player.vx = objectList[2].x - player.x + offsetTeleportLeft  + Teleportal[2].width/2;
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
    Plank = false;
    for (int i = 0; i < objectList.length; i++) {
      if (objectList[i].picture == plank) {
        if (x  < objectList[i].x + objectList[i].w - offsetPlankRight
          && x + w > objectList[i].x + offsetPlankLeft
          && y  < objectList[i].y + objectList[i].h - offsetPlankDown
          && y + h > objectList[i].y + offsetPlankUp) {
          Plank = true;
        }
      } else if ( objectList[i].picture == crater) {
        if (x  < objectList[i].x + objectList[i].w - offsetCraterRight
          && x + w > objectList[i].x + offsetCraterLeft
          && y  < objectList[i].y + objectList[i].h - offsetCraterDown
          && y + h > objectList[i].y + offsetCraterUp ) {
          hasCollision = true;
        }
      }  else if ( objectList[i].picture == Ship) { 
        if (x  < objectList[i].x + objectList[i].w 
          && x + w > objectList[i].x 
          && y  < objectList[i].y + objectList[i].h - offsetShipDown 
          && y + h > objectList[i].y + offsetShipUp ) { 
          if (player.fuel == player.MaxFuel && key == 'c' || key == 'C') { 
            states=stateInput;
            state = 5;
           
            
      //      collision = true; // set boolean collision to true
      //      framecount++; //add one to framecount each frame
      //      if (framecount == animationAccelerator) { // if framecount is the same as animationAccelerator then do this
      //        framecount = 0; // reset framecount to 0
      //        cycleImage++; // change the picture in the animation
      //        flight = flight + 0.1*(flight+1);// slowly move the spaceship forward 
      //        if (shipShake <= 3.4) { // slowly up the shipshake value untill it reaches 3.5 (it says 3.4 in the code beause it go's to 3.4999999999999)
      //          shipShake = shipShake + 0.1;
      //        }
      //        if (animationAccelerator >= 6) { // if animationAccelerator is larger or equal to 6 subtract 1 from animationAccelerator each frame.
      //          animationAccelerator--;
      //        }
      //      }

      //      if (cycleImage == 3) {//if cycleImage reaches 3 reset it to 0
      //        cycleImage = 0;
      //      }
            
      //      image(activatedSpaceShip[cycleImage], objectList[i].x+random(-shipShake, shipShake)-flight, objectList[i].y+random(-shipShake, shipShake)); //here we cycle through the images and add some spicy shaky movements
      //      endCounter++; //add one to end counter each frame wich dictates when the game is about to end
      //      if (endCounter == 630) {// if endCounter gets to 630 frames counted end the game.
      //        state = 4;
      //      }
      //      player.hp = 30;// set player hp to 30, preventing player death while in the animation.
      //    }
      //  }
      //} 
          }
        }
       }
    
      
       else {
        if (x  < objectList[i].x + objectList[i].w - offsetAllObjectsRight
          && x + w > objectList[i].x + offsetAllObjectsLeft
          && y  < objectList[i].y + objectList[i].h - offsetAllObjectsDown
          && y + h > objectList[i].y + offsetAllObjectsUp) {
          if (objectList[i].picture != Teleportal[2]) {
            hasCollision = true;
          }
        }
      }
    }
    if (Plank == true) {
      return false;
    } else {
      return hasCollision;
    }
  }
}
