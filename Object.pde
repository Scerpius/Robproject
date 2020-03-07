class Object {

  int x, y;
  int w, h;
  PImage picture;

  Object(int xPos, int yPos, PImage photo) {
    x = xPos;
    y = yPos;
    picture = photo;
    w = photo.width;
    h = photo.height;
  }

  void display() {
    image(picture, x, y);
    
  }
}
