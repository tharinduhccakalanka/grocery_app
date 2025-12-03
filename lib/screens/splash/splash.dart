import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_1/components/custom_text.dart';
import 'package:grocery_app_1/screens/auth/signup.dart';
import 'package:grocery_app_1/utils/constants/app_colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => const Signup(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Applogo(
            width: 331,
            height: 225,
          ),
          const SizedBox(height: 72),
          FadeInUp(
            child: const CustomText(
              "Shop Your Daily\nNecessary",
              fontSize: 30,
              textAlign: TextAlign.center,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }
}
