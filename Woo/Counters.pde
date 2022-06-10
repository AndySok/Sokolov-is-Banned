class Counters{
  String LevelCounter, MoveCounter;
  int keyCounter;
  
  Counters(){
    keyCounter = 0;
    LevelCounter = "" + transition.getLevel() + "/" + levels.size();
    MoveCounter = "" + keyCounter;
  }
  
  void countUp(){
    keyCounter++;
  }
  
  void draw(){
    LevelCounter = "" + (transition.getLevel()-1) + "/" + levels.size();
    MoveCounter = "" + keyCounter;    
    fill(0);
    textFont(fontSizes[2]);
    if(transition.getLevel() == 2){
      textAlign(LEFT, CENTER);
      text("use arrow keys to move", width-350, height-30);
    }
    textAlign(LEFT, CENTER);
    text("Moves: " + MoveCounter, 10, height-60);
    text("Level: " + LevelCounter, 10, height-30);
  }
}
