import java.io.*;
import java.util.*;
import java.util.stream.*;
import java.nio.file.*;

public class Parser {
 public static void main(String[] args){
  List<File> levels = getLevels("./levels");
  try{
    System.out.println(Files.readString(levels.get(0).toPath()));
  } catch(Exception e){
    System.out.println("levels failed to load!");
  }
 }

 public static List<File> getLevels(String levelsPath){
  try{
    List<File> levels = Files.list(Paths.get(levelsPath))
      .map(Path::toFile)
      .filter(File::isFile)
      .collect(Collectors.toList());
      return levels;
  } catch (IOException e){
    e.printStackTrace();
      return null;
  }
 }
}
