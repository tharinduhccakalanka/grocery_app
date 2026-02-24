import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_1/components/custom_button.dart';
import 'package:grocery_app_1/components/custom_text.dart';

import 'package:grocery_app_1/screens/auth/login.dart';
import 'package:grocery_app_1/utils/constants/app_assets.dart';
import 'package:grocery_app_1/utils/constants/app_colors.dart';

import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

// User name TextEditing controller
// ignore: unused_element
final TextEditingController _name = TextEditingController();
// Email TextEditing controller
// ignore: unused_element
final TextEditingController _email = TextEditingController();
// Password TextEditing controller
// ignore: unused_element
final TextEditingController _password = TextEditingController();

class _SignupState extends State<Signup> {
  get authProvider => null;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            //Wrap with SinglechildSrollview for remove offflow error
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  "Sign Up",
                  fontSize: 30,
                  color: Color.fromARGB(255, 36, 190, 126),
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 41),
                const Applogo(
                  width: 202,
                  height: 138,
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.ash.withValues(alpha: 0.4),
                          offset: const Offset(0, 2),
                          blurRadius: 10,
                        )
                      ]),
                  child: TextField(
                    controller: Provider.of<AuthProvider>(context).name,
                    decoration: InputDecoration(
                      hintText: "Enter your Name here",
                      hintStyle: const TextStyle(color: AppColors.ash),
                      label: const Text(
                        "Name",
                        style: TextStyle(color: AppColors.ash),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 74, 175, 116),
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
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.ash.withValues(alpha: 0.3),
                          offset: const Offset(0, 0),
                          blurRadius: 10,
                        ),
                      ]),
                  child: TextField(
                    controller: Provider.of<AuthProvider>(context).email,
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
                const CustomTextField(),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    child: const Text("Already have an account?"),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Consumer<AuthProvider>(
                  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                  builder: (context, AuthProvider, child) {
                    return CustomButton(
                      text: "Sign Up",
                      onTap: () {
                        authProvider.startSignup(context);
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension on AuthProvider {
  get email => null;

  get name => null;

  get password => null;

  void startSignup(BuildContext context) {}
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomTextFeild();
  }
}

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.ash.withValues(alpha: 0.4),
              offset: const Offset(0, 2),
              blurRadius: 10,
            )
          ]),
      child: TextField(
        //hide password
        controller: Provider.of<AuthProvider>(context).password,
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

  get context => null;

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
