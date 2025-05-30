import java.awt.Robot;

public class Camera {
  Robot robot; 
  
  protected float x,y,z;
  protected float pitch, yaw;
  private float sensitivity;
  
  public Camera(float x, float y, float z, float pitch, float yaw, float sensitivity) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.pitch = pitch;
    this.yaw = yaw;
    this.sensitivity = sensitivity;
    
    try {
       robot = new Robot(); 
    } catch(Exception e) {
       e.printStackTrace(); 
    }  
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
     0,1,0
   ); 
  }
}
