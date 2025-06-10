public class Inventory {
  private int[] itemStack;
  private int currentIndex;

  public Inventory() {
    itemStack = new int[k.AMT_ITEMS];
    for (int i=0; i<k.AMT_ITEMS; i++) {
      itemStack[i] = 0;
    }
    currentIndex = 0;
  }

  public boolean hasItem() {
    return (itemStack[currentIndex] > 0);
  }

  public void moveRight() {
    currentIndex++;
    currentIndex %= k.AMT_ITEMS;
  }

  public void moveLeft() {
    currentIndex--;
    if (currentIndex < 0) currentIndex = k.AMT_ITEMS-1;
  }

  public void addItem(int index) {
    if (itemStack[index] < k.MAX_ITEMS) {
      itemStack[index]++;
    }
  }

  public void removeItem() {
    if (itemStack[currentIndex] > 0) {
      itemStack[currentIndex]--;
    }
  }

  public int getCurrentIndex() {
    return currentIndex;
  }

  public int[] getItemCount() {
    return itemStack;
  }
}
