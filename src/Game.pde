import java.awt.Robot;

Robot robot;

float camX = 0, camY = -50, camZ = 200;
float pitch = 1.5, yaw = 0;

float sensitivity = 0.002;

void setup() {
  fullScreen(P3D);
  noCursor();
  
  try {
    robot = new Robot(); 
  } catch(Exception e) {
    e.printStackTrace(); 
  }
}  

void draw() {
   background(135, 206, 235); 
   lights();
   
   handleMouseLook();
   
   camera(
     camX, camY, camZ,
     camX + cos(yaw) * cos(pitch),
     camY + sin(pitch),
     camZ + sin(yaw) * cos(pitch),
     0,1,0
   );
   
   drawGround();
}

void handleMouseLook() {
   float dx = (mouseX - width / 2) * sensitivity;
   float dy = (mouseY - height / 2) * sensitivity;
   
   yaw += dx;
   pitch += dy;
   
   pitch = constrain(pitch, -HALF_PI + .5, HALF_PI - .5);
   
   robot.mouseMove(width / 2, height / 2);
   mouseX = width / 2;
   mouseY = height / 2;
}

void drawGround() {
  pushMatrix();
  translate(0, 150, 0);
  rotateX(HALF_PI);
  fill(100, 200, 100);
  noStroke();
  rectMode(CENTER);
  rect(0, 0, 5000, 5000);
  popMatrix();
}
