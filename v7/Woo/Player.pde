class Player{
  
 color Color; float x; float y; int scale; PImage photo;
 
 Player(String file, float x, float y, int scale){
    photo = loadImage(file);
    this.x = x;
    this.y = y;
    this.scale = scale;
    this.Color = color(32, 194, 32);
 }
 
 void draw(){
   image(photo, x+6, y+4, (width/20), (height/20));
 }
 
 int getX(){
   return (int)this.x / scale; 
 }
 
 int getY(){
   return (int)this.y / scale; 
 }
 
 String getType(){
   return "PLAYER"; 
 }
}
