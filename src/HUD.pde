public class HUD {
  public void renderCrosshair() {
    hint(DISABLE_DEPTH_TEST);

    pushMatrix();
    pushStyle();

    camera();
    stroke(255);
    strokeWeight(3);
    line(width / 2 - k.CROSSHAIR, height / 2, width / 2 + k.CROSSHAIR, height / 2);
    line(width / 2, height / 2 - k.CROSSHAIR, width / 2, height / 2 + k.CROSSHAIR);
    strokeWeight(1);

    popMatrix();
    popStyle();

    hint(ENABLE_DEPTH_TEST);
  }

  public void renderHotbar() {
    hint(DISABLE_DEPTH_TEST);
    pushMatrix();
    pushStyle();

    camera();

    float x = width / 2 - k.BAR_WIDTH / 2;
    float y = height - 2 * k.BAR_HEIGHT;
    float slotWidth = k.BAR_WIDTH / k.AMT_ITEMS;

    textAlign(RIGHT, BOTTOM);
    textSize(k.TEXT_SIZE);
    rectMode(CORNER);
    imageMode(CENTER);

    for (int i=0; i<k.AMT_ITEMS; i++) {
      if (i == inventory.getCurrentIndex()) {
        stroke(255, 255, 0);
        strokeWeight(8);
      } else {
        stroke(255);
        strokeWeight(1);
      }

      fill(255);
      float slotX = x + i * slotWidth;
      rect(slotX, y, slotWidth, k.BAR_HEIGHT);

      float imgX = slotX + slotWidth / 2;
      float imgY = y + k.BAR_HEIGHT / 2;
      float imgW = slotWidth - k.PADDING * 2;
      float imgH = k.BAR_HEIGHT - k.PADDING * 2;
      image(textures[i], imgX, imgY, imgW, imgH);

      fill(0);
      text(inventory.getItemCount()[i], slotX + slotWidth - k.PADDING * 2, y + k.BAR_HEIGHT);
      fill(255);
    }

    popMatrix();
    popStyle();

    hint(ENABLE_DEPTH_TEST);
  }
}
