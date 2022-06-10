class Game{
  String PLAYER = "@";
  String WALL = "X";
  String BOX = "*";
  String TARGET = ".";
  String PLAYERTARGET = "P";
  String BOXTARGET = "T";   

  void startMenu(){
    background(255);
    level = levels.get(transition.getLevel()); //CHANGE LEVEL
    originalLevel = game.dupliKate(level);
    transition.draw();
  }
  
  void nextLevel(){
   // game.draw(); // update this everytime
   transition.draw();
  }
  
  void endScreen(){
   transition.draw();
  }
  
  void game(){
   background(255);
   counters.draw();
   home.draw("<-");
   game.setupMap(level, scale);
   scale = 30;
  // levelCounter(transition.getLevel());
   if(checkWin()){
     finishLevel();
   }
  }
  
  void finishLevel(){
    if(transition.getLevel() <= levels.size()){
      STATE = "FINISH";
    } else {
      STATE = "COMPLETED";
      println("COMPLETED!");
    }
  }
  
  boolean checkWin(){
   for(int y=0;y<level.length-2;y++){
    for(int x=0;x<level[0].length;x++){
      if(level[y][x].equals("*")) return false;
    }
   } return true;
  }

   boolean move(String direction){
    String oldPosition = level[player.getY()][player.getX()];
    String newPosition;
    int oldY, oldX, newY, newX;
    switch(direction){
      case "up":
        oldY = player.getY();
        oldX = player.getX();
        newY = player.getY()-1;
        newX = player.getX();
        newPosition = level[newY][newX];
        if(notNullorWall(newPosition)){ //if it's not a wall, move up
          if(oldPosition.equals(PLAYERTARGET)){ //if we're on a target
            if(newPosition.equals(TARGET)){ //if we're moving to a target
              return swap(oldY, oldX, "P", newY, newX, ".");
            } else if(newPosition.equals(BOX) || newPosition.equals(BOXTARGET)){ //if we're moving a box
              if(push(direction)){
                newPosition = level[newY][newX];
                if(newPosition.equals(TARGET)) { //can't check for TARGET, as push() happens afterwards
                  return swap(oldY, oldX, PLAYERTARGET, newY, newX, ".");
                } else return swap(oldY, oldX, PLAYER, newY, newX, ".");
              }
            } else{
              return swap(oldY, oldX, PLAYER, newY, newX, ".");
            }
          } else if((newPosition.equals(BOXTARGET)) && playerAtOld(oldPosition)){ //if you're pushing a box off a target
              if(push(direction)){
                return swap(oldY, oldX, "P",  newY, newX, " ");
              }
          } else if((newPosition.equals(BOX)) && playerAtOld(oldPosition)){
              if(push(direction)){
                return swap(oldY, oldX, PLAYER,  newY, newX, " ");
              }
          } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
              return swap(oldY, oldX, "P", newY, newX, " ");
          } else if(playerAtOld(oldPosition)){
            return swap(oldY, oldX, PLAYER,  newY, newX, " ");
          }
        }
        break;
      case "left":
        oldY = player.getY();
        oldX = player.getX();
        newY = player.getY();
        newX = player.getX()-1;
        newPosition = level[newY][newX];
        if(notNullorWall(newPosition)){ //if it's not a wall, move up
          if(oldPosition.equals(PLAYERTARGET)){ //if we're on a target
            if(newPosition.equals(TARGET)){ //if we're moving to a target
              return swap(oldY, oldX, "P", newY, newX, ".");
            } else if(newPosition.equals(BOX) || newPosition.equals(BOXTARGET)){ //if we're moving a box
              if(push(direction)){
                newPosition = level[newY][newX];
                if(newPosition.equals(TARGET)) { //can't check for TARGET, as push() happens afterwards
                  return swap(oldY, oldX, PLAYERTARGET, newY, newX, ".");
                } else swap(oldY, oldX, PLAYER, newY, newX, ".");
              }
            } else{
              return swap(oldY, oldX, PLAYER, newY, newX, ".");
            }
          } else if((newPosition.equals(BOXTARGET)) && playerAtOld(oldPosition)){ //if you're pushing a box off a target
              if(push(direction)){
                return swap(oldY, oldX, "P",  newY, newX, " ");
              }
          } else if((newPosition.equals(BOX)) && playerAtOld(oldPosition)){
              if(push(direction)){
                return swap(oldY, oldX, PLAYER,  newY, newX, " ");
              }
          } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
              return swap(oldY, oldX, "P", newY, newX, " ");
          } else if(playerAtOld(oldPosition)){
            return swap(oldY, oldX, PLAYER,  newY, newX, " ");
          }
        }
        break;
      case "down":
        oldY = player.getY();
        oldX = player.getX();
        newY = player.getY()+1;
        newX = player.getX();
        newPosition = level[newY][newX];
        if(notNullorWall(newPosition)){ //if it's not a wall, move up
          if(oldPosition.equals(PLAYERTARGET)){ //if we're on a target
            if(newPosition.equals(TARGET)){ //if we're moving to a target
              return swap(oldY, oldX, "P", newY, newX, ".");
            } else if(newPosition.equals(BOX) || newPosition.equals(BOXTARGET)){ //if we're moving a box
              if(push(direction)){
                newPosition = level[newY][newX];
                if(newPosition.equals(TARGET)) { //can't check for TARGET, as push() happens afterwards
                  return swap(oldY, oldX, PLAYERTARGET, newY, newX, ".");
                } else return swap(oldY, oldX, PLAYER, newY, newX, ".");
              }
            } else{
              return swap(oldY, oldX, PLAYER, newY, newX, ".");
            }
          } else if((newPosition.equals(BOXTARGET)) && playerAtOld(oldPosition)){ //if you're pushing a box off a target
              if(push(direction)){
                return swap(oldY, oldX, "P",  newY, newX, " ");
              }
          } else if((newPosition.equals(BOX)) && playerAtOld(oldPosition)){
              if(push(direction)){
                return swap(oldY, oldX, PLAYER,  newY, newX, " ");
              }
          } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
              return swap(oldY, oldX, "P", newY, newX, " ");
          } else if(playerAtOld(oldPosition)){
            return swap(oldY, oldX, PLAYER,  newY, newX, " ");
          }
        }
        break;
      case "right":
        oldY = player.getY();
        oldX = player.getX();
        newY = player.getY();
        newX = player.getX()+1;
        newPosition = level[newY][newX];
        if(notNullorWall(newPosition)){ //if it's not a wall, move up
          if(oldPosition.equals(PLAYERTARGET)){ //if we're on a target
            if(newPosition.equals(TARGET)){ //if we're moving to a target
              return swap(oldY, oldX, "P", newY, newX, ".");
            } else if(newPosition.equals(BOX) || newPosition.equals(BOXTARGET)){ //if we're moving a box
              if(push(direction)){
                newPosition = level[newY][newX];
                if(newPosition.equals(TARGET)) { //can't check for TARGET, as push() happens afterwards
                  return swap(oldY, oldX, PLAYERTARGET, newY, newX, ".");
                } else return swap(oldY, oldX, PLAYER, newY, newX, ".");
              }
            } else{
              return swap(oldY, oldX, PLAYER, newY, newX, ".");
            }
          } else if((newPosition.equals(BOXTARGET)) && playerAtOld(oldPosition)){ //if you're pushing a box off a target
              if(push(direction)){
                return swap(oldY, oldX, "P",  newY, newX, " ");
              }
          } else if((newPosition.equals(BOX)) && playerAtOld(oldPosition)){
              if(push(direction)){
                return swap(oldY, oldX, PLAYER,  newY, newX, " ");
              }
          } else if(newPosition.equals(TARGET) && playerAtOld(oldPosition)){
              return swap(oldY, oldX, "P", newY, newX, " ");
          } else if(playerAtOld(oldPosition)){
            return swap(oldY, oldX, PLAYER,  newY, newX, " ");
          }
        }
        break;
      } return false;
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
        boxPosition = level[oldBoxPositionY][oldBoxPositionX];
        newBoxPosition = level[boxPositionY][boxPositionX];
        if(notNullorWall(newBoxPosition) && !(newBoxPosition.equals(BOX)) && !(newBoxPosition.equals(BOXTARGET))){
          if(newBoxPosition.equals(TARGET) && boxPosition.equals(BOXTARGET)){ //check if this is a box on a target
            swap(oldBoxPositionY, oldBoxPositionX, "T", boxPositionY, boxPositionX, ".");
          }
          else if(newBoxPosition.equals(TARGET) && boxAtOld(boxPosition)){ // if the new position is a target
            swap(oldBoxPositionY, oldBoxPositionX, "T", boxPositionY, boxPositionX, " ");
          }
          else if(boxPosition.equals(BOXTARGET)){
            swap(oldBoxPositionY, oldBoxPositionX, "*", boxPositionY, boxPositionX, ".");
          }
          else if(boxAtOld(boxPosition) || boxPosition.equals(BOXTARGET)){ //check if there is a box
            swap(oldBoxPositionY, oldBoxPositionX, "*", boxPositionY, boxPositionX, " ");
          } return true;
        } return false;
      case "left":
        oldBoxPositionY = player.getY();
        oldBoxPositionX = player.getX()-1;
        boxPositionY = oldBoxPositionY;
        boxPositionX = oldBoxPositionX-1;
        boxPosition = level[oldBoxPositionY][oldBoxPositionX];
        newBoxPosition = level[boxPositionY][boxPositionX];
        if(notNullorWall(newBoxPosition) && !(newBoxPosition.equals(BOX)) && !(newBoxPosition.equals(BOXTARGET))){
          if(newBoxPosition.equals(TARGET) && boxPosition.equals(BOXTARGET)){ //check if this is a box on a target
            swap(oldBoxPositionY, oldBoxPositionX, "T", boxPositionY, boxPositionX, ".");
          }
          else if(newBoxPosition.equals(TARGET) && boxAtOld(boxPosition)){ // if the new position is a target
            swap(oldBoxPositionY, oldBoxPositionX, "T", boxPositionY, boxPositionX, " ");
          }
          else if(boxPosition.equals(BOXTARGET)){
            swap(oldBoxPositionY, oldBoxPositionX, "*", boxPositionY, boxPositionX, ".");
          }
          else if(boxAtOld(boxPosition) || boxPosition.equals(BOXTARGET)){ //check if there is a box
            swap(oldBoxPositionY, oldBoxPositionX, "*", boxPositionY, boxPositionX, " ");
          } return true;
        } return false;
      case "down":
        oldBoxPositionY = player.getY()+1;
        oldBoxPositionX = player.getX();
        boxPositionY = oldBoxPositionY+1;
        boxPositionX = oldBoxPositionX;
        boxPosition = level[oldBoxPositionY][oldBoxPositionX];
        newBoxPosition = level[boxPositionY][boxPositionX];
        if(notNullorWall(newBoxPosition) && !(newBoxPosition.equals(BOX)) && !(newBoxPosition.equals(BOXTARGET))){
          if(newBoxPosition.equals(TARGET) && boxPosition.equals(BOXTARGET)){ //check if this is a box on a target
            swap(oldBoxPositionY, oldBoxPositionX, "T", boxPositionY, boxPositionX, ".");
          }
          else if(newBoxPosition.equals(TARGET) && boxAtOld(boxPosition)){ // if the new position is a target
            swap(oldBoxPositionY, oldBoxPositionX, "T", boxPositionY, boxPositionX, " ");
          }
          else if(boxPosition.equals(BOXTARGET)){
            swap(oldBoxPositionY, oldBoxPositionX, "*", boxPositionY, boxPositionX, ".");
          }
          else if(boxAtOld(boxPosition) || boxPosition.equals(BOXTARGET)){ //check if there is a box
            swap(oldBoxPositionY, oldBoxPositionX, "*", boxPositionY, boxPositionX, " ");
          } return true;
        } return false;
      case "right":
        oldBoxPositionY = player.getY();
        oldBoxPositionX = player.getX()+1;
        boxPositionY = oldBoxPositionY;
        boxPositionX = oldBoxPositionX+1;
        boxPosition = level[oldBoxPositionY][oldBoxPositionX];
        newBoxPosition = level[boxPositionY][boxPositionX];
        if(notNullorWall(newBoxPosition) && !(newBoxPosition.equals(BOX)) && !(newBoxPosition.equals(BOXTARGET))){
          if(newBoxPosition.equals(TARGET) && boxPosition.equals(BOXTARGET)){ //check if this is a box on a target
            swap(oldBoxPositionY, oldBoxPositionX, "T", boxPositionY, boxPositionX, ".");
          }
          else if(newBoxPosition.equals(TARGET) && boxAtOld(boxPosition)){ // if the new position is a target
            swap(oldBoxPositionY, oldBoxPositionX, "T", boxPositionY, boxPositionX, " ");
          }
          else if(boxPosition.equals(BOXTARGET)){
            swap(oldBoxPositionY, oldBoxPositionX, "*", boxPositionY, boxPositionX, ".");
          }
          else if(boxAtOld(boxPosition)){ //check if there is a box
            swap(oldBoxPositionY, oldBoxPositionX, "*", boxPositionY, boxPositionX, " ");
          } return true;
        } return false;
    } return false;
  }

  void setupMap(String[][] level, int scale){
    for(int y = 0; y < level.length-2; y++){
      for(int x = 0; x < level[y].length; x++){
        switch(level[y][x]){
         case "X":
          (new Object(x*scale + centeredWidth, y*scale + centeredHeight, scale, color(183, 116, 8))).draw();
          break;
         case ".":
          (new Target(x*scale + scale/2 + centeredWidth, y*scale + scale/2 + centeredHeight, scale/2)).draw();
          break;
         case "*":
          (new Object(x*scale + centeredWidth, y*scale + centeredHeight, scale, color(98, 26, 165))).draw();
          break;
         case "@":
          player = new Player("sprites/emoji.png", x*scale + centeredWidth, y*scale + centeredHeight, scale);
          player.draw();
          break;
         case "T":
          (new Object(x*scale + centeredWidth, y*scale + centeredHeight, scale, color(100, 100, 100))).draw();
          break;
         case "P":
          player = new Player("sprites/emoji.png", x*scale + centeredWidth, y*scale + centeredHeight, scale);
          player.draw();
          break;
        }
      }
     }
     centeredWidth = Integer.parseInt(level[level.length-2][0]);
     centeredHeight = Integer.parseInt(level[level.length-1][0]);
   } // end method
  
  //HELPER METHODS
  boolean notNullorWall(String spot){
    return (spot != null && !spot.equals(this.WALL));
  }
  
  boolean playerAtOld(String position){
    return position.equals(PLAYER);
  }
  
  boolean boxAtOld(String position){
    return position.equals(BOX);
  }
  
  boolean swap(int oldY, int oldX, String oldPositionChar, int newY, int newX, String newPositionChar){ //swap the given characters around. Using a helper function to account for keeping the target in the same place!
        level[oldY][oldX] = newPositionChar;
        level[newY][newX] = oldPositionChar; //WEIRD
        return true;
  }

  String[][] dupliKate(String[][] original){
      String[][] copy = new String[original.length][original[0].length];
      for(int y = 0; y < original.length; y++){
        for(int x = 0; x < original[y].length; x++){
          copy[y][x] = original[y][x];
        }
      } return copy;
  }
 
  
  //PRECONDITION: file follows the right format
  String[][] parseFile(String fileLocation) {
      String[] lines = loadStrings(fileLocation);
      String[][] level = new String[lines.length][lines[0].length()];
      for(int y = 0; y < level.length-2; y++){
        for(int x = 0; x < level[y].length; x++){
          level[y][x] = lines[y].substring(0, 1);
          lines[y] = lines[y].substring(1);
        }
      }
      level[level.length-2][0] = lines[level.length-2];
      level[level.length-1][0] = lines[level.length-1];
      return level;
  }
  
  LinkedList<String[][]> parse(){
    LinkedList<String[][]> levels = new LinkedList<String[][]>();
    for(int i=1; i<=listPaths("levels").length; i++){
      levels.add(parseFile("levels/" + i));
    }
    return levels;
  }
  
}
