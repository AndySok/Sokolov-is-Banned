class Box extends Object{
 Box(float x, float y, int scale, int type){
   super(x, y, scale, color(98, 26, 165));
   if(type==1){
    Color = color(100, 100, 100); 
   }
 }
 
 void draw(){
   fill(Color);
   rect(this.x, this.y, scale, scale);
 }
 
 String getType(){
   return "BOX";
 }
 
}
