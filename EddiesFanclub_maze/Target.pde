class Target{
  
 color Color; float x; float y; int scale;
  
 Target(float x, float y, int scale){
   Color = color(255, 19, 19);
   this.x = x;
   this.y = y;
   this.scale = scale;
 }
 
 void draw(){
   fill(Color);
   circle(this.x, this.y, scale/2);
 }
 
}
