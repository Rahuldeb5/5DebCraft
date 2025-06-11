import java.awt.Robot;

public class Camera {
  Robot robot;

  protected float x, y, z;
  protected float pitch, yaw;
  private float sensitivity;

  private float velocityY;
  private boolean isOnGround;


  public Camera(float x, float y, float z, float pitch, float yaw, float sensitivity) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.pitch = pitch;
    this.yaw = yaw;
    this.sensitivity = sensitivity;

    try {
      robot = new Robot();
    }
    catch(Exception e) {
      e.printStackTrace();
    }

    velocityY = 0;
    isOnGround = false;
  }

  void update() {
    float dx = (mouseX - width / 2) * sensitivity;
    float dy = (mouseY - height / 2) * sensitivity;

    yaw += dx;
    pitch += dy;

    pitch = constrain(pitch, -HALF_PI+.05, HALF_PI-.05);

    robot.mouseMove(width / 2, height / 2);
    mouseX = width / 2;
    mouseY = height / 2;
  }

  void apply() {
    camera(
      x, y, z,
      x + cos(yaw) * cos(pitch),
      y + sin(pitch),
      z + sin(yaw) * cos(pitch),
      0, 1, 0
      );
  }

  void resetCharacter() {
    if (y > k.worldVoidLevel) {
      x = k.camX;
      z = k.camZ;
      y = k.camY;
    }
  }

  private boolean checkCollision(float newX, float newY, float newZ) {
    float playerMinX = newX - k.PLAYER_WIDTH / 2;
    float playerMaxX = newX + k.PLAYER_WIDTH / 2;

    float playerMinY = newY - k.PLAYER_HEIGHT;
    float playerMaxY = newY + k.PLAYER_CAM_HEIGHT;

    float playerMinZ = newZ - k.PLAYER_WIDTH / 2;
    float playerMaxZ = newZ + k.PLAYER_WIDTH / 2;

    for (int x=0; x<k.WORLD_SIZE; x++) {
      for (int y=0; y<k.WORLD_HEIGHT; y++) {
        for (int z=0; z<k.WORLD_SIZE; z++) {
          float blockX = (x - k.WORLD_SIZE / 2) * k.BLOCK_SIZE;
          float blockY = -world.getHeightAt(x, z) * k.BLOCK_SIZE;
          float blockZ = (z - k.WORLD_SIZE / 2) * k.BLOCK_SIZE;

          float blockMinX = blockX - k.BLOCK_SIZE/2;
          float blockMaxX = blockX + k.BLOCK_SIZE/2;

          float blockMinY = blockY - k.BLOCK_SIZE/2;
          float blockMaxY = blockY + k.BLOCK_SIZE/2;

          float blockMinZ = blockZ - k.BLOCK_SIZE/2;
          float blockMaxZ = blockZ + k.BLOCK_SIZE/2;

          if (playerMaxX > blockMinX && playerMinX < blockMaxX &&
            playerMaxY > blockMinY && playerMinY < blockMaxY &&
            playerMaxZ > blockMinZ && playerMinZ < blockMaxZ) return true;
        }
      }
    }
    return false;
  }

  public Ray castRay(float x, float y, float z, float dx, float dy, float dz) {
    for (float t = k.BLOCK_SIZE / 20; t < k.MAX_DISTANCE; t += k.BLOCK_SIZE / 100) {
      int bx = floor((x+dx*t) / k.BLOCK_SIZE + k.WORLD_SIZE / 2);
      int by = floor(-(y+dy*t) / k.BLOCK_SIZE);
      int bz = floor((z+dz*t) / k.BLOCK_SIZE + k.WORLD_SIZE / 2);


      if (bx < 0 || bx >= k.WORLD_SIZE ||
        by < 0 || by >= k.WORLD_HEIGHT ||
        bz < 0 || bz >= k.WORLD_SIZE) {
        continue;
      }

      int target = world.blocks[bx][by][bz];
      if (target != 0) {
        return new Ray(bx, by, bz, target);
      }
    }
    return null;
  }
}

public class Ray {
  int x, y, z;
  int blockId;

  public Ray(int x, int y, int z, int blockId) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.blockId = blockId;
  }
}
