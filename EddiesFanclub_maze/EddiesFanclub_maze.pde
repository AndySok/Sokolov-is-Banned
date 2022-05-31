import java.util.Scanner;
import java.io.*;
import java.util.Arrays;

Player player;
String[][] parsed;
String WALL = "X";
String BOX = "*";
String TARGET = ".";
int scale;

void setup(){
 size(700, 700);
 parsed = parseFile("LevelSample");
 scale = 30;
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
 }

 void move(String direction){
  String oldPosition = parsed[player.getY()][player.getX()];
  String newPosition;
  switch(direction){
    case "up":
      newPosition = parsed[player.getY()-1][player.getX()];
      if(newPosition != null && !(newPosition.equals(WALL)) && !(newPosition.equals(BOX))){
        String temp = oldPosition;
        parsed[player.getY()][player.getX()] = parsed[player.getY()-1][player.getX()];
        parsed[player.getY()-1][player.getX()] = temp; //WEIRD
      }
      break;
    case "left":
      newPosition = parsed[player.getY()][player.getX()-1];
      if(newPosition != null && !(newPosition.equals(WALL)) && !(newPosition.equals(BOX))){
        String temp = oldPosition;
        parsed[player.getY()][player.getX()] = parsed[player.getY()][player.getX()-1];
        parsed[player.getY()][player.getX()-1] = temp; //WEIRD
      }
      break;
    case "down":
      newPosition = parsed[player.getY()+1][player.getX()];
      if(newPosition != null && !(newPosition.equals(WALL)) && !(newPosition.equals(BOX))){
        String temp = oldPosition;
        parsed[player.getY()][player.getX()] = parsed[player.getY()+1][player.getX()];
        parsed[player.getY()+1][player.getX()] = temp; //WEIRD
      }
      break;
    case "right":
      newPosition = parsed[player.getY()][player.getX()+1];
      if(newPosition != null && !(newPosition.equals(WALL)) && !(newPosition.equals(BOX))){
        String temp = oldPosition;
        parsed[player.getY()][player.getX()] = parsed[player.getY()][player.getX()+1];
        parsed[player.getY()][player.getX()+1] = temp; //WEIRD
      }
      break;
    }     
  }

void draw(){
 background(255);
 setupMap(parsed, scale);
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
        (new Box(x*scale, y*scale, scale)).draw();
        break;
       case "@":
        player = new Player(x*scale, y*scale, scale);
        player.draw();        
        break;
      }
    }
   }  
 } // end method

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
