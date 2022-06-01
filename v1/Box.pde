class Box extends Object{
 Box(float x, float y, int scale){
   super(x, y, scale, color(98, 26, 165));
 }
 
 void draw(){
   fill(Color);
   rect(this.x, this.y, scale, scale);
 }
 
 String getType(){
   return "BOX";
 }
 
}
