import 'package:flutter/material.dart';
import 'package:grocery_app_1/components/custom_text.dart';
import 'package:grocery_app_1/utils/constants/app_assets.dart';
import 'package:grocery_app_1/utils/constants/app_colors.dart';

class RelatedItemTile extends StatelessWidget {
  const RelatedItemTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 90,
        height: 90,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(AppAssets.tomatoImg),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          height: 24,
          decoration: BoxDecoration(
            color: AppColors.lightGreen,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                "Tomato",
                fontSize: 11,
                color: AppColors.white,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                width: 30,
                child: CustomText(
                  "Rs.150.00",
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
