import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app_1/components/custom_text.dart';
import 'package:grocery_app_1/screens/main/cart/cart.dart';
import 'package:grocery_app_1/screens/main/product_details/product_details.dart';
import 'package:grocery_app_1/utils/constants/app_assets.dart';
import 'package:grocery_app_1/utils/constants/app_colors.dart';
import 'package:grocery_app_1/utils/helpers/helpers.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppAssets.menuIcon),
                InkWell(
                  onTap: () {
                    Helpers.navigateTo(context, const Cart());
                  },
                  child: SvgPicture.asset(AppAssets.cartIcon),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                "Vegetables",
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(
              height: 41,
            ),
            //Product Grid
            Expanded(
              child: FadeInLeft(
                // FadeInLeft Added animation
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 19,
                    mainAxisSpacing: 44,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ProductTile();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Helpers.navigateTo(
          context,
          const ProductDetails(),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(AppAssets.dummyImg),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              child: const Icon(
                Icons.favorite_border,
                color: AppColors.ash,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    "Pumpkin",
                    fontSize: 15,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    "Rs.150.00",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
