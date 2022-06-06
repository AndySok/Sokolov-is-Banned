<<<<<<< HEAD
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
   println(Arrays.toString(parsed[1]));
   println(Arrays.toString(parsed[2]));
   println(Arrays.toString(parsed[3]));
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
          swap("up", player.getY(), player.getX(), "@", player.getY()-1, player.getX(), ".");
        } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
          swap("up", player.getY(), player.getX(), "P", player.getY()-1, player.getX(), " ");
        } else if(newPosition.equals(BOX) && playerAtOld(oldPosition)){
          push("up");
          println("PUSHUP");
        } else if(playerAtOld(oldPosition)){
          swap("up", player.getY(), player.getX(), "@",  player.getY()-1, player.getX(), " ");
        }
      }
      break;
    case "left":
      newPosition = parsed[player.getY()][player.getX()-1];
      if(notNullorWall(newPosition)){
//        println("LEFT");
        if((oldPosition.equals(PLAYERTARGET))){
          swap("left", "@", ".");
        } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
          swap("left", "P", " ");
        } else if(newPosition.equals(BOX) && playerAtOld(oldPosition)){
          println("PUSHLEFT");
        } else if(playerAtOld(oldPosition)){
          swap("left", "@", " ");
        }
      }
      break;
    case "down":
      newPosition = parsed[player.getY()+1][player.getX()];
      if(notNullorWall(newPosition)){
//        println("DOWN");
        if(oldPosition.equals(PLAYERTARGET)){
          swap("down", "@", ".");
        } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
          swap("down", "P", " ");
        } else if(newPosition.equals(BOX) && playerAtOld(oldPosition)){
          println("PUSHDOWN");
        } else if(playerAtOld(oldPosition)){
          swap("down", "@", " ");
        }
      }
      break;
    case "right":
      newPosition = parsed[player.getY()][player.getX()+1];
      if(notNullorWall(newPosition)){
//        println("RIGHT");
        if((oldPosition.equals(PLAYERTARGET))){
          swap("right", "@", ".");
        } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
          swap("right", "P", " ");
        } else if(newPosition.equals(BOX) && playerAtOld(oldPosition)){
          println("PUSHRIGHT");
        } else if(playerAtOld(oldPosition)){
          swap("right", "@", " ");
        }
      }
      break;
    }     
  }

void swap(String type, int oldY, int oldX, String oldPositionChar, int newY, int newX, String newPositionChar){ //swap the given characters around. Using a helper function to account for keeping the target in the same place!
  switch(type){
    case "up":
      parsed[oldY][oldX] = newPositionChar;
      parsed[newY][newX] = oldPositionChar; //WEIRD
      return;
    case "left":
      parsed[player.getY()][player.getX()] = newPositionChar;
      parsed[player.getY()][player.getX()-1] = oldPositionChar; //WEIRD
      return;
    case "down":
      parsed[player.getY()][player.getX()] = newPositionChar;
      parsed[player.getY()+1][player.getX()] = oldPositionChar; //WEIRD
      return;
    case "right":
      parsed[player.getY()][player.getX()] = newPositionChar;
      parsed[player.getY()][player.getX()+1] = oldPositionChar; //WEIRD
      return;
  }
}

void push(String type){
  String boxPosition, newBoxPosition;
  switch(type){
    case "up":
      boxPosition = parsed[player.getY()-1][player.getX()];
      newBoxPosition = parsed[player.getY()-2][player.getX()];
      if(notNullorWall(newBoxPosition)){
        if(boxPosition.equals(BOXTARGET)){
          swap("up", "T", ".");
        } else if(newBoxPosition.equals(TARGET) && boxAtOld(boxPosition)){
          swap("up", "T", " ");
        } else if(boxAtOld(boxPosition)){
          swap("up", "*", " ");
        }
      }    
      return;
    case "left":
    
      return;
    case "down":
    
      return;
      
    case "right":
    
      return;
  }
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
 
//BOOLEAN METHODS
boolean notNullorWall(String spot){
  return (spot != null && !spot.equals(WALL));
}

boolean playerAtOld(String position){
  return position.equals("@");
}

boolean boxAtOld(String position){
  return position.equals("*");
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
=======
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
          swap("up", "@", ".");
        } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
          swap("up", "P", " ");
        } else if(newPosition.equals(BOX) && playerAtOld(oldPosition)){
          println("PUSHUP");
        } else if(playerAtOld(oldPosition)){
          swap("up", "@", " ");
        }
      }
      break;
    case "left":
      newPosition = parsed[player.getY()][player.getX()-1];
      if(notNullorWall(newPosition)){
//        println("LEFT");
        if((oldPosition.equals(PLAYERTARGET))){
          swap("left", "@", ".");
        } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
          swap("left", "P", " ");
        } else if(newPosition.equals(BOX) && playerAtOld(oldPosition)){
          println("PUSHLEFT");
        } else if(playerAtOld(oldPosition)){
          swap("left", "@", " ");
        }
      }
      break;
    case "down":
      newPosition = parsed[player.getY()+1][player.getX()];
      if(notNullorWall(newPosition)){
//        println("DOWN");
        if(oldPosition.equals(PLAYERTARGET)){
          swap("down", "@", ".");
        } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
          swap("down", "P", " ");
        } else if(newPosition.equals(BOX) && playerAtOld(oldPosition)){
          println("PUSHDOWN");
        } else if(playerAtOld(oldPosition)){
          swap("down", "@", " ");
        }
      }
      break;
    case "right":
      newPosition = parsed[player.getY()][player.getX()+1];
      if(notNullorWall(newPosition)){
//        println("RIGHT");
        if((oldPosition.equals(PLAYERTARGET))){
          swap("right", "@", ".");
        } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
          swap("right", "P", " ");
        } else if(newPosition.equals(BOX) && playerAtOld(oldPosition)){
          println("PUSHRIGHT");
        } else if(playerAtOld(oldPosition)){
          swap("right", "@", " ");
        }
      }
      break;
    }
  }

void swap(String type, String oldPosition, String newPosition){ //swap the given characters around. Using a helper function to account for keeping the target in the same place!
  switch(type){
    case "up":
      parsed[player.getY()][player.getX()] = newPosition;
      parsed[player.getY()-1][player.getX()] = oldPosition; //WEIRD
      return;
    case "left":
      parsed[player.getY()][player.getX()] = newPosition;
      parsed[player.getY()][player.getX()-1] = oldPosition; //WEIRD
      return;
    case "down":
      parsed[player.getY()][player.getX()] = newPosition;
      parsed[player.getY()+1][player.getX()] = oldPosition; //WEIRD
      return;
    case "right":
      parsed[player.getY()][player.getX()] = newPosition;
      parsed[player.getY()][player.getX()+1] = oldPosition; //WEIRD
      return;
  }
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

//BOOLEAN METHODS
boolean notNullorWall(String spot){
  return (spot != null && !spot.equals(WALL));
}

boolean playerAtOld(String position){
  return position.equals("@");
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
>>>>>>> dc1427cae1bfa70958f052e60bdbb7c527e1a931
