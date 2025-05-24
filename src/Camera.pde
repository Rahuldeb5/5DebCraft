import java.awt.Robot;

public class Camera {
  Robot robot; 
  
  float x,y,z;
  float pitch, yaw;
  float sensitivity;
  
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
   
   pitch = constrain(pitch, -HALF_PI, HALF_PI - .5);
   
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
