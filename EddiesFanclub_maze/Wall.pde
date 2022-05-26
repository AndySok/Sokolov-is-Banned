class Wall{
 color WallColor; float x; float y; int scale;
  
 Wall(float x, float y, int scale){
   WallColor = color(183, 116, 8);
   this.x = x;
   this.y = y;
   this.scale = scale;
 }
 
 void draw(){
   fill(WallColor);
   rect(this.x, this.y, scale, scale);
 }
}
