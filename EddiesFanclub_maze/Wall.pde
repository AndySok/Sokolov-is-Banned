class Wall{
 color Color; float x; float y; int scale;
  
 Wall(float x, float y, int scale){
   Color = color(183, 116, 8);
   this.x = x;
   this.y = y;
   this.scale = scale;
 }
 
 void draw(){
   fill(Color);
   rect(this.x, this.y, scale, scale);
 }
}
