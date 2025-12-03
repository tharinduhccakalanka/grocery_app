import 'package:flutter/material.dart';
import 'package:grocery_app_1/components/custom_text.dart';
import 'package:grocery_app_1/utils/constants/app_assets.dart';
import 'package:grocery_app_1/utils/constants/app_colors.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.all(10),
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.ash.withOpacity(.4),
              offset: const Offset(0, 2),
              blurRadius: 10,
            )
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              AppAssets.grapesImg,
              width: 70,
              height: 70,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(
                "Grapes",
                fontSize: 14,
              ),
              Row(
                children: [
                  InkWell(
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CustomText(
                    "1",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
              const CustomText(
                "Rs.150.00",
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ],
      ),
    );
  }
}
