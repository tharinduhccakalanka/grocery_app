import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_1/components/common_back_button.dart';
import 'package:grocery_app_1/components/custom_button.dart';
import 'package:grocery_app_1/components/custom_text.dart';
import 'package:grocery_app_1/utils/constants/app_assets.dart';
import 'package:grocery_app_1/utils/constants/app_colors.dart';

class FogotPassword extends StatefulWidget {
  const FogotPassword({super.key});

  @override
  State<FogotPassword> createState() => _FogotPasswordState();
}

class _FogotPasswordState extends State<FogotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          //Wrap with SinglechildSrollview for remove offflow error
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: CommonBackButton(),
              ),
              const CustomText(
                "Fogot Password",
                fontSize: 30,
                color: Color.fromARGB(255, 36, 190, 126),
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 41),
              const Applogo(
                width: 202,
                height: 138,
              ),
              const SizedBox(height: 100),
              const CustomText(
                "Please, enter your email address. You will receive a link to create a new password via email.",
                fontSize: 14,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.ash.withAlpha(3),
                        offset: const Offset(0, 0),
                        blurRadius: 10,
                      )
                    ]),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your Email here",
                    hintStyle: const TextStyle(color: AppColors.ash),
                    label: const Text(
                      "Email",
                      style: TextStyle(color: AppColors.ash),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                text: "Send",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController controller,
    required String hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.ash.withAlpha(3),
              offset: const Offset(0, 2),
              blurRadius: 10,
            ),
          ]),
      child: TextField(
        obscureText: true, //hide password
        decoration: InputDecoration(
          hintText: "Enter your Password here",
          hintStyle: const TextStyle(color: AppColors.ash),
          label: const Text(
            "Password",
            style: TextStyle(color: AppColors.ash),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

class Applogo extends StatelessWidget {
  const Applogo({
    super.key,
    required int height,
    required int width,
  });

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
