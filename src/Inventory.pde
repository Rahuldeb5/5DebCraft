public class Inventory {
  private int[] itemStack;
  private int currentIndex;

  public Inventory() {
    itemStack = new int[k.AMT_ITEMS];
    for (int i=0; i<k.AMT_ITEMS; i++) {
      itemStack[i] = 64;
    }
    currentIndex = 0;
  }

  public boolean hasItem() {
    return (itemStack[currentIndex] > 0);
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

  public void setCurrentIndex(int index) {
    currentIndex = index;
  }

  public int[] getItemCount() {
    return itemStack;
  }
}
