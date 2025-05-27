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
  }

  counterSkip() {
    counter += (3 - counter);
    controller.jumpToPage(counter);
  }
}
