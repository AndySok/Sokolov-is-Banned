import java.util.Scanner;
import java.io.*;
import java.util.Arrays;

Player player;
String[][] parsed;
String WALL = "X";
String BOX = "*dd";
int scale;

void setup(){
 size(700, 700);
 parsed = parseFile("LevelSample");
 scale = 30;
 setupMap(parsed, scale);
}

void keyPressed(){
   if (key == 'a'){
    println("AHHH");
    move("left");
   } else if (key == 'd'){
     fill(0);
   }
 }

 void move(String direction){
  String oldPosition = parsed[player.getY()][player.getX()];
  if(direction.equals("left")){
   String newPosition = parsed[player.getY()][player.getX()-1];
   if(newPosition != null && !(newPosition.equals(WALL)) && !(newPosition.equals(BOX))){
     String temp = oldPosition;
     parsed[player.getY()][player.getX()] = parsed[player.getY()][player.getX()-1];
     parsed[player.getY()][player.getX()-1] = temp; //WEIRD
   }
  }
 }

void draw(){
 background(255);
 setupMap(parsed, scale);
}

void setupMap(String[][] parsed, int scale){
  for(int y = 0; y < parsed.length; y++){
  for(int x = 0; x < parsed[y].length; x++){
    if(parsed[y][x].equals(WALL)){
      (new Wall(x*scale, y*scale, scale)).draw();
    }
    else if(parsed[y][x].equals(".")){
      (new Target(x*scale + scale/2, y*scale + scale/2, scale/2)).draw();
    } else if(parsed[y][x].equals(BOX)){
      //(new Box(x*scale, y*scale, scale)).draw();      
    }
    else if (parsed[y][x].equals("@")){
      player = new Player(x*scale, y*scale, scale);
      player.draw();
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
