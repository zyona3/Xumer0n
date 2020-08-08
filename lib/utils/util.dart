mixin logic {
  static void call() {
    print('call ok');
  }

  static void back(List<int> prediction) {
    prediction.removeAt(prediction.length - 1);
  }

  static bool checkDuplicate(List<int> prediction, int element) {
    if (prediction.contains(element)) {
      return true;
    }
    return false;
  }

  static bool isFillable(List<int> prediction) {
    if (prediction.length < 3) {
      return true;
    } else {
      return false;
    }
  }
}
