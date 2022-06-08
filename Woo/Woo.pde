import java.util.Scanner;
import java.util.LinkedList;
import java.io.*;
import java.util.Arrays;

Player player;
//LinkedList<String[][]> levels = parse();
String[][] originalParsed;
String STATE = "PLAY";
String[][] parsed;
String PLAYER = "@";
String WALL = "X";
String BOX = "*";
String TARGET = ".";
String PLAYERTARGET = "P";
String BOXTARGET = "T";
int scale;
int centered = 800/4;

void setup(){
 size(800, 800);
 parsed = parseFile("LevelFour");
 originalParsed = dupliKate(parsed);
 scale = 50;
 setupMap(parsed, scale);
}

void draw(){
//  while(checkWin() != true){
  if(STATE.equals("START")){
   startMenu(); 
  } else if(STATE.equals("PLAY")){
   game();
 }
}

void startMenu(){
  
}

void game(){
 background(255);
 setupMap(parsed, scale);
 //if(checkWin()){
 //  STATE = "FINISH";
 //}
}

boolean checkWin(){
 for(int y=0;y<parsed.length;y++){
  for(int x=0;x<parsed[0].length;x++){
    if(parsed[y][x].equals(BOX)) return false;
  }
 } return true;
}

void keyPressed(){
   switch(key){
    case 'w':
      move("up");
      break;
    case 'a':
      move("left");
      break;
    case 's':
      move("down");
      break;
    case 'd':
      move("right");
      break;
    case ' ':
      println("RESTART!");
      parsed = dupliKate(originalParsed);
      break;
   }
   println(Arrays.toString(parsed[5]));
   println(Arrays.toString(parsed[6]));
   println(Arrays.toString(parsed[7]));
   println();
 }

 void move(String direction){
  String oldPosition = parsed[player.getY()][player.getX()];
  String newPosition;
  int oldY, oldX, newY, newX;
  switch(direction){
    case "up":
      oldY = player.getY();
      oldX = player.getX();
      newY = player.getY()-1;
      newX = player.getX();
      newPosition = parsed[newY][newX];
      if(notNullorWall(newPosition)){ //if it's not a wall, move up
        if(oldPosition.equals(PLAYERTARGET)){ //if we're on a target
          if(newPosition.equals(TARGET)){ //if we're moving to a target
            swap(oldY, oldX, "P", newY, newX, ".");            
          } else if(newPosition.equals(BOX)){ //if we're moving a box
            if(push(direction)){
              if(newPosition.equals(TARGET)) {
                swap(oldY, oldX, PLAYERTARGET, newY, newX, ".");
              } else swap(oldY, oldX, PLAYER, newY, newX, ".");
            }            
          } else{
            swap(oldY, oldX, PLAYER, newY, newX, ".");            
          }
        } else if((newPosition.equals(BOXTARGET)) && playerAtOld(oldPosition)){ //if you're pushing a box off a target
            if(push(direction)){
              swap(oldY, oldX, "P",  newY, newX, " ");
            }         
        } else if((newPosition.equals(BOX)) && playerAtOld(oldPosition)){
            if(push(direction)){
              swap(oldY, oldX, PLAYER,  newY, newX, " ");
            } 
        } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
            swap(oldY, oldX, "P", newY, newX, " ");
        } else if(playerAtOld(oldPosition)){
          swap(oldY, oldX, PLAYER,  newY, newX, " ");
        }
      }
      break;
    case "left":
      oldY = player.getY();
      oldX = player.getX();
      newY = player.getY();
      newX = player.getX()-1;
      newPosition = parsed[newY][newX];
      if(notNullorWall(newPosition)){ //if it's not a wall, move up
        if(oldPosition.equals(PLAYERTARGET)){ //if we're on a target
          if(newPosition.equals(TARGET)){ //if we're moving to a target
            swap(oldY, oldX, "P", newY, newX, ".");            
          } else if(newPosition.equals(BOX)){ //if we're moving a box
            if(push(direction)){
              if(newPosition.equals(TARGET)) {
                swap(oldY, oldX, PLAYERTARGET, newY, newX, ".");
              } else swap(oldY, oldX, PLAYER, newY, newX, ".");
            }            
          } else{
            swap(oldY, oldX, PLAYER, newY, newX, ".");            
          }
        } else if((newPosition.equals(BOXTARGET)) && playerAtOld(oldPosition)){ //if you're pushing a box off a target
            if(push(direction)){
              swap(oldY, oldX, "P",  newY, newX, " ");
            }         
        } else if((newPosition.equals(BOX)) && playerAtOld(oldPosition)){
            if(push(direction)){
              swap(oldY, oldX, PLAYER,  newY, newX, " ");
            } 
        } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
            swap(oldY, oldX, "P", newY, newX, " ");
        } else if(playerAtOld(oldPosition)){
          swap(oldY, oldX, PLAYER,  newY, newX, " ");
        }
      }
      break;
    case "down":
      oldY = player.getY();
      oldX = player.getX();
      newY = player.getY()+1;
      newX = player.getX();
      newPosition = parsed[newY][newX];
      if(notNullorWall(newPosition)){ //if it's not a wall, move up
        if(oldPosition.equals(PLAYERTARGET)){ //if we're on a target
          if(newPosition.equals(TARGET)){ //if we're moving to a target
            swap(oldY, oldX, "P", newY, newX, ".");            
          } else if(newPosition.equals(BOX)){ //if we're moving a box
            if(push(direction)){
              if(newPosition.equals(TARGET)) {
                swap(oldY, oldX, PLAYERTARGET, newY, newX, ".");
              } else swap(oldY, oldX, PLAYER, newY, newX, ".");
            }            
          } else{
            swap(oldY, oldX, PLAYER, newY, newX, ".");            
          }
        } else if((newPosition.equals(BOXTARGET)) && playerAtOld(oldPosition)){ //if you're pushing a box off a target
            if(push(direction)){
              swap(oldY, oldX, "P",  newY, newX, " ");
            }         
        } else if((newPosition.equals(BOX)) && playerAtOld(oldPosition)){
            if(push(direction)){
              swap(oldY, oldX, PLAYER,  newY, newX, " ");
            } 
        } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
            swap(oldY, oldX, "P", newY, newX, " ");
        } else if(playerAtOld(oldPosition)){
          swap(oldY, oldX, PLAYER,  newY, newX, " ");
        }
      }
      break;
    case "right":
      oldY = player.getY();
      oldX = player.getX();
      newY = player.getY();
      newX = player.getX()+1;
      newPosition = parsed[newY][newX];
      if(notNullorWall(newPosition)){ //if it's not a wall, move up
        if(oldPosition.equals(PLAYERTARGET)){ //if we're on a target
          if(newPosition.equals(TARGET)){ //if we're moving to a target
            swap(oldY, oldX, "P", newY, newX, ".");            
          } else if(newPosition.equals(BOX)){ //if we're moving a box
            if(push(direction)){
              if(newPosition.equals(TARGET)) {
                swap(oldY, oldX, PLAYERTARGET, newY, newX, ".");
              } else swap(oldY, oldX, PLAYER, newY, newX, ".");
            }            
          } else{
            swap(oldY, oldX, PLAYER, newY, newX, ".");            
          }
        } else if((newPosition.equals(BOXTARGET)) && playerAtOld(oldPosition)){ //if you're pushing a box off a target
            if(push(direction)){
              swap(oldY, oldX, "P",  newY, newX, " ");
            }         
        } else if((newPosition.equals(BOX)) && playerAtOld(oldPosition)){
            if(push(direction)){
              swap(oldY, oldX, PLAYER,  newY, newX, " ");
            } 
        } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
            swap(oldY, oldX, "P", newY, newX, " ");
        } else if(playerAtOld(oldPosition)){
          swap(oldY, oldX, PLAYER,  newY, newX, " ");
        }
      }
      break;
    }     
  }

boolean push(String type){
  String boxPosition, newBoxPosition;
  int oldBoxPositionY, oldBoxPositionX, boxPositionY, boxPositionX;
  switch(type){
    case "up":
      oldBoxPositionY = player.getY()-1;
      oldBoxPositionX = player.getX();
      boxPositionY = oldBoxPositionY-1;
      boxPositionX = oldBoxPositionX;
      boxPosition = parsed[oldBoxPositionY][oldBoxPositionX];
      newBoxPosition = parsed[boxPositionY][boxPositionX];
      if(notNullorWall(newBoxPosition) && !(newBoxPosition.equals(BOX)) && !(newBoxPosition.equals(BOXTARGET))){
        if(newBoxPosition.equals(TARGET) && boxPosition.equals(BOXTARGET)){ //check if this is a box on a target
          swap(oldBoxPositionY, oldBoxPositionX, "T", boxPositionY, boxPositionX, ".");
        }
        else if(newBoxPosition.equals(TARGET) && boxAtOld(boxPosition)){ // if the new position is a target
          swap(oldBoxPositionY, oldBoxPositionX, "T", boxPositionY, boxPositionX, " ");
        } 
        else if(boxAtOld(boxPosition)){ //check if there is a box
          swap(oldBoxPositionY, oldBoxPositionX, "*", boxPositionY, boxPositionX, " ");
        } return true;
      } return false;
    case "left":
      oldBoxPositionY = player.getY();
      oldBoxPositionX = player.getX()-1;
      boxPositionY = oldBoxPositionY;
      boxPositionX = oldBoxPositionX-1;
      boxPosition = parsed[oldBoxPositionY][oldBoxPositionX];
      newBoxPosition = parsed[boxPositionY][boxPositionX];
      if(notNullorWall(newBoxPosition) && !(newBoxPosition.equals(BOX)) && !(newBoxPosition.equals(BOXTARGET))){
        if(newBoxPosition.equals(TARGET) && boxPosition.equals(BOXTARGET)){ //check if this is a box on a target
          println("IT PUSHED");
          swap(oldBoxPositionY, oldBoxPositionX, "T", boxPositionY, boxPositionX, ".");
        }
        else if(newBoxPosition.equals(TARGET) && boxAtOld(boxPosition)){ // if the new position is a target
          swap(oldBoxPositionY, oldBoxPositionX, "T", boxPositionY, boxPositionX, " ");
        } 
        else if(boxAtOld(boxPosition)){ //check if there is a box
          swap(oldBoxPositionY, oldBoxPositionX, "*", boxPositionY, boxPositionX, " ");
        } return true;
      } return false;
    case "down":    
      oldBoxPositionY = player.getY()+1;
      oldBoxPositionX = player.getX();
      boxPositionY = oldBoxPositionY+1;
      boxPositionX = oldBoxPositionX;
      boxPosition = parsed[oldBoxPositionY][oldBoxPositionX];
      newBoxPosition = parsed[boxPositionY][boxPositionX];
      if(notNullorWall(newBoxPosition) && !(newBoxPosition.equals(BOX)) && !(newBoxPosition.equals(BOXTARGET))){
        if(newBoxPosition.equals(TARGET) && boxPosition.equals(BOXTARGET)){ //check if this is a box on a target
          swap(oldBoxPositionY, oldBoxPositionX, "T", boxPositionY, boxPositionX, ".");
        }
        else if(newBoxPosition.equals(TARGET) && boxAtOld(boxPosition)){ // if the new position is a target
          swap(oldBoxPositionY, oldBoxPositionX, "T", boxPositionY, boxPositionX, " ");
        } 
        else if(boxAtOld(boxPosition)){ //check if there is a box
          swap(oldBoxPositionY, oldBoxPositionX, "*", boxPositionY, boxPositionX, " ");
        } return true;
      } return false;
    case "right":    
      oldBoxPositionY = player.getY();
      oldBoxPositionX = player.getX()+1;
      boxPositionY = oldBoxPositionY;
      boxPositionX = oldBoxPositionX+1;
      boxPosition = parsed[oldBoxPositionY][oldBoxPositionX];
      newBoxPosition = parsed[boxPositionY][boxPositionX];
      if(notNullorWall(newBoxPosition) && !(newBoxPosition.equals(BOX)) && !(newBoxPosition.equals(BOXTARGET))){
        if(newBoxPosition.equals(TARGET) && boxPosition.equals(BOXTARGET)){ //check if this is a box on a target
          swap(oldBoxPositionY, oldBoxPositionX, "T", boxPositionY, boxPositionX, ".");
        }
        else if(newBoxPosition.equals(TARGET) && boxAtOld(boxPosition)){ // if the new position is a target
          swap(oldBoxPositionY, oldBoxPositionX, "T", boxPositionY, boxPositionX, " ");
        } 
        else if(boxAtOld(boxPosition)){ //check if there is a box
          swap(oldBoxPositionY, oldBoxPositionX, "*", boxPositionY, boxPositionX, " ");
        } return true;
      } return false; 
  } return false;
}

void setupMap(String[][] parsed, int scale){
  for(int y = 0; y < parsed.length; y++){
    for(int x = 0; x < parsed[y].length; x++){
      switch(parsed[y][x]){
       case "X":
        (new Wall(x*scale, y*scale, scale)).draw();
        break;
       case ".":
        (new Target(x*scale + scale/2, y*scale + scale/2, scale/2)).draw();
        break;
       case "*":
        (new Box(x*scale, y*scale, scale, 0)).draw();
        break;
       case "@":
        player = new Player("emoji.png", x*scale, y*scale, scale);
        player.draw();        
        break;
       case "T":
        (new Box(x*scale, y*scale, scale, 1)).draw();
        break;
       case "P":
        player = new Player("emoji.png", x*scale, y*scale, scale);
        player.draw();
        break;
      }
    }
   }
 } // end method
 
//HELPER METHODS
boolean notNullorWall(String spot){
  return (spot != null && !spot.equals(WALL));
}

boolean playerAtOld(String position){
  return position.equals(PLAYER);
}

boolean boxAtOld(String position){
  return position.equals(BOX);
}

void swap(int oldY, int oldX, String oldPositionChar, int newY, int newX, String newPositionChar){ //swap the given characters around. Using a helper function to account for keeping the target in the same place!
      parsed[oldY][oldX] = newPositionChar;
      parsed[newY][newX] = oldPositionChar; //WEIRD
}

//PRECONDITION: file follows the right format
String[][] parseFile(String fileLocation) {
    String[] lines = loadStrings(fileLocation);
    String[][] parsed = new String[lines.length][lines[0].length()];
    for(int y = 0; y < parsed.length; y++){
      for(int x = 0; x < parsed[y].length; x++){
        parsed[y][x] = lines[y].substring(0, 1);
        lines[y] = lines[y].substring(1);
      }
    }
    return parsed;
}

String[][] dupliKate(String[][] original){
    String[][] copy = new String[original.length][original[0].length];
    for(int y = 0; y < original.length; y++){
      for(int x = 0; x < original[y].length; x++){
        copy[y][x] = original[y][x];
      }
    } return copy; 
}

LinkedList parse(){
  LinkedList<String[][]> list = new LinkedList<String[][]>();
//for(int i=0; i<25; i++){
//  levels.add(parseFile(i + ".txt");
//} 
  return list;
}
