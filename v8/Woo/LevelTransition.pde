class LevelTransition{
  PFont font;
  int levelCounter;
  
  LevelTransition(PFont font){
    levelCounter = 0;
    this.font = font;
  }
  
  LevelTransition(PFont font, int level){
    levelCounter = level;
    this.font = font;
  }
  
  int getLevel(){
    return levelCounter;
  }
  
  int setLevel(int increment){
    levelCounter += increment;
    return levelCounter-increment;
  }
  
  void setupTransition(int level){
    
  }
  
  void draw(){
    setupTransition(this.getLevel());
    fill(0);
    textFont(font);
    fill(190, 229, 176); 
    rect(0+(width*1/6), 0+50,width*2/3, width/4);
    fill(0);
    text("CONGRATULATIONS", 0+(width*1/6)+50, width/4+20);
  }
}
