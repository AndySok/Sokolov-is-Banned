class Wall extends Object{
 Wall(float x, float y, int scale){
   super(x, y, scale, color(183, 116, 8));
 }
 
 void draw(){
   fill(Color);
   rect(this.x, this.y, scale, scale);
 }
 
 String getType(){
   return "WALL";
 }
 
}
