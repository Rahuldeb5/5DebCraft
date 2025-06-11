public class InputManager {

  private boolean wPressed, aPressed, sPressed, dPressed;

  private boolean shiftPressed, spacePressed;

  private int index;

  public void update() {
    PVector forward = new PVector(cos(cam.yaw), 0, sin(cam.yaw)).normalize();
    PVector right = new PVector(forward.z, 0, -forward.x).normalize();

    float newSpeed;
    if (shiftPressed) {
      newSpeed = k.moveSpeed * 1.75;
    } else {
      newSpeed = k.moveSpeed;
    }

    float moveX = 0, moveZ = 0;

    boolean isWalking = false;

    if (wPressed) {
      moveX += forward.x * newSpeed;
      moveZ += forward.z * newSpeed;
      isWalking = true;
    }
    if (sPressed) {
      moveX -= forward.x * newSpeed;
      moveZ -= forward.z * newSpeed;
      isWalking = true;
    }
    if (aPressed) {
      moveX += right.x * newSpeed;
      moveZ += right.z * newSpeed;
      isWalking = true;
    }
    if (dPressed) {
      moveX -= right.x * newSpeed;
      moveZ -= right.z * newSpeed;
      isWalking = true;
    }

    if (isWalking && !walkSound.isPlaying() && cam.isOnGround) {
      walkSound.play();
    }

    if (moveX == 0 || moveZ == 0) {
      walkSound.stop();
    }

    if (!cam.checkCollision(cam.x+moveX, cam.y, cam.z)) {
      cam.x += moveX;
    }

    if (!cam.checkCollision(cam.x, cam.y, cam.z + moveZ)) {
      cam.z += moveZ;
    }

    cam.velocityY += k.GRAVITY;
    if (!cam.checkCollision(cam.x, cam.y + cam.velocityY, cam.z)) {
      cam.y += cam.velocityY;
      cam.isOnGround = false;
    } else {
      cam.isOnGround = true;
      cam.velocityY = 0;
    }

    if (spacePressed && cam.isOnGround) {
      cam.velocityY = -k.JUMP;
      cam.isOnGround = false;
    }

    inventory.setCurrentIndex(index-1);
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

    for (int i=1; i<=k.AMT_ITEMS; i++) {
      if (key - '0' == i) {
        index = i;
        break;
      }
    }
    if (key == CODED) {
      if (keyCode == SHIFT) {
        shiftPressed = state;
      }
    }
  }
}
