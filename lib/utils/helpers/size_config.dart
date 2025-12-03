import 'package:flutter/material.dart';

class SizeConfig {
  //Get screen height

  static double h(BuildContext context) =>
      MediaQuery.of(context).size.height; //Method 1 with =>

  //Get screen Wight

  static double w(BuildContext context) {
    return MediaQuery.of(context).size.width; //Method 2 with return
  }
}
