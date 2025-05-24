import java.awt.Robot;

Robot robot;

float camX = 0, camY = -135, camZ = 200;
float pitch = 1.5, yaw = 0;

float sensitivity = 0.002;

PImage dirtTexture;
DirtBlock[][] blocks;

final int GRID_SIZE = 16;
final int BLOCK_SIZE = 50;

void setup() {
  fullScreen(P3D);
  noCursor();
  textureMode(NORMAL);
  
  try {
    robot = new Robot(); 
  } catch(Exception e) {
    e.printStackTrace(); 
  }
  
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
   
   handleMouseLook();
   
   camera(
     camX, camY, camZ,
     camX + cos(yaw) * cos(pitch),
     camY + sin(pitch),
     camZ + sin(yaw) * cos(pitch),
     0,1,0
   );
   
   for(int x = 0; x<GRID_SIZE; x++) {
      for(int z =0; z<GRID_SIZE; z++) {
         float worldX = (x - GRID_SIZE / 2) * BLOCK_SIZE;
         float worldZ = (z - GRID_SIZE / 2) * BLOCK_SIZE;
         blocks[x][z].render(worldX, 0, worldZ);
      }
   }
}

void handleMouseLook() {
   float dx = (mouseX - width / 2) * sensitivity;
   float dy = (mouseY - height / 2) * sensitivity;
   
   yaw += dx;
   pitch += dy;
   
   pitch = constrain(pitch, -HALF_PI, HALF_PI - .25);
   
   robot.mouseMove(width / 2, height / 2);
   mouseX = width / 2;
   mouseY = height / 2;
}
