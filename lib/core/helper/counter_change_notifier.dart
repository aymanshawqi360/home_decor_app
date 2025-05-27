import 'package:flutter/material.dart';

class CounterChangeNotifier extends ChangeNotifier {
  int counter = 0;
  late PageController controller;
  CounterChangeNotifier._();
  static CounterChangeNotifier counterChangeNotifier =
      CounterChangeNotifier._();
  factory CounterChangeNotifier() => counterChangeNotifier;

  counterNext({required int index}) {
    if (index < 3) {
      counter++;
      controller.animateToPage(
        counter,
        duration: Duration(seconds: 1),
        curve: Curves.ease,
      );
    }
    notifyListeners();
  }

  counterSkip({required int lenght}) {
    counter += (lenght - 1) - counter;
    controller.jumpToPage(counter);
    notifyListeners();
  }
}
