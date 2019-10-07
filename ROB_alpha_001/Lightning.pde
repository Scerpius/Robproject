class Bubble{
  float x1; 
  float y1;
  float x2;
  float y2;
  
  Bubble(){
    x1 = random(width-width+30, width-width+ 95);
    y1 = height-height + 140;
    x2 = random(width-width+30, width-width+ 95);
    y2 = height-height + 100;
    
  }
  void display(){
  

  }
  
  
  void ascend(){
    y1 -=0.5;
    y2 -=0.5;
    
    
  }
  
  
  void top(){
     if(y1 == 40){
     y1 = height-height + 150; x1 = random(width-width+30, width-width+ 95); }
     
     if(y2 <= 40){
     y2 = height-height + 150; x2 = random(width-width+30, width-width+ 95); }
    

    }
    
  }
