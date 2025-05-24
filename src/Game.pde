float camX = 0, camY = -135, camZ = 200;
float pitch = 1.5, yaw = 0;

float sensitivity = 0.002;

PImage dirtTexture;
DirtBlock[][] blocks;

final int GRID_SIZE = 16;
final int BLOCK_SIZE = 50;

Camera cam;

void setup() {
  fullScreen(P3D);
  noCursor();
  textureMode(NORMAL);
  
  cam = new Camera(camX, camY, camZ, pitch, yaw, sensitivity);
  
  dirtTexture = loadImage("../data/dirt.png");

  blocks = new DirtBlock[GRID_SIZE][GRID_SIZE];
  
  for(int x = 0; x < GRID_SIZE; x++) {
     for(int z = 0; z < GRID_SIZE; z++) {
        blocks[x][z] = new DirtBlock(dirtTexture); 
     }
  }
}  

void draw() {
   background(135, 205, 235); 
   lights();
   
   cam.update();
   cam.apply();
   
   for(int x = 0; x<GRID_SIZE; x++) {
      for(int z =0; z<GRID_SIZE; z++) {
         float worldX = (x - GRID_SIZE / 2) * BLOCK_SIZE;
         float worldZ = (z - GRID_SIZE / 2) * BLOCK_SIZE;
         blocks[x][z].render(worldX, 0, worldZ);
      }
   }
}
