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
  // never used
  static int countEat(List<int> answer, List<int> predction) {
    var ret = 0;
    for (var i = 0; i < answer.length; i++) {
      if (predction[i] == answer[i]) {
        ret++;
      }
    }
    return ret;
  }
  // never used
  static int countBite(List<int> answer, List<int> predction) {
    var ret = 0;
    for (var i = 0; i < predction.length; i++) {
      if (answer.contains(predction[i])) {
        ret++;
      }
    }
    return ret;
  }

  static List<int> mooproduct(List<int> answer, List<int> predction) {
    var e = 0;
    var b = 0;
    for (var i = 0; i < answer.length; i++) {
      if (predction[i] == answer[i]) {
        e++;
      } else {
        if (answer.contains(predction[i])) {
          b++;
        }
      }
    }
    return <int>[e, b];
  }

  // never used
  static List<int> mooProduct(List<int> answer, List<int> predction) {
    final ret = [countEat(answer, predction), countBite(answer, predction)];
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
