import java.util.Scanner;
import java.io.*;
import java.util.Arrays;

void setup(){
 size(700, 700);
 String[][] parsed = parseFile("Level2");
 int scale = 30;
 setupWalls(parsed, scale);
}

void setupWalls(String[][] parsed, int scale){
  for(int y = 0; y < parsed.length; y++){
  for(int x = 0; x < parsed[y].length; x++){
    if(parsed[y][x].equals("X")){
      (new Wall(x*scale, y*scale, scale)).draw();
    }
  }
 }

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
