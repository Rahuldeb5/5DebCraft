PImage dirtTexture;
DirtBlock[][] blocks;

PImage stoneTexture;
PImage sandTexture;
PImage woodTexture;
PImage leafTexture;

PImage waterTexture;

Camera cam;
InputManager input;
Constants k;

void setup() {
  fullScreen(P3D);
  noCursor();
  textureMode(NORMAL);
  
  k = new Constants();
  
  cam = new Camera(k.camX,k.camY, k.camZ, k.pitch, k.yaw, k.sensitivity);
  input = new InputManager(cam, k.moveSpeed);
  
  dirtTexture = loadImage("../data/dirt.jpg");
  stoneTexture = loadImage("../data/stone.jpg");
  sandTexture = loadImage("../data/sand.jpg");
  waterTexture = loadImage("../data/water.jpg");
  woodTexture = loadImage("../data/wood.jpg");
  leafTexture = loadImage("../data/leaf.jpg");

  blocks = new DirtBlock[k.GRID_SIZE][k.GRID_SIZE];
  
  for(int x = 0; x < k.GRID_SIZE; x++) {
     for(int z = 0; z < k.GRID_SIZE; z++) {
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
      
   for(int x = 0; x<k.GRID_SIZE; x++) {
      for(int z =0; z<k.GRID_SIZE; z++) {
         float worldX = (x - k.GRID_SIZE / 2) * k.BLOCK_SIZE;
         float worldZ = (z - k.GRID_SIZE / 2) * k.BLOCK_SIZE;
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
