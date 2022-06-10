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
    textAlign(LEFT, CENTER);
    fill(0);
    textFont(fontSizes[2]);
    text("Moves: " + MoveCounter, 10, height-60);
    text("Level: " + LevelCounter, 10, height-30);
  }
}
