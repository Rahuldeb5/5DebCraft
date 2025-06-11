PImage[] textures;

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
HUD hud;
Inventory inventory;

Ray targetBlock;

void setup() {
  fullScreen(P3D);
  noCursor();
  textureMode(NORMAL);

  k = new Constants();

  cam = new Camera(k.camX, k.camY, k.camZ, k.pitch, k.yaw, k.sensitivity);
  input = new InputManager();

  inventory = new Inventory();

  dirtTexture = loadImage("../data/dirt.jpg");
  stoneTexture = loadImage("../data/stone.jpg");
  sandTexture = loadImage("../data/sand.jpg");
  waterTexture = loadImage("../data/water.jpg");
  woodTexture = loadImage("../data/wood.jpg");
  leafTexture = loadImage("../data/leaf.jpg");

  textures = new PImage[] {dirtTexture, stoneTexture, sandTexture, woodTexture, leafTexture, waterTexture};

  world = new World();
  blocks = new Block[k.WORLD_SIZE][k.WORLD_HEIGHT][k.WORLD_SIZE];

  hud = new HUD();

  for (int x=0; x<k.WORLD_SIZE; x++) {
    for (int y=0; y<k.WORLD_HEIGHT; y++) {
      for (int z=0; z<k.WORLD_SIZE; z++) {
        int blockType = world.getBlockAt(x, y, z);
        switch(blockType) {
        case 1:
          blocks[x][y][z] = new DirtBlock(textures[0]);
          break;
        case 2:
          blocks[x][y][z] = new StoneBlock(textures[1]);
          break;
        case 3:
          blocks[x][y][z] = new SandBlock(textures[2]);
          break;
        case 4:
          blocks[x][y][z] = new WaterBlock(textures[5]);
          break;
        case 5:
          blocks[x][y][z] = new WoodBlock(textures[3]);
          break;
        case 6:
          blocks[x][y][z] = new LeafBlock(textures[4]);
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

  targetBlock = cam.castRay(cam.x, cam.y, cam.z,
    cos(cam.yaw) * cos(cam.pitch),
    sin(cam.pitch),
    sin(cam.yaw) * cos(cam.pitch));

  if (targetBlock != null) {
    println(targetBlock.blockId + " " + targetBlock.x + " " + targetBlock.y + " " + targetBlock.z);
  }

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

  hud.renderCrosshair();
  hud.renderHotbar();
}

void keyPressed() {
  input.setInputState(key, true);
}

void keyReleased() {
  input.setInputState(key, false);
}
