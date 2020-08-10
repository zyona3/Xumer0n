import 'package:flutter/foundation.dart';

import '../util.dart';

class todai {
  static List<int> createCPUpred(
      List<List> mosikasite, List<int> ansmoo, List<int> predmoo) {
    mosikasite
        .removeWhere((item) => listEquals<dynamic>(item, predmoo) == true);
    final mooproduct = logic.mooproduct(ansmoo, predmoo);
    if (listEquals<dynamic>(mooproduct, <int>[0, 0])) {
      for (var i = 0; i < mosikasite.length; i++) {
        for (var j = 0; j < predmoo.length; j++) {
          if (mosikasite[i].contains(predmoo[j])) {
            mosikasite.removeWhere((item) => item.contains(predmoo[j]));
          }
        }
      }
    }
    for (var i = 0; i < mosikasite.length; i++) {
      var kouho = mosikasite[i].cast<int>();
      var tmpmooproduct = logic.mooproduct(predmoo, kouho);
      if (!listEquals<dynamic>(tmpmooproduct, mooproduct)) {
        mosikasite
            .removeWhere((item) => listEquals<dynamic>(item, kouho) == true);
      }
    }
    List<int> ret;
    ret = (mosikasite..shuffle()).first.cast<int>();
    return ret;
  }

  static List<List> createPossible(int size) {
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

  static List<List> createPossible4(int size) {
    final mosikasite = <List>[];
    for (var i = 0; i < size; i++) {
      for (var j = 0; j < size; j++) {
        if (i != j) {
          for (var k = 0; k < size; k++) {
            if (j != k && i != k) {
              for (var l = 0; l < size; l++) {
                if (k != l && j != l && i != l) {
                  final list = <int>[i, j, k, l];
                  mosikasite.add(list);
                }
              }
            }
          }
        }
      }
    }
    return mosikasite;
  }
}
