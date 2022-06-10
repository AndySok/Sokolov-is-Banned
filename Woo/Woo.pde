import java.util.Scanner;
import java.util.LinkedList;
import java.io.*;
import java.util.Arrays;

Game game = new Game();
String STATE = "START"; 
LinkedList<String[][]> levels;
LevelTransition transition;
EndScreen end;
Counters counters;
Button confirm;
Player player;
String[][] level;
String[][] originalLevel;
PFont[] fontSizes = new PFont[4];
int scale, centeredWidth, centeredHeight;

void setup(){
 size(800, 600);
 levels = game.parse();
 transition = new LevelTransition(fontSizes[0], 1);
 scale = 50;
 counters = new Counters();
 confirm = new Button((width/2+55), 505, scale*4);
 fontSizes[0] = createFont("fonts/Blaka-Regular.ttf", 92);
 fontSizes[1] = createFont("fonts/Roboto-Bold.ttf", 56);
 fontSizes[2] = createFont("fonts/Roboto-Black.ttf", 30);
 fontSizes[3] = createFont("fonts/VarelaRound-Regular.ttf", 20);
}
  
void draw(){
  if(STATE.equals("START")){
   game.startMenu();
  } else if(STATE.equals("FINISH")){
   game.nextLevel();
  } else if(STATE.equals("COMPLETED")){
   game.endScreen();
  } else if(STATE.equals("PLAY")){
   game.game();
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
          STATE = "FINISH";
        }
        break;
      case 'p':
        if(STATE.equals("PLAY")){
          STATE = "FINISH";
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
   }
 }

 void mousePressed() {
  if (confirm.rectOver) {
    transition.nextLevel();
  }
}
