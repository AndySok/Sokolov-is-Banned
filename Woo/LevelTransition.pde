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
  
  void draw(){
    fill(0);
    textFont(font);
    text("Test", width-(width*1/3), height-50);
  }
}
