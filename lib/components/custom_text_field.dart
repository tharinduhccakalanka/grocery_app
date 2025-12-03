import 'package:flutter/material.dart';
import 'package:grocery_app_1/components/custom_text.dart';
import 'package:grocery_app_1/utils/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.isObscure = false,
    this.controller,
  });

  final String hintText;
  final String labelText;
  final bool isObscure;
  final TextEditingController? controller;

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
            )
          ]),
      child: TextField(
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.ash),
          label: CustomText(
            labelText,
            color: AppColors.ash,
            fontSize: 0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Colors.white,
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
