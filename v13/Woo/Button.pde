//gracefully inspired by https://processing.org/examples/button.html
class Button{
  int rectX, rectY;
  int rectSize;
  int type; //1 is square, 2 is circle
  color rectColor;
  color rectHighlight;
  boolean circleOver = false;
  boolean rectOver = false;
  
  Button(int x, int y, int size, int type){
   rectX = x;
   rectY = y;
   rectSize = size;
   this.type = type;
   rectColor = color(57, 12, 163);
   rectHighlight = color(230, 57, 70);
  }
  
  void draw(String text) {
  update(mouseX, mouseY);
  noStroke();
  if(type == 1){
    if (rectOver) { // if mouse is over the rectangle
      fill(rectHighlight);
    } else { 
      fill(rectColor);
    }
    rect(rectX, rectY, rectSize, rectSize/3);
    fill(255);
    textAlign(CENTER, CENTER);
    text(text, rectX+rectSize/2, rectY+rectSize/7); 
  } else if (type == 2){
    if (circleOver) { // if mouse is over the rectangle
      fill(rectHighlight);
    } else { 
      fill(rectColor);
    }
      ellipseMode(CENTER);
      ellipse(rectX, rectY, rectSize, rectSize);
      fill(255);
      textAlign(CENTER, CENTER);
      text(text, rectX+1, rectY-2);     
    } 
  }
  
  void update(int x, int y) {
  if(type == 1){
    if ( overRect(rectX, rectY, rectSize, rectSize) ) {
      rectOver = true;
    } else {
      rectOver = false;
    }
  } 
  else if(type == 2){
    if ( overCircle(rectX, rectY, rectSize) ) {
      circleOver = true;
    } else {
      circleOver = false;
    }    
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

  boolean overCircle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } else {
      return false;
    }
  }

}
