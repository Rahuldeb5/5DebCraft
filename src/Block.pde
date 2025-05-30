public abstract class Block {
  private final float hardness;
  private final PImage texture;
  private final boolean breakable;
  
  Constants k;
  
  public Block(float hardness, PImage texture, boolean breakable) {
     this.hardness = hardness;
     this.texture = texture;
     this.breakable = breakable;
     
     k = new Constants();
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
     
     vertex(-k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, 0, 0);
     vertex(k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, 1, 0);
     vertex(k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, 1, 1);
     vertex(-k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, 0, 1);

     vertex(k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, 0, 0);
     vertex(-k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, 1, 0);
     vertex(-k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, 1, 1);
     vertex(k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, 0, 1);
    
     vertex(k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, 0, 0);
     vertex(k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, 1, 0);
     vertex(k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, 1, 1);
     vertex(k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, 0, 1);

     vertex(-k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, 0, 0);
     vertex(-k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, 1, 0);
     vertex(-k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, 1, 1);
     vertex(-k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, 0, 1);

     vertex(-k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, 0, 0);
     vertex(k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, 1, 0);
     vertex(k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, 1, 1);
     vertex(-k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, 0, 1);

     vertex(-k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, 0, 0);
     vertex(k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, 1, 0);
     vertex(k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, 1, 1);
     vertex(-k.BLOCK_SIZE / 2, -k.BLOCK_SIZE / 2, k.BLOCK_SIZE / 2, 0, 1);

     endShape();
     
     noFill();
     stroke(0);
     box(k.BLOCK_SIZE);
     popMatrix();
  }
}
