import java.util.Scanner;
import java.io.*;
import java.util.Arrays;

Player player;
String[][] parsed;
String WALL = "X";
String BOX = "*";
String TARGET = ".";
String PLAYERTARGET = "P";
String BOXTARGET = "T";
int scale;

void setup(){
 size(700, 700);
 parsed = parseFile("LevelSample");
 scale = 40;
 setupMap(parsed, scale);
}

void draw(){
 background(255);
 setupMap(parsed, scale);
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
   }
//   println(Arrays.toString(parsed[1]));
//   println(Arrays.toString(parsed[2]));
//   println(Arrays.toString(parsed[3]));
 }

 void move(String direction){
  String oldPosition = parsed[player.getY()][player.getX()];
  String newPosition;
  switch(direction){
    case "up":
      newPosition = parsed[player.getY()-1][player.getX()];
      if(notNullorWall(newPosition)){
//        println("UP");
        if(oldPosition.equals(PLAYERTARGET)){
          swap(player.getY(), player.getX(), "@", player.getY()-1, player.getX(), ".");
        } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
          swap(player.getY(), player.getX(), "P", player.getY()-1, player.getX(), " ");
        } else if(newPosition.equals(BOX) && playerAtOld(oldPosition)){
          if(push("up")){
            swap(player.getY(), player.getX(), "@",  player.getY()-1, player.getX(), " ");
          }
          println("PUSHUP");
        } else if(playerAtOld(oldPosition)){
          swap(player.getY(), player.getX(), "@",  player.getY()-1, player.getX(), " ");
        }
      }
      break;
    case "left":
      newPosition = parsed[player.getY()][player.getX()-1];
      if(notNullorWall(newPosition)){
//        println("LEFT");
        if((oldPosition.equals(PLAYERTARGET))){
          swap(player.getY(), player.getX(), "@", player.getY(), player.getX()-1, ".");
        } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
          swap(player.getY(), player.getX(), "P", player.getY(), player.getX()-1, " ");
        } else if(newPosition.equals(BOX) && playerAtOld(oldPosition)){
          println("PUSHLEFT");
        } else if(playerAtOld(oldPosition)){
          swap(player.getY(), player.getX(), "@", player.getY(), player.getX()-1, " ");
        }
      }
      break;
    case "down":
      newPosition = parsed[player.getY()+1][player.getX()];
      if(notNullorWall(newPosition)){
//        println("DOWN");
        if(oldPosition.equals(PLAYERTARGET)){
          swap(player.getY(), player.getX(), "@", player.getY()+1, player.getX(), ".");
        } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
          swap(player.getY(), player.getX(), "P", player.getY()+1, player.getX(), " ");
        } else if(newPosition.equals(BOX) && playerAtOld(oldPosition)){
          println("PUSHDOWN");
        } else if(playerAtOld(oldPosition)){
          swap(player.getY(), player.getX(), "@", player.getY()+1, player.getX(), " ");
        }
      }
      break;
    case "right":
      newPosition = parsed[player.getY()][player.getX()+1];
      if(notNullorWall(newPosition)){
//        println("RIGHT");
        if((oldPosition.equals(PLAYERTARGET))){
          swap(player.getY(), player.getX(), "@", player.getY(), player.getX()+1, ".");
        } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
          swap(player.getY(), player.getX(), "P", player.getY(), player.getX()+1, " ");
        } else if(newPosition.equals(BOX) && playerAtOld(oldPosition)){
          println("PUSHRIGHT");
        } else if(playerAtOld(oldPosition)){
          swap(player.getY(), player.getX(), "@", player.getY(), player.getX()+1, " ");
        }
      }
      break;
    }     
  }

boolean push(String type){
  String boxPosition, newBoxPosition;
  int boxPositionY, boxPositionX;
  switch(type){
    case "up":
      boxPositionY = player.getY()-1;
      boxPositionX = player.getX();
      boxPosition = parsed[boxPositionY][boxPositionX];
      newBoxPosition = parsed[boxPositionY-1][boxPositionX];
      if(notNullorWall(newBoxPosition)){
        if(boxPosition.equals(BOXTARGET)){
          swap(boxPositionY, boxPositionX, "T", boxPositionY-1, boxPositionX, ".");
        } else if(newBoxPosition.equals(TARGET) && boxAtOld(boxPosition)){
          swap(boxPositionY, boxPositionX, "T", boxPositionY-1, boxPositionX, " ");
        } else if(boxAtOld(boxPosition)){
          swap(boxPositionY, boxPositionX, "*", boxPositionY-1, boxPositionX, " ");
        }
        return true;
      } return false;   
    case "left":
      boxPositionY = player.getY();
      boxPositionX = player.getX()-1;
      boxPosition = parsed[boxPositionY][boxPositionX];
      newBoxPosition = parsed[boxPositionY-1][boxPositionX];
      if(notNullorWall(newBoxPosition)){
        if(boxPosition.equals(BOXTARGET)){
          swap(boxPositionY, boxPositionX, "T", boxPositionY-1, boxPositionX, ".");
        } else if(newBoxPosition.equals(TARGET) && boxAtOld(boxPosition)){
          swap(boxPositionY, boxPositionX, "T", boxPositionY-1, boxPositionX, " ");
        } else if(boxAtOld(boxPosition)){
          swap(boxPositionY, boxPositionX, "*", boxPositionY-1, boxPositionX, " ");
        }
        return true;
      } return false;
//      return;
//    case "down":    
//      return;      
//    case "right":    
//      return;
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
        player = new Player(x*scale, y*scale, scale);
        player.draw();        
        break;
       case "T":
        (new Box(x*scale, y*scale, scale, 1)).draw();
        break;
       case "P":
        player = new Player(x*scale, y*scale, scale);
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
  return position.equals("@");
}

boolean boxAtOld(String position){
  return position.equals("*");
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
    } return parsed;
}
