import 'package:flutter/foundation.dart';

import '../util.dart';

void main() {
  var mosikasite = <List>[];
  mosikasite = createPossible(4);
  var ansmoo = <int>[2, 0, 1];
  var predmoo = <int>[0, 2, 1];

  // // ------------
  mosikasite.removeWhere((item) => listEquals<dynamic>(item, predmoo) == true);
  var mooproduct = logic.mooproduct(ansmoo, predmoo);
  print(mosikasite.length);
  print('-');
  for (var i = 0; i < mosikasite.length; i++) {
    final kouho = mosikasite[i].cast<int>();
    final tmpmooproduct = logic.mooproduct(predmoo, kouho);
    if (!listEquals<dynamic>(tmpmooproduct, mooproduct)) {
      mosikasite
          .removeWhere((item) => listEquals<dynamic>(item, kouho) == true);
    }
  }
  print(mosikasite.length);
  for (var i = 0; i < mosikasite.length; i++) {
    if (listEquals<dynamic>(mosikasite[i], ansmoo)) {
      print('found');
    }
  }
}

List<List> createPossible(int size) {
  final mosikasite = <List>[];
  for (var i = 0; i < size; i++) {
    for (var j = 0; j < size; j++) {
      if (i != j) {
        for (var k = 0; k < size; k++) {
          if (j != k && i != k) {
            final list = <int>[i, j, k];
            mosikasite.add(list);
          }
        }
      }
    }
  }
  return mosikasite;
}
