class Timer {
  float Time;

  Timer (float set) {
    Time = set;
  }
  float getTime() {
    return(Time);
  }
  void setTime(float set) {
    Time = set;
  }

  void countUp() {
   // //if (key == CODED){r
   // //  if (keyCode == LEFT || keyCode == DOWN || keyCode == RIGHT || keyCode == UP) {
        
        
   //  textSize(20); 
   //  if (ms<=119) {
   //   //text(h + ":" + min, width/2, 30);
   //  ms = ms + 1;
   // } else {
   //   s = s + 1;
   //   ms = 0;
   //   //text(h + ":" + 0 + min, width/2, 30);
   //   ms = ms + 1;
   //  }
   //  if (s<=9){
   //    text(min + " : " + 0 + s, width / 4, 30);
   //    ms = ms + 1;
   //  }
   //  else if (s<=59){
   //    text(min + " : " + s, width / 4, 30);
   //    ms = ms + 1;
   //  } else { 
   //    min = min + 1;
   //    s = 0;
   //    text(min + " : " + 0 + s, width / 4, 30);
   //    ms = ms + 1;
   //  //}
   // //}
   //}
  
   if(frameCount % 60 == 0){
     s = s+ 1;
   }
   textSize(20); 
   text(s, width / 4, 30);
  }
}
