int floorSize = 40;
int deskX = 280;
int deskY = 500;
int deskSX = 150;
int deskSY = 40;

SpawnPoint newSpawn;
LevelObjects newObject;
Bubble newBubbles;
Teleporter teleport;

void setup() {
  size(1280, 720);
  newSpawn = new SpawnPoint();
  newObject = new LevelObjects();
  newBubbles = new Bubble();
  teleport = new Teleporter();
}

void draw() {
  //Level floor, this is the background of the game and the area where the player moves.
  for (int FloorX = 0; FloorX < width; FloorX=FloorX+40) {
    for (int FloorY = 0; FloorY < height; FloorY=FloorY+40) {
      fill(115);
      rect(FloorX, FloorY, floorSize, floorSize);
    }
    
   
  }
  // Classes //
  newSpawn.display();
  newObject.display();
  teleport.display();
  
  
  newBubbles.display();
  newBubbles.ascend();
  newBubbles.top();
  // End Classes //


}
