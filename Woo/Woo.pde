import java.util.Scanner;
import java.util.LinkedList;
import java.io.*;
import java.util.Arrays;

Game game = new Game();
String STATE = "START"; 
LinkedList<String[][]> levels;
LevelTransition transition;
EndScreen end;
Button confirm;
Player player;
String[][] level;
String[][] originalLevel;
PFont[] fontSizes = new PFont[4];
int scale, centeredWidth, centeredHeight, keyCounter;

void setup(){
 size(800, 600);
 levels = game.parse();
 transition = new LevelTransition(fontSizes[0], 1);
 keyCounter = 0;
 scale = 50;
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
   keyCounter++;
   if(STATE.equals("PLAY")){
     switch(key){
      case CODED:
        if(keyCode == UP){ // uses the arrow keys
          game.move("up");
        } else if(keyCode == LEFT){
          game.move("left");
        } else if(keyCode == DOWN){
          game.move("down");
        } else if(keyCode == RIGHT){
          game.move("right");
        } else{
           break; 
        } break;
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
   println(keyCounter);
 }

 void mousePressed() {
  if (confirm.rectOver) {
    transition.nextLevel();
  }
}
