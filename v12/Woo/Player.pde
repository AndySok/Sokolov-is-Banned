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
   photo.resize(scale, scale);
   image(photo, x, y);
 }
 
 int getX(){
   return ((int)this.x - centeredWidth) / scale; 
 }
 
 int getY(){
   return ((int)this.y - centeredHeight) / scale; 
 }
}
