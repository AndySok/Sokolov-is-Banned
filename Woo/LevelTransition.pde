class LevelTransition{
  PFont headingFont;
  int levelCounter;
  
  LevelTransition(PFont font){
    levelCounter = 0;
    this.headingFont = font;
  }
  
  LevelTransition(PFont font, int level){
    levelCounter = level;
    this.headingFont = font;
  }
  
  int getLevel(){
    return levelCounter;
  }
  
  void nextLevel(){
    levelCounter ++;
  }
  
  void setupTransition(int level){
    
  }
  
  void draw(){
    setupTransition(this.getLevel());
    fill(0);
    textFont(fontSizes[1]);
    textAlign(CENTER, CENTER);
    fill(190, 229, 176); 
    rect(0+(width*1/6), 0+50,width*2/3, width/4);
    fill(0);
    text("LEVEL COMPLETE!", width/2, 130);
    textFont(fontSizes[2]);
    text((levels.size() - this.getLevel()) + " remaining", width/2, 200);
    confirm.draw();
    fill(0);
    text("next level", (width/2+125)+scale, 500+scale);
  }
}
