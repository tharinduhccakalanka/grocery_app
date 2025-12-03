import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app_1/components/common_back_button.dart';
import 'package:grocery_app_1/components/custom_button.dart';
import 'package:grocery_app_1/components/custom_text.dart';
import 'package:grocery_app_1/screens/auth/fogot_password.dart';

import 'package:grocery_app_1/utils/constants/app_assets.dart';
import 'package:grocery_app_1/utils/constants/app_colors.dart';

import 'package:logger/logger.dart';

import '../../utils/helpers/alert_helper.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Email TextEditing controller
  final TextEditingController _email = TextEditingController();
  // Password TextEditing controller
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: CommonBackButton(),
                ),
                const CustomText(
                  "Login",
                  fontSize: 30,
                  color: Color.fromARGB(255, 36, 190, 126),
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 41),
                const Applogo(
                  width: 202,
                  height: 138,
                ),
                const SizedBox(height: 60),
                // Email TextField
                CustomTextField(
                  hintText: "Enter your Email here",
                  controller: _email,
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // Password TextField
                CustomTextField(
                  hintText: "Enter your Password here",
                  controller: _password,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FogotPassword()));
                    },
                    child: const Text(
                      "Forgot Your Password?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: "Login",
                  onTap: () {
                    if (validateFields(context)) {
                      // Pass 'context' as an argument
                      Logger().w("All fields are validated");
                    }
                  },
                ),
                const SizedBox(height: 23),
                const CustomText(
                  "Or login with social accounts",
                  fontSize: 14,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      path: AppAssets.google,
                      onTap: () {},
                    ),
                    const SizedBox(width: 16),
                    SocialButton(
                      path: AppAssets.fb,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

//Bellow validation box's rest of code in"alert_helper.dart"

//Validate Text Inputs

  bool validateFields(BuildContext context) {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      Logger().w("Please fill all the fields");
      AlertHelper.showAlert(context, "Please fill all the fields.");
      return false;
    } else if (!_email.text.contains("@")) {
      Logger().w("Please enter a valid email");
      AlertHelper.showAlert(context, "Please enter a valid email.");
      return false;
    } else if (_password.text.length < 6) {
      Logger().w("The password must have at least 6 characters");
      AlertHelper.showAlert(
          context, "The password must have at least 6 characters.");
      return false;
    } else {
      Logger().w("All fields are validated");
      return true;
    }
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
  });

  final TextEditingController controller;
  final bool obscureText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.ash.withOpacity(.4),
            offset: const Offset(0, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.ash),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.onTap,
    required this.path,
  });

  final String path;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.ash.withOpacity(.4),
              offset: const Offset(0, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: SvgPicture.asset(path),
      ),
    );
  }
}

class Applogo extends StatelessWidget {
  const Applogo({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Image.asset(
        AppAssets.logo, //used image in app.assets.dart file
        width: width,
        height: height,
        fit: BoxFit.fill,
      ),
    );
  }
}
