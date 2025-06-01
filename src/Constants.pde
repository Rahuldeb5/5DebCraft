public class Constants {
 public final int BLOCK_SIZE = 100;
 public final int GRID_SIZE = 16;
 
 public float camX = 0, camY = -270, camZ = 0;
 public float pitch = 1.25, yaw = 0;
 
 public float moveSpeed = 5;
 
 public float sensitivity;
 
 public float PLAYER_HEIGHT = 2.6 * BLOCK_SIZE;
 public float PLAYER_WIDTH = 0.6 * BLOCK_SIZE;
 public float PLAYER_CAM_HEIGHT = 2.4 * BLOCK_SIZE;
 
 public float GRAVITY = .9;
 public float JUMP = 22;
    
 public Constants() {
    float dpi = java.awt.Toolkit.getDefaultToolkit().getScreenResolution();
    float screenHeight = displayHeight / dpi;
    
      if(screenHeight > 9) {
        sensitivity = .002;
      } else {
        sensitivity = 0.00004;
      }
  }
}
