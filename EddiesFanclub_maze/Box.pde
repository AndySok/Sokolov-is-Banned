class Box {
  
 color Color; float x; float y; int scale;
  
 Box(float x, float y, int scale){
   Color = color(98, 26, 165);
   this.x = x;
   this.y = y;
   this.scale = scale;
 }
 
 void draw(){
   fill(Color);
   rect(this.x, this.y, scale, scale);
 }
 
}
