public abstract class Block {
  private final float hardness;
  private final PImage texture;
  private final boolean breakable;
  
  public Block(float hardness, PImage texture, boolean breakable) {
     this.hardness = hardness;
     this.texture = texture;
     this.breakable = breakable;
  }
  
  public float getHardness() {
     return hardness; 
  }
  
  public boolean isBreakable() {
     return breakable; 
  }
  
  public void render(float x, float y, float z) {
     pushMatrix();
     translate(x,y,z);
     noStroke();
     beginShape(QUADS);
     texture(texture);
     
     vertex(-25, -25, 25, 0, 0);
     vertex(25, -25, 25, 1, 0);
     vertex(25, 25, 25, 1, 1);
     vertex(-25, 25, 25, 0, 1);

     vertex(25, -25, -25, 0, 0);
     vertex(-25, -25, -25, 1, 0);
     vertex(-25, 25, -25, 1, 1);
     vertex(25, 25, -25, 0, 1);
    
     vertex(25, -25, 25, 0, 0);
     vertex(25, -25, -25, 1, 0);
     vertex(25, 25, -25, 1, 1);
     vertex(25, 25, 25, 0, 1);

     vertex(-25, -25, -25, 0, 0);
     vertex(-25, -25, 25, 1, 0);
     vertex(-25, 25, 25, 1, 1);
     vertex(-25, 25, -25, 0, 1);

     vertex(-25, 25, 25, 0, 0);
     vertex(25, 25, 25, 1, 0);
     vertex(25, 25, -25, 1, 1);
     vertex(-25, 25, -25, 0, 1);

     vertex(-25, -25, -25, 0, 0);
     vertex(25, -25, -25, 1, 0);
     vertex(25, -25, 25, 1, 1);
     vertex(-25, -25, 25, 0, 1);

     endShape();
     
     noFill();
     stroke(0);
     box(50);
     popMatrix();
  }
}
