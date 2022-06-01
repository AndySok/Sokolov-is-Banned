class Player{
  
 color Color; float x; float y; int scale; 
 
 Player(float x, float y, int scale){
    this.x = x;
    this.y = y;
    this.scale = scale;
    this.Color = color(32, 194, 32);
 }
 
 void draw(){
   fill(Color);
   rect(this.x, this.y, scale, scale);
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
