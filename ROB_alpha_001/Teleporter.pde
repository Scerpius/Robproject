class Teleporter {
  int portalX1 = 80;
  int portalY1 = 80;
  int portalY2 = height-80; 
  int portalX2 = width - 80;


  void display() {

    int iColor = 5;
    iColor+=8;
    //Teleporter Linksboven//
    for (int iPortal = 120; iPortal > 0; iPortal -=10) {
      
      noStroke();
      
      fill(148, 0, 211, iColor);
      ellipse(portalX1, portalY1, iPortal, iPortal);

      stroke(0);
      ellipse(portalX1, portalY1, 120, 120);


      //Teleporter Rechtsonder//

      noStroke();
      fill(148, 0, 211, iColor);

      ellipse(portalX2, portalY2, iPortal, iPortal);

      stroke(0);
      ellipse(portalX2, portalY2, 120, 120);
    }




  }
}
