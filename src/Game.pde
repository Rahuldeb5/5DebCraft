PImage[] textures;

PImage[] breakingStages;

Camera cam;
InputManager input;
Constants k;
World world;
Block[][][] blocks;
HUD hud;
Inventory inventory;

Ray targetBlock;
float breakStart = -1;

void setup() {
  fullScreen(P3D);
  noCursor();
  textureMode(NORMAL);

  k = new Constants();

  cam = new Camera(k.camX, k.camY, k.camZ, k.pitch, k.yaw, k.sensitivity);
  input = new InputManager();

  inventory = new Inventory();

  textures = new PImage[] {loadImage("../data/dirt.jpg"), loadImage("../data/stone.jpg"), loadImage("../data/sand.jpg"),
    loadImage("../data/wood.jpg"), loadImage("../data/leaf.jpg"), loadImage("../data/water.jpg")};

  breakingStages = new PImage[5];
  for (int i=0; i<5; i++) {
    breakingStages[i] = loadImage("../data/crack_"+i+".png");
  }

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
          blocks[x][y][z] = new WoodBlock(textures[3]);
          break;
        case 5:
          blocks[x][y][z] = new LeafBlock(textures[4]);
          break;
        case 6:
          blocks[x][y][z] = new WaterBlock(textures[5]);
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

  targetBlock = cam.castRay(cam.x, cam.y, cam.z,
    cos(cam.yaw) * cos(cam.pitch),
    sin(cam.pitch),
    sin(cam.yaw) * cos(cam.pitch));

  if (targetBlock != null) {
    Block actualBlock = blocks[targetBlock.x][targetBlock.y][targetBlock.z];
    if (mousePressed && (mouseButton == LEFT) && actualBlock != null && blocks[targetBlock.x][targetBlock.y][targetBlock.z].isBreakable()) {
      if (breakStart < 0) breakStart = millis();
      float duration = millis() - breakStart;
      if (duration > blocks[targetBlock.x][targetBlock.y][targetBlock.z].getHardness() * 1000) {
        inventory.addItem(targetBlock.blockId-1);
        blocks[targetBlock.x][targetBlock.y][targetBlock.z] = null;
        targetBlock = null;
        breakStart = -1;
      } else {
        int stage = int(map(duration, 0, blocks[targetBlock.x][targetBlock.y][targetBlock.z].getHardness()*1000, 0, 5));
        stage = constrain(stage, 0, 4);
        actualBlock.setBreakingStage(stage);
      }
    } else {
      if (actualBlock != null) {
        actualBlock.setBreakingStage(-1);
      }
    }
    if (mousePressed && (mouseButton == RIGHT) && inventory.hasItem() && blocks[targetBlock.x][constrain(targetBlock.y+1, 0, k.WORLD_HEIGHT-1)][targetBlock.z] == null) {
      world.blocks[targetBlock.x][constrain(targetBlock.y+1, 0, k.WORLD_HEIGHT-1)][targetBlock.z] = inventory.getCurrentIndex() + 1;

      int blockType = world.getBlockAt(targetBlock.x, constrain(targetBlock.y+1, 0, k.WORLD_HEIGHT-1), targetBlock.z);
      switch(blockType) {
      case 1:
        blocks[targetBlock.x][constrain(targetBlock.y+1, 0, k.WORLD_HEIGHT-1)][targetBlock.z] = new DirtBlock(textures[0]);
        break;
      case 2:
        blocks[targetBlock.x][constrain(targetBlock.y+1, 0, k.WORLD_HEIGHT-1)][targetBlock.z] = new StoneBlock(textures[1]);
        break;
      case 3:
        blocks[targetBlock.x][constrain(targetBlock.y+1, 0, k.WORLD_HEIGHT-1)][targetBlock.z] = new SandBlock(textures[2]);
        break;
      case 4:
        blocks[targetBlock.x][constrain(targetBlock.y+1, 0, k.WORLD_HEIGHT-1)][targetBlock.z] = new WoodBlock(textures[3]);
        break;
      case 5:
        blocks[targetBlock.x][constrain(targetBlock.y+1, 0, k.WORLD_HEIGHT-1)][targetBlock.z] = new LeafBlock(textures[4]);
        break;
      case 6:
        blocks[targetBlock.x][constrain(targetBlock.y+1, 0, k.WORLD_HEIGHT-1)][targetBlock.z] = new WaterBlock(textures[5]);
        break;
      default:
        blocks[targetBlock.x][constrain(targetBlock.y+1, 0, k.WORLD_HEIGHT-1)][targetBlock.z] = null;
      }
      inventory.removeItem();
    }
  }

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

  hud.renderCrosshair();
  hud.renderHotbar();
}

void keyPressed() {
  input.setInputState(key, true);
}

void keyReleased() {
  input.setInputState(key, false);
}
