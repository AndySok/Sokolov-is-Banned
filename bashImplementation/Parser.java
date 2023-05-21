import java.io.IOException;
import java.nio.file.*;

public class Parser {
 public static void main(String[] args){
  Path filePath = Path.of("./levels/1");
  try{
    String content = Files.readString(filePath);
    System.out.println(content);
  } catch (IOException e){
    System.out.println("file doesn't exist!");
  }
 }
}
