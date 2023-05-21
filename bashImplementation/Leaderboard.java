import java.util.Collections;
import java.util.LinkedList;

public class Leaderboard{
  String file;
  int yourValue;
  LinkedList<Integer> leaderboard;
  String[] newArray;
  Leaderboard(String file, int newVal){
    this.file = file;
    yourValue = newVal;
    leaderboard = parse(file, newVal);
    newArray = copyOf(leaderboard);
    saveStrings("leaderboard", newArray);     
  }
  
  LinkedList<Integer> parse(String file, int newVal){
    String[] list = loadStrings(file);
    LinkedList<Integer> parsed = new LinkedList<Integer>();
    for(int i=0; i<list.length;i++){
      parsed.add(Integer.parseInt(list[i]));
    }
    parsed.add(newVal);
    Collections.sort(parsed);
    return parsed;
  }
  
  String[] copyOf(LinkedList<Integer> list){
    String[] copy = new String[list.size()];
    for (int i=0 ; i<copy.length; i++){
      copy[i] = list.get(i).toString();
    } return copy;
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
    textFont(fontSizes[2]);
    textAlign(LEFT, CENTER);
    for(int i=0; i<2; i++){
      for(int j=0; j<5; j++){
        if(leaderboard.get(i*5+j) == yourValue) fill(255, 0, 0);
        else fill(255);
        text("" + (i*5+j+1) + ". " + leaderboard.get(i*5+j), width/7 + 70*(i*5), height/3 + 60*(j));
      }
    }
  }
}

