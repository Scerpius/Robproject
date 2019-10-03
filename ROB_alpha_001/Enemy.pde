class Enemy {
  float x, y;
  float vx = random(-3, 3);
  float vy = random(-3, 3);

  Enemy() {
    x = random(0, width);
    y = random(0, 100);
  }


  void update() {
    x = x + vx;
    y = y + vy;


    if (x < 0 || x> width) {
      vx *= -1;
    }

    if (y<0 || y> 300) {
      vy *= -1;
    }
  }

  void show () {
    fill(255);
    noStroke();
    ellipse(x, y, 25, 25);
  }

  void collision() {
  }
}
