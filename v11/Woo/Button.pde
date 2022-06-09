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
   rectColor = color(57, 12, 163);
   rectHighlight = color(230, 57, 70);
  }
  
  void draw(String text) {
  update(mouseX, mouseY);
  
  if (rectOver) { // if mouse is over the rectangle
    fill(rectHighlight);
  } else { 
    fill(rectColor);
  }
  noStroke();
  rect(rectX, rectY, rectSize, rectSize/3);
  fill(255);
  textAlign(CENTER, CENTER);
  text(text, rectX+rectSize/2, rectY+rectSize/7); 
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
