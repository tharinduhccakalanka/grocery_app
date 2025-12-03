import 'package:flutter/material.dart';

class Helpers {
  //push navigator function here
  //
  //
  //
  //
  //
  static void navigateTo(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
