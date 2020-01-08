public class spaceShip {

  boolean spaceshipHit(float x0, float y0, PImage texture0, float x1, float y1, PImage texture1) {  
    int w0 = texture0.width, 
      h0 = texture0.height, 
      w1 = texture1.width, 
      h1 = texture1.height;

    if (x0 > x1   + w1 || x0 + w0 < x1 || 
      y0 > y1 + h1 || y0 + h0 < y1)
      return false;
    else
      return true;
  }



  int spaceShipX = 640;
  int spaceShipY = 360;
  PImage spaceShip;

  spaceShip() {
    spaceShip = loadImage("BookShelf.png");
  }
  void display() {
  //  image(spaceShip, spaceShipX, spaceShipY);
  }

  void collision() {
    if (spaceshipHit(spaceShipX, spaceShipY, spaceShip, player.x, player.y, playerSprite) == true) {
      println("het werkt");
    }
  }
}
