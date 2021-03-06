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
    level = levels.get(transition.getLevel()-1);
    originalLevel = dupliKate(level);
    levelCounter ++;
    confirm.rectOver = false;
    STATE = "PLAY";
    println(transition.getLevel());
  }
  
  void mainMenu(){
    background(62, 55, 201); // background
    textFont(fontSizes[0]);
    textAlign(CENTER, CENTER);
    fill(130, 134, 255); // rectangle
    rect(0+(width*1/8), 0+50,width*3/4, width*0.5);
    fill(255);
    textAlign(RIGHT, CENTER);
    text("SOKOLOV", width/2+20, 90);
    textAlign(CENTER, CENTER);
    text("IS", width/2, 180);
    textAlign(LEFT, CENTER);
    text("BANNED", width/2, 270);
    textFont(fontSizes[2]);
    textAlign(CENTER, CENTER);
    fill(226, 255, 152);
    text("a SOKOBAN implementation", width/2, 360);
    textAlign(LEFT, CENTER);
    text("in Processing", width/2, 400);
    fill(255);
    confirm.draw("START");
  }
  
  void completionScreen(){
    fill(0);
    textFont(fontSizes[1]);
    textAlign(CENTER, CENTER);
    fill(190, 229, 176); 
    rect(0+(width*1/6), 0+50,width*2/3, width/4);
    fill(0);
    text("LEVEL COMPLETE!", width/2, 130);
    textFont(fontSizes[2]);
    text((levels.size() - this.getLevel()+1) + " levels remaining", width/2, 200);
    confirm.draw("next level"); 
  }
  
  void draw(){
    if(STATE.equals("START")){
      mainMenu(); 
    } else if(STATE.equals("FINISH")){
      completionScreen();
    }
  }
}
