public class InputManager {
  private Camera camera;
  private float moveSpeed;
  
  private boolean wPressed, aPressed, sPressed, dPressed;
  
  public InputManager(Camera camera, float moveSpeed) {
     this.camera = camera;
     this.moveSpeed = moveSpeed;
  }
  
  public void update() {
     PVector forward = new PVector(cos(camera.yaw), 0, sin(camera.yaw)).normalize();
     PVector right = new PVector(forward.z, 0, -forward.x).normalize();
     
     if(wPressed) {
        camera.x += forward.x * moveSpeed;
        camera.z += forward.z * moveSpeed;
     }
     if(sPressed) {
        camera.x -= forward.x * moveSpeed;
        camera.z -= forward.z * moveSpeed;
     }
     if(aPressed) {
        camera.x += right.x * moveSpeed;
        camera.z += right.z * moveSpeed;
     }
     if(dPressed) {
        camera.x -= right.x * moveSpeed;
        camera.z -= right.z * moveSpeed; 
     }
  }
  
  public void setInputState(char key, boolean state) {
     switch(Character.toLowerCase(key)) {
        case 'w': wPressed = state; break;
        case 'a': aPressed = state; break;
        case 's': sPressed = state; break;
        case 'd': dPressed = state; break;
     }
  }
  
}
