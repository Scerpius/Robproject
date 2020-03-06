//de class waar de kogel wordt aangemaakt
public class  Kogel {

  float x;// de x waarde van de kogel
  float y;// de y waarde van de kogel
  float vx = 0; // de x snelheid van de kogel
  float vy = 0;// de y snehlheid van de kogel
  float dx = -999, dy = -999; 

  boolean fireD = false;
  boolean fireU = false;
  boolean fireR = false;
  boolean fireL = false;
  PImage texture;

  boolean kogelHit(float x1, float y1, PImage texture1, float x2, float y2, PImage texture2) {  
    int w1 = texture1.width, 
      h1 = texture1.height, 
      w2 = texture2.width, 
      h2 = texture2.height;

    if (x1 > x2   + w2 || x1 + w1 < x2 || 
      y1 > y2 + h2 || y1 + h1 < y2)
      return false;
    else
      return true;
  }

  Kogel(float _x, float _y, float directionX, float directionY) { // waardes van de kogel om het door te sturen naar de shooter
     //hier hebben we een class gemaakt die elementen opvraagt uit een andere class, namelijk die van shooter.
    //hierdoor kunnen wij de kogel een plaats en richting geven
    x = _x;
    y = _y;
    dx = directionX;
    dy = directionY;
    vx += dx;
    vy += dy;

    texture = loadImage("bullet.png");
  }

  void show() {
    image(texture, x, y); // het showen  van de texture in de game
  }

  void reset() { // waar de waardes heen moeten gaan als gereset wordt
  //als de kogel een speler raakt of buiten het bereik van het veld is moet de kogel verdwijnen
  //door hem geen snelheid meer mee te geven en naar buiten het veld te teleporteren
    x = -1000;    
    vy = 0;
    vx = 0;
    dx = 0;
    dy = 0;
  }

  void shoot() {
//als deze void wordt aangeroepen moet de kogel in een bepaalde richting geschoten worden. Deze richting wordt bepaald door de dX en dY in shooter
    x += vx;// het bewegen van de kogel op zn snelheid - de snelheid van de player
    y += vy;

    if (kogelHit(x, y, texture, player.x, player.y, playerSprite) == true) {// wat er moet gebeuren als er collision is met de player
    //zodra de speler geraakt is moet de kogel gereset worden
      if (player.shield) {
        player.shield = false; 
        bulletInvisibility = true;
      }
      if (player.shield == false) {
        if (!bulletInvisibility) {
          player.hp -= 1;
        }
        bulletInvisibility = true;
        reset();
      }
    }

    /* // als de detectie klopt dan moet de kogel bewegen 
    if (fireD) {
     println(vy);
     y+= vy;
     
     }
     if (fireU) {
     println(vy);
     y-= vy;
     
     }
     if (fireR) {
     x+= vx;
     
     }
     if (fireL) {
     x-= vx;
     
     }*/
  }
}
