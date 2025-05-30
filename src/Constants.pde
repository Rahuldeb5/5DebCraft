public class Constants {  
 public final int BLOCK_SIZE;
 public float camX = 0, camY, camZ = 0;
 public float pitch = 1.5, yaw = 0;
 
 public float sensitivity;
    
 public Constants() {
    float dpi = java.awt.Toolkit.getDefaultToolkit().getScreenResolution();
    float screenHeight = displayHeight / dpi;
    
      if(screenHeight > 9) {
        camY = -135;
        BLOCK_SIZE = 50;
        sensitivity = .002;
      } else {
        camY = -270;
        BLOCK_SIZE = 100;
        sensitivity = 0.00004;
      }
  }
}
