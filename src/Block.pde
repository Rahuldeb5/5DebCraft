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
    translate(x, y, z);
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

public class DirtBlock extends Block {
  public DirtBlock(PImage texture) {
    super(1.0, texture, true);
  }
}

public class StoneBlock extends Block {
  public StoneBlock(PImage texture) {
    super(1.0, texture, true);
  }
}

public class SandBlock extends Block {
  public SandBlock(PImage texture) {
    super(1.0, texture, true);
  }
}

public class WaterBlock extends Block {
  public WaterBlock(PImage texture) {
    super(1.0, texture, false);
  }
}

public class WoodBlock extends Block {
  public WoodBlock(PImage texture) {
    super(1.0, texture, true);
  }
}

public class LeafBlock extends Block {
  public LeafBlock(PImage texture) {
    super(1.0, texture, false);
  }
}

public enum BlockType {
  DIRT(1),
    STONE(2),
    SAND(3),
    WATER(4);

  private final int type;

  BlockType(int type) {
    this.type = type;
  }

  public int getType() {
    return type;
  }
}
