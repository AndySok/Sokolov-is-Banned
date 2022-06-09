import java.util.Scanner;
import java.util.LinkedList;
import java.io.*;
import java.util.Arrays;

Game game = new Game();
String STATE = "START"; 
LinkedList<String[][]> levels;
LevelTransition transition;
Button confirm;
Player player;
String[][] level;
String[][] originalLevel;
PFont[] fontSizes = new PFont[4];
int scale;
int centeredWidth = width;
int centeredHeight = height;



void setup(){
 levels = game.parse();
 size(800, 600);
 scale = 50;
 confirm = new Button((width/2+55), 505, scale*4);
 fontSizes[0] = createFont("fonts/Blaka-Regular.ttf", 92);
 fontSizes[1] = createFont("fonts/Roboto-Bold.ttf", 56);
 fontSizes[2] = createFont("fonts/Roboto-Black.ttf", 30);
 fontSizes[3] = createFont("fonts/VarelaRound-Regular.ttf", 20);
 transition = new LevelTransition(fontSizes[0], 1);
}

void draw(){
  if(STATE.equals("START")){
   startMenu();
  } else if(STATE.equals("FINISH")){
   nextLevel();
  }
  else if(STATE.equals("PLAY")){
   game();
 }
}

void startMenu(){
  background(255);
  level = levels.get(transition.getLevel()-1); //CHANGE LEVEL
  originalLevel = game.dupliKate(level);
  transition.draw();
}

void nextLevel(){
// background(255);
 transition.draw();
}

void game(){
 background(255);
 game.setupMap(level, scale);
 scale = 30;
// levelCounter(transition.getLevel());
 if(checkWin()){
   STATE = "FINISH";
 }
}

boolean checkWin(){
 for(int y=0;y<level.length;y++){
  for(int x=0;x<level[0].length;x++){
    if(level[y][x].equals("*")) return false;
  }
 } return true;
}

void keyPressed(){
   switch(key){
    case CODED:
      if(keyCode == UP){
        game.move("up");
      } else if(keyCode == LEFT){
        game.move("left");
      } else if(keyCode == DOWN){
        game.move("down");
      } else if(keyCode == RIGHT){
        game.move("right");
      }
      break;
    case 'w':
      game.move("up");
      break;
    case 'W':
      game.move("up");
      break;
    case 'a':
      game.move("left");
      break;
    case 'A':
      game.move("left");
      break;
    case 's':
      game.move("down");
      break;
    case 'S':
      game.move("down");
      break;
    case 'd':
      game.move("right");
      break;
    case 'D':
      game.move("right");
      break;
    case 'P':
      if(STATE.equals("PLAY")){
        STATE = "FINISH";
      }
    case 'p':
      if(STATE.equals("PLAY")){
        STATE = "FINISH";
      }
    case ' ':
      println("RESTART!");
      level = game.dupliKate(originalLevel);
      break;
   }
 }

   void mousePressed() {
    if (confirm.rectOver) {
      transition.nextLevel();
    }
  }


void levelCounter(int current){
 println("" + current + "/" + levels.size());
}

//PRECONDITION: file follows the right format
String[][] parseFile(String fileLocation) {
    String[] lines = loadStrings(fileLocation);
    String[][] level = new String[lines.length][lines[0].length()];
    for(int y = 0; y < level.length; y++){
      for(int x = 0; x < level[y].length; x++){
        level[y][x] = lines[y].substring(0, 1);
        lines[y] = lines[y].substring(1);
      }
    }
    return level;
}
