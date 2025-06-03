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
    if (shiftPressed) {
      newSpeed = moveSpeed * 1.75;
    } else {
      newSpeed = moveSpeed;
    }

    float moveX = 0, moveZ = 0;

    if (wPressed) {
      moveX += forward.x * newSpeed;
      moveZ += forward.z * newSpeed;
    }
    if (sPressed) {
      moveX -= forward.x * newSpeed;
      moveZ -= forward.z * newSpeed;
    }
    if (aPressed) {
      moveX += right.x * newSpeed;
      moveZ += right.z * newSpeed;
    }
    if (dPressed) {
      moveX -= right.x * newSpeed;
      moveZ -= right.z * newSpeed;
    }

    if (!camera.checkCollision(camera.x+moveX, camera.y, camera.z)) {
      camera.x += moveX;
    }

    if (!camera.checkCollision(camera.x, camera.y, camera.z + moveZ)) {
      camera.z += moveZ;
    }

    camera.velocityY += k.GRAVITY;
    if (!camera.checkCollision(camera.x, camera.y + camera.velocityY, camera.z)) {
      camera.y += camera.velocityY;
      camera.isOnGround = false;
    } else {
      camera.isOnGround = true;
      camera.velocityY = 0;
    }

    if (spacePressed && camera.isOnGround) {
      camera.velocityY = -k.JUMP;
      camera.isOnGround = false;
    }
  }

  public void setInputState(char key, boolean state) {
    switch(Character.toLowerCase(key)) {
    case 'w':
      wPressed = state;
      break;
    case 'a':
      aPressed = state;
      break;
    case 's':
      sPressed = state;
      break;
    case 'd':
      dPressed = state;
      break;
    case ' ':
      spacePressed = state;
      break;
    }
    if (key == CODED) {
      if (keyCode == SHIFT) {
        shiftPressed = state;
      }
    }
  }
}
