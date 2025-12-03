import 'package:flutter/material.dart';

// Firstly go to "main.dart" and input provider
//
//
class CounterProvider extends ChangeNotifier {
  //-----------counter
  int _counter = 0;

  // getter for counter
  int get counter => _counter;

  //___increse counter
  void increaseCounter() {
    _counter++;
    notifyListeners();
  }

  //___increse counter
  void decreaseCounter() {
    _counter--;
    notifyListeners();
  }
}
