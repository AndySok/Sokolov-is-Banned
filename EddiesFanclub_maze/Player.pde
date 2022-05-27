class Player{
  
 color Color; float x; float y; int scale; 
 
 Player(float x, float y, int scale){
   Color = color(32, 194, 32);
   this.x = x;
   this.y = y;
   this.scale = scale;
 }
 
 void draw(){
   fill(Color);
   rect(this.x, this.y, scale, scale);
 }
 
 void keyPressed(){
   if (key == 'a'){
    fill(255);
   } else if (key == 'd'){
     fill(0);
   }
 }
 
 
}
