PImage dirtTexture;
PImage stoneTexture;
PImage sandTexture;
PImage waterTexture;
PImage woodTexture;
PImage leafTexture;

Camera cam;
InputManager input;
Constants k;
World world;
Block[][][] blocks;

void setup() {
  fullScreen(P3D);
  noCursor();
  textureMode(NORMAL);

  k = new Constants();

  cam = new Camera(k.camX, k.camY, k.camZ, k.pitch, k.yaw, k.sensitivity);
  input = new InputManager(cam, k.moveSpeed);

  dirtTexture = loadImage("../data/dirt.jpg");
  stoneTexture = loadImage("../data/stone.jpg");
  sandTexture = loadImage("../data/sand.jpg");
  waterTexture = loadImage("../data/water.jpg");
  woodTexture = loadImage("../data/wood.jpg");
  leafTexture = loadImage("../data/leaf.jpg");

  world = new World();
  blocks = new Block[k.WORLD_SIZE][k.WORLD_HEIGHT][k.WORLD_SIZE];

  for (int x=0; x<k.WORLD_SIZE; x++) {
    for (int y=0; y<k.WORLD_HEIGHT; y++) {
      for (int z=0; z<k.WORLD_SIZE; z++) {
        int blockType = world.getBlockAt(x, y, z);
        switch(blockType) {
        case 1:
          blocks[x][y][z] = new DirtBlock(dirtTexture);
          break;
        case 2:
          blocks[x][y][z] = new StoneBlock(stoneTexture);
          break;
        case 3:
          blocks[x][y][z] = new SandBlock(sandTexture);
          break;
        case 4:
          blocks[x][y][z] = new WaterBlock(waterTexture);
          break;
        case 5:
          blocks[x][y][z] = new WoodBlock(woodTexture);
          break;
        case 6:
          blocks[x][y][z] = new LeafBlock(leafTexture);
          break;
        default:
          blocks[x][y][z] = null;
        }
      }
    }
  }
}

void draw() {
  background(135, 205, 235);
  lights();

  cam.update();
  cam.apply();
  cam.resetCharacter();

  input.update();

  for (int x=0; x<k.WORLD_SIZE; x++) {
    for (int y=0; y<k.WORLD_HEIGHT; y++) {
      for (int z=0; z<k.WORLD_SIZE; z++) {
        if (blocks[x][y][z] != null) {
          float worldX = (x - k.WORLD_SIZE / 2) * k.BLOCK_SIZE;
          float worldY = y * k.BLOCK_SIZE;
          float worldZ = (z - k.WORLD_SIZE / 2) * k.BLOCK_SIZE;
          blocks[x][y][z].render(worldX, -worldY, worldZ);
        }
      }
    }
  }
}

void keyPressed() {
  input.setInputState(key, true);
}

void keyReleased() {
  input.setInputState(key, false);
}
