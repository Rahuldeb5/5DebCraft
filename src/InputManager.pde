public class InputManager {
  private Camera camera;
  private float moveSpeed;
  
  private boolean wPressed, aPressed, sPressed, dPressed;
  
  private boolean shiftPressed, spacePressed;
  
  public InputManager(Camera camera, float moveSpeed) {
     this.camera = camera;
     this.moveSpeed = moveSpeed;
  }
  
  public void update() {
     PVector forward = new PVector(cos(camera.yaw), 0, sin(camera.yaw)).normalize();
     PVector right = new PVector(forward.z, 0, -forward.x).normalize();
     
     float newSpeed;
     if(shiftPressed) {
        newSpeed = moveSpeed * 1.75; 
     } else {
        newSpeed = moveSpeed; 
     }
     
     if(wPressed) {
        camera.x += forward.x * newSpeed;
        camera.z += forward.z * newSpeed;
     }
     if(sPressed) {
        camera.x -= forward.x * newSpeed;
        camera.z -= forward.z * newSpeed;
     }
     if(aPressed) {
        camera.x += right.x * newSpeed;
        camera.z += right.z * newSpeed;
     }
     if(dPressed) {
        camera.x -= right.x * newSpeed;
        camera.z -= right.z * newSpeed; 
     }
  }
  
  public void setInputState(char key, boolean state) {
     switch(Character.toLowerCase(key)) {
        case 'w': wPressed = state; break;
        case 'a': aPressed = state; break;
        case 's': sPressed = state; break;
        case 'd': dPressed = state; break;
        case ' ': spacePressed = state; break;
     }
     if(key == CODED) {
        if(keyCode == SHIFT) {
           shiftPressed = state; 
        }
     }  
  }
  
}
