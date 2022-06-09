class Button{
  int rectX, rectY;
  color rectColor;
  color rectHighlight;
  int rectSize;
  boolean rectOver = false;
  
  
  Button(int x, int y, int size){
   rectX = x;
   rectY = y;
   rectSize = size;
   rectColor = color(190, 229, 176);
   rectHighlight = color(180, 226, 163);
  }
  
  void draw(String text) {
  update(mouseX, mouseY);
  
  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  stroke(255);
  rect(rectX, rectY, rectSize, rectSize/3);
  fill(0);
  textAlign(LEFT, CENTER);
  text(text, rectX+10, rectY+20); 
  }
  
  void update(int x, int y) {
  if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    } else {
      rectOver = false;
    }
  }

  boolean overRect(int x, int y, int width, int height)  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }

}
