public class Constants {  
 public final int BLOCK_SIZE = 100;
 public float camX = 0, camY = -270, camZ = 0;
 public float pitch = 1.5, yaw = 0;
 
 public float sensitivity;
    
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
