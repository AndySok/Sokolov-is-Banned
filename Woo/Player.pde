class Player{
  
 color Color; float x; float y; int scale; 
 PShape s;
 
 Player(String file, float x, float y, int scale){
    this.s = loadShape(file);
    this.x = x;
    this.y = y;
    this.scale = scale;
    //this.Color = color(32, 194, 32);
 }
 
 void draw(){
   shape(s, x*scale, y*scale, 20, 20);
   //fill(Color);
   //rect(this.x, this.y, scale, scale);
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
