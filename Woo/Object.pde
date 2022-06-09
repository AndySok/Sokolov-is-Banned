class Object{
  color Color; float x; float y; int scale; PImage photo;
  Object(float x, float y, int scale, color Color){
    this.x = x;
    this.y = y;
    this.scale = scale;
    this.Color = Color;
 }
 
  Object(String file, float x, float y, int scale){
    photo = loadImage(file);
    this.x = x;
    this.y = y;
    this.scale = scale;
 }
 
 void draw(){
   if(photo != null){
     photo.resize(scale, scale);
     image(photo, x, y);
   } else{
     fill(Color);
     rect(this.x, this.y, scale, scale);
   }
 }
}
