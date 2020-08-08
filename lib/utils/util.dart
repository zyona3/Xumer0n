import 'dart:math';

mixin logic {
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

  static int countEat(List<int> answer, List<int> predction) {
    var ret = 0;
    for (var i = 0; i < answer.length; i++) {
      if (predction[i] == answer[i]) {
        ret++;
      }
    }
    return ret;
  }

  static int countBite(List<int> answer, List<int> predction) {
    var ret = 0;
    for (var i = 0; i < predction.length; i++) {
      if (answer.contains(predction[i])) {
        ret++;
      }
    }
    return ret;
  }

  // never used
  static int convertToInt(List<int> predction) {
    var ret = 0;
    for (var i = 0; i < predction.length; i++) {
      ret += predction[i].toInt() * pow(10, predction.length - 1 - i) as int;
    }
    return ret;
  }
}
