class Leaderboard{
  String file;
  int yourValue;
  LinkedList<Integer> leaderboard;
  Leaderboard(String file, int newVal){
    this.file = file;
    yourValue = newVal;
    leaderboard = parse(file);
  }
  
  LinkedList<Integer> parse(String file){
    String[] list = loadStrings(file);
    LinkedList<Integer> parsed = new LinkedList<Integer>();
    for(int i=0; i<list.length;i++){
      parsed.add(Integer.parseInt(list[i]));
    }
//    parsed.sort();
    return parsed;
  }
  
  void setYourValue(int val){
    yourValue = val;
  }
  
  void draw(){
    
    background(62, 55, 201); // background
    textFont(fontSizes[0]);
    textAlign(CENTER, CENTER);
    fill(130, 134, 255); // rectangle
    rect(0+(width*1/8), 0+50,width*3/4, height*0.75);
    fill(255);
    text("LEADERBOARD", width/2, 100);
    textFont(fontSizes[1]);
    textAlign(LEFT, CENTER);
    for(int i=0; i<1; i++){
      for(int j=0; j<5; j++){
        
      }
    }
//    saveStrings("leaderboard", leaderboard.toArray());
  }
}
