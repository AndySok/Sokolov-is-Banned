class Object{
  color Color; float x; float y; int scale;
  Object(float x, float y, int scale, color Color){
    this.x = x;
    this.y = y;
    this.scale = scale;
    this.Color = Color;
 }
 
 void draw(){
   fill(Color);
   rect(this.x, this.y, scale, scale);
 }
 
 String getType(){
   return null; //do NOT USE AS AN OBJECT IN THE GAME
 }
}
