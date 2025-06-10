public class Constants {
  public final int BLOCK_SIZE = 100;

  public final int WORLD_SIZE = 16;
  public final int WORLD_HEIGHT = 14;
  public final float SURFACE_LEVEL_SCALE = 0.4;

  public float camX = 0, camY = -3000, camZ = 0;
  public float pitch = 1.25, yaw = 0;
  public float worldVoidLevel = 6000;

  public float moveSpeed = 5;

  public float sensitivity;

  public float PLAYER_HEIGHT = 2.0 * BLOCK_SIZE;
  public float PLAYER_WIDTH = 0.6 * BLOCK_SIZE;
  public float PLAYER_CAM_HEIGHT = 1.8 * BLOCK_SIZE;

  public float GRAVITY = .9;
  public float JUMP = 22;

  public float CROSSHAIR = 10;

  public int AMT_ITEMS = 5;
  public int MAX_ITEMS = 64;

  public Constants() {
    float dpi = java.awt.Toolkit.getDefaultToolkit().getScreenResolution();
    float screenHeight = displayHeight / dpi;

    if (screenHeight > 9) {
      sensitivity = .002;
    } else {
      sensitivity = 0.00004;
    }
  }
}
