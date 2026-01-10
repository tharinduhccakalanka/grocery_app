import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_1/components/custom_button.dart';
import 'package:grocery_app_1/components/custom_text.dart';
import 'package:grocery_app_1/utils/constants/app_assets.dart';
import 'package:grocery_app_1/utils/constants/app_colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: FadeInUp(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: CustomText(
                      "Profile",
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 165,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      AppAssets.profileImg,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomText(
                    "Tharindu Akalanka",
                    fontSize: 18,
                  ),
                  const CustomText(
                    "tharindu@gmail.com",
                    fontSize: 13,
                    color: Colors.blueGrey,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomButton(text: "LogOut", onTap: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
