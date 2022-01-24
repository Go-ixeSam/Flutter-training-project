import 'package:flutter/widgets.dart';

class CheckFilterChangeNotify extends ChangeNotifier {
  int currentIndex = -1;

  void check(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void close() {
    currentIndex = -1;
    notifyListeners();
  }
}
