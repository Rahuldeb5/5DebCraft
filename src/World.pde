public class World {
  private int[][][] blocks;

  public World() {
    blocks = new int[k.WORLD_SIZE][k.WORLD_HEIGHT][k.WORLD_SIZE];
    generateTerrain();
  }

  public void generateTerrain() {
    noiseSeed((int)random(10000));
    float scale = 0.1;

    float[][] heightMap = new float[k.WORLD_SIZE][k.WORLD_SIZE];
    for (int x=0; x<k.WORLD_SIZE; x++) {
      for (int z=0; z<k.WORLD_SIZE; z++) {
        float h = noise(x*scale, z*scale) * 20;
        h += noise(x*scale*2, z*scale*2) * 10;
        h += noise(x*scale*4, z*scale*4) *5;
        heightMap[x][z] = h;
      }
    }

    for (int x=0; x<k.WORLD_SIZE; x++) {
      for (int z=0; z<k.WORLD_SIZE; z++) {
        int surfaceHeight = (int)heightMap[x][z];

        if (surfaceHeight < k.WORLD_HEIGHT * k.SURFACE_LEVEL_SCALE) {
          surfaceHeight = int(k.WORLD_HEIGHT * k.SURFACE_LEVEL_SCALE);
        }

        for (int y=0; y<surfaceHeight; y++) {
          if (y < surfaceHeight - 4) blocks[x][y][z] = BlockType.STONE.getType();
          else blocks[x][y][z] = BlockType.DIRT.getType();
        }

        if (heightMap[x][z] < k.WORLD_HEIGHT * k.SURFACE_LEVEL_SCALE) {
          for (int y=(int)heightMap[x][z]; y < k.WORLD_HEIGHT * k.SURFACE_LEVEL_SCALE; y++) {
            blocks[x][y][z] = BlockType.WATER.getType();
          }
        }

        if (heightMap[x][z] >= k.WORLD_HEIGHT * k.SURFACE_LEVEL_SCALE &&
          heightMap[x][z] < k.WORLD_HEIGHT * (k.SURFACE_LEVEL_SCALE + 0.05)) {
          blocks[x][surfaceHeight-1][z] = BlockType.SAND.getType();
        }
      }
    }
  }

  public int getBlockAt(int x, int y, int z) {
    if (x >= 0 && x < k.WORLD_SIZE &&
      y >= 0 && y < k.WORLD_HEIGHT &&
      z >= 0 && z < k.WORLD_SIZE) {
      return blocks[x][y][z];
    }
    return 0;
  }
}
