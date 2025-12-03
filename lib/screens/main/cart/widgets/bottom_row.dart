import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app_1/components/custom_button.dart';
import 'package:grocery_app_1/components/custom_text.dart';
import 'package:grocery_app_1/utils/constants/app_assets.dart';
import 'package:grocery_app_1/utils/constants/app_colors.dart';

class BottomRow extends StatelessWidget {
  const BottomRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CartAmountRow(
            name: "Item total",
            amount: "1000.00",
          ),
          const SizedBox(
            height: 12,
          ),
          const CartAmountRow(
            name: "Discount",
            amount: "Rs.-200.00",
          ),
          const SizedBox(
            height: 12,
          ),
          const CartAmountRow(
            name: "Tax",
            amount: "Rs.100.00",
          ),
          const SizedBox(
            height: 12,
          ),
          const CartAmountRow(
            name: "Total",
            amount: "900.00",
            isTotal: true,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
              text: "Place Order",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const DialogBoxContent();
                  },
                );
              }),
        ],
      ),
    );
  }
}

//  **********Dialog Box details*********
class DialogBoxContent extends StatelessWidget {
  const DialogBoxContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: 300,
            height: 333,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.dialogImg),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  "Thanks for Buying\nfrom Us",
                  fontSize: 20,
                  color: AppColors.primaryColor,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -10,
            child: CustomButton(text: "See Your Order", onTap: () {}),
          ),
        ],
      ),
    );
  }
}

class CartAmountRow extends StatelessWidget {
  const CartAmountRow({
    super.key,
    required this.name,
    required this.amount,
    this.isTotal = false,
  });

  final String name;
  final String amount;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          name,
          fontSize: isTotal ? 16 : 14,
          fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
        ),
        CustomText(
          amount,
          fontSize: isTotal ? 16 : 14,
          fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
        ),
      ],
    );
  }
}
