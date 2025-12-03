import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_1/utils/constants/app_assets.dart';

class Applogo extends StatelessWidget {
  const Applogo({super.key, this.width = 202, this.height = 138});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Image.asset(
        AppAssets.logo, //used image in app.assets.dart file
        width: 202,
        height: 138,
        fit: BoxFit.fill,
      ),
    );
  }
}
