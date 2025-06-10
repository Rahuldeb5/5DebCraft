public class HUD {
  public void renderCrosshair() {
    hint(DISABLE_DEPTH_TEST);
    camera();
    stroke(255);
    strokeWeight(3);
    line(width / 2 - k.CROSSHAIR, height / 2, width / 2 + k.CROSSHAIR, height / 2);
    line(width / 2, height / 2 - k.CROSSHAIR, width / 2, height / 2 + k.CROSSHAIR);
    strokeWeight(1);
    hint(ENABLE_DEPTH_TEST);
  }
}
