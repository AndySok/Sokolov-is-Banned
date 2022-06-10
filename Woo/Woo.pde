import java.util.Scanner;
import java.util.LinkedList;
import java.io.*;
import java.util.Arrays;

Game game = new Game();
String STATE = "START"; 
LinkedList<String[][]> levels;
LevelTransition transition;
Leaderboard leaderboard;
Counters counters;
Button confirm, start, home;
Player player;
String[][] level;
String[][] originalLevel;
PFont[] fontSizes = new PFont[4];
int scale, centeredWidth, centeredHeight;

void setup(){
 size(800, 600);
 levels = game.parse();
 transition = new LevelTransition(fontSizes[0], 0);
 scale = 50;
 counters = new Counters();
 start = new Button((width/2+55), 505, scale*4, 1);
 confirm = new Button((width/2-scale*2), 350, scale*4, 1);
 home = new Button(scale, scale, scale, 2);
 fontSizes[0] = createFont("fonts/Blaka-Regular.ttf", 92);
 fontSizes[1] = createFont("fonts/Roboto-Bold.ttf", 56);
 fontSizes[2] = createFont("fonts/Roboto-Black.ttf", 30);
 fontSizes[3] = createFont("fonts/VarelaRound-Regular.ttf", 20);
}
  
void draw(){
  if(STATE.equals("START")){
   game.startMenu();
  } else if(STATE.equals("PLAY")){
   game.game();
  } else if(STATE.equals("FINISH") || STATE.equals("COMPLETED")){
   game.nextLevel();
  } else if(STATE.equals("LEADERBOARD")){
   game.leaderboard(); 
  }
}

void keyPressed(){
   if(STATE.equals("PLAY")){
     switch(key){
      case CODED:
        if(keyCode == UP){ // uses the arrow keys
          if(game.move("up")) counters.countUp();
        } else if(keyCode == LEFT){
          if(game.move("left")) counters.countUp();
        } else if(keyCode == DOWN){
          if(game.move("down")) counters.countUp();
        } else if(keyCode == RIGHT){
          if(game.move("right")) counters.countUp();
        } else{
           break; 
        } break;
      case 'w':
        if(game.move("up")) counters.countUp();
        break;
      case 'W':
        if(game.move("up")) counters.countUp();
        break;
      case 'a':
        if(game.move("left")) counters.countUp();
        break;
      case 'A':
        if(game.move("left")) counters.countUp();
        break;
      case 's':
        if(game.move("down")) counters.countUp();
        break;
      case 'S':
        if(game.move("down")) counters.countUp();
        break;
      case 'd':
        if(game.move("right")) counters.countUp();
        break;
      case 'D':
        if(game.move("right")) counters.countUp();
        break;
      case 'P':
        if(STATE.equals("PLAY")){
          game.finishLevel();
        }
        break;
      case 'p':
        if(STATE.equals("PLAY")){
          game.finishLevel();
        }
        break;
      case ' ':
        println("RESTART!");
        level = game.dupliKate(originalLevel);
        break;
     }
   }
   if(key == ENTER){
     if(STATE.equals("FINISH")){
       transition.nextLevel();
     }
   } else if(key == TAB){
     game.createLeaderboard();
   }
 }

 void mousePressed() {
  if (home.circleOver) {
    STATE = "START";
    home.circleOver = false;
  }
  if (start.rectOver) {
    transition.levelCounter = 1;
    counters.keyCounter = 0;
    transition.nextLevel();
    start.rectOver = false;
  }
  if (confirm.rectOver) {
    if(STATE.equals("FINISH")){
      transition.nextLevel();
      confirm.rectOver = false;
    }
    else if(STATE.equals("COMPLETED")){
      leaderboard.setYourValue(counters.keyCounter);
      game.createLeaderboard();
      confirm.rectOver = false;
    }
  }
}
