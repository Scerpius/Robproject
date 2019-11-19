class Object2 {

  int x, y;
  int w, h;
  PImage picture;

  Object2(int xPos, int yPos, PImage photo) {
    x = xPos;
    y = yPos;
    picture = photo;
    w = photo.width;
    h = photo.height;
  }

  void draw() {
    image(picture, x, y);
  }
  
//  boolean Collision(Object2 collider){
  
    
//  }
}
