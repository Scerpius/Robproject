public class spaceShip {

  boolean spaceshipHit(float x1, float y1, PImage texture1, float x2, float y2, PImage texture2) {  
    int w1 = texture1.width, 
      h1 = texture1.height, 
      w2 = texture2.width, 
      h2 = texture2.height;

    if (x1 > x2   + w2 || x1 + w1 < x2 ||  // de collision 
      y1 > y2 + h2 || y1 + h1 < y2)
      return false;
    else
      return true;
  }



  int spaceShipX = 640;// waardes van het spaceship
  int spaceShipY = 360;
  PImage spaceShip;

  spaceShip() {
    //spaceShip = loadImage("SpaceShip.png");// texture inladen
  }
  void display() { 
   // image(spaceShip, spaceShipX, spaceShipY); // texture showen in de game op zn waardes
  }

  void collision() {
    //if (spaceshipHit(spaceShipX, spaceShipY, spaceShip, player.x, player.y, playerSprite) == true) { wat er moet gebeuren als er collision is
    //  if(player.fuel == player.MaxFuel && key == 'c' || key == 'C'){ wat er moet gebeuren als de fuel max is en de 'c' wordt in gelikt
    //    state = 4;  naar het eindscherm toe gaan
    //  }
    //  println("het werkt");
    //}
  }
}
