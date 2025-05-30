PImage dirtTexture;
DirtBlock[][] blocks;

PImage stoneTexture;
PImage sandTexture;
PImage woodTexture;
PImage leafTexture;

PImage waterTexture;

final int GRID_SIZE = 16;

Camera cam;
InputManager input;
Constants k = new Constants();

void setup() {
  fullScreen(P3D);
  noCursor();
  textureMode(NORMAL);
  
  cam = new Camera(k.camX,k.camY, k.camZ, k.pitch, k.yaw, k.sensitivity);
  input = new InputManager(cam, 5);
  
  dirtTexture = loadImage("../data/dirt.jpg");
  stoneTexture = loadImage("../data/stone.jpg");
  sandTexture = loadImage("../data/sand.jpg");
  waterTexture = loadImage("../data/water.jpg");
  woodTexture = loadImage("../data/wood.jpg");
  leafTexture = loadImage("../data/leaf.jpg");

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
   
   input.update();
   
   for(int x = 0; x<GRID_SIZE; x++) {
      for(int z =0; z<GRID_SIZE; z++) {
         float worldX = (x - GRID_SIZE / 2) * k.BLOCK_SIZE;
         float worldZ = (z - GRID_SIZE / 2) * k.BLOCK_SIZE;
         blocks[x][z].render(worldX, 0, worldZ);
      }
   }
}

void keyPressed() {
   input.setInputState(key, true); 
}

void keyReleased() {
   input.setInputState(key, false); 
}
