class Target extends Object{
  
 Target(float x, float y, int scale){
   super(x, y, scale, color(255, 19, 19));
 }
 
 void draw(){
   fill(Color);
   circle(this.x, this.y, scale/2);
 }
 
 String getType(){
   return "TARGET"; 
 }
 
}
