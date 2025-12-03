import 'package:flutter/material.dart';
import 'package:grocery_app_1/components/common_back_button.dart';
import 'package:grocery_app_1/components/custom_text.dart';
import 'package:grocery_app_1/screens/main/cart/widgets/bottom_row.dart';
import 'package:grocery_app_1/screens/main/cart/widgets/cart_tile.dart';

import 'package:grocery_app_1/utils/constants/app_colors.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonBackButton(),
                ],
              ),
              const CustomText(
                "Cart",
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
              const Icon(
                Icons.abc,
                color: AppColors.white,
              ),
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const CartTile();
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: 6,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomRow(),
    );
  }
}
