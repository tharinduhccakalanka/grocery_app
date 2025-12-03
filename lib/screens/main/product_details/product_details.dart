import 'package:flutter/material.dart';
import 'package:grocery_app_1/components/common_back_button.dart';
import 'package:grocery_app_1/components/custom_button.dart';
import 'package:grocery_app_1/components/custom_text.dart';
import 'package:grocery_app_1/screens/main/product_details/related_item_tile.dart';
import 'package:grocery_app_1/utils/constants/app_colors.dart';
import 'package:grocery_app_1/utils/helpers/size_config.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.h(context),
        width: SizeConfig.w(context),
        child: const Stack(
          children: [
            UpperSection(),
            Positioned(
              top: 280,
              child: ProductDetailsSection(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.h(context),
      width: SizeConfig.w(context),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34),
          topRight: Radius.circular(34),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(29, 34, 29, 0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                "Pumpkin",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              CounterSection(),
            ],
          ),
          const SizedBox(
            height: 21,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: CustomText(
              "Rs.250.00 /kg",
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          const CustomText(
            "Pumpkins are often yellowish to orange in colour, and they vary from oblate to globular to oblong; some feature a white rind. The rind is smooth and usually lightly furrowed or ribbed.",
            textAlign: TextAlign.justify,
            fontSize: 13,
          ),
          const SizedBox(
            height: 35,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: CustomText(
              "Related Items",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.darkGreen,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 90,
            child: ListView.separated(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const RelatedItemTile();
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
            ),
          ),
          const SizedBox(
            height: 55,
          ),
          CustomButton(text: "Add to Cart", onTap: () {})
        ],
      ),
    );
  }
}

class CounterSection extends StatelessWidget {
  const CounterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.ash,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: const Row(
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
    );
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: 280,
      width: SizeConfig.w(context),
      decoration: const BoxDecoration(
        color: AppColors.lightPurple,
        image: DecorationImage(
            image: NetworkImage(
                "https://www.happyvalleyseeds.com.au/cdn/shop/products/pumpkin-orange-dawn-f1-seeds-336022.jpg?v=1702184847"),
            fit: BoxFit.cover),
      ),
      child: const SafeArea(child: CommonBackButton()),
    );
  }
}
