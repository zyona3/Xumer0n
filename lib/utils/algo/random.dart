import 'dart:math';

mixin random {
  static List<int> createAnswer() {
    final ll = List<int>.generate(10, (i) => i);
    final botprediction = <int>[];
    final _random = Random();
    while (botprediction.length < 3) {
      final element = ll[_random.nextInt(ll.length)];
      if (!botprediction.contains(element)) {
        botprediction.add(element);
      }
    }
    return botprediction;
  }
}
