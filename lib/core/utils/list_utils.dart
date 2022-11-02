class ListUtils {
  static List<T> overwriteFirstElementInList<T>(List<T> list, T element) {
    List<T> clonedList = [...list];
    clonedList[0] = element;
    return clonedList;
  }
}
